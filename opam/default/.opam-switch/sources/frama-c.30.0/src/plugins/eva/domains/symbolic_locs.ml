(**************************************************************************)
(*                                                                        *)
(*  This file is part of Frama-C.                                         *)
(*                                                                        *)
(*  Copyright (C) 2007-2024                                               *)
(*    CEA (Commissariat à l'énergie atomique et aux énergies              *)
(*         alternatives)                                                  *)
(*                                                                        *)
(*  you can redistribute it and/or modify it under the terms of the GNU   *)
(*  Lesser General Public License as published by the Free Software       *)
(*  Foundation, version 2.1.                                              *)
(*                                                                        *)
(*  It is distributed in the hope that it will be useful,                 *)
(*  but WITHOUT ANY WARRANTY; without even the implied warranty of        *)
(*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *)
(*  GNU Lesser General Public License for more details.                   *)
(*                                                                        *)
(*  See the GNU Lesser General Public License version 2.1                 *)
(*  for more details (enclosed in the file licenses/LGPLv2.1).            *)
(*                                                                        *)
(**************************************************************************)

open Eval
open Eva_ast
open Locations

module K = Hcexprs
module V = Cvalue.V (* TODO: functorize (with locations too ?) *)


(* Map from expressions/lvalues to abstract values *)
module K2V = struct

  module Hptmap_Info = struct
    let initial_values = []
    let dependencies = [ Ast.self ]
  end
  module M = Hptmap.Make (K.HCE) (V) (Hptmap_Info)

  include M

  let cache_prefix = "Value.Symbolic_locs.K2V"

  let join =
    (* Missing keys are bound to top -> use inter as base function *)
    let cache_name = cache_prefix ^ ".join" in
    let cache = Hptmap_sig.PersistentCache cache_name in
    let symmetric = true in
    let idempotent = true in
    let decide _ v1 v2 = Some (V.join v1 v2) in
    M.inter ~cache ~symmetric ~idempotent ~decide

  let widen =
    let cache = Hptmap_sig.NoCache in
    let symmetric = false in
    let idempotent = true in
    let decide _ v1 v2 = Some (V.widen v1 v2) in
    M.inter ~cache ~symmetric ~idempotent ~decide

  let _narrow =
    let module E = struct exception Bottom end in
    let cache_name = cache_prefix ^ ".narrow" in
    let cache = Hptmap_sig.PersistentCache cache_name in
    let symmetric = true in
    let idempotent = true in
    let decide _ v1 v2 =
      let v = V.narrow v1 v2 in
      if V.is_bottom v then raise E.Bottom else v
    in
    fun a b ->
      try `Value (M.join ~cache ~symmetric ~idempotent ~decide a b)
      with E.Bottom -> `Bottom

  let merge =
    let cache_name = cache_prefix ^ ".join" in
    let cache = Hptmap_sig.PersistentCache cache_name in
    let decide _ _ _ = assert false in
    M.join ~cache ~symmetric:true ~idempotent:false ~decide

  let is_included =
    let cache_name = cache_prefix ^ ".is_included" in
    let decide_fst _b _v1 = true (* v2 is top *) in
    let decide_snd _b _v2 = false (* v1 is top, v2 should not be *) in
    let decide_both _ v1 v2 = V.is_included v1 v2 in
    let decide_fast s t =
      (* All bases present in s but not in t are implicitly bound to Top in t,
         so an empty t implies that the inclusion holds. *)
      if s == t || M.is_empty t
      then M.PTrue
      else M.PUnknown
    in
    M.binary_predicate
      (Hptmap_sig.PersistentCache cache_name) M.UniversalPredicate
      ~decide_fast ~decide_fst ~decide_snd ~decide_both

  (* Return the subtrees of the left map whose keys are *not* present in the
     right map. Values are ignored *)
  let only_in_left =
    let cache_name = cache_prefix ^ ".only_left" in
    let cache = Hptmap_sig.PersistentCache cache_name in
    let symmetric = false in
    let idempotent = false in
    let decide_both _ _ _ = None in
    let decide_left = M.Neutral in
    let decide_right = M.Absorbing in
    M.merge ~cache
      ~symmetric ~idempotent ~decide_both ~decide_left ~decide_right

end

(* Whether the value of an expression should be retained by the domain:
   - if the expression is an lvalue with a non-singleton location;
   - if the expression is a binop between two expressions, each containing an
     lvalue with a non-singleton value.

   In both cases, the value will not be infered by the cvalue domain.
   Otherwise, the value should be inferred by the cvalue domain, or can be
   precisely computed from values inferred by the cvalue domain. *)
let interesting_exp get_locs get_val e =
  let is_comp = function Eq | Ne | Le | Ge | Lt | Gt -> true | _ -> false in
  let rec has_lvalue e =
    match e.node with
    | Lval _ ->
      not (Cvalue.V.cardinal_zero_or_one (get_val e))
    | CastE (_, e) | UnOp (_, e, _) ->
      has_lvalue e
    | BinOp (op, e1, e2,_) ->
      not (is_comp op) && (has_lvalue e1 || has_lvalue e2)
    | Const _ | StartOf _ | AddrOf _ ->
      false
  in
  match e.node with
  | Lval lv ->
    not (Precise_locs.cardinal_zero_or_one (get_locs lv))
  | BinOp (op, e1, e2,_) ->
    not (is_comp op) && has_lvalue e1 && has_lvalue e2
  | CastE _ | UnOp _ | Const _ | StartOf _ | AddrOf _ ->
    false

(* Locals and formals syntactically present in an expression or lvalue *)
let vars_to_bases vi_set =
  vi_set
  |> Cil_datatype.Varinfo.Set.to_seq
  (* Global variables never go out of scope, no need to track them *)
  |> Seq.filter (fun vi -> not vi.Cil_types.vglob)
  |> Seq.map Base.of_varinfo
  |> Base.Set.of_seq

let vars_lv lv =
  vars_to_bases (Eva_ast.vars_in_lval lv)

let vars_exp (e: exp) =
  vars_to_bases (Eva_ast.vars_in_exp e)

(* Legacy names *)
module B2K = K.BaseToHCESet
module K2Z = K.HCEToZone

module Memory = struct

  (* This is the abstract state for the 'Symbolic location' domains *)
  type memory = {
    values: K2V.t (* map from expressions/lvalues to their abstract value *);
    zones: K2Z.t (* map from expressions/lvalues to the memory location
                    they depend on *);
    deps: B2K.t (* map from bases to the expressions/lvalues that
                   depend on them according to [zones] *);
    syntactic_deps: B2K.t (* map from bases to the expressions/lvalues
                             that syntactically refer to them *);
  }
  (* Invariants: [values] and [zones] have exactly the same keys.
     [deps] and [syntactic_deps] are caches that can be rebuilt from [values]
     and [vars_exp/lv] for [syntactic_deps], and from [zones] for [deps]. *)

  include Datatype.Make_with_collections(struct
      include Datatype.Serializable_undefined

      type t = memory
      let name = "symbolic-locations"

      let reprs = [ { values = List.hd K2V.M.reprs;
                      zones = List.hd K2Z.reprs;
                      deps = List.hd B2K.reprs;
                      syntactic_deps = List.hd B2K.reprs;
                    } ]

      let structural_descr =
        Structural_descr.t_record [|
          K2V.packed_descr;
          K2Z.packed_descr;
          B2K.packed_descr;
          B2K.packed_descr;
        |]

      let compare m1 m2 =
        let c = K2V.compare m1.values m2.values in
        if c <> 0 then c else K2Z.compare m1.zones m2.zones

      let equal = Datatype.from_compare

      let pretty fmt m =
        Format.fprintf fmt "@[<v>V: @[%a@]@ Z: @[%a@]@ I: @[%a@]@ S: @[%a@]@]"
          K2V.M.pretty m.values K2Z.pretty m.zones
          B2K.pretty m.deps B2K.pretty m.syntactic_deps

      let hash m = Hashtbl.hash (K2V.hash m.values, K2Z.hash m.zones)

      let copy c = c

    end)

  let top = {
    values = K2V.M.empty;
    zones = K2Z.empty;
    deps = B2K.empty;
    syntactic_deps = B2K.empty;
  }

  let empty_map = top

  let is_included m1 m2 =
    K2V.is_included m1.values m2.values &&
    K2Z.is_included m1.zones m2.zones
  (* No need to check the two other fields, that are only inverse mappings
     from the first two ones *)

  (* bases on which a Cvalue.V depends *)
  let v_deps v =
    let aux b acc =
      let add =
        match b with
        | Base.Var (vi, _) -> not vi.vglob
        | Base.Allocated _ -> true (* can be freed. TODO: handle free *)
        | Base.Null | Base.CLogic_Var _ -> false (* does not appear yet *)
        | Base.String _ -> false (* can be seen as a global*)
      in
      if add then Base.Set.add b acc else acc
    in
    V.fold_bases aux v Base.Set.empty

  let key_deps k =
    match K.HCE.get k with
    | K.E e -> vars_exp e
    | K.LV lv -> vars_lv lv

  let add_deps k v z state =
    let add_dep b deps =
      let s = B2K.find_default b deps in
      let s' = K.HCESet.add k s in
      B2K.add b s' deps
    in
    let deps = Zone.fold_bases add_dep z state.deps in
    let bases = Base.Set.union (key_deps k) (v_deps v) in
    let syntactic_deps = Base.Set.fold add_dep bases state.syntactic_deps in
    { state with deps; syntactic_deps }

  (* Auxiliary function that add [k] to [state]. [v] is the value bound to
     [k], [z] the dependency information. *)
  let add_key k v z state =
    let values = K2V.add k v state.values in
    let zones = K2Z.add k z state.zones in
    try add_deps k v z { state with values; zones }
    with Abstract_interp.Error_Top (* unknown dependencies *) -> state

  (* rebuild the state from scratch, especially [deps] and [syntactic_deps].
     For debugging purposes. *)
  let rebuild state =
    let aux k v acc =
      let z =
        try K2Z.find k state.zones
        with Not_found ->
          Self.abort "Missing zone for %a@.%a"
            K.HCE.pretty k pretty state
      in
      add_deps k v z acc
    in
    let state = { state with deps = B2K.empty; syntactic_deps = B2K.empty } in
    K2V.fold aux state.values state

  (* check that a state is correct w.r.t. the invariants on [deps] and
     [syntactic_deps]. *)
  let _check state =
    assert (equal state (rebuild state))

  (* inverse operation of [add_key] *)
  let remove_key k state =
    try
      let v = K2V.find k state.values in
      let values = K2V.remove k state.values in
      let zones = K2Z.remove k state.zones in
      let aux_deps b d =
        let set_b = try B2K.find b d with Not_found -> assert false in
        let set_b' = K.HCESet.remove k set_b in
        if K.HCESet.is_empty set_b'
        then B2K.remove b d
        else B2K.add b set_b' d
      in
      (* there exists a dependency associated to k because d(values)=d(zones) *)
      let z = try K2Z.find k state.zones with Not_found -> assert false in
      let deps = Zone.fold_bases aux_deps z state.deps in
      let syn_deps = Base.Set.union (key_deps k) (v_deps v) in
      let syntactic_deps =
        Base.Set.fold aux_deps syn_deps state.syntactic_deps
      in
      { values; zones; deps; syntactic_deps }
    with Not_found -> state

  let remove_keys keys state =
    K.HCESet.fold remove_key keys state

  let join m1 m2 =
    if K2V.equal m1.values m2.values && K2Z.equal m1.zones m2.zones then m1
    else
      let remove_m1 = K2V.only_in_left m1.values m2.values in
      let remove_m2 = K2V.only_in_left m2.values m1.values in
      let m1 = K2V.fold (fun k _ m -> remove_key k m) remove_m1 m1 in
      let m2 = K2V.fold (fun k _ m -> remove_key k m) remove_m2 m2 in
      { values = K2V.join m1.values m2.values;
        zones = K2Z.union m1.zones m2.zones;
        deps = B2K.union m1.deps m2.deps;
        syntactic_deps = B2K.union m1.syntactic_deps m2.syntactic_deps;
      }

  let widen _kf _wh m1 m2 =
    if K2V.equal m1.values m2.values && K2Z.equal m1.zones m2.zones
    then m1
    else { m2 with values = K2V.widen m1.values m2.values }

  (* TODO *)
  let narrow m1 _m2 = `Value m1

  (* ------------------------------------------------------------------------ *)
  (* --- High-level functions                                             --- *)
  (* ------------------------------------------------------------------------ *)

  (* fold on all the keys of [state] overwritten when [z] is written *)
  let fold_overwritten f state z acc =
    (* Check if [k] is overwritten *)
    let aux_key k acc =
      try
        let z_k = K2Z.find k state.zones in
        if Zone.intersects z z_k then f k acc else acc
      with Not_found -> acc
    in
    (* Check the keys overwritten among those depending on [b] *)
    let aux_base b acc =
      let keys = B2K.find_default b state.deps in
      K.HCESet.fold aux_key keys acc
    in
    try
      (* Check all the keys overwritten *)
      Zone.fold_bases aux_base z acc
    with Abstract_interp.Error_Top -> top

  (* remove the keys that depend on the variables in [l] *)
  let remove_variables l state =
    let aux_vi state vi =
      let b = Base.of_varinfo vi in
      let keys = B2K.find_default b state.syntactic_deps in
      remove_keys keys state
    in
    List.fold_left aux_vi state l

  let kill loc state =
    let z = Locations.(enumerate_valid_bits Read loc) in
    fold_overwritten remove_key state z state

  (* Add the the mapping [lv --> v] to [state] when possible.
     [get_z] is a function that computes dependencies. *)
  let add_lv state get_z lv v  =
    if Eva_ast.lval_contains_volatile lv then
      state
    else
      let k = K.HCE.of_lval lv in
      let z_lv = Precise_locs.enumerate_valid_bits Locations.Read (get_z lv) in
      let z_lv_indirect = Eva_ast.indirect_zone_of_lval get_z lv in
      if Locations.Zone.intersects z_lv z_lv_indirect then
        (* The location of [lv] intersects with the zones needed to compute
           itself, the equality would not hold. *)
        state
      else
        let z = Zone.join z_lv z_lv_indirect in
        add_key k v z state

  (* Add the mapping [e --> v] to [state] when possible and useful.
     [get_z] is a function that computes dependencies. *)
  let add_exp state get_z e v =
    if Eva_ast.exp_contains_volatile e then
      state
    else
      let k = K.HCE.of_exp e in
      let z = Eva_ast.zone_of_exp get_z e in
      add_key k v z state

  let find k state =
    try Some (K2V.find k state.values)
    with Not_found -> None

  let find_lval lv state =
    find (K.HCE.of_lval lv) state

  let find_expr expr state =
    find (K.HCE.of_exp expr) state

  (* [gather_keys bases t] returns the set of keys bound to a base in [bases]
     in [t.deps] or [t.syntactic_deps]. *)
  let gather_keys =
    let fold2 =
      B2K.fold2_join_heterogeneous
        ~cache:Hptmap_sig.NoCache
        ~empty_left:(fun _ -> K.HCESet.empty)
        ~empty_right:(fun _ -> K.HCESet.empty)
        ~both:(fun _ keys _ -> keys)
        ~join:K.HCESet.union
        ~empty:K.HCESet.empty
    in
    fun bases t ->
      K.HCESet.union (fold2 t.syntactic_deps bases) (fold2 t.deps bases)

  (* Projects a state [t] onto the set of bases [bases]; used by MemExec to
     efficiently compare different entry states for a function analysis.
     Dependencies are left empty, as they are redundant with the [values] and
     [zones] map – they could be rebuilt from the zones map. The maps produced
     by [filter] should never be propagated, and a proper map is rebuild by
     [reuse] if needed. *)
  let filter bases t =
    let keys = gather_keys bases t in
    let zones = K2Z.inter_with_shape keys t.zones in
    let values = K2V.inter_with_shape keys t.values in
    { values; zones; deps = B2K.empty; syntactic_deps = B2K.empty }

  (* Removes from [t] all information about keys whose dependencies intersect
     the set of bases [bases]. Note that dependencies are not minimal in the
     result. *)
  let diff bases t =
    let keys = gather_keys bases t in
    let values = K2V.diff_with_shape keys t.values in
    let zones = K2Z.diff_with_shape keys t.zones in
    let deps = B2K.diff_with_shape bases t.deps in
    let syntactic_deps = B2K.diff_with_shape bases t.syntactic_deps in
    { values; zones; deps; syntactic_deps }

  (* Merges all properties from [t] into [into]. *)
  let merge ~into t =
    { values = K2V.merge into.values t.values;
      zones = K2Z.merge ~into:into.zones t.zones;
      deps = B2K.union into.deps t.deps;
      syntactic_deps = B2K.union into.syntactic_deps t.syntactic_deps }
end

module D : Abstract_domain.Leaf
  with type state = Memory.t
   and type value = V.t
   and type location = Precise_locs.precise_location
= struct
  type state = Memory.t
  type value = V.t
  type location = Precise_locs.precise_location
  type origin

  let value_dependencies = Main_values.cval
  let location_dependencies = Main_locations.ploc

  include (Memory: sig
             include Datatype.S_with_collections with type t = state
             include Abstract_domain.Lattice with type state := state
           end)

  include Domain_builder.Complete (Memory)

  let empty _ = Memory.empty_map

  let enter_scope _kind _vars state = state
  let leave_scope _kf vars state =
    (* removed variables revert implicitly to Top *)
    Memory.remove_variables vars state

  (* build a [get_locs] function from a valuation *)
  let get_locs valuation =
    fun lv ->
    let r =
      match valuation.Abstract_domain.find_loc lv with
      | `Top -> Precise_locs.loc_top
      | `Value loc -> loc.Eval.loc
    in
    if Precise_locs.(equal_loc loc_top r) then
      Self.fatal "Unknown location for %a" Eva_ast.pp_lval lv
    else r

  let get_val valuation = fun lv ->
    match valuation.Abstract_domain.find lv with
    | `Top -> Cvalue.V.top_int
    | `Value v ->
      match v.Eval.value.Eval.v with
      | `Bottom -> Cvalue.V.bottom
      | `Value v -> v

  (* update the state according to the information known in the valuation.
     Important, because on statements such as [if (t[i] + j <= 3)], the
     interesting information on [t[i]] is only in the valuation. *)
  let update valuation state =
    let aux e r state =
      let v = r.value in
      (* TODO: incorporate DB criterion: only expressions that are immediate
         lvalues, or that embed two non-singleton lvalues for the first
         time. *)
      match r.reductness, v.v, v.initialized, v.escaping with
      | (Created | Reduced), `Value v, true, false ->
        if interesting_exp (get_locs valuation) (get_val valuation) e then
          begin
            let k = K.HCE.of_exp e in
            (* remove the existing binding: the key may already be in
               the state, and [add_exp] assumes it is not the case.
               The new dependencies may not be the same (in rare cases
               where one dependency has disappeared by reduction), so
               we need to update the dependency inverse maps. *)
            (* TODO: it would be more efficient to use a function that
               compares the previous and current dependencies, and update
               the inverse maps accordingly. *)
            let state = Memory.remove_key k state in
            Memory.add_exp state (get_locs valuation) e v
          end
        else
          state
      | _ -> state
    in
    `Value (valuation.Abstract_domain.fold aux state)

  let store_value valuation lv loc state v =
    let loc = Precise_locs.imprecise_location loc in
    (* Remove the keys that are overwritten because [loc] is written *)
    let state = Memory.kill loc state in
    if Locations.cardinal_zero_or_one loc then
      (* Stored by the standard domain. Skip *)
      `Value state
    else
      (* Add the new binding *)
      `Value (Memory.add_lv state (get_locs valuation) lv v)

  (* Assume we may be copying indeterminate bits. Kill existing information *)
  let store_indeterminate state loc =
    let loc = Precise_locs.imprecise_location loc in
    `Value (Memory.kill loc state)

  let store_copy valuation lv loc state fv =
    if Cil.isScalarType lv.lval.typ then
      match fv.v, fv.initialized, fv.escaping with
      | `Value v, true, false -> store_value valuation lv.lval loc state v
      | _ -> store_indeterminate state loc
    else
      store_indeterminate state loc

  (* perform [lv = e] in [state] *)
  let assign _kinstr lv _e v valuation state =
    update valuation state >>- fun state ->
    match v with
    | Copy (_, vc) -> store_copy valuation lv lv.lloc state vc
    | Assign v -> store_value valuation lv.lval lv.lloc state v

  let assume _stmt _exp _pos valuation state = update valuation state

  let start_recursive_call recursion state =
    let vars = List.map fst recursion.substitution @ recursion.withdrawal in
    Memory.remove_variables vars state

  let start_call _stmt _call recursion valuation state =
    update valuation state >>-: fun state ->
    let start_recursive_call r = start_recursive_call r state in
    Option.fold ~some:start_recursive_call ~none:state recursion

  let finalize_call _stmt _call _recursion ~pre:_ ~post = `Value post

  let top_query = `Value (V.top, None), Alarmset.all

  (* For extraction functions, if we have an information about the value,
     this means that the key has been evaluated in all the paths that reach
     this point. Hence, the alarms have already been emitted, and we can
     return [Alarmset.none]. *)

  let extract_expr ~oracle:_ _context state expr =
    match Memory.find_expr expr state with
    | None -> top_query
    | Some v -> `Value (v, None), Alarmset.none

  let extract_lval ~oracle:_ _context state lv _locs =
    match Memory.find_lval lv state with
    | None -> top_query
    | Some v -> `Value (v, None), Alarmset.none

  (* We could implement [backward_location if [[lval]] intersects [value] and
     return [`Bottom] if it is not the case, but we have already supplied
     [[lval]] during the forward propagation, so the intersection is probably
     always non-empty. *)

  (* Memexec: the symbolic locations domain is relational, as it may infer a
     value for an expression or lvalue involving two different variables.
     However, such values are only used when the expression or lvalue is
     evaluated as it is: during the analysis of f, this domain cannot relate
     by itself a variable read or written by f to a variable that is not. *)
  let relate _kf _bases _state = Base.SetLattice.empty

  let filter _kind = Memory.filter

  (* Efficient version of [reuse], but the resulting state does not satisfy
     the [_check state], as some extra dependenies of keys removed from the
     [current_input] may remain. *)
  let reuse _kf bases ~current_input ~previous_output =
    let into = Memory.diff bases current_input in
    let state = Memory.merge ~into (Memory.rebuild previous_output) in
    state

  (* Less efficient version of [reuse], using successive applications of
     [Memory.remove] and [Memory.add]. The resulting state is canonical and
     satisfies [_check state]. *)
  let _reuse _kf bases ~current_input ~previous_output =
    let keys = Memory.gather_keys bases current_input in
    let state = Memory.remove_keys keys current_input in
    let keys = Memory.gather_keys bases previous_output in
    K.HCESet.fold
      (fun elt acc ->
         let value = K2V.find elt previous_output.Memory.values in
         let zone = K2Z.find elt previous_output.Memory.zones in
         Memory.add_key elt value zone acc)
      keys state

  (* Initial state. Initializers are singletons, so we store nothing. *)
  let initialize_variable_using_type _ _ state = state
  let initialize_variable _ _ ~initialized:_ _ state = state

  (* Logic *)
  let logic_assign _assigns location state =
    let loc = Precise_locs.imprecise_location location in
    Memory.kill loc state
end

let registered =
  let name = "symbolic-locations"
  and descr =
    "Infers values of symbolic locations represented by imprecise lvalues, \
     such as t[i] or *p when the possible values of [i] or [p] are imprecise."
  in
  Abstractions.Domain.register ~name ~descr ~priority:7 (module D)
