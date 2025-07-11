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
open Cil_datatype

type overflow_kind =
    Signed | Unsigned | Signed_downcast | Unsigned_downcast | Pointer_downcast
type access_kind = For_reading | For_writing
type bound_kind = Lower_bound | Upper_bound

let string_of_overflow_kind = function
  | Signed -> "signed_overflow"
  | Unsigned -> "unsigned_overflow"
  | Signed_downcast -> "signed_downcast"
  | Unsigned_downcast -> "unsigned_downcast"
  | Pointer_downcast -> "pointer_downcast"

type alarm =
  | Division_by_zero of exp
  | Memory_access of lval * access_kind
  | Index_out_of_bound of
      exp (* index *)
      * exp option (* None = lower bound is zero; Some up = upper bound *)
  | Invalid_pointer of exp
  | Invalid_shift of exp * int option (* strict upper bound, if any *)
  | Pointer_comparison of
      exp option (* [None] when implicit comparison to 0 *)
      * exp
  | Differing_blocks of exp * exp
  | Overflow of
      overflow_kind
      * exp
      * Integer.t (* the bound *)
      * bound_kind
  | Float_to_int of
      exp
      * Integer.t (* the bound *)
      * bound_kind
  | Not_separated of lval * lval
  | Overlap of lval * lval
  | Uninitialized of lval
  | Dangling of lval
  | Is_nan_or_infinite of exp * fkind
  | Is_nan of exp * fkind
  | Function_pointer of exp * exp list option
  | Invalid_bool of lval

(* If you add one constructor to this type, make sure to add a dummy value
   in the 'reprs' value below, and increase 'nb_alarms' *)
let nb_alarm_constructors = 17

module D =
  Datatype.Make_with_collections
    (struct
      type t = alarm
      let name = "Alarms"

      let reprs = (* This reprs is exhaustive (there is one value by
                     constructor) for introspection purposes. *)
        let e = List.hd Exp.reprs in
        let lv = List.hd Lval.reprs in
        [ Division_by_zero e;
          Memory_access (lv, For_reading);
          Index_out_of_bound (e, None);
          Invalid_pointer e;
          Invalid_shift (e, None);
          Pointer_comparison (None, e);
          Differing_blocks (e, e);
          Overflow (Signed, e, Integer.one, Lower_bound);
          Float_to_int (e, Integer.one, Lower_bound);
          Not_separated (lv, lv);
          Overlap (lv, lv);
          Uninitialized lv;
          Dangling lv;
          Is_nan_or_infinite (e, FFloat);
          Is_nan (e, FFloat);
          Function_pointer (e, None);
          Invalid_bool lv;
        ]

      let nb = function
        | Division_by_zero _ -> 0
        | Memory_access _ -> 1
        | Index_out_of_bound _ -> 2
        | Invalid_pointer _ -> 3
        | Invalid_shift _ -> 4
        | Pointer_comparison _ -> 5
        | Overflow _ -> 6
        | Not_separated _ -> 7
        | Overlap _ -> 8
        | Uninitialized _ -> 9
        | Is_nan_or_infinite _ -> 10
        | Is_nan _ -> 11
        | Float_to_int _ -> 12
        | Differing_blocks _ -> 13
        | Dangling _ -> 14
        | Function_pointer _ -> 15
        | Invalid_bool _ -> 16

      let () = (* Lightweight checks *)
        for i = 0 to nb_alarm_constructors - 1 do
          assert (List.exists (fun a -> nb a = i) reprs);
        done

      let compare a1 a2 = match a1, a2 with
        | Division_by_zero e1, Division_by_zero e2 -> Exp.compare e1 e2
        | Is_nan_or_infinite (e1, fk1), Is_nan_or_infinite (e2, fk2) ->
          let n = Exp.compare e1 e2 in
          if n = 0 then Extlib.compare_basic fk1 fk2 else n
        | Is_nan (e1, fk1), Is_nan (e2, fk2) ->
          let n = Exp.compare e1 e2 in
          if n = 0 then Extlib.compare_basic fk1 fk2 else n
        | Memory_access(lv1, access_kind1), Memory_access(lv2, access_kind2) ->
          let n = Stdlib.compare access_kind1 access_kind2 in
          if n = 0 then Lval.compare lv1 lv2 else n
        | Index_out_of_bound(e11, e12), Index_out_of_bound(e21, e22) ->
          let n = Exp.compare e11 e21 in
          if n = 0 then Option.compare Exp.compare e12 e22 else n
        | Invalid_pointer e1, Invalid_pointer e2 -> Exp.compare e1 e2
        | Invalid_shift(e1, n1), Invalid_shift(e2, n2) ->
          let n = Exp.compare e1 e2 in
          if n = 0 then Option.compare Datatype.Int.compare n1 n2 else n
        | Pointer_comparison(e11, e12), Pointer_comparison(e21, e22) ->
          let n = Option.compare Exp.compare e11 e21 in
          if n = 0 then Exp.compare e12 e22 else n
        | Overflow(s1, e1, n1, b1), Overflow(s2, e2, n2, b2) ->
          let n = Stdlib.compare s1 s2 in
          if n = 0 then
            let n = Exp.compare e1 e2 in
            if n = 0 then
              let n = Stdlib.compare b1 b2 in
              if n = 0 then Integer.compare n1 n2 else n
            else
              n
          else
            n
        | Float_to_int(e1, n1, b1), Float_to_int(e2, n2, b2) ->
          let n = Exp.compare e1 e2 in
          if n = 0 then
            let n = Stdlib.compare b1 b2 in
            if n = 0 then Integer.compare n1 n2 else n
          else
            n
        | Not_separated(lv11, lv12), Not_separated(lv21, lv22)
        | Overlap(lv11, lv12), Overlap(lv21, lv22)
          ->
          let n = Lval.compare lv11 lv21 in
          if n = 0 then Lval.compare lv12 lv22 else n
        | Uninitialized lv1, Uninitialized lv2 -> Lval.compare lv1 lv2
        | Dangling lv1, Dangling lv2 -> Lval.compare lv1 lv2
        | Differing_blocks (e11, e12), Differing_blocks (e21, e22) ->
          let n = Exp.compare e11 e21 in
          if n = 0 then Exp.compare e12 e22 else n
        | Function_pointer (e1, l1), Function_pointer (e2, l2) ->
          let n = Exp.compare e1 e2 in
          if n <> 0 then n
          else Option.compare (Extlib.list_compare Exp.compare) l1 l2
        | Invalid_bool lv1, Invalid_bool lv2 -> Lval.compare lv1 lv2
        | _, (Division_by_zero _ | Memory_access _ |
              Index_out_of_bound _ | Invalid_pointer _ |
              Invalid_shift _ | Pointer_comparison _ |
              Overflow _ | Not_separated _ | Overlap _ | Uninitialized _ |
              Dangling _ | Is_nan_or_infinite _ | Is_nan _ | Float_to_int _ |
              Differing_blocks _ | Function_pointer _ |
              Invalid_bool _)
          ->
          let n = nb a1 - nb a2 in
          assert (n <> 0);
          n

      let equal = Datatype.from_compare

      let hash a = match a with
        | Division_by_zero e ->
          Hashtbl.hash (nb a, Exp.hash e)
        | Is_nan_or_infinite (e, fk)
        | Is_nan (e, fk) ->
          Hashtbl.hash (nb a, Exp.hash e, fk)
        | Memory_access(lv, b) -> Hashtbl.hash (nb a, Lval.hash lv, b)
        | Index_out_of_bound(e1, e2) ->
          Hashtbl.hash
            (nb a,
             Exp.hash e1,
             match e2 with None -> 0 | Some e -> 17 + Exp.hash e)
        | Invalid_pointer e -> Hashtbl.hash (nb a, Exp.hash e)
        | Invalid_shift(e, n) -> Hashtbl.hash (nb a, Exp.hash e, n)
        | Pointer_comparison(e1, e2) ->
          Hashtbl.hash
            (nb a,
             (match e1 with None -> 0 | Some e -> 17 + Exp.hash e),
             Exp.hash e2)
        | Differing_blocks (e1, e2) ->
          Hashtbl.hash (nb a, Exp.hash e1, Exp.hash e2)
        | Overflow(s, e, n, b) ->
          Hashtbl.hash (s, nb a, Exp.hash e, Integer.hash n, b)
        | Float_to_int(e, n, b) ->
          Hashtbl.hash (nb a, Exp.hash e, Integer.hash n, b)
        | Not_separated(lv1, lv2) | Overlap(lv1, lv2) ->
          Hashtbl.hash (nb a, Lval.hash lv1, Lval.hash lv2)
        | Uninitialized lv -> Hashtbl.hash (nb a, Lval.hash lv)
        | Dangling lv -> Hashtbl.hash (nb a, Lval.hash lv)
        | Function_pointer (e, _) -> Hashtbl.hash (nb a, Exp.hash e)
        | Invalid_bool lv -> Hashtbl.hash (nb a, Lval.hash lv)

      let structural_descr = Structural_descr.t_abstract
      let rehash = Datatype.identity

      let pretty fmt = function
        | Division_by_zero e ->
          Format.fprintf fmt "Division_by_zero(@[%a@])" Printer.pp_exp e
        | Is_nan_or_infinite (e, fk) ->
          Format.fprintf fmt "Is_nan_or_infinite(@[(%a)%a@])"
            Printer.pp_fkind fk Printer.pp_exp e
        | Is_nan (e, fk) ->
          Format.fprintf fmt "Is_nan(@[(%a)%a@])"
            Printer.pp_fkind fk Printer.pp_exp e
        | Memory_access(lv, read) ->
          Format.fprintf fmt "Memory_access(@[%a@],@ %s)"
            Printer.pp_lval lv
            (match read with For_reading -> "read" | For_writing -> "write")
        | Index_out_of_bound(e1, e2) ->
          Format.fprintf fmt "Index_out_of_bound(@[%a@]@ %s@ @[%a@])"
            Printer.pp_exp e1
            (match e2 with None -> ">=" | Some _ -> "<")
            Printer.pp_exp
            (match e2 with None -> Cil.zero ~loc:e1.eloc | Some e -> e)
        | Invalid_pointer e ->
          Format.fprintf fmt "Invalid_pointer(@[%a@])" Exp.pretty e
        | Invalid_shift(e, n) ->
          Format.fprintf fmt "Invalid_shift(@[%a@]@ %s)"
            Printer.pp_exp e
            (match n with None -> "" | Some n -> "<= " ^ string_of_int n)
        | Pointer_comparison(e1, e2) ->
          Format.fprintf fmt "Pointer_comparison(@[%a@],@ @[%a@])"
            Printer.pp_exp
            (match e1 with None -> Cil.zero ~loc:e2.eloc | Some e -> e)
            Printer.pp_exp e2
        | Differing_blocks (e1, e2) ->
          Format.fprintf fmt "Differing_blocks(@[%a@],@ @[%a@])"
            Printer.pp_exp e1 Printer.pp_exp e2
        | Overflow(s, e, n, b) ->
          Format.fprintf fmt "%s(@[%a@]@ %s@ @[%a@])"
            (String.capitalize_ascii (string_of_overflow_kind s))
            Printer.pp_exp e
            (match b with Lower_bound -> ">=" | Upper_bound -> "<=")
            Datatype.Integer.pretty n
        | Float_to_int(e, n, b) ->
          Format.fprintf fmt "Float_to_int(@[%a@]@ %s@ @[%a@])"
            Printer.pp_exp e
            (match b with Lower_bound -> ">" | Upper_bound -> "<")
            Datatype.Integer.pretty
            ((match b with
                | Lower_bound -> Integer.sub
                | Upper_bound -> Integer.add) n Integer.one)
        | Not_separated(lv1, lv2) ->
          Format.fprintf fmt "Not_separated(@[%a@],@ @[%a@])"
            Lval.pretty lv1 Lval.pretty lv2
        | Overlap(lv1, lv2) ->
          Format.fprintf fmt "Overlap(@[%a@],@ @[%a@])"
            Lval.pretty lv1 Lval.pretty lv2
        | Uninitialized lv ->
          Format.fprintf fmt "Uninitialized(@[%a@])" Lval.pretty lv
        | Dangling lv ->
          Format.fprintf fmt "Unspecified(@[%a@])" Lval.pretty lv
        | Function_pointer (e, _) ->
          Format.fprintf fmt "Function_pointer(@[%a@])" Exp.pretty e
        | Invalid_bool lv ->
          Format.fprintf fmt "Invalid_bool(@[%a@])" Lval.pretty lv

      let copy = Datatype.undefined
      let mem_project = Datatype.never_any_project
    end)

include D

module Usable_emitter = struct
  include Emitter.Usable_emitter
  let local_clear _ h = Hashtbl.clear h
  let usable_get e = e
end

module Rank = State_builder.Counter(struct let name = "Alarms.Rank" end)

module State =
  Emitter.Make_table
    (Kinstr.Hashtbl)
    (Usable_emitter)
    (D.Hashtbl.Make
       (Datatype.Quadruple
          (Code_annotation)(Kernel_function)(Stmt)(Datatype.Int)))
    (struct
      let name = "Alarms.State"
      let dependencies = [ Ast.self; Rank.self ]
      let kinds = [ Emitter.Alarm ]
      let size = 97
    end)

let () =
  State.add_hook_on_remove
    (fun e _ h ->
       D.Hashtbl.iter
         (fun _ (a, kf, s, _) ->
            Annotations.remove_code_annot
              (Emitter.Usable_emitter.get e) ~kf s a)
         h)

module Alarm_of_annot =
  State_builder.Hashtbl
    (Code_annotation.Hashtbl)
    (D)
    (struct
      let name = "Alarms.Alarm_of_annot"
      let dependencies = [ Ast.self; Rank.self ]
      let size = 97
    end)

let self = State.self
let () = Ast.add_monotonic_state self

let emit_status emitter kf stmt annot status =
  let p = Property.ip_of_code_annot_single kf stmt annot in
  Property_status.emit emitter ~hyps:[] p ~distinct:true status

(* kf and stmt at which an alarm emitted at [kinstr] should be registered.
   When [kinstr] is [Kglobal], we root the code annotation at the first
   statement of the main function. We should probably be using a precondition
   instead. *)
let alarm_kf_stmt ?kf kinstr =
  match kinstr with
  | Kglobal -> begin
      let kf = match kf with
        | None -> fst (Globals.entry_point ())
        | Some kf ->
          Kernel.fatal "inconsistency in alarm location" Kernel_function.pretty kf
      in
      try
        let stmt = Kernel_function.find_first_stmt kf in
        kf, stmt
      with Kernel_function.No_Statement ->
        (* TODO: this can actually happen *)
        Kernel.fatal "[Alarm] main function has no code"
    end
  | Kstmt stmt -> begin
      let kf = match kf with
        | None -> Kernel_function.find_englobing_kf stmt
        | Some kf -> kf
      in
      kf, stmt
    end

let add_annotation tbl alarm emitter ?kf kinstr annot =
  let kf, stmt = alarm_kf_stmt ?kf kinstr in
  Annotations.add_code_annot emitter ~kf stmt annot;
  let id = Rank.next () in
  D.Hashtbl.add tbl alarm (annot, kf, stmt, id);
  Alarm_of_annot.add annot alarm

let get_name = function
  | Division_by_zero _ -> "division_by_zero"
  | Memory_access _ -> "mem_access"
  | Index_out_of_bound _ -> "index_bound"
  | Invalid_pointer _ -> "pointer_value"
  | Invalid_shift _ -> "shift"
  | Pointer_comparison _ -> "ptr_comparison"
  | Differing_blocks _ -> "differing_blocks"
  | Overflow(s, _, _, _) -> string_of_overflow_kind s
  | Not_separated _ -> "separation"
  | Overlap _ -> "overlap"
  | Uninitialized _ -> "initialization"
  | Dangling _ -> "dangling_pointer"
  | Is_nan_or_infinite _ -> "is_nan_or_infinite"
  | Is_nan _ -> "is_nan"
  | Float_to_int _ -> "float_to_int"
  | Function_pointer _ -> "function_pointer"
  | Invalid_bool _ -> "bool_value"

let get_short_name = function
  | Overflow _ -> "overflow"
  | a -> get_name a

let get_description = function
  | Division_by_zero _ -> "Integer division by zero"
  | Memory_access _ -> "Invalid pointer dereferencing"
  | Index_out_of_bound _ -> "Array access out of bounds"
  | Invalid_pointer _ -> "Invalid pointer computation"
  | Invalid_shift _ -> "Invalid shift"
  | Pointer_comparison _ -> "Invalid pointer comparison"
  | Differing_blocks _ -> "Operation on pointers within different blocks"
  | Overflow(_, _, _, _) -> "Integer overflow or downcast"
  | Not_separated _ -> "Unsequenced side-effects on non-separated memory"
  | Overlap _ -> "Overlap between left- and right-hand-side in assignment"
  | Uninitialized _ -> "Uninitialized memory read"
  | Dangling _ -> "Read of a dangling pointer"
  | Is_nan_or_infinite _ -> "Non-finite (nan or infinite) floating-point value"
  | Is_nan _ -> "NaN floating-point value"
  | Float_to_int _ -> "Overflow in float to int conversion"
  | Function_pointer _ -> "Pointer to a function with non-compatible type"
  | Invalid_bool _ -> "Trap representation of a _Bool lvalue"


(* Given a "topmost" location and another one supposed to be more precise,
   returns the best (hopefully not unknown) one. *)
let best_loc ~loc loc' =
  if Location.equal loc' Location.unknown then loc else loc'

let overflowed_expr_to_term ~loc e =
  let loc = best_loc ~loc e.eloc in
  match e.enode with
  | UnOp(op, e, ty) ->
    let t = Logic_utils.expr_to_term ~coerce:true e in
    let lty = Logic_utils.coerce_type ty in
    Logic_const.term ~loc (TUnOp(op, t)) lty
  | BinOp(op, e1, e2, ty) ->
    let t1 = Logic_utils.expr_to_term ~coerce:true e1 in
    let t2 = Logic_utils.expr_to_term ~coerce:true e2 in
    let lty = Logic_utils.coerce_type ty in
    Logic_const.term ~loc (TBinOp(op, t1, t2)) lty
  | _ -> Logic_utils.expr_to_term ~coerce:true e

(* Creates \is_finite((fkind)e) or \is_nan((fkind)e) according to
   [predicate]. *)
let create_special_float_predicate ~loc e fkind predicate =
  let loc = best_loc ~loc e.eloc in
  let t = Logic_utils.expr_to_term e in
  let typ = match fkind with
    | FFloat -> Cil_const.floatType
    | FDouble -> Cil_const.doubleType
    | FLongDouble -> Cil_const.longDoubleType
  in
  let t = Logic_utils.mk_cast ~loc typ t in
  (* Different signatures, depending on the type of the argument *)
  let all_predicates = Logic_env.find_all_logic_functions predicate in
  let compatible li =
    Logic_type.equal t.term_type (List.hd li.l_profile).lv_type
  in
  let pi =
    try List.find compatible all_predicates
    with Not_found ->
      Kernel.fatal "Unexpected type %a for predicate %s"
        Printer.pp_logic_type t.term_type predicate
  in
  Logic_const.unamed ~loc (Papp (pi, [], [ t ]))

let create_predicate ?(loc=Location.unknown) alarm =
  let aux = function
    | Division_by_zero e ->
      (* e != 0 *)
      let loc = best_loc ~loc e.eloc in
      let t = Logic_utils.expr_to_term ~coerce:true e in
      Logic_const.prel ~loc (Rneq, t, Cil.lzero ())

    | Memory_access(lv, read) ->
      (* \valid(lv) or \valid_read(lv) according to read *)
      let valid = match read with
        | For_reading -> Logic_const.pvalid_read
        | For_writing -> Logic_const.pvalid
      in
      let e = Cil.mkAddrOrStartOf ~loc lv in
      let t = Logic_utils.expr_to_term e in
      valid ~loc (Logic_const.here_label, t)

    | Index_out_of_bound(e1, e2) ->
      (* 0 <= e1 < e2, left part if None, right part if Some e *)
      let loc = best_loc ~loc e1.eloc in
      let t1 = Logic_utils.expr_to_term ~coerce:true e1 in
      (match e2 with
       | None ->
         Logic_const.prel ~loc (Rle, Cil.lzero (), t1)
       | Some e2 ->
         let t2 = Logic_utils.expr_to_term ~coerce:true e2 in
         Logic_const.prel ~loc (Rlt, t1, t2))

    | Invalid_pointer e ->
      let loc = best_loc ~loc e.eloc in
      let t = Logic_utils.expr_to_term e in
      if Cil.isFunPtrType (Cil.typeOf e)
      then Logic_const.pvalid_function ~loc t
      else Logic_const.pobject_pointer ~loc (Logic_const.here_label, t)

    | Invalid_shift(e, n) ->
      (* 0 <= e < n *)
      let loc = best_loc ~loc e.eloc in
      let t = Logic_utils.expr_to_term ~coerce:true e in
      let low_cmp = Logic_const.prel ~loc (Rle, Cil.lzero (), t) in
      (match n with
       | None -> low_cmp
       | Some n ->
         let tn = Logic_const.tinteger ~loc n in
         let up_cmp = Logic_const.prel ~loc (Rlt, t, tn) in
         Logic_const.pand ~loc (low_cmp, up_cmp))

    | Pointer_comparison(e1, e2) ->
      (* \pointer_comparable(e1, e2) *)
      let loc = best_loc ~loc e2.eloc in
      let t1 = match e1 with
        | None -> begin
            let typ = match Cil.unrollTypeDeep (Cil.typeOf e2) with
              | TPtr (TFun _, _) -> TPtr (TFun(Cil_const.voidType, None, false, []), [])
              | _ -> Cil_const.voidPtrType
            in
            let zero = Cil.lzero () in
            Logic_const.term (TCast (false, Ctype typ, zero)) (Ctype typ)
          end
        | Some e -> Logic_utils.expr_to_term e
      in
      let t2 = Logic_utils.expr_to_term e2 in
      Logic_utils.pointer_comparable ~loc t1 t2

    | Differing_blocks(e1, e2) ->
      (* \base_addr(e1) == \base_addr(e2) *)
      let loc = best_loc ~loc e1.eloc in
      let t1 = Logic_utils.expr_to_term e1 in
      let here = Logic_const.here_label in
      let typ = Ctype Cil_const.charPtrType in
      let t1 =
        Logic_const.term ~loc:(best_loc ~loc e1.eloc) (Tbase_addr(here, t1)) typ
      in
      let t2 = Logic_utils.expr_to_term e2 in
      let t2 =
        Logic_const.term ~loc:(best_loc ~loc e2.eloc) (Tbase_addr(here, t2)) typ
      in
      Logic_const.prel ~loc (Req, t1, t2)

    | Overflow(kind, e, n, bound) ->
      (* n <= e or e <= n according to bound *)
      let loc = best_loc ~loc e.eloc in
      let t = match kind with
        | Pointer_downcast ->
          let t = Logic_utils.expr_to_term e in
          Logic_const.tcast ~loc t (Machine.uintptr_type ())
        | Signed_downcast | Unsigned_downcast ->
          Logic_utils.expr_to_term ~coerce:true e
        | _ ->
          (* For overflows, the computation must be done on mathematical types,
             else the value is necessarily in bounds. *)
          overflowed_expr_to_term ~loc e
      in
      let tn = Logic_const.tint ~loc n in
      Logic_const.prel ~loc
        (match bound with
         | Lower_bound -> Rle, tn, t
         | Upper_bound -> Rle, t, tn)

    | Float_to_int(e, n, bound) ->
      (* n < e or e < n according to bound *)
      let loc = best_loc ~loc e.eloc in
      let te = overflowed_expr_to_term ~loc e in
      let t = Logic_const.tlogic_coerce ~loc te Lreal in
      let n =
        (match bound with
         | Lower_bound -> Integer.sub
         | Upper_bound -> Integer.add)
          n Integer.one
      in
      let tn = Logic_const.tlogic_coerce ~loc (Logic_const.tint ~loc n) Lreal in
      Logic_const.prel ~loc
        (match bound with
         | Lower_bound -> Rlt, tn, t
         | Upper_bound -> Rlt, t, tn)

    | Not_separated(lv1, lv2) ->
      (* \separated(lv1, lv2) *)
      let e1 = Cil.mkAddrOf ~loc lv1 in
      let t1 = Logic_utils.expr_to_term e1 in
      let e2 = Cil.mkAddrOf ~loc lv2 in
      let t2 = Logic_utils.expr_to_term e2 in
      Logic_const.pseparated ~loc [ t1; t2 ]

    | Overlap(lv1, lv2) ->
      (* (lv1 == lv2) || \separated(lv1, lv2) *)
      let e1 = Cil.mkAddrOf ~loc lv1 in
      let t1 = Logic_utils.expr_to_term e1 in
      let e2 = Cil.mkAddrOf ~loc lv2 in
      let t2 = Logic_utils.expr_to_term e2 in
      let eq = Logic_const.prel ~loc (Req, t1, t2) in
      let sep = Logic_const.pseparated ~loc [ t1; t2 ] in
      Logic_const.por ~loc (eq, sep)

    | Uninitialized lv ->
      (* \initialized(lv) *)
      let e = Cil.mkAddrOrStartOf ~loc lv in
      let t = Logic_utils.expr_to_term e in
      Logic_const.pinitialized ~loc (Logic_const.here_label, t)

    | Dangling lv ->
      (* !\dangling(lv) *)
      let e = Cil.mkAddrOrStartOf ~loc lv in
      let t = Logic_utils.expr_to_term e in
      Logic_const.(pnot ~loc (pdangling ~loc (Logic_const.here_label, t)))

    | Is_nan_or_infinite (e, fkind) ->
      create_special_float_predicate ~loc e fkind "\\is_finite"
    | Is_nan (e, fkind) ->
      let pred = create_special_float_predicate ~loc e fkind "\\is_NaN" in
      Logic_const.pnot ~loc pred

    | Function_pointer (e, args) ->
      let loc = e.eloc in
      let t = Cil.typeOf e in
      let e =
        match Cil.unrollTypeDeep t, args with
        | TPtr (TFun (_, Some _, _, _), _), _
        | TPtr (TFun _, _), None -> e
        | TPtr (TFun (ret, None, var, attrs), _), Some args ->
          let ltyps = List.map (fun arg -> "", Cil.typeOf arg, []) args in
          let typ = TFun (ret, Some ltyps, var, attrs) in
          Cil.mkCast ~newt:(TPtr (typ, [])) e
        | t', _ ->
          Kernel.fatal
            "Trying to emit a Function_pointer alarm over expression %a \
             that has unexpected type %a (unrolled as %a)"
            Printer.pp_exp e Printer.pp_typ t Printer.pp_typ t'
      in
      let t = Logic_utils.expr_to_term e in
      Logic_const.(pvalid_function ~loc t)

    | Invalid_bool lv ->
      let e = Cil.new_exp ~loc (Lval lv) in
      let t = Logic_utils.expr_to_term ~coerce:true e in
      let zero = Logic_const.prel ~loc (Req, t, Cil.lzero ()) in
      let one = Logic_const.prel ~loc (Req, t, Cil.lone ()) in
      Logic_const.por ~loc (zero, one)
  in
  let p = aux alarm in
  assert (p.pred_name = []);
  { p with pred_name = [ get_name alarm ] }

exception Found of (code_annotation * kernel_function * stmt * int)
let find_alarm_in_emitters tbl alarm =
  try
    Usable_emitter.Hashtbl.iter
      (fun _ h ->
         try
           let triple = D.Hashtbl.find h alarm in
           raise (Found triple)
         with Not_found ->
           ())
      tbl;
    None
  with Found x ->
    Some x


(** Converts an alarm to a code annotation. Returns the code annotation,
    whether said code annotation is new, and the table in which the code annot
    is/should be inserted. *)
let to_annot_aux kinstr ?loc alarm =
  (*  Kernel.debug "registering alarm %a" D.pretty alarm;*)
  let loc = match loc, kinstr with
    | Some l, _ -> l
    | None, Kstmt stmt -> Stmt.loc stmt
    | None, Kglobal -> Location.unknown
  in
  let add alarm =
    let pred = create_predicate ~loc alarm in
    let pred = Logic_const.toplevel_predicate pred in
    Logic_const.new_code_annotation (AAssert([], pred))
  in
  try
    let by_emitter = State.find kinstr in
    match find_alarm_in_emitters by_emitter alarm with
    | None ->
      (* some alarms already associated to this [kinstr],
         but not this [alarm] *)
      add alarm, true, by_emitter
    | Some (annot, _kf, _stmt, _) ->
      (* this alarm was already emitted *)
      annot, false, by_emitter
  with Not_found ->
    (* no alarm associated to this [kinstr] *)
    let by_emitter = Usable_emitter.Hashtbl.create 7 in
    State.add kinstr by_emitter;
    add alarm, true, by_emitter

let to_annot kinstr ?loc alarm =
  let ca, fresh, _ = to_annot_aux kinstr ?loc alarm in
  ca, fresh

let register emitter ?kf kinstr ?loc ?status alarm =
  let annot, fresh, by_emitter = to_annot_aux kinstr ?loc alarm in
  if fresh then begin
    let e = Emitter.get emitter in
    let tbl =
      try Usable_emitter.Hashtbl.find by_emitter e
      with Not_found ->
        let h = D.Hashtbl.create 7 in
        Usable_emitter.Hashtbl.add by_emitter e h;
        h
    in
    add_annotation tbl alarm emitter ?kf kinstr annot;
  end;
  begin match status with
    | Some status ->
      let kf, stmt = alarm_kf_stmt ?kf kinstr in
      emit_status emitter kf stmt annot status;
    | _ -> ()
  end;
  annot, fresh

let iter f =
  State.iter
    (fun _ by_emitter ->
       Usable_emitter.Hashtbl.iter
         (fun e h ->
            D.Hashtbl.iter
              (fun alarm (annot, kf, stmt, rank) ->
                 f (Usable_emitter.get e) kf stmt ~rank alarm annot)
              h)
         by_emitter)

let fold f =
  State.fold
    (fun _ by_emitter acc ->
       Usable_emitter.Hashtbl.fold
         (fun e h acc ->
            D.Hashtbl.fold
              (fun alarm (annot, kf, stmt, rank) acc ->
                 f (Usable_emitter.get e) kf stmt ~rank alarm annot acc)
              h
              acc)
         by_emitter
         acc)

let to_seq () =
  State.to_seq () |>
  Seq.flat_map (fun (_,emitter) -> Usable_emitter.Hashtbl.to_seq emitter) |>
  Seq.flat_map
    (fun (e,h) ->
       D.Hashtbl.to_seq h |>
       Seq.map (fun (alarm, (annot, kf, stmt, rank)) ->
           Usable_emitter.get e, kf, stmt, rank, alarm, annot))

let find annot =
  try Some (Alarm_of_annot.find annot)
  with Not_found -> None

let unsafe_remove ?filter ?kinstr e =
  let usable_e = Emitter.get e in
  let remove also_alarm by_emitter =
    try
      let tbl = Usable_emitter.Hashtbl.find by_emitter usable_e in
      let to_be_removed = D.Hashtbl.create 7 in
      let stmt_ref = ref Cil.dummyStmt in
      let extend_del a (annot, _, stmt, _ as t) =
        D.Hashtbl.add to_be_removed a t;
        Alarm_of_annot.remove annot;
        stmt_ref := stmt
      in
      D.Hashtbl.iter
        (fun alarm v ->
           match filter with
           | Some f when not (f alarm) -> ()
           | _ -> extend_del alarm v)
        tbl;
      if also_alarm then begin
        let remove alarm _ = D.Hashtbl.remove tbl alarm in
        D.Hashtbl.iter remove to_be_removed;
      end; (* else the alarm is removed by the global [remove] of
              [filtered_remove] *)
      State.apply_hooks_on_remove
        (Emitter.get e)
        (Kstmt !stmt_ref)
        to_be_removed
    with Not_found ->
      ()
  in
  let filtered_remove tbl = match filter with
    | None ->
      remove false tbl;
      Usable_emitter.Hashtbl.remove tbl usable_e
    | Some _ ->
      remove true tbl
  in
  match kinstr with
  | None ->
    State.iter (fun _ by_emitter -> filtered_remove by_emitter)
  | Some ki ->
    try
      let by_emitter = State.find ki in
      filtered_remove by_emitter
    with Not_found ->
      ()

let remove ?filter ?kinstr e =
  unsafe_remove ?filter ?kinstr e

let () =
  Annotations.remove_alarm_ref :=
    (fun e stmt annot ->
       try
         let a = Alarm_of_annot.find annot in
         (* [JS 2013/01/09] could be more efficient but seems we only consider
            the alarms of one statement, it should be enough yet *)
         let filter a' = a == a' in
         let kinstr = Kstmt stmt in
         remove ~filter ~kinstr (Emitter.Usable_emitter.get e)
       with Not_found ->
         ())

(*
Local Variables:
compile-command: "make -C ../../.."
End:
*)
