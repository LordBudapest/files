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
open Eval

(* Eva ignores predicates with a "no_eva" tag. *)
let ignore_predicate named_pred =
  List.exists (fun tag -> tag = "no_eva") named_pred.Cil_types.pred_name

let create_conjunction l=
  let loc = match l with
    | [] -> None
    | p :: _ -> Some (Logic_const.pred_of_id_pred p).pred_loc
  in
  Logic_const.(List.fold_right (fun p1 p2 -> pand ?loc (p1, p2)) (List.map pred_of_id_pred l) ptrue)

let ip_from_precondition kf call_ki b pre =
  let ip_precondition = Property.ip_of_requires kf Kglobal b pre in
  match call_ki with
  | Kglobal -> (* status of the main function. We update the global
                  status, and pray that there is no recursion.
                  TODO: check what the WP does.*)
    ip_precondition
  | Kstmt stmt ->
    (* choose the copy of the precondition on the call point [stmt]. *)
    Statuses_by_call.setup_precondition_proxy kf ip_precondition;
    Statuses_by_call.precondition_at_call kf ip_precondition stmt

(* --------------------- Message and status emission ------------------------ *)

(* The function that puts statuses on pre- and post-conditions is essentially
   agnostic as to which kind of property it operates on. However, the messages
   that get emitted are quite different. The types below distinguish between
   the various possibilities. *)
type postcondition_kf_kind =
  | PostLeaf (* The function has no body in the AST *)
  | PostBody (* The function has a body, which is used for the evaluation *)
  | PostBuiltin (* A cvalue builtin is used for the function. *)
  | PostUseSpec (* The function has a body, but its specification is used
                   instead *)

type p_kind = Precondition | Postcondition of postcondition_kf_kind | Assumes

let emit_postcond_status = function
  | PostLeaf | PostBuiltin -> false
  | PostBody | PostUseSpec -> true

let pp_p_kind fmt = function
  | Precondition    -> Format.pp_print_string fmt "precondition"
  | Postcondition _ -> Format.pp_print_string fmt "postcondition"
  | Assumes -> Format.pp_print_string fmt "assumes"

let post_kind kf =
  if Builtins.is_builtin_overridden kf
  then PostBuiltin
  else if Function_calls.use_spec_instead_of_definition kf then
    if Kernel_function.is_definition kf
    then PostUseSpec
    else PostLeaf
  else PostBody

let emit_status ppt status =
  let status =
    match status with
    | Alarmset.False -> Property_status.False_if_reachable;
    | Alarmset.True -> Property_status.True;
    | Alarmset.Unknown -> Property_status.Dont_know
  in
  if status = Property_status.False_if_reachable then
    Red_statuses.add_red_property (Property.get_kinstr ppt) ppt;
  Property_status.emit ~distinct:true Eva_utils.emitter ~hyps:[] ppt status

(* Display the message as result/warning depending on [status] *)
let msg_status status ?current ?once ?source fmt =
  if status = Alarmset.True then
    if Parameters.ValShowProgress.get ()
    then Self.result ?current ?once ?source fmt
    else Self.result ?current ?once ?source ~level:2 fmt
  else
    Eva_utils.alarm_report ?current ?once ?source fmt

let behavior_inactive fmt =
  Format.fprintf fmt " (Behavior may be inactive, no reduction performed.)"

let pp_behavior fmt b =
  if not (Cil.is_default_behavior b)
  then Format.fprintf fmt ", behavior %s" b.b_name

let pp_header kf fmt behavior =
  Format.fprintf fmt "function %a%a"
    Kernel_function.pretty kf pp_behavior behavior

(* The location displayed for a precondition is the call site.
   To distinguish between different preconditions of a behavior, this function:
   - prints the name of the precondition, if it exists;
   - otherwise, inlines the precondition, if the behavior contains more than
     one precondition. *)
let pp_requires behavior fmt named_pred =
  if named_pred.Cil_types.pred_name <> []
  then Description.pp_named fmt named_pred
  else if List.length behavior.b_requires > 1
  then Format.fprintf fmt " %a" Printer.pp_predicate named_pred

(* To identify a predicate, prints the function, the behavior (if non default),
   the kind of predicate and the name of the predicate (if any). *)
let pp_predicate behavior kind fmt named_pred =
  let pp_predicate = match kind with
    | Precondition -> pp_requires behavior
    | _ -> Description.pp_named
  in
  Format.fprintf fmt "%a%a" pp_p_kind kind pp_predicate named_pred

let emit_contract_status kind kf behavior ~active ~empty property named_pred status =
  let pp_predicate = pp_predicate behavior kind in
  let source = fst (Property.location property) in
  match kind with
  | Precondition | Postcondition PostBody ->
    msg_status status ~once:true ~source
      "%a: %s%a got status %a.%t%t"
      (pp_header kf) behavior
      (if empty then "no state left, " else "")
      pp_predicate named_pred
      Alarmset.Status.pretty status
      (if active then (fun _ -> ()) else behavior_inactive)
      Eva_utils.pp_callstack;
    emit_status property status;
  | Postcondition postk ->
    (* Do not emit a status for leaf functions or builtins. Otherwise, we would
       overwrite the "considered valid" status of the kernel. *)
    if emit_postcond_status postk
    then emit_status property status
  | Assumes ->
    (* No statuses are emitted for 'assumes' clauses, and for the moment we
       do not emit text either *) ()

let pp_code_annot fmt ca =
  match ca.annot_content with
  | AAssert (_,{ tp_kind; tp_statement }) ->
    let kind = Cil_printer.name_of_assert tp_kind in
    Format.fprintf fmt "%s%a" kind Description.pp_named tp_statement
  | AInvariant (_, _, { tp_statement }) ->
    Format.fprintf fmt "loop invariant%a" Description.pp_named tp_statement
  | AExtended (_, _, extension) ->
    Format.fprintf fmt "%s annotation" extension.ext_name;
  | AVariant _ | AAssigns _ | AAllocation _ | AStmtSpec _ ->
    assert false (* currently not treated by Eva *)

(* location of the given code annotation. If unknown, use the location of the
   statement instead. *)
let code_annotation_loc stmt code_annot =
  match Cil_datatype.Code_annotation.loc code_annot with
  | Some loc when not (Cil_datatype.Location.(equal loc unknown)) -> loc
  | _ -> Cil_datatype.Stmt.loc stmt

let emit_code_annot_status ~reduce ~empty kf stmt code_annot status =
  let source, _ = code_annotation_loc stmt code_annot in
  let ips = Property.ip_of_code_annot kf stmt code_annot in
  List.iter (fun p -> emit_status p status) ips;
  let message =
    match status with
    | Alarmset.Unknown -> "unknown"
    | Alarmset.True -> "valid"
    | Alarmset.False ->
      "invalid" ^ (if reduce then " (stopping propagation)" else "")
  in
  let prefix = if empty then "no state left, " else "" in
  msg_status status ~once:true ~source
    "%s%a got status %s." prefix pp_code_annot code_annot message

(* --------------------- Process inactive behaviors ------------------------- *)

(* Emits informative messages about inactive behaviors, and emits a valid
   status for requires and ensures that have not been evaluated. *)
let process_inactive_behavior kf call_ki behavior =
  let emitted = ref false in
  (* We emit a valid status for every requires and ensures of the behavior. *)
  List.iter (fun (tk, pred as post) ->
      if tk = Normal && pred.ip_content.tp_kind <> Admit then begin
        emitted := true;
        if emit_postcond_status (post_kind kf) then
          let ip = Property.ip_of_ensures kf Kglobal behavior post in
          emit_status ip Alarmset.True;
      end
    ) behavior.b_post_cond;
  List.iter (fun pre ->
      if pre.ip_content.tp_kind <> Admit then begin
        emitted := true;
        let ip = ip_from_precondition kf call_ki behavior pre in
        emit_status ip Alarmset.True;
      end
    ) behavior.b_requires;
  if !emitted then
    Self.result ~once:true ~current:true ~level:2
      "%a: assumes got status invalid; behavior not evaluated.%t"
      (pp_header kf) behavior Eva_utils.pp_callstack

let process_inactive_behaviors call_ki kf behaviors =
  List.iter (process_inactive_behavior kf call_ki) behaviors

(* Emits informative messages about behavior postconditions not evaluated
   because the _requires_ of the behavior are invalid. *)
let process_inactive_postconds kf inactive_bhvs =
  List.iter
    (fun b ->
       let emitted = ref false in
       List.iter (fun (tk, pred as post) ->
           if tk = Normal && pred.ip_content.tp_kind <> Admit then begin
             emitted := true;
             if emit_postcond_status (post_kind kf) then
               let ip = Property.ip_of_ensures kf Kglobal b post in
               emit_status ip Alarmset.True;
           end
         ) b.b_post_cond;
       if !emitted then
         Self.result ~once:true ~current:true ~level:2
           "%a: requires got status invalid; postconditions not evaluated.%t"
           (pp_header kf) b Eva_utils.pp_callstack;
    ) inactive_bhvs


(* ---------------- Evaluation of "calls" ACSL extension  ------------------- *)

let get_call term =
  match term.term_node with
  | TLval (TVar { lv_origin = Some v }, TNoOffset ) -> Globals.Functions.get v
  | _ -> raise Not_found

(* Returns the list of kernel functions referred to by a "calls" annotation,
   or raise exception Not_found if it is not a proper "calls" annotation. *)
let get_calls_kf code_annot =
  match code_annot.annot_content with
  | AExtended (_, _, { ext_kind = Ext_terms terms }) -> List.map get_call terms
  | _ -> raise Not_found

(* Returns the "calls" annotations at statement [stmt]. *)
let get_calls_annotations stmt =
  let filter code_annot =
    match code_annot.annot_content with
    | AExtended (_, _, e) -> e.ext_name = "calls" && e.ext_has_status
    | _ -> false
  in
  Annotations.code_annot ~filter stmt

(* Checks one "calls" annotation [code_annot] at statement [stmt]. *)
let check_calls_annotation stmt called_functions code_annot =
  match get_calls_kf code_annot with
  | exception Not_found ->
    Self.warning ~current:true ~once:true
      "Ignoring invalid calls annotation: %a"
      Printer.pp_code_annotation code_annot;
    called_functions
  | kfs ->
    let length = List.length called_functions in
    let kfs = Kernel_function.Set.of_list kfs in
    let is_call (kf, _) = Kernel_function.Set.mem kf kfs in
    let called_functions = List.filter is_call called_functions in
    let status =
      match List.length called_functions with
      | 0 -> Alarmset.False
      | l when l = length -> Alarmset.True
      | _ -> Alarmset.Unknown
    in
    let kf = Kernel_function.find_englobing_kf stmt in
    emit_code_annot_status ~reduce:true ~empty:false kf stmt code_annot status;
    called_functions

let check_calls_annotations stmt called_functions =
  let calls = get_calls_annotations stmt in
  List.fold_left (check_calls_annotation stmt) called_functions calls

(* -------------------------------- Functor --------------------------------- *)

module type S = sig
  type state
  type states

  val create: state -> kernel_function -> Active_behaviors.t
  val create_from_spec: state -> spec -> Active_behaviors.t

  val check_fct_preconditions_for_behaviors:
    kinstr -> kernel_function -> behavior list -> Alarmset.status ->
    states -> states

  val check_fct_preconditions:
    kinstr -> kernel_function -> Active_behaviors.t -> state -> states or_bottom

  val check_fct_postconditions_for_behaviors:
    kernel_function -> behavior list -> Alarmset.status ->
    pre_state:state -> post_states:states -> result:varinfo option -> states

  val check_fct_postconditions:
    kernel_function -> Active_behaviors.t -> termination_kind ->
    pre_state:state -> post_states:states -> result:varinfo option ->
    states or_bottom

  val evaluate_assumes_of_behavior: state -> behavior -> Alarmset.status

  val interp_annot:
    limit:int -> record:bool ->
    kernel_function -> Active_behaviors.t -> stmt -> code_annotation ->
    initial_state:state -> states -> states
end

module type LogicDomain = sig
  type t
  val top: t
  val equal: t -> t -> bool
  val evaluate_predicate:
    t Abstract_domain.logic_environment -> t -> predicate -> Alarmset.status
  val reduce_by_predicate:
    t Abstract_domain.logic_environment -> t -> predicate -> bool -> t or_bottom
  val interpret_acsl_extension:
    acsl_extension -> t Abstract_domain.logic_environment -> t -> t
end

module Make
    (Domain: LogicDomain)
    (States: Powerset.S with type state = Domain.t)
= struct

  type state = Domain.t
  type states = States.t

  let pre_env ~pre =
    let states = function
      | BuiltinLabel Pre -> pre
      | BuiltinLabel Here -> pre
      | BuiltinLabel _ | FormalLabel _ | StmtLabel _ -> Domain.top
    in
    Abstract_domain.{ states; result = None }

  let post_env ~pre ~post ~result =
    let states = function
      | BuiltinLabel Pre -> pre
      | BuiltinLabel Old -> pre
      | BuiltinLabel Post -> post
      | BuiltinLabel Here -> post
      | BuiltinLabel _ | FormalLabel _ | StmtLabel _ -> Domain.top
    in
    Abstract_domain.{ states; result }

  let here_env  ~pre ~here =
    let states = function
      | BuiltinLabel Pre -> pre
      | BuiltinLabel Here -> here
      | BuiltinLabel _ | FormalLabel _ | StmtLabel _ -> Domain.top
    in
    Abstract_domain.{ states; result = None }

  let create_from_spec pre funspec =
    let eval_predicate = Domain.evaluate_predicate (pre_env ~pre) pre in
    Active_behaviors.create eval_predicate funspec

  let create init_state kf =
    let funspec = Annotations.funspec kf in
    create_from_spec init_state funspec

  exception Does_not_improve

  let rec fold_on_disjunction f p acc =
    match p.pred_content with
    | Por (p1,p2 ) -> fold_on_disjunction f p2 (fold_on_disjunction f p1 acc)
    | _ -> f p acc

  let count_disjunction p = fold_on_disjunction (fun _pred -> succ) p 0

  let split_disjunction_and_reduce ~reduce ~limit env state pred =
    let nb = count_disjunction pred in
    if nb <= 1 && not reduce then
      States.singleton state (* reduction not required, nothing to split *)
    else if nb <= limit
    then begin (* Can split and maybe reduce *)
      let treat_subpred pred acc =
        match Domain.reduce_by_predicate env state pred true with
        | `Bottom -> acc
        | `Value current_state ->
          if Domain.equal current_state state then
            (* This part of the disjunction will contain the entire state.
               Reduction has failed, there is no point in propagating the
               smaller states in acc, that are contained in this one. *)
            raise Does_not_improve
          else
            States.add current_state acc
      in
      try fold_on_disjunction treat_subpred pred States.empty
      with Does_not_improve -> States.singleton state
    end
    else if reduce then
      (* Not enough slevel to split, but we should reduce in a global way *)
      match Domain.reduce_by_predicate env state pred true with
      | `Bottom -> States.empty
      | `Value s -> States.singleton s
    else (* Not enough slevel to split, and reduction not required *)
      States.singleton state

  let eval_split_and_reduce limit ~reduce pred build_env state =
    let env = build_env state in
    let status = Domain.evaluate_predicate env state pred in
    let reduced_states =
      if reduce then
        match status with
        | Alarmset.False   -> States.empty
        | Alarmset.True    ->
          (* Reduce in case [pre] is a disjunction *)
          split_disjunction_and_reduce ~reduce:false ~limit env state pred
        | Alarmset.Unknown ->
          (* Reduce in all cases *)
          split_disjunction_and_reduce ~reduce:true ~limit env state pred
      else
        States.singleton state
    in
    status, reduced_states

  (* Do not display anything for postconditions of leaf functions that
     receive status valid (very rare) or unknown: this brings no
     information. However, warn the user if the status is invalid.
     (unless this is on purpose, using [assert \false]) *)
  let check_ensures_false kf behavior active pr kind statuses =
    let source = fst pr.Cil_types.pred_loc in
    let pp_header = pp_header kf in
    let pp_behavior_inactive fmt =
      Format.fprintf fmt ",@ the behavior@ was@ inactive"
    in
    if (Alarmset.Status.join_list statuses) = Alarmset.False &&
       (match kind with
        | Postcondition (PostLeaf | PostUseSpec) -> true
        | _ -> false)
       && pr.pred_content <> Pfalse then
      Self.warning ~once:true ~source ~wkey:Self.wkey_ensures_false
        "@[%a:@ this postcondition@ evaluates to@ false@ in this@ context.\
         @ If it is valid,@ either@ a precondition@ was not@ verified@ \
         for this@ call%t,@ or some assigns/from@ clauses@ are \
         incomplete@ (or incorrect).@]%t"
        pp_header behavior
        (if active then (fun _ -> ()) else pp_behavior_inactive)
        Eva_utils.pp_callstack

  (* [per_behavior] indicates if we are processing each behavior separately.
     If this is the case, then [Unknown] and [True] behaviors are treated
     in the same way. *)
  let refine_active ~per_behavior behavior status =
    match status with
    | Alarmset.True -> Some true
    | Alarmset.Unknown -> Some (per_behavior || Cil.is_default_behavior behavior)
    | Alarmset.False -> None

  (* [eval_and_reduce_p_kind kf b active p_kind ips states build_prop build_env]
     evaluates the identified predicates [ips] of [kf] in the states [states].
     The states are used simultaneously for evaluation and reduction: if one
     predicate is not valid in one of the states, the status of the predicate is
     set to [Unknown] or [Invalid]. In this case, the state is simultaneously
     reduced (when possible).
     - [p_pkind] indicates the kind of clause being evaluated.
     - [b] is the behavior to which [ips] belong.
     - [active] indicates whether [b] is guaranteed to be active, or maybe active.
     - [build_prop] builds the [Property.t] that corresponds to the pre/post
       being evaluated.
     - [build_env] is used to build the environment evaluation, in particular
       the pre- and post-states. *)
  let eval_and_reduce kf behavior active kind ips states build_prop build_env =
    let limit = Eva_utils.get_slevel kf in
    let emit = emit_contract_status kind kf behavior ~active in
    let aux_pred states pred =
      let pr = Logic_const.pred_of_id_pred pred in
      let record = pred.ip_content.tp_kind <> Admit in
      let reduce = active && pred.ip_content.tp_kind <> Check in
      let ip = build_prop pred in
      if ignore_predicate pr then
        states
      else if States.is_empty states then begin
        if record then emit ~empty:true ip pr Alarmset.True;
        states
      end
      else
        let (statuses, reduced_states) =
          States.fold
            (fun state (acc_status, acc_states) ->
               let status, reduced_states =
                 eval_split_and_reduce limit ~reduce pr build_env state
               in
               (status :: acc_status,
                fst (States.merge ~into:acc_states reduced_states)))
            states ([], States.empty)
        in
        if record
        then
          begin
            List.iter (fun status -> emit ~empty:false ip pr status) statuses;
            check_ensures_false kf behavior active pr kind statuses;
          end;
        States.reorder reduced_states
    in
    List.fold_left aux_pred states ips

  (** Check the postcondition of [kf] for the list of [behaviors].
      This may result in splitting [post_states] if the postconditions contain
      disjunctions. *)
  let check_fct_postconditions_of_behaviors kf behaviors is_active kind
      ~per_behavior ~pre_state ~post_states ~result =
    if behaviors = [] then post_states
    else
      let build_env s = post_env ~pre:pre_state ~post:s ~result in
      let k = Postcondition (post_kind kf) in
      let check_one_behavior states b =
        match refine_active ~per_behavior b (is_active b) with
        | None -> states
        | Some active ->
          let posts = List.filter (fun (x, _) -> x = kind) b.b_post_cond in
          let posts = List.map snd posts in
          let build_prop p = Property.ip_of_ensures kf Kglobal b (kind, p) in
          let states =
            eval_and_reduce kf b active k posts states build_prop build_env
          in
          let interpret_extension extension state =
            Domain.interpret_acsl_extension extension (build_env state) state
          in
          List.fold_left
            (fun acc e -> States.map (interpret_extension e) acc)
            states b.b_extended
      in
      List.fold_left check_one_behavior post_states behaviors

  (** Check the postcondition of [kf] for the list [behaviors] and for
      the default behavior, treating them separately if [per_behavior] is [true],
      merging them otherwise. *)
  let check_fct_postconditions_for_behaviors kf behaviors status
      ~pre_state ~post_states ~result =
    let behaviors =
      if List.exists Cil.is_default_behavior behaviors && behaviors <> []
      then behaviors
      else match Cil.find_default_behavior kf.spec with
        | None -> behaviors
        | Some default -> default :: behaviors
    in
    let is_active _ = status in
    let kind = Normal in
    check_fct_postconditions_of_behaviors kf behaviors is_active kind
      ~per_behavior:true ~pre_state ~post_states ~result

  (** Check the postcondition of [kf] for every behavior.
      The postcondition of the global behavior is applied for each behavior,
      to help reduce the final state. *)
  let check_fct_postconditions kf ab kind ~pre_state ~post_states ~result =
    let behaviors = Annotations.behaviors kf in
    let is_active = Active_behaviors.is_active ab in
    let states =
      check_fct_postconditions_of_behaviors
        kf behaviors is_active kind ~per_behavior:false
        ~pre_state ~post_states ~result
    in
    if States.is_empty states then `Bottom else `Value states


  let check_fct_preconditions_of_behaviors call_ki kf ~per_behavior behaviors
      is_active states =
    if behaviors = [] then states
    else
      let build_env pre = pre_env ~pre in
      let k = Precondition in
      let check_one_behavior states b =
        match refine_active ~per_behavior b (is_active b) with
        | None -> process_inactive_behavior kf call_ki b; states
        | Some active ->
          let build_prop assume = Property.ip_of_assumes kf Kglobal b assume in
          let states =
            eval_and_reduce kf b active Assumes b.b_assumes states build_prop build_env
          in
          let build_prop = ip_from_precondition kf call_ki b in
          let states =
            eval_and_reduce kf b active k b.b_requires states build_prop build_env
          in
          if States.is_empty states
          then process_inactive_postconds kf [b];
          states
      in
      List.fold_left check_one_behavior states behaviors

  (** Check the precondition of [kf] for a given behavior [b].
      This may result in splitting [states] if the precondition contains
      disjunctions. *)
  let check_fct_preconditions_for_behaviors call_ki kf behaviors status states =
    let is_active _ = status in
    check_fct_preconditions_of_behaviors call_ki kf ~per_behavior:true
      behaviors is_active states

  (*  Check the precondition of [kf]. This may result in splitting [init_state]
      into multiple states if the precondition contains disjunctions. *)
  let check_fct_preconditions call_ki kf ab init_state =
    let init_states = States.singleton init_state in
    let behaviors = Annotations.behaviors kf in
    let is_active = Active_behaviors.is_active ab in
    let states =
      check_fct_preconditions_of_behaviors call_ki kf ~per_behavior:false
        behaviors is_active init_states
    in
    if States.is_empty states then `Bottom else `Value states

  let evaluate_assumes_of_behavior state =
    let pre_env = pre_env ~pre:state in
    fun behavior ->
      let assumes = create_conjunction behavior.b_assumes in
      Domain.evaluate_predicate pre_env state assumes


  (* Reduce the given states according to the given code annotations.
     If [record] is true, update the proof state of the code annotation.
     DO NOT PASS record=false unless you know what your are doing *)
  let interp_annot ~limit ~record kf ab stmt code_annot ~initial_state states =
    let aux_interp ~record ~reduce code_annot behav p =
      let in_behavior =
        match behav with
        | [] -> `True
        | behavs ->
          let aux acc b =
            match Active_behaviors.is_active_from_name ab b with
            | Alarmset.True -> `True
            | Alarmset.Unknown -> if acc = `True then `True else `Unknown
            | Alarmset.False -> acc
          in
          List.fold_left aux `False behavs
      in
      match in_behavior with
      | `False -> states
      | `True | `Unknown as in_behavior ->
        (* No reduction if the behavior might be inactive. *)
        let reduce = reduce && in_behavior = `True in
        let emit = emit_code_annot_status ~reduce ~empty:false kf stmt in
        let reduce_state here res accstateset =
          match res with
          | Alarmset.False -> accstateset (* Dead/invalid branch *)
          | Alarmset.Unknown | Alarmset.True ->
            let env = here_env ~pre:initial_state ~here in
            (* Reduce by p if it is a disjunction, or if it did not
               evaluate to True *)
            let reduce = res = Alarmset.Unknown in
            let reduced_states =
              split_disjunction_and_reduce ~reduce ~limit env here p
            in
            fst (States.merge reduced_states ~into:accstateset)
        in
        let reduced_states =
          States.fold
            (fun (here: Domain.t) accstateset ->
               let env = here_env ~pre:initial_state ~here in
               let res = Domain.evaluate_predicate env here p in
               (* if [record] holds, emit kernel status and print a message *)
               if record then emit code_annot res;
               (* if [reduce] holds, reduce the state. *)
               if reduce then reduce_state here res accstateset else accstateset)
            states States.empty
        in
        (* States resulting from disjunctions are reversed compared to the
           'nice' ordering *)
        if reduce then States.reorder reduced_states else states
    in
    let aux code_annot ~record ~reduce behav p =
      if ignore_predicate p then
        states
      else if States.is_empty states then (
        if record then
          emit_code_annot_status ~reduce:true ~empty:true
            kf stmt code_annot Alarmset.True;
        states
      ) else
        aux_interp ~record ~reduce code_annot behav p
    in
    match code_annot.annot_content with
    | AAssert (behav, p)
    | AInvariant (behav, true, p) ->
      let record = record && p.tp_kind <> Admit in
      let reduce = p.tp_kind <> Check in
      aux ~record ~reduce code_annot behav p.tp_statement
    | AInvariant (_, false, _)
    | AVariant _ | AAssigns _ | AAllocation _
    | AStmtSpec _ (*TODO*) -> states
    | AExtended (_, _, extension) ->
      let interpret_extension extension state =
        let env = here_env ~pre:initial_state ~here:state in
        Domain.interpret_acsl_extension extension env state
      in
      States.map (interpret_extension extension) states

end


(*
Local Variables:
compile-command: "make -C ../../../.."
End:
*)
