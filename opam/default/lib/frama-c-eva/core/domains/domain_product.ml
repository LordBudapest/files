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

let counter = ref 0

let product_category =
  Self.register_category "domain_product" ~help:"inactive category"

module Make
    (Context  : Abstract_context.S)
    (Value    : Abstract_value.S with type context = Context.t)
    (Location : Abstract_location.S with type value = Value.t)
    (Left  : Abstract.Domain.Internal
     with type context = Context.t
      and type value = Value.t
      and type location = Location.location)
    (Right : Abstract.Domain.Internal
     with type context = Context.t
      and type value = Value.t
      and type location = Location.location)
= struct

  type context = Context.t
  type value = Value.t
  type location = Location.location

  type origin = {
    left:  reductness * Left.origin option;
    right: reductness * Right.origin option;
  }

  let () = incr counter
  let unique_name = Left.name ^ "*" ^ Right.name ^
                    "(" ^ string_of_int !counter ^ ")"

  include Datatype.Pair_with_collections
      (Left)
      (Right)
      (struct let module_name = unique_name end)
  type state = t
  let name = Left.name ^ " * " ^ Right.name

  let structure = Abstract.Domain.Node (Left.structure, Right.structure)

  let log_category = product_category

  let top = Left.top, Right.top
  let is_included (left1, right1) (left2, right2) =
    Left.is_included left1 left2 && Right.is_included right1 right2
  let join (left1, right1) (left2, right2) =
    Left.join left1 left2, Right.join right1 right2
  let widen kf stmt (left1, right1) (left2, right2) =
    Left.widen kf stmt left1 left2, Right.widen kf stmt right1 right2

  let narrow (left1, right1) (left2, right2) =
    Left.narrow left1 left2 >>- fun left ->
    Right.narrow right1 right2 >>-: fun right ->
    (left, right)


  let merge (eval1, alarms1) (eval2, alarms2) =
    match Alarmset.inter alarms1 alarms2 with
    | `Inconsistent -> `Bottom, Alarmset.none
    | `Value alarms ->
      let value =
        eval1 >>- fun (v1, o1) ->
        eval2 >>- fun (v2, o2) ->
        Value.narrow v1 v2 >>-: fun value ->
        let left =
          if Value.equal value v1 then Unreduced
          else if Value.equal v1 Value.top then Created else Reduced
        and right =
          if Value.equal value v2 then Unreduced
          else if Value.equal v2 Value.top then Created else Reduced
        in
        let origin = {left = left, o1; right = right, o2} in
        value, Some origin
      in
      value, alarms

  let extract_expr ~oracle context (left, right) expr =
    merge
      (Left.extract_expr ~oracle context left expr)
      (Right.extract_expr ~oracle context right expr)

  let extract_lval ~oracle context (left, right) lval location =
    merge
      (Left.extract_lval ~oracle context left lval location)
      (Right.extract_lval ~oracle context right lval location)

  let backward_location (left, right) lval loc value =
    (* TODO: Loc.narrow *)
    Left.backward_location left lval loc value >>- fun (loc, value1) ->
    Right.backward_location right lval loc value >>- fun (loc, value2) ->
    Value.narrow value1 value2 >>-: fun value ->
    loc, value

  let reduce_further (left, right) expr value =
    List.append
      (Left.reduce_further left expr value)
      (Right.reduce_further right expr value)

  let build_context (left, right) =
    let open Lattice_bounds.Bottom.Operators in
    let* left  = Left.build_context  left  in
    let* right = Right.build_context right in
    Context.narrow left right

  let lift_record side record =
    let origin = Option.map side record.origin in
    let reductness =
      match record.reductness, origin with
      | Unreduced, Some (reduced, _) -> reduced
      | Unreduced, None -> Unreduced (* This case should not happen. *)
      | Reduced, Some (Created, _) -> Created
      | _ as x, _ -> x
    in
    let origin = Option.fold ~some:snd ~none:None origin in
    { record with origin; reductness }

  let lift_valuation side valuation =
    let find expr =
      match valuation.Abstract_domain.find expr with
      | `Value record -> `Value (lift_record side record)
      | `Top -> `Top
    in
    let fold f acc =
      valuation.Abstract_domain.fold
        (fun expr record acc -> f expr (lift_record side record) acc)
        acc
    in
    Abstract_domain.{ find; fold; find_loc = valuation.find_loc }

  let left_val = lift_valuation (fun o -> o.left)
  let right_val = lift_valuation (fun o -> o.right)


  let update valuation (left, right) =
    Left.update (left_val valuation) left >>- fun left ->
    Right.update (right_val valuation) right >>-: fun right ->
    left, right

  let assign stmt lv expr value valuation (left, right) =
    Left.assign stmt lv expr value (left_val valuation) left >>- fun left ->
    Right.assign stmt lv expr value (right_val valuation) right >>-: fun right ->
    left, right

  let assume stmt expr positive valuation (left, right) =
    Left.assume stmt expr positive (left_val valuation) left >>- fun left ->
    Right.assume stmt expr positive (right_val valuation) right >>-: fun right ->
    left, right

  let finalize_call stmt call recursion ~pre ~post =
    let pre_left, pre_right = pre
    and left_state, right_state = post in
    Left.finalize_call stmt call recursion ~pre:pre_left ~post:left_state
    >>- fun left ->
    Right.finalize_call stmt call recursion ~pre:pre_right ~post:right_state
    >>-: fun right ->
    left, right

  let start_call stmt call recursion valuation (left, right) =
    Left.start_call stmt call recursion (left_val valuation) left
    >>- fun left ->
    Right.start_call stmt call recursion (right_val valuation) right
    >>-: fun right ->
    left, right

  let show_expr =
    let (|-) f g = fun fmt exp -> f fmt exp; g fmt exp in
    let show_expr_one_side category name show_expr = fun fmt exp ->
      if Self.is_debug_key_enabled category
      then Format.fprintf fmt "@,@]@[<v># %s: @[<hov>%a@]" name show_expr exp
    in
    let right_log = Right.log_category
    and left_log = Left.log_category in
    match left_log = product_category,
          right_log = product_category with
    | true, true ->
      (fun valuation (left, right) ->
         Left.show_expr (left_val valuation) left |-
         Right.show_expr (right_val valuation) right)
    | true, false ->
      (fun valuation (left, right) ->
         Left.show_expr (left_val valuation) left |-
         show_expr_one_side right_log Right.name
           (Right.show_expr (right_val valuation) right))
    | false, true ->
      (fun valuation (left, right) ->
         show_expr_one_side left_log Left.name
           (Left.show_expr (left_val valuation) left) |-
         Right.show_expr (right_val valuation) right)
    | false, false ->
      (fun valuation (left, right) ->
         show_expr_one_side left_log Left.name
           (Left.show_expr (left_val valuation) left) |-
         show_expr_one_side right_log Right.name
           (Right.show_expr (right_val valuation) right))

  let pretty =
    let print_one_side fmt category name dump state =
      if Self.is_debug_key_enabled category
      then Format.fprintf fmt "# %s:@ @[<hv>%a@]@ " name dump state
    in
    let right_log = Right.log_category
    and left_log = Left.log_category in
    match left_log = product_category,
          right_log = product_category with
    | true, true ->
      (fun fmt (left, right) ->
         Left.pretty fmt left;
         Right.pretty fmt right)
    | true, false ->
      (fun fmt (left, right) ->
         Left.pretty fmt left;
         print_one_side fmt right_log Right.name Right.pretty right)
    | false, true ->
      (fun fmt (left, right) ->
         print_one_side fmt left_log Left.name Left.pretty left;
         Right.pretty fmt right)
    | false, false ->
      (fun fmt (left, right) ->
         print_one_side fmt left_log Left.name Left.pretty left;
         print_one_side fmt right_log Right.name Right.pretty right)


  let logic_assign assign location (left, right) =
    let left_assign, right_assign =
      match assign with
      | None -> None, None
      | Some (assign, (left, right)) -> Some (assign, left), Some (assign, right)
    in
    Left.logic_assign left_assign location left,
    Right.logic_assign right_assign location right

  let lift_logic_env f logic_env =
    Abstract_domain.{ states = (fun label -> f (logic_env.states label));
                      result = logic_env.result; }

  let split_logic_env logic_env =
    lift_logic_env fst logic_env, lift_logic_env snd logic_env

  let evaluate_predicate logic_environment (left, right) pred =
    let left_env, right_env = split_logic_env logic_environment in
    let left_status = Left.evaluate_predicate left_env left pred
    and right_status = Right.evaluate_predicate right_env right pred in
    match Alarmset.Status.inter left_status right_status with
    | `Inconsistent ->
      (* This may happen when the product of states has no concretization.
         We would need an "Inconsistent" status to be precise, but it should
         not be usable by the domains. *)
      Abstract_interp.Comp.True
    | `Value status -> status

  let reduce_by_predicate logic_environment (left, right) pred positive =
    let left_env, right_env = split_logic_env logic_environment in
    Left.reduce_by_predicate left_env left pred positive >>- fun left ->
    Right.reduce_by_predicate right_env right pred positive >>-: fun right ->
    left, right

  let interpret_acsl_extension extension env (left, right) =
    let left_env, right_env = split_logic_env env in
    Left.interpret_acsl_extension extension left_env left,
    Right.interpret_acsl_extension extension right_env right

  let enter_scope kind vars (left, right) =
    Left.enter_scope kind vars left, Right.enter_scope kind vars right
  let leave_scope kf vars (left, right) =
    Left.leave_scope kf vars left, Right.leave_scope kf vars right

  let enter_loop stmt (left, right) =
    Left.enter_loop stmt left, Right.enter_loop stmt right
  let incr_loop_counter stmt (left, right) =
    Left.incr_loop_counter stmt left, Right.incr_loop_counter stmt right
  let leave_loop stmt (left, right) =
    Left.leave_loop stmt left, Right.leave_loop stmt right

  let empty () = Left.empty (), Right.empty ()
  let initialize_variable lval loc ~initialized init_value (left, right) =
    Left.initialize_variable lval loc ~initialized init_value left,
    Right.initialize_variable lval loc ~initialized init_value right
  let initialize_variable_using_type kind varinfo (left, right) =
    Left.initialize_variable_using_type kind varinfo left,
    Right.initialize_variable_using_type kind varinfo right


  let relate kf bases (left, right) =
    Base.SetLattice.join
      (Left.relate kf bases left) (Right.relate kf bases right)
  let filter kind bases (left, right) =
    Left.filter kind bases left, Right.filter kind bases right
  let reuse kf bases ~current_input ~previous_output =
    let left_input, right_input = current_input
    and left_output, right_output = previous_output in
    Left.reuse kf bases ~current_input:left_input ~previous_output:left_output,
    Right.reuse kf bases ~current_input:right_input ~previous_output:right_output

  let merge_tbl left_tbl right_tbl =
    let tbl = Callstack.Hashtbl.create 7 in
    let merge callstack left =
      try
        let right = Callstack.Hashtbl.find right_tbl callstack in
        Callstack.Hashtbl.replace tbl callstack (left, right)
      with
        Not_found -> ()
    in
    Callstack.Hashtbl.iter merge left_tbl;
    if Callstack.Hashtbl.length tbl > 0 then `Value tbl else `Bottom

  let lift_tbl f tbl =
    let new_tbl = Callstack.Hashtbl.create 7 in
    let lift cs t = Callstack.Hashtbl.replace new_tbl cs (f t) in
    Callstack.Hashtbl.iter lift tbl;
    `Value new_tbl

  let merge_callstack_tbl left right =
    match left, right with
    | `Top, `Top -> `Top
    | `Value left, `Value right -> merge_tbl left right
    | `Top, `Value right -> lift_tbl (fun t -> Left.top, t) right
    | `Value left, `Top -> lift_tbl (fun t -> t, Right.top) left
    | `Bottom, _ | _, `Bottom -> `Bottom

  module Store = struct
    let register_global_state b state =
      Left.Store.register_global_state b (state >>-: fst);
      Right.Store.register_global_state b (state >>-: snd)
    let register_initial_state callstack kf (left, right) =
      Left.Store.register_initial_state callstack kf left;
      Right.Store.register_initial_state callstack kf right
    let register_state_before_stmt callstack stmt (left, right) =
      Left.Store.register_state_before_stmt callstack stmt left;
      Right.Store.register_state_before_stmt callstack stmt right
    let register_state_after_stmt callstack stmt (left, right) =
      Left.Store.register_state_after_stmt callstack stmt left;
      Right.Store.register_state_after_stmt callstack stmt right

    let get_global_state () =
      Left.Store.get_global_state () >>- fun left ->
      Right.Store.get_global_state () >>-: fun right ->
      left, right
    let get_initial_state kf =
      Left.Store.get_initial_state kf >>- fun left ->
      Right.Store.get_initial_state kf >>-: fun right ->
      left, right
    let get_initial_state_by_callstack ?selection kf =
      let left_tbl, right_tbl =
        Left.Store.get_initial_state_by_callstack ?selection kf,
        Right.Store.get_initial_state_by_callstack ?selection kf
      in
      merge_callstack_tbl left_tbl right_tbl

    let get_stmt_state ~after stmt =
      Left.Store.get_stmt_state ~after stmt >>- fun left ->
      Right.Store.get_stmt_state ~after stmt >>-: fun right ->
      left, right
    let get_stmt_state_by_callstack ?selection ~after stmt =
      let left_tbl, right_tbl =
        Left.Store.get_stmt_state_by_callstack ?selection ~after stmt,
        Right.Store.get_stmt_state_by_callstack ?selection ~after stmt
      in
      merge_callstack_tbl left_tbl right_tbl

    let mark_as_computed () =
      Left.Store.mark_as_computed ();
      Right.Store.mark_as_computed ()

    let is_computed () = Left.Store.is_computed () && Right.Store.is_computed ()
  end

  let post_analysis = function
    | `Bottom -> Left.post_analysis `Bottom; Right.post_analysis `Bottom
    | `Value (left, right) ->
      Left.post_analysis (`Value left);
      Right.post_analysis (`Value right)

end


(*
Local Variables:
compile-command: "make -C ../../../.."
End:
*)
