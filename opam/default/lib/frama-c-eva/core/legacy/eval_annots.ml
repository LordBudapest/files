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
open Eval_terms
open Lattice_bounds

let has_requires spec =
  let behav_has_requires b = b.b_requires <> [] in
  List.exists behav_has_requires spec.spec_behavior

let code_annotation_text ca =
  match ca.annot_content with
  | AAssert (_, {tp_kind}) -> Cil_printer.name_of_assert tp_kind
  | AInvariant _ ->  "loop invariant"
  | AVariant _ | AAssigns _ | AAllocation _ | AStmtSpec _
  | AExtended _  ->
    assert false (* currently not treated by Value *)

(* location of the given code annotation. If unknown, use the location of the
   statement instead. *)
let code_annotation_loc ca stmt =
  match Cil_datatype.Code_annotation.loc ca with
  | Some loc when not (Cil_datatype.Location.(equal loc unknown)) -> loc
  | _ -> Cil_datatype.Stmt.loc stmt


let mark_unreachable () =
  let mark ppt =
    if not (Property_status.automatically_computed ppt) then begin
      Self.debug "Marking property %a as dead"
        Description.pp_property ppt;
      let emit =
        Property_status.emit ~distinct:false Eva_utils.emitter ~hyps:[]
      in
      let reach_p = Property.ip_reachable_ppt ppt in
      emit ppt Property_status.True;
      emit reach_p Property_status.False_and_reachable
    end
  in
  (* Mark standard code annotations *)
  let do_code_annot stmt _emit ca =
    if not (Cvalue_results.is_reachable stmt) then begin
      let kf = Kernel_function.find_englobing_kf stmt in
      let ppts = Property.ip_of_code_annot kf stmt ca in
      List.iter mark ppts;
    end
  in
  (* Mark preconditions of dead calls *)
  let unreach = object
    inherit Visitor.frama_c_inplace

    method! vstmt_aux stmt =
      if not (Cvalue_results.is_reachable stmt) then begin
        let mark_status kf =
          (* Do not mark preconditions as dead if they are not analyzed in
             non-dead code. Otherwise, the consolidation does strange things. *)
          if not (Eva_utils.skip_specifications kf) ||
             Builtins.is_builtin_overridden kf
          then begin
            (* Setup all precondition statuses for [kf]: maybe it has
               never been called anywhere. *)
            Statuses_by_call.setup_all_preconditions_proxies kf;
            (* Now mark the statuses at this particular statement as dead*)
            let preconds =
              Statuses_by_call.all_call_preconditions_at
                ~warn_missing:false kf stmt
            in
            List.iter (fun (_, p) -> mark p) preconds
          end
        in
        match stmt.skind with
        | Instr (Call (_, e, _, _)) ->
          Option.iter mark_status (Kernel_function.get_called e)
        | Instr(Local_init(_, ConsInit(f,_,_),_)) ->
          mark_status (Globals.Functions.get f)
        | _ -> ()
      end;
      Cil.DoChildren

    method! vinst _ = Cil.SkipChildren
    method! vexpr _ = Cil.SkipChildren
    method! vlval _ = Cil.SkipChildren
    method! vtype _ = Cil.SkipChildren
    method! vspec _ = Cil.SkipChildren
    method! vcode_annot _ = Cil.SkipChildren
  end
  in
  Annotations.iter_all_code_annot do_code_annot;
  Visitor.visitFramacFileFunctions unreach (Ast.get ())

let c_labels kf cs =
  if Function_calls.use_spec_instead_of_definition kf then
    Cil_datatype.Logic_label.Map.empty
  else
    let fdec = Kernel_function.get_definition kf in
    let aux acc stmt =
      if stmt.labels != [] then
        match Cvalue_results.get_stmt_state_by_callstack ~after:false stmt with
        | `Bottom | `Top -> acc
        | `Value hstate ->
          try
            let state = Callstack.Hashtbl.find hstate cs in
            Cil_datatype.Logic_label.Map.add (StmtLabel (ref stmt)) state acc
          with Not_found -> acc
      else acc
    in
    List.fold_left aux Cil_datatype.Logic_label.Map.empty fdec.sallstmts

(* Evaluates [p] at [stmt], using per callstack states for maximum precision. *)
(* TODO: we can probably factor some code with the GUI *)
let eval_by_callstack kf stmt p =
  (* This is actually irrelevant for alarms: they never use \old *)
  let pre = Cvalue_results.get_initial_state kf in
  let here = Cvalue_results.get_stmt_state_by_callstack ~after:false stmt in
  match pre, here with
  | `Bottom, _
  | _, (`Top | `Bottom) ->
    (* Ignore dead statements, those will be marked 'unreachable' elsewhere *)
    Unknown
  | `Value pre, `Value states ->
    let aux_callstack callstack state acc_status =
      let c_labels = c_labels kf callstack in
      let env = Eval_terms.env_annot ~c_labels ~pre ~here:state () in
      let status = Eval_terms.eval_predicate env p in
      let join = Eval_terms.join_predicate_status in
      match Bottom.join join acc_status (`Value status) with
      | `Value Unknown -> raise Exit (* shortcut *)
      | _ as r -> r
    in
    try
      match Callstack.Hashtbl.fold aux_callstack states `Bottom with
      | `Bottom -> Eval_terms.Unknown (* probably never reached *)
      | `Value status -> status
    with Exit -> Eval_terms.Unknown

(* Detection of terms \at(_, L) where L is a C label *)
class contains_c_at = object
  inherit Visitor.frama_c_inplace

  method! vterm t = match t.term_node with
    | Tat (_, StmtLabel _) -> raise Exit
    | _ -> Cil.DoChildren
end

let contains_c_at ca =
  let vis = new contains_c_at in
  try
    ignore (Visitor.visitFramacCodeAnnotation vis ca);
    false
  with Exit -> true

(* Re-evaluate all alarms, and see if we can put a 'green' or 'red' status,
   which would be more precise than those we have emitted during the current
   analysis. *)
let mark_green_and_red () =
  let do_code_annot stmt _e ca  =
    (* We reevaluate only alarms, in the hope that we can emit an 'invalid'
       status, or user assertions that mention a C label. The latter are
       currently skipped during evaluation. *)
    if contains_c_at ca || (Alarms.find ca <> None) then
      match ca.annot_content with
      | AAssert (_, p) | AInvariant (_, true, p) ->
        let p = p.tp_statement in
        let loc = code_annotation_loc ca stmt in
        let open Current_loc.Operators in
        let<> UpdatedCurrentLoc = loc in
        let kf = Kernel_function.find_englobing_kf stmt in
        let ip = Property.ip_of_code_annot_single kf stmt ca in
        (* This status is exact: we are _not_ refining the statuses previously
           emitted, but writing a synthetic more precise status. *)
        let distinct = false in
        let emit status =
          let status, text_status = match status with
            | `True -> Property_status.True, "valid"
            | `False -> Property_status.False_if_reachable, "invalid"
          in
          Property_status.emit ~distinct Eva_utils.emitter ~hyps:[] ip status;
          let source = fst loc in
          let text_ca = code_annotation_text ca in
          Self.result ~once:true ~source "%s%a got final status %s."
            text_ca Description.pp_named p text_status;
        in
        begin
          match eval_by_callstack kf stmt p with
          | Eval_terms.False -> emit `False
          | Eval_terms.True ->
            (* Should not happen for an alarm that has been emitted during this
               analysis. However, this is possible for an 'old' alarm. *)
            emit `True
          | Eval_terms.Unknown -> ()
        end
      | AInvariant (_, false, _) | AStmtSpec _ | AVariant _ | AAssigns _
      | AAllocation _ | AExtended _ -> ()
  in
  Annotations.iter_all_code_annot do_code_annot

(* Special evaluation for the alarms on the very first statement of the
   main function. We put 'Invalid' statuses on them using this function. *)
let mark_invalid_initializers () =
  let kf = fst (Globals.entry_point ()) in
  let first_stmt = Kernel_function.find_first_stmt kf in
  let do_code_annot _e ca  =
    match Alarms.find ca with (* We only check alarms *)
    | None -> ()
    | Some _ ->
      match ca.annot_content with
      | AAssert (_, p) ->
        let p = p.tp_statement in
        let ip = Property.ip_of_code_annot_single kf first_stmt ca in
        (* Evaluate in a fully empty state. Only predicates that do not
           depend on the memory will result in 'False' *)
        let bot = Cvalue.Model.bottom in
        let env = Eval_terms.env_annot ~pre:bot ~here:bot () in
        begin match Eval_terms.eval_predicate env p with
          | True | Unknown -> ()
          | False ->
            let status = Property_status.False_and_reachable in
            let distinct = false (* see comment in mark_green_and_red above *) in
            Red_statuses.add_red_property Kglobal ip;
            Property_status.emit ~distinct Eva_utils.emitter ~hyps:[] ip status;
        end
      | _ -> ()
  in
  Annotations.iter_code_annot do_code_annot first_stmt

(*
Local Variables:
compile-command: "make -C ../../../.."
End:
*)
