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

open Cvalue

open Cil_types
open Abstract_interp
open Lattice_bounds

let offsetmap_of_v ~typ v =
  let size = Int.of_int (Cil.bitsSizeOf typ) in
  let v = V_Or_Uninitialized.initialized v in
  V_Offsetmap.create ~size v ~size_v:size

let offsetmap_of_loc location state =
  let aux loc offsm_res =
    let open Locations in
    let size = Int_Base.project loc.size in
    let copy = Cvalue.Model.copy_offsetmap loc.loc size state in
    Bottom.join Cvalue.V_Offsetmap.join copy offsm_res
  in
  Precise_locs.fold aux location `Bottom

let v_uninit_of_offsetmap ~typ offsm =
  let size = Eval_typ.sizeof_lval_typ typ in
  match size with
  | Int_Base.Top -> V_Offsetmap.find_imprecise_everywhere offsm
  | Int_Base.Value size ->
    let validity = Base.validity_from_size size in
    let offsets = Ival.zero in
    V_Offsetmap.find ~validity ~conflate_bottom:false ~offsets ~size offsm

let backward_comp_int_left positive comp l r =
  if (Parameters.UndefinedPointerComparisonPropagateAll.get())
  && not (Cvalue_forward.are_comparable comp l r)
  then l
  else
    let binop = if positive then comp else Comp.inv comp in
    V.backward_comp_int_left binop l r

let backward_comp_float_left fkind positive comp l r =
  let back =
    if positive
    then V.backward_comp_float_left_true
    else V.backward_comp_float_left_false in
  back comp fkind l r

let backward_comp_left_from_type = function
  | Ctype typ -> begin
      match Cil.unrollType typ with
      | TInt _ | TEnum _ | TPtr _ -> backward_comp_int_left
      | TFloat (fk, _) -> backward_comp_float_left (Fval.kind fk)
      | _ -> (fun _ _ v _ -> v) (* should never occur anyway *)
    end
  | Linteger -> backward_comp_int_left
  | Lreal -> backward_comp_float_left (Fval.Real)
  | _ -> (fun _ _ v _ -> v) (* should never occur anyway *)

exception Unchanged
exception Reduce_to_bottom

let reduce_by_initialized_defined f loc state =
  try
    let base, offset =
      Locations.Location_Bits.find_lonely_key loc.Locations.loc
    in
    if Base.is_weak base then raise Unchanged;
    let size = Int_Base.project loc.Locations.size in
    let ll = Ival.project_int offset in
    let lh = Int.pred (Int.add ll size) in
    let offsm = match Model.find_base_or_default base state with
      | `Bottom | `Top -> raise Unchanged
      | `Value offsm -> offsm
    in
    let aux (offl, offh) (v, modu, shift) acc =
      let v' = f v in
      if v' != v then begin
        if V_Or_Uninitialized.is_bottom v' then raise Reduce_to_bottom;
        let il = Int.max offl ll and ih = Int.min offh lh in
        let abs_shift = Integer.e_rem (Rel.add_abs offl shift) modu in
        (* il and ih are the bounds of the interval to reduce.
           We change the initialized flags in the following cases:
           - either we overwrite entire values, or the partly overwritten
             value is at the beginning or at the end of the subrange
           - or we do not lose information on misaligned or partial values:
             the result is a singleton *)
        if V_Or_Uninitialized.(cardinal_zero_or_one v' || is_isotropic v') ||
           ((Int.equal offl il || Int.equal (Int.e_rem ll modu) abs_shift) &&
            (Int.equal offh ih ||
             Int.equal (Int.e_rem (Int.succ lh) modu) abs_shift))
        then
          let diff = Rel.sub_abs il offl in
          let shift_il = Rel.e_rem (Rel.sub shift diff) modu in
          V_Offsetmap.add (il, ih) (v', modu, shift_il) acc
        else acc
      end
      else acc
    in
    let noffsm =
      V_Offsetmap.fold_between ~entire:true (ll, lh) aux offsm offsm
    in
    Model.add_base base noffsm state
  with
  | Reduce_to_bottom -> Model.bottom
  | Unchanged -> state
  | Abstract_interp.Error_Top (* from Int_Base.project *)
  | Not_found (* from find_lonely_key *)
  | Ival.Not_Singleton_Int (* from Ival.project_int *) ->
    state

let reduce_by_valid_loc ~positive access loc typ state =
  let value = Cvalue.Model.find_indeterminate state loc in
  let loc_bytes = Cvalue.V_Or_Uninitialized.get_v value in
  let loc_bits = Locations.loc_bytes_to_loc_bits loc_bytes in
  let size = Bit_utils.sizeof_pointed typ in
  let location = Locations.make_loc loc_bits size in
  let reduced_location =
    if positive
    then Locations.valid_part access location
    else Locations.invalid_part location
  in
  let reduced_loc_bytes = Locations.loc_to_loc_without_size reduced_location in
  let reduced_value =
    if positive
    then Cvalue.V_Or_Uninitialized.initialized reduced_loc_bytes
    else Cvalue.V_Or_Uninitialized.map (fun _ -> reduced_loc_bytes) value
  in
  if Cvalue.V_Or_Uninitialized.equal value reduced_value
  then state
  else
  if Cvalue.V_Or_Uninitialized.(equal bottom reduced_value)
  then Cvalue.Model.bottom
  else Cvalue.Model.reduce_indeterminate_binding state loc reduced_value

let make_loc_contiguous loc =
  try
    let base, offset =
      Locations.Location_Bits.find_lonely_key loc.Locations.loc
    in
    if Ival.is_small_set offset
    then loc
    else
      let min, max, _rem, modu = Ival.min_max_r_mod offset in
      match min, max, loc.Locations.size with
      | Some min, Some max, Int_Base.Value size when Int.equal modu size ->
        let size' = Int.add (Int.sub max min) modu in
        let i = Ival.inject_singleton min in
        let loc_bits = Locations.Location_Bits.inject base i in
        Locations.make_loc loc_bits (Int_Base.inject size')
      | _ -> loc
  with Not_found -> loc

let apply_on_all_locs f loc state =
  match loc.Locations.size with
  | Int_Base.Top -> state
  | Int_Base.Value _ as size ->
    let loc = Locations.valid_part Locations.Read loc in
    let plevel = Parameters.ArrayPrecisionLevel.get () in
    let ilevel = Int_set.get_small_cardinal () in
    let limit = max plevel ilevel in
    let apply_f base ival state =
      f Locations.(make_loc (Location_Bits.inject base ival) size) state
    in
    let aux base ival state =
      if Ival.cardinal_is_less_than ival limit
      then Ival.fold_enum (fun i acc -> apply_f base i acc) ival state
      else state
    in
    try Locations.Location_Bits.fold_i aux loc.loc state
    with Abstract_interp.Error_Top -> state

(* Display [o] as a single value, when this is more readable and more precise
   than the standard display. *)
let pretty_stitched_offsetmap fmt typ o =
  if Cil.isScalarType typ &&
     not (Cvalue.V_Offsetmap.is_single_interval o)
  then
    let v = v_uninit_of_offsetmap ~typ o in
    if not (Cvalue.V_Or_Uninitialized.is_isotropic v)
    then
      Format.fprintf fmt "@\nThis amounts to: %a"
        Cvalue.V_Or_Uninitialized.pretty v

let pretty_offsetmap typ fmt offsm =
  (* YYY: catch pointers to arrays, and print the contents of the array *)
  Format.fprintf fmt "@[";
  if Cvalue.V_Offsetmap.(equal empty offsm)
  then Format.fprintf fmt "%s" (Unicode.emptyset_string ())
  else begin
    match Cvalue.V_Offsetmap.single_interval_value offsm with
    | Some value -> Cvalue.V_Or_Uninitialized.pretty_typ (Some typ) fmt value;
    | None ->
      Cvalue.V_Offsetmap.pretty_generic ~typ () fmt offsm;
      pretty_stitched_offsetmap fmt typ offsm
  end;
  Format.fprintf fmt "@]"

(* ------------------------- Under-approximation ---------------------------- *)

let add_if_singleton value acc =
  if Cvalue.V_Or_Uninitialized.cardinal_zero_or_one value
  then Cvalue.V_Or_Uninitialized.link value acc
  else acc

let find_offsm_under validity ival size offsm acc =
  let offsets = Tr_offset.trim_by_validity ival size validity in
  match offsets with
  | Tr_offset.Invalid | Tr_offset.Overlap _ -> acc
  | Tr_offset.Set list ->
    let find acc offset =
      let offsets = Ival.inject_singleton offset in
      let value = Cvalue.V_Offsetmap.find ~validity ~offsets ~size offsm in
      add_if_singleton value acc
    in
    List.fold_left find acc list
  | Tr_offset.Interval (min, max, modu) ->
    let process (start, _stop) (v, v_size, v_offset) acc =
      if Rel.(equal v_offset zero) && Int.equal v_size size
         && Int.equal (Int.e_rem (Int.sub start min) modu) Int.zero
      then add_if_singleton v acc
      else acc
    in
    Cvalue.V_Offsetmap.fold_between ~entire:true (min, max) process offsm acc

exception CannotComputeUnder

let find_lmap_under state location =
  match location.Locations.size with
  | Int_Base.Top -> raise CannotComputeUnder
  | Int_Base.Value size ->
    match location.Locations.loc with
    | Locations.Location_Bits.Top _ -> raise CannotComputeUnder
    | Locations.Location_Bits.Map map ->
      let process base offset acc =
        let offsm = Cvalue.Model.find_base_or_default base state in
        match offsm with
        | `Bottom -> acc
        | `Top -> raise CannotComputeUnder
        | `Value offsm ->
          let validity = Base.validity base in
          find_offsm_under validity offset size offsm acc
      in
      let acc = Cvalue.V_Or_Uninitialized.bottom in
      Locations.Location_Bits.M.fold process map acc

let find_under_approximation state location =
  try Some (find_lmap_under state location)
  with CannotComputeUnder -> None

(*
Local Variables:
compile-command: "make -C ../../../.."
End:
*)
