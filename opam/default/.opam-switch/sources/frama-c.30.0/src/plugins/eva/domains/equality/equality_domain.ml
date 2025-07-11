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

type call_init_state =
  | ISCaller
  | ISFormals
  | ISEmpty

let call_init_state kf =
  let str =
    try Parameters.EqualityCallFunction.find kf
    with Not_found -> Parameters.EqualityCall.get ()
  in
  match str with
  | "all" -> ISCaller
  | "formals" -> ISFormals
  | "none" -> ISEmpty
  | _ -> assert false

open Hcexprs

(* ------------------------- Dependences ------------------------------------ *)

module Deps = struct
  include Datatype.Pair (HCEToZone) (BaseToHCESet)
  (* Map from expression to its dependencies, and inverse map from the
     bases of the dependencies to the expressions *)

  let empty = HCEToZone.empty, BaseToHCESet.empty

  let join (m1, i1) (m2, i2) =
    HCEToZone.inter m1 m2, BaseToHCESet.union i1 i2

  let is_included (m1, _) (m2, _) =
    HCEToZone.is_included m1 m2

  let concat (m1, i1) (m2, i2) =
    HCEToZone.union m1 m2, BaseToHCESet.union i1 i2

  let intersects (m, i: t) z =
    let aux_e e acc =
      try
        let z_e = HCEToZone.find e m in
        if Locations.Zone.intersects z z_e then
          e :: acc
        else acc
      with Not_found -> acc
    in
    let aux_base b _ acc =
      let set = BaseToHCESet.find_default b i in
      HCESet.fold aux_e set acc
    in
    (* TODO: a recursive descent would be much more effective *)
    Locations.Zone.fold_topset_ok aux_base z []

  let add e z (m, i : t) =
    let aux_base b _ acc =
      let set = BaseToHCESet.find_default b i in
      let set = HCESet.add e set in
      BaseToHCESet.add b set acc
    in
    let i = Locations.Zone.fold_topset_ok aux_base z i in
    let m = HCEToZone.add e z m in
    (m, i : t)

  let remove e (m, i as state : t) =
    try
      let z = HCEToZone.find e m in
      let aux_base b _ i =
        let s = BaseToHCESet.find_default b i in
        let s = HCESet.remove e s in
        if HCESet.is_empty s then
          BaseToHCESet.remove b i
        else
          BaseToHCESet.add b s i
      in
      let i = Locations.Zone.fold_topset_ok aux_base z i in
      let m = HCEToZone.remove e m in
      (m, i)
    with Not_found -> (* cannot find [e] in [m] *)
      state

end


(* --------------------- Internal Types of the Domain ----------------------- *)

module Internal = struct

  include Datatype.Triple_with_collections
      (Equality.Set)
      (Deps)
      (Locations.Zone) (* memory zones that have been overwritten since
                          the beginning of the function. Not used when the
                          state of the caller is used as initial state. *)
      (struct let module_name = "equality_domain_reloaded" end)

  type state = t

  let name = "equality"

  let pretty fmt (eqs, _, _) = Equality.Set.pretty fmt eqs

  let _pretty_debug fmt (eqs, deps, modified) =
    Format.fprintf fmt
      "@[<v>@[<hov 2>Eqs: %a@]@.@[<hov 2>Deps: %a@]@.@[<hov 2>Changed: %a@]@]"
      Equality.Set.pretty eqs Deps.pretty deps
      Locations.Zone.pretty modified

  let empty = Equality.Set.empty, Deps.empty, Locations.Zone.bottom
  let top = Equality.Set.empty, Deps.empty, Locations.Zone.top

  let rec fold_tree f t acc =
    match t with
    | Equality.Empty -> acc
    | Equality.Leaf v -> f v acc
    | Equality.Node (t1, t2) -> fold_tree f t2 (fold_tree f t1 acc)

  let is_included (a, m, y) (b, n, z) =
    Equality.Set.subset b a && Deps.is_included m n
    && Locations.Zone.is_included y z
  let join (e1, d1, z1) (e2, d2, z2) =
    let e' = Equality.Set.inter e1 e2 in
    let z' = Locations.Zone.join z1 z2 in
    let removed1 = Equality.Set.lvalues_only_left e1 e' in
    let removed2 = Equality.Set.lvalues_only_left e2 e' in
    let d1' = fold_tree Deps.remove removed1 d1 in
    let d2' = fold_tree Deps.remove removed2 d2 in
    let d' = Deps.join d1' d2' in
    e', d', z'

  (* Can we define a more efficient widening? *)
  let widen _kf _stmt a b = join a b

  let concat (e1, d1, z1) (e2, d2, z2) =
    Equality.Set.union e1 e2, Deps.concat d1 d2, Locations.Zone.join z1 z2

  let narrow (e1, d1, z1) (e2, d2, z2) =
    if Deps.equal d1 d2
    then `Value (Equality.Set.union e1 e2, d1, Locations.Zone.narrow z1 z2)
    else `Value (e1, d1, z1)
end

module Store = Domain_builder.Complete (Internal)

type t = Internal.t
let key = Store.key
let project (t, _, _) = t


(* ------------------------- Abstract Domain -------------------------------- *)

module type Context = Abstract.Context.External
module type Value = Abstract.Value.External

module Make (Context : Context) (Value : Value with type context = Context.t) =
struct

  include Internal
  include Store

  let get_cvalue = Value.get Main_values.CVal.key

  type context = Context.t
  type value = Value.t
  type location = Precise_locs.precise_location
  type origin

  let build_context _ = `Value Context.top

  let reduce_further (equalities, _, _) expr value =
    let atom = HCE.of_exp expr in
    match Equality.Set.find_option atom equalities with
    | Some equality ->
      Equality.Equality.fold
        (fun atom acc ->
           let e = HCE.to_exp atom in
           if Eva_ast.Exp.equal e expr
           then acc else (e, value) :: acc)
        equality []
    | None -> []

  (* Remove all 'origin' information from the Cvalue component of a value.
     Since we perform evaluations at the current statement, the origin
     information we compute is incompatible with the one obtained from e.g.
     the Cvalue domain. *)
  let imprecise_origin =
    match get_cvalue with
    | None -> fun v -> v
    | Some get ->
      fun v ->
        let c = get v in
        if Cvalue.V.is_imprecise c then
          let c' = Cvalue.V.topify_with_origin Origin.unknown c in
          Value.set Main_values.CVal.key c' v
        else v

  let coop_eval oracle equalities atom_src =
    match Equality.Set.find_option atom_src equalities with
    | Some equality ->
      let aux_eq atom acc =
        if HCE.equal atom atom_src then acc (* avoid trivial recursion *)
        else
          let e = HCE.to_exp atom in
          let v', _alarms = oracle e in
          Bottom.narrow Value.narrow acc v'
      in
      let v = Equality.Equality.fold aux_eq equality (`Value Value.top) in
      (* Remove the 'origin' information of garbled mixes. *)
      let v = v >>-: fun v -> imprecise_origin v, None in
      (* All expressions used by the equality domain have already been evaluated
         before during the analysis; alarms about those expressions have already
         been emitted. *)
      v, Alarmset.none
    | None -> `Value (Value.top, None), Alarmset.all

  let extract_expr ~oracle _context (equalities, _, _) expr =
    let expr = Eva_ast.const_fold expr in
    let atom_e = HCE.of_exp expr in
    coop_eval oracle equalities atom_e

  let extract_lval ~oracle _context (equalities, _, _) lval _location =
    let atom_lv = HCE.of_lval lval in
    coop_eval oracle equalities atom_lv

  let kill kt zone (equalities, deps, modified_zone) =
    if Locations.Zone.(equal zone top) then
      top
    else
      let modified_zone =
        match kt with
        | Hcexprs.Modified -> Locations.Zone.join modified_zone zone
        | Hcexprs.Deleted -> Locations.Zone.diff modified_zone zone
      in
      match Deps.intersects deps zone with
      | [] -> equalities, deps, modified_zone
      | atoms ->
        let extract_lval h = Option.get (HCE.to_lval h) in
        let atoms = List.map extract_lval atoms in
        let process eq atom = Equality.Set.remove kt atom eq in
        let equalities' = List.fold_left process equalities atoms in
        let disappeared =
          Equality.Set.lvalues_only_left equalities equalities'
        in
        let deps = fold_tree Deps.remove disappeared deps in
        let s' = equalities', deps, modified_zone in
        s'

  (* assume that [vars] go out of scope, and remove them from the list of
     equalities *)
  let unscope state vars =
    let aux_vi zones vi =
      let z = Locations.zone_of_varinfo vi in
      Locations.Zone.join z zones
    in
    let zone = List.fold_left aux_vi Locations.Zone.bottom vars in
    kill Hcexprs.Deleted zone state

  let find_val valuation expr =
    match valuation.Abstract_domain.find expr with
    | `Top -> Value.top
    | `Value record -> Bottom.non_bottom record.value.v

  let minus_zero = Cvalue.V.inject_float Fval.minus_zero
  let plus_zero = Cvalue.V.inject_float Fval.plus_zero

  let incompatible_zeros v1 v2 =
    let aux v1 v2 =
      Cvalue.V.(is_included minus_zero v1 && is_included plus_zero v2)
    in
    aux v1 v2 || aux v2 v1

  (* Does the equality between two expressions imply they have the same
     object representation, allowing the narrow of their abstract values? *)
  let is_safe_equality =
    match get_cvalue with
    | None -> fun _ _ _ -> false
    | Some get_cvalue ->
      fun valuation e1 e2 ->
        let cval1 = get_cvalue (find_val valuation e1)
        and cval2 = get_cvalue (find_val valuation e2) in
        Cvalue_forward.are_comparable Abstract_interp.Comp.Eq cval1 cval2
        && not (incompatible_zeros cval1 cval2)

  exception Top_location

  let find_loc valuation = fun lval ->
    match valuation.Abstract_domain.find_loc lval with
    | `Top -> raise Top_location
    | `Value record -> record.loc

  let add_one_dep valuation lval deps =
    match HCE.get lval with
    | E _ -> assert false
    | LV lv ->
      let zone =
        match lv.node with
        | Var vi, NoOffset -> Locations.zone_of_varinfo vi
        | _ ->
          let expr = Eva_ast.Build.lval lv in
          Eva_ast.zone_of_exp (find_loc valuation) expr
      in
      Deps.add lval zone deps

  let add_deps valuation lvalues deps =
    let deps = HCESet.fold (add_one_dep valuation) lvalues.read deps in
    HCESet.fold (add_one_dep valuation) lvalues.addr deps

  let update _valuation state = `Value state

  let is_singleton = match get_cvalue with
    | None -> fun _ -> false
    | Some get ->
      function
      | `Bottom -> true
      | `Value v -> Cvalue.V.cardinal_zero_or_one (get v)

  let expr_cardinal_zero_or_one valuation e =
    match valuation.Abstract_domain.find e with
    | `Top -> false (* should not happen *)
    | `Value { value = { v } } -> is_singleton v

  let expr_is_cardinal_zero_or_one_loc valuation (e : Eva_ast.exp) =
    match e.node with
    | Lval lv -> begin
        let loc = valuation.Abstract_domain.find_loc lv in
        match loc with
        | `Top -> false (* should not happen *)
        | `Value loc -> Precise_locs.cardinal_zero_or_one loc.loc
      end
    | _ -> false (* TODO: handle upcasts *)


  let register expr valuation deps =
    let term = HCE.of_exp expr in
    if HCE.is_lval term
    then
      let deps = add_one_dep valuation term deps in
      term, Hcexprs.empty_lvalues, deps
    else
      let lvalues = Hcexprs.syntactic_lvalues expr in
      term, lvalues, add_deps valuation lvalues deps

  let indeterminate_copy = function
    | Assign _ -> false
    | Copy (_loc, value) -> not value.initialized || value.escaping

  (* Auxiliary function for [assign]. The equality is inferred, unless:
     - some of the expressions involved are volatile
     - the value has an aggregate type (as the current Eva values have no
       meaning for such type, the equality would be useless or misleading).
     - it is an assignment by copy, and the copied value is possibly
       unitialized or escaping. In this case, when using the equality later,
       the reevaluation of [right_expr] would reduce it incorrectly, by
       removing indeterminate flags without emitting alarms. *)
  let assign_eq left_lval right_expr value valuation state =
    if Eva_ast.lval_contains_volatile left_lval ||
       Eva_ast.exp_contains_volatile right_expr ||
       not (Cil.isScalarType left_lval.typ) ||
       indeterminate_copy value
    then state
    else
      let (equalities, deps, modified_zone: t) = state in
      let lterm = HCE.of_lval left_lval in
      let lterm_lvals = Hcexprs.empty_lvalues in
      let deps = add_one_dep valuation lterm deps in
      let rterm, rterm_lvals, deps = register right_expr valuation deps in
      let equalities =
        Equality.Set.unite
          (lterm, lterm_lvals) (rterm, rterm_lvals) equalities
      in
      (equalities, deps, modified_zone: t)

  let assign _stmt left_value right_expr value valuation state =
    let open Locations in
    let left_loc = Precise_locs.imprecise_location left_value.lloc in
    let direct_left_zone = Locations.(enumerate_valid_bits Write left_loc) in
    let state = kill Hcexprs.Modified direct_left_zone state in
    let right_expr = Eva_ast.const_fold right_expr in
    try
      let indirect_left_zone =
        Eva_ast.indirect_zone_of_lval (find_loc valuation) left_value.lval
      and right_zone =
        Eva_ast.zone_of_exp (find_loc valuation) right_expr
      in
      (* After an assignment lv = e, the equality [lv == eq] holds iff the value
         of [e] and the location of [lv] are not modified by the assignment,
         i.e. iff the dependencies of [e] and of the lhost and offset of [lv]
         do not intersect the assigned location.
         Moreover, the domain do not store the equality when the abstract
         location of [lv] and the abstract value of [e] are singleton, as in
         this case, the main cvalue domain is able to infer the equality. *)
      if (Zone.intersects direct_left_zone right_zone) ||
         (Zone.intersects direct_left_zone indirect_left_zone) ||
         (is_singleton (Eval.value_assigned value) &&
          Locations.cardinal_zero_or_one left_loc)
      then `Value state
      else `Value (assign_eq left_value.lval right_expr value valuation state)
    with Top_location -> `Value state

  (* Add the equalities between the formals of a function and the actuals
     at the call. *)
  let assign_formals valuation call state =
    let assign_formal state arg =
      if is_singleton (Eval.value_assigned arg.avalue) then
        state
      else
        try
          let left_value = Eva_ast.Build.var arg.formal in
          assign_eq left_value arg.concrete arg.avalue valuation state
        with Top_location -> state
    in
    List.fold_left assign_formal state call.arguments

  (* The domain infers equalities [e1 = e2] stemming from assignments,
     meaning that e1 and e2 have not only the same value, but also the same
     object representation — their values can thus be safely narrowed,
     which is used by the domain to regain precision when possible.
     The domain can also infer equalities from conditions, but C values
     with different object representations may be equal, invalidating this
     reasoning. This is the case for equalities between 0. and -0., and
     between non-comparable pointers, so we need to skip such equalities. *)
  let assume _stmt expr positive valuation (eqs, deps, modified_zone as state) =
    match positive, (expr : Eva_ast.exp).node with
    | true,  BinOp (Eq, e1, e2, _)
    | false, BinOp (Ne, e1, e2, _) ->
      begin
        if not (is_safe_equality valuation e1 e2)
        then `Value state
        else
          let e1 = Eva_ast.const_fold e1
          and e2 = Eva_ast.const_fold e2 in
          if Eva_ast.exp_contains_volatile e1
          || Eva_ast.exp_contains_volatile e2
          || not (Cil.isScalarType e1.typ)
          || (expr_is_cardinal_zero_or_one_loc valuation e1 &&
              expr_cardinal_zero_or_one valuation e2)
          || (expr_is_cardinal_zero_or_one_loc valuation e2 &&
              expr_cardinal_zero_or_one valuation e1)
          then `Value state
          else
            try
              let a1, a1_lvals, deps = register e1 valuation deps in
              let a2, a2_lvals, deps = register e2 valuation deps in
              let eqs = Equality.Set.unite (a1, a1_lvals) (a2, a2_lvals) eqs in
              `Value (eqs, deps, modified_zone)
            with Top_location -> `Value state
      end
    | _ -> `Value state

  let start_recursive_call recursion state =
    let vars = List.map fst recursion.substitution @ recursion.withdrawal in
    unscope state vars

  let start_call _stmt call recursion valuation state =
    let state =
      match recursion with
      | Some recursion ->
        (* No relation inferred from the assignment of formal parameters
           for recursive calls, because the valuation cannot be used safely
           as the substitution of local and formals variables has not been
           applied to it. *)
        start_recursive_call recursion state
      | None ->
        match call_init_state call.kf with
        | ISCaller  -> assign_formals valuation call state
        | ISFormals -> assign_formals valuation call empty
        | ISEmpty   -> empty
    in
    `Value state

  let finalize_call _stmt call _recursion ~pre ~post =
    if call_init_state call.kf = ISCaller then
      `Value post (* [pre] was the state inferred in the caller, and it
                     has been updated during the analysis of [kf] into
                     [post]. Send all the equalities back to the caller. *)
    else
      (* [pre] contains the equalities from the caller, but [post] was
         computed starting from an essentially empty state. We must
         restore the equalities of [pre]. *)
      let (_, _, modif) = post in
      (* Invalidate the equalities that are no longer true. *)
      let pre' = kill Hcexprs.Modified modif pre in
      (* then merge the two sets of equalities *)
      `Value (concat pre' post)

  let show_expr _valuation (equalities, _, _) fmt expr =
    let atom = Hcexprs.HCE.of_exp expr in
    match Equality.Set.find_option atom equalities with
    | Some equality -> Equality.Equality.pretty fmt equality
    | None -> ()

  let logic_assign _assigns location state =
    let loc = Precise_locs.imprecise_location location in
    let zone = Locations.(enumerate_valid_bits Write loc) in
    kill Hcexprs.Modified zone state

  let enter_scope _kind _vars state = state
  let leave_scope _kf vars state = unscope state vars

  let empty () = empty
  let initialize_variable _ _ ~initialized:_ _ state = state
  let initialize_variable_using_type _ _ state  = state

  let relate kf _bases _state =
    match call_init_state kf with
    | ISEmpty | ISFormals -> Base.SetLattice.empty
    | ISCaller -> Base.SetLattice.top
end



module Functor = struct
  type location = Precise_locs.precise_location
  let location_dependencies = Main_locations.ploc
  module Make (C : Context) (V : Value with type context = C.t) = Make (C) (V)
end

let registered =
  let name = "equality" and priority = 8 in
  let descr =
    "Infers equalities between syntactic C expressions. \
     Makes the analysis less dependent on temporary variables and \
     intermediate computations."
  in
  Abstractions.Domain.register_functor ~name ~priority ~descr (module Functor)
