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

open Cil_types
open Cil
open Abstract_interp

module Hptmap_Info = struct
  let initial_values = [ [Base.null,Ival.zero];
                         [Base.null,Ival.one];
                         [Base.null,Ival.zero_or_one];
                         [Base.null,Ival.top];
                         [Base.null,Ival.top_float];
                         [Base.null,Ival.top_single_precision_float];
                         [Base.null,Ival.float_zeros];
                       ]

  let dependencies = [ Ast.self ]
end

(* Store the information that the location has at most cardinal 1, ignoring
   weak bases. The rationale is as follows: this compositional bool is used
   to improve the performance of slevel, to detect the parts of memory states
   that are "exact". Intuitively, locations that involve weak bases do not
   qualify. However, "exact" must be understood w.r.t. the [is_included]
   function: a value is "exact" if no other value than itself and bottom
   are included in it. Said otherwise, we do not consider the cardinality
   of the concretization, but instead the one of the Ocaml datastructure. *)
module Comp_exact = struct
  let empty = true (* corresponds to bottom *)

  let leaf _b v = Ival.cardinal_zero_or_one v
  (* on Ival, both forms of cardinal coincide *)

  let compose _ _ = false
  (* Keys cannot be bound to Bottom (see MapLattice). Hence, two subtrees have
     a t least cardinal two. *)
end


module Location_Bytes = struct

  module M = struct
    include Hptmap.Make_with_compositional_bool
        (Base.Base) (Ival) (Comp_exact) (Hptmap_Info)
    let shape x = x
  end
  let () = Ast.add_monotonic_state M.self
  let clear_caches = M.clear_caches

  module MapLattice = struct
    include Map_lattice.Make_Map_Lattice (Base) (Ival) (M)
    include With_Cardinality (struct let is_summary = Base.is_weak end) (Ival)
  end

  module MapSetLattice = struct
    include Map_lattice.Make_MapSet_Lattice
        (Base.Base) (Base.SetLattice) (Ival) (MapLattice)
    include With_Cardinality (MapLattice)
  end

  include MapSetLattice
  (* Invariant :
     [Top (s, _) must always contain NULL, _and_ at least another base.
     Top ({Null}, _) is replaced by Top_int]. See inject_top_origin_internal
     below. *)

  let find_or_bottom = MapLattice.find_or_bottom
  let is_bottom = equal bottom

  let filter_base = filter_keys
  let fold_bases = fold_keys
  let fold_i f t acc = match t with
    | Top _ -> raise Error_Top
    | Map m -> MapLattice.fold f m acc
  let fold_topset_ok = fold
  let to_seq_i = function
    | Top _ -> raise Error_Top
    | Map m -> MapLattice.to_seq m
  let inject_ival i = inject Base.null i

  let inject_float f =
    inject_ival
      (Ival.inject_float
         (Fval.inject_singleton f))

  (** Check that those values correspond to {!Initial_Values} above. *)
  let singleton_zero = inject_ival Ival.zero
  let singleton_one = inject_ival Ival.one
  let zero_or_one = inject_ival Ival.zero_or_one
  let top_int = inject_ival Ival.top
  let top_float = inject_ival Ival.top_float
  let top_single_precision_float = inject_ival Ival.top_single_precision_float

  (* true iff [v] is exactly 0 *)
  let is_zero v = equal v singleton_zero

  (* [shift offset l] is the location [l] shifted by [offset] *)
  let shift offset l =
    if Ival.is_bottom offset then bottom
    else map (Ival.add_int offset) l

  (* [shift_under offset l] is the location [l] (an
     under-approximation) shifted by [offset] (another
     under-approximation); returns an underapproximation. *)
  let shift_under offset l =
    if Ival.is_bottom offset then bottom
    else map (Ival.add_int_under offset) l

  let sub_pointwise_map ?factor m1 m2 =
    let factor = match factor with
      | None -> Int_Base.minus_one
      | Some f -> Int_Base.neg f
    in
    (* Subtract pointwise for all the bases that are present in both m1
       and m2. *)
    M.fold2_join_heterogeneous
      ~cache:Hptmap_sig.NoCache
      ~empty_left:(fun _ -> Ival.bottom)
      ~empty_right:(fun _ -> Ival.bottom)
      ~both:(fun _b i1 i2 -> Ival.add_int i1 (Ival.scale_int_base factor i2))
      ~join:Ival.join
      ~empty:Ival.bottom
      m1 m2

  let sub_pointwise ?factor l1 l2 =
    match l1, l2 with
    | Top _, Top _
    | Top (Base.SetLattice.Top, _), Map _
    | Map _, Top (Base.SetLattice.Top, _) -> Ival.top
    | Top (Base.SetLattice.Set s, _), Map m
    | Map m, Top (Base.SetLattice.Set s, _) ->
      let s' = Base.SetLattice.O.add Base.null s in
      if M.exists (fun base _ -> Base.SetLattice.O.mem base s') m then
        Ival.top
      else
        Ival.bottom
    | Map m1, Map m2 -> sub_pointwise_map ?factor m1 m2

  let sub_pointer l1 l2 =
    match l1, l2 with
    | Top (s1, o1), Top (s2, o2) ->
      if Base.SetLattice.intersects s1 s2
      then Top (Base.SetLattice.join s1 s2, Origin.join o1 o2)
      else bottom
    | Top (s, _) as t, Map m
    | Map m, (Top (s, _) as t) ->
      if Base.SetLattice.exists (fun b -> M.mem b m) s then t else bottom
    | Map m1, Map m2 ->
      let ival = sub_pointwise_map m1 m2 in
      inject_ival ival

  let cardinal_zero_or_one = function
    | Top _ -> false
    | Map m ->
      M.is_empty m ||
      M.on_singleton
        (fun b i -> not (Base.is_weak b) && Ival.cardinal_zero_or_one i) m

  let cardinal = function
    | Top _ -> None
    | Map m ->
      let aux_base b i card =
        if Base.is_weak b then None
        else
          match card, Ival.cardinal i with
          | None, _ | _, None -> None
          | Some c1, Some c2 -> Some (Int.add c1 c2)
      in
      M.fold aux_base m (Some Int.zero)

  let top_with_origin origin = Top (Base.SetLattice.top, origin)

  let inject_top_origin o b =
    if Base.Hptset.(equal b empty || equal b Base.null_set) then
      top_int
    else begin
      let bases = Base.SetLattice.inject Base.(Hptset.add null b) in
      Origin.register bases o;
      Top (bases, o)
    end

  (** some functions can reduce a garbled mix, make sure to normalize
      the result when only NULL remains *)
  let normalize_top m =
    match m with
    | Top (Base.SetLattice.Top, _) | Map _ -> m
    | Top (Base.SetLattice.Set s, o) -> inject_top_origin o s

  let narrow m1 m2 = normalize_top (narrow m1 m2)
  let meet m1 m2 = normalize_top (meet m1 m2)

  let is_top = function
    | Top _ -> true
    | Map _ -> false

  let topify_with_origin o v =
    if is_top v || is_zero v || is_bottom v then v
    else
      match get_keys v with
      | Base.SetLattice.Top -> top_with_origin o
      | Base.SetLattice.Set b -> inject_top_origin o b

  let topify kind = topify_with_origin (Origin.current kind)

  let get_bases = get_keys

  let is_relationable m =
    try
      let b,_ = find_lonely_binding m in
      match Base.validity b with
      | Base.Empty | Base.Known _ | Base.Unknown _ | Base.Invalid -> true
      | Base.Variable { Base.weak } -> not weak
    with Not_found -> false

  let may_reach base loc =
    if Base.is_null base then true
    else
      match loc with
      | Top (Base.SetLattice.Top, _) -> true
      | Top (Base.SetLattice.Set s,_) ->
        Base.Hptset.mem base s
      | Map m -> try
          ignore (M.find base m);
          true
        with Not_found -> false

  let contains_addresses_of_locals is_local l =
    match l with
    | Top (Base.SetLattice.Top,_) -> true
    | Top (Base.SetLattice.Set s, _) ->
      Base.SetLattice.O.exists is_local s
    | Map m ->
      M.exists (fun b _ -> is_local b) m

  let remove_escaping_locals is_local v =
    let non_local b = not (is_local b) in
    match v with
    | Top (Base.SetLattice.Top,_) -> true, v
    | Top (Base.SetLattice.Set garble, orig) ->
      let nonlocals = Base.Hptset.filter non_local garble in
      if Base.Hptset.equal garble nonlocals then
        false, v
      else
        true, inject_top_origin orig nonlocals
    | Map m ->
      let nonlocals = M.filter non_local m in
      if M.equal nonlocals m then
        false, v
      else
        true, Map nonlocals

  let contains_addresses_of_any_locals =
    let f base _offsets = Base.is_any_formal_or_local base in
    let projection _base = Ival.top in
    let cached_f =
      cached_fold
        ~cache_name:"loc_top_any_locals"
        ~temporary:false
        ~f
        ~projection
        ~joiner:(||)
        ~empty:false
    in
    fun loc ->
      try
        cached_f loc
      with Error_Top ->
        assert (match loc with
            | Top (Base.SetLattice.Top,_) -> true
            | Top (Base.SetLattice.Set _top_param,_orig) ->
              false
            | Map _ -> false);
        true

  let replace_base substitution v =
    let substitute replace make acc =
      let modified, set' = replace substitution acc in
      modified, if modified then make set' else v
    in
    match v with
    | Top (Base.SetLattice.Top, _) -> false, v
    | Top (Base.SetLattice.Set set, origin) ->
      substitute Base.Hptset.replace (inject_top_origin origin) set
    | Map map ->
      let decide _key  = Ival.join in
      substitute (M.replace_key ~decide) (fun m -> Map m) map

  let overlaps ~partial ~size mm1 mm2 =
    match mm1, mm2 with
    | Top _, _ | _, Top _ -> intersects mm1 mm2
    | Map m1, Map m2 ->
      (* The two locations may overlap if there are two offsets i1 and i2 such
         that |i1-i2| < size (and |i1-i2| > 0 when partial is true). *)
      let pred_size = Int.pred size in
      let min = if partial then Int.one else Int.zero in
      let size_itv = Ival.inject_range (Some min) (Some pred_size) in
      let decide_both _ x y =
        let abs_diff = Ival.abs_int (Ival.sub_int x y) in
        Ival.intersects abs_diff size_itv
      in
      M.symmetric_binary_predicate
        Hptmap_sig.NoCache M.ExistentialPredicate
        ~decide_fast:(fun _ _ -> M.PUnknown)
        ~decide_one:(fun _ _ -> false)
        ~decide_both
        m1 m2

  type widen_hint = Ival.widen_hint

  (* Computes widening thresholds according to the validity of [base]. *)
  let validity_widen_hints base =
    let zero = Datatype.Integer.Set.singleton Integer.zero in
    let int_thresholds =
      match Base.validity base with
      | Base.Known (_, m)
      | Base.Unknown (_, _, m)
      | Base.Variable { Base.max_alloc = m } ->
        (* Try the frontier of the block: further accesses are invalid
           anyway. This also works great for constant strings (this computes
           the offset of the null terminator). *)
        let bound = Integer.(pred (e_div (succ m) eight)) in
        Datatype.Integer.Set.add bound zero
      | Base.Empty | Base.Invalid -> zero
    in
    int_thresholds, Datatype.Float.Set.empty

  let widen ?size ?hint =
    let widen_map =
      let decide base v1 v2 =
        let size, hint =
          if Base.is_null base then size, hint else
            (* Do not perform size-based widening for pointers. This will only
               delay convergence, for no real benefit. The only interesting
               bound is the validity. *)
            None, Some (validity_widen_hints base)
        in
        Ival.widen ?size ?hint v1 v2
      in
      M.join
        ~cache:Hptmap_sig.NoCache (* No cache, because of wh *)
        ~symmetric:false ~idempotent:true ~decide
    in
    fun m1 m2 ->
      match m1, m2 with
      | _ , Top _ -> m2
      | Top _, _ -> assert false (* m2 should be larger than m1 *)
      | Map m1, Map m2 -> Map (widen_map m1 m2)

end

module Location_Bits = Location_Bytes

module Zone = struct

  module Info = struct
    let initial_values = []
    let dependencies = [ Ast.self ]
  end

  module M = Hptmap.Make (Base.Base) (Int_Intervals) (Info)
  let () = Ast.add_monotonic_state M.self
  let clear_caches = M.clear_caches

  module MapLattice =
    Map_lattice.Make_Map_Lattice (Base) (Int_Intervals) (M)

  type map_t = MapLattice.t
  let find_or_bottom = MapLattice.find_or_bottom

  include Map_lattice.Make_MapSet_Lattice
      (Base.Base) (Base.SetLattice) (Int_Intervals) (MapLattice)

  let is_bottom = equal bottom

  let filter_base = filter_keys
  let fold_bases = fold_keys
  let fold_i f t acc = match t with
    | Top _ -> raise Error_Top
    | Map m -> MapLattice.fold f m acc
  let fold_topset_ok = fold

  let pretty fmt m =
    match m with
    | Top (Base.SetLattice.Top,a) ->
      Format.fprintf fmt "ANYTHING(origin:%a)"
        Origin.pretty a
    | Top (s,a) ->
      Format.fprintf fmt "Unknown(%a, origin:%a)"
        Base.SetLattice.pretty s
        Origin.pretty a
    | Map _ when equal m bottom ->
      Format.fprintf fmt "\\nothing"
    | Map off ->
      let print_binding fmt (k, v) =
        Format.fprintf fmt "@[<h>%a%a@]"
          Base.pretty k
          (Int_Intervals.pretty_typ (Base.typeof k)) v
      in
      Pretty_utils.pp_iter ~pre:"" ~suf:"" ~sep:";@,@ "
        (fun f -> M.iter (fun k v -> f (k, v))) print_binding fmt off

  let valid_intersects = intersects

  let mem_base b = function
    | Top (top_param, _) ->
      Base.SetLattice.mem b top_param
    | Map m -> M.mem b m

  let get_bases = get_keys

  let shape x = x

  let fold2_join_heterogeneous ~cache ~empty_left ~empty_right ~both ~join ~empty =
    let f_top =
      (* Build a zone corresponding to the garbled mix. Do not add NULL, we
         are reasoning on zones. Inefficient if empty_right does not use
         its argument, though... *)
      let build_z set =
        let aux b z = M.add b Int_Intervals.top z in
        Map (Base.Hptset.fold aux set M.empty)
      in
      let empty_right set = empty_right (build_z set) in
      let both base v = both base Int_Intervals.top v in
      Base.SetLattice.O.fold2_join_heterogeneous
        ~cache ~empty_left ~empty_right ~both ~join ~empty
    in
    let f_map =
      let empty_right m = empty_right (Map m) in
      let both base itvs v = both base itvs v in
      M.fold2_join_heterogeneous
        ~cache ~empty_left ~empty_right ~both ~join ~empty
    in
    fun z ->
      match z with
      | Top (Base.SetLattice.Top, _) -> raise Error_Top
      | Top (Base.SetLattice.Set s, _) -> f_top s
      | Map mm -> f_map mm

end


type location =
  { loc : Location_Bits.t;
    size : Int_Base.t }

type access = Read | Write | No_access

let project_size = function
  | Int_Base.Value size -> size
  | Int_Base.Top -> Int.zero

(* Conversion into Base.access. A location valid for an access of unknown size
   must be at least valid for an empty access, so accesses of unknown sizes are
   converted into empty accesses. *)
let base_access ~size = function
  | No_access -> Base.No_access
  | Read -> Base.Read (project_size size)
  | Write -> Base.Write (project_size size)

exception Found_two

let valid_cardinal_zero_or_one ~for_writing {loc=loc;size=size} =
  Location_Bits.equal Location_Bits.bottom loc ||
  let found_one =
    let already = ref false in
    function () ->
      if !already then raise Found_two;
      already := true
  in
  try
    match loc, size with
    | Location_Bits.Top _, _ -> false
    | _, Int_Base.Top -> false
    | Location_Bits.Map m, Int_Base.Value size ->
      Location_Bits.M.iter
        (fun base offsets ->
           if Base.is_weak base then raise Found_two;
           let access =
             if for_writing then Base.Write size else Base.Read size
           in
           let valid_offsets =
             Ival.narrow offsets (Base.valid_offset access base)
           in
           if Ival.cardinal_zero_or_one valid_offsets
           then begin
             if not (Ival.is_bottom valid_offsets)
             then found_one ()
           end
           else raise Found_two
        ) m;
      true
  with
  | Abstract_interp.Error_Top | Found_two -> false


let loc_bytes_to_loc_bits x =
  Location_Bytes.map (Ival.scale (Bit_utils.sizeofchar())) x

let loc_bits_to_loc_bytes x =
  Location_Bits.map (Ival.scale_div ~pos:true (Bit_utils.sizeofchar())) x

let loc_bits_to_loc_bytes_under x =
  Location_Bits.map (Ival.scale_div_under ~pos:true (Bit_utils.sizeofchar())) x


let loc_to_loc_without_size {loc = loc} = loc_bits_to_loc_bytes loc
let loc_size { size = size } = size

let make_loc loc_bits size = { loc = loc_bits; size = size }

let is_valid access {loc; size} =
  not (Int_Base.is_top size) &&
  let access = base_access ~size access in
  let is_valid_offset = Base.is_valid_offset access in
  match loc with
  | Location_Bits.Top _ -> false
  | Location_Bits.Map m -> Location_Bits.M.for_all is_valid_offset m


let filter_base f loc =
  { loc with loc = Location_Bits.filter_base f loc.loc }

let int_base_size_of_varinfo v =
  try
    let s = bitsSizeOf v.vtype in
    let s = Int.of_int s in
    Int_Base.inject s
  with Cil.SizeOfError (msg, _) ->
    Abstract_interp.feedback_approximation
      "imprecise size for variable %a (%s)" Printer.pp_varinfo v msg;
    Int_Base.top

let loc_of_varinfo v =
  let base = Base.of_varinfo v in
  make_loc (Location_Bits.inject base Ival.zero) (int_base_size_of_varinfo v)

let loc_of_base v =
  make_loc (Location_Bits.inject v Ival.zero) (Base.bits_sizeof v)

let loc_of_typoffset b typ offset =
  try
    let offs, size = Cil.bitsOffset typ offset in
    let size = Int_Base.inject (Int.of_int size) in
    make_loc (Location_Bits.inject b (Ival.of_int offs)) size
  with SizeOfError _ as _e ->
    make_loc (Location_Bits.inject b Ival.top) Int_Base.top

let loc_top = make_loc Location_Bits.top Int_Base.top
let loc_bottom = make_loc Location_Bits.bottom Int_Base.top
let is_bottom_loc l = Location_Bits.(equal l.loc bottom)

let cardinal_zero_or_one { loc = loc ; size = size } =
  Location_Bits.cardinal_zero_or_one loc &&
  Int_Base.cardinal_zero_or_one size

let loc_equal { loc = loc1 ; size = size1 } { loc = loc2 ; size = size2 } =
  Int_Base.equal size1 size2 &&
  Location_Bits.equal loc1 loc2

let loc_hash { loc = loc; size = size } =
  Int_Base.hash size + 317 * Location_Bits.hash loc

let loc_compare { loc = loc1 ; size = size1 } { loc = loc2 ; size = size2 } =
  let c1 = Int_Base.compare size1 size2 in
  if c1 <> 0 then c1
  else Location_Bits.compare loc1 loc2

let pretty fmt { loc = loc ; size = size } =
  Format.fprintf fmt "%a (size:%a)"
    Location_Bits.pretty loc
    Int_Base.pretty size
let pretty_loc = pretty

let pretty_english ~prefix fmt { loc = m ; size = size } =
  match m with
  | Location_Bits.Top (Base.SetLattice.Top,a) ->
    Format.fprintf fmt "somewhere unknown (origin:%a)"
      Origin.pretty a
  | Location_Bits.Top (s,a) ->
    Format.fprintf fmt "somewhere in %a (origin:%a)"
      Base.SetLattice.pretty s
      Origin.pretty a
  | Location_Bits.Map _ when Location_Bits.(equal m bottom) ->
    Format.fprintf fmt "nowhere"
  | Location_Bits.Map off ->
    let print_binding fmt (k, v) =
      ( match Ival.is_zero v, Base.validity k, size with
          true, Base.Known (_,s1), Int_Base.Value s2 when
            Int.equal (Int.succ s1) s2 ->
          Format.fprintf fmt "@[<h>%a@]" Base.pretty k
        | _ ->
          Format.fprintf fmt "@[<h>%a with offsets %a@]"
            Base.pretty k
            Ival.pretty v)
    in
    Pretty_utils.pp_iter
      ~pre:(if prefix then format_of_string "in " else "") ~suf:"" ~sep:";@,@ "
      (fun f -> Location_Bits.M.iter (fun k v -> f (k, v)))
      print_binding fmt off

(* Case [Top (Top, _)] must be handled by caller. *)
let enumerate_valid_bits_under_over under_over access {loc; size} =
  let access = base_access ~size access in
  let compute_offset base offs acc =
    let valid_offset = Ival.narrow offs (Base.valid_offset access base) in
    if Ival.is_bottom valid_offset then
      acc
    else
      let valid_itvs = under_over base valid_offset size in
      if Int_Intervals.(equal bottom valid_itvs) then acc
      else Zone.M.add base valid_itvs acc
  in
  Zone.Map (Location_Bits.fold_topset_ok compute_offset loc Zone.M.empty)

let interval_from_ival_over _ offset size =
  Int_Intervals.from_ival_size offset size

let interval_from_ival_under base offset size =
  match Base.validity base with
  | Base.Variable { Base.weak = true } -> Int_Intervals.bottom
  | _ -> Int_Intervals.from_ival_size_under offset size

let enumerate_valid_bits access loc =
  match loc.loc with
  | Location_Bits.Top (Base.SetLattice.Top, _) -> Zone.top
  | _ ->
    enumerate_valid_bits_under_over interval_from_ival_over access loc
;;

let enumerate_valid_bits_under access loc =
  match loc.size with
  | Int_Base.Top -> Zone.bottom
  | Int_Base.Value _ ->
    match loc.loc with
    | Location_Bits.Top _ -> Zone.bottom
    | Location_Bits.Map _ ->
      enumerate_valid_bits_under_over interval_from_ival_under access loc
;;

(** [valid_part l] is an over-approximation of the valid part
    of the location [l]. *)
let valid_part access ?(bitfield=true) {loc = loc; size = size } =
  let access = base_access ~size access in
  let compute_loc base offs acc =
    let valid_offset =
      Ival.narrow offs (Base.valid_offset access ~bitfield base)
    in
    if Ival.is_bottom valid_offset then
      acc
    else
      Location_Bits.M.add base valid_offset acc
  in
  let locbits =
    match loc with
    | Location_Bits.Top (Base.SetLattice.Top, _) -> loc
    | Location_Bits.Top (Base.SetLattice.Set _, _) ->
      Location_Bits.(Map (fold_topset_ok compute_loc loc M.empty))
    | Location_Bits.Map m ->
      Location_Bits.Map
        (Location_Bits.M.fold compute_loc m Location_Bits.M.empty)
  in
  make_loc locbits size

let enumerate_bits_under_over under_over {loc; size} =
  let compute_offset base offs acc =
    let valid_offset = under_over base offs size in
    if Int_Intervals.(equal valid_offset bottom) then acc
    else Zone.M.add base valid_offset acc
  in
  Zone.Map (Location_Bits.fold_topset_ok compute_offset loc Zone.M.empty)

let enumerate_bits loc =
  match loc.loc with
  | Location_Bits.Top (Base.SetLattice.Top, _) -> Zone.top
  | _ -> enumerate_bits_under_over interval_from_ival_over loc

let enumerate_bits_under loc =
  match loc.loc, loc.size with
  | Location_Bits.Top _, _ | _, Int_Base.Top -> Zone.bottom
  | _ -> enumerate_bits_under_over interval_from_ival_under loc


let zone_of_varinfo var = enumerate_bits (loc_of_varinfo var)

(** [invalid_part l] is an over-approximation of the invalid part
    of the location [l] *)
let invalid_part l = l (* TODO (but rarely useful) *)

let overlaps ~partial l1 l2 =
  try
    let size = Int.max (Int_Base.project l1.size) (Int_Base.project l2.size) in
    Location_Bits.overlaps ~partial ~size l1.loc l2.loc
  with Abstract_interp.Error_Top -> true

module Location =
  Datatype.Make
    (struct
      include Datatype.Serializable_undefined
      type t = location
      let structural_descr =
        Structural_descr.t_record
          [| Location_Bits.packed_descr; Int_Base.packed_descr |]
      let reprs =
        List.fold_left
          (fun acc l ->
             List.fold_left
               (fun acc n -> { loc = l; size = n } :: acc)
               acc
               Int_Base.reprs)
          []
          Location_Bits.reprs
      let name = "Locations.Location"
      let mem_project = Datatype.never_any_project
      let equal = loc_equal
      let compare = loc_compare
      let hash = loc_hash
      let pretty = pretty_loc
    end)

(*
Local Variables:
compile-command: "make -C ../../.."
End:
*)
