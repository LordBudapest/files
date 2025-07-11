(**************************************************************************)
(*                                                                        *)
(*  This file is part of the Frama-C's E-ACSL plug-in.                    *)
(*                                                                        *)
(*  Copyright (C) 2012-2024                                               *)
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

module Dataflow = Dataflow2

let dkey = Options.Dkey.mtracking
module Error = Error.Make(struct let phase = dkey end)

(* Some pointers (stdin, stdout, stderr, &errno) are special in the sense that
   they need not be allocated, initialized, and in that they are not freeable,
   and that some of them are statically known to be writeable/read-only.
   There is no need to monitor the corresponding memory regions. *)
module SpecialPointers = struct
  type spec = {pointer : bool; freeable : bool; writeable : bool; initialized : bool}

  let specs = [
    "errno",  {pointer = false; freeable = false; writeable = true;  initialized = true};
    "stdin",  {pointer = true;  freeable = false; writeable = false; initialized = true};
    "stdout", {pointer = true;  freeable = false; writeable = true;  initialized = true};
    "stderr", {pointer = true;  freeable = false; writeable = true;  initialized = true}
  ]

  let tbl = Varinfo.Hashtbl.create 5

  let initialize () =
    let add_builtin (name, spec) =
      let name = if Kernel.FramaCStdLib.get () then "__fc_" ^ name else name in
      let vi_o = Globals.Syntactic_search.find_in_scope name Global in
      Option.iter (fun vi -> Varinfo.Hashtbl.add tbl vi spec) vi_o
    in List.iter add_builtin specs

  let clear () = Varinfo.Hashtbl.clear tbl

  let mem = Varinfo.Hashtbl.mem tbl

  let find_opt = Varinfo.Hashtbl.find_opt tbl

  let pointer_of_term t =
    let filter_opt f = function
      | None -> None
      | Some x -> if f x then Some x else None
    in
    match t.term_node with
    | TLval (TVar {lv_origin = Some v}, TNoOffset) ->
      filter_opt (fun spec -> spec.pointer) (find_opt v)
    | TAddrOf (TVar {lv_origin = Some v}, TNoOffset) ->
      filter_opt (fun spec -> not @@ spec.pointer) (find_opt v)
    | _ -> None
end

let must_never_monitor vi =
  (* E-ACSL, please do not monitor yourself! *)
  Rtl.Symbols.mem_vi vi.vname
  ||
  (* extern ghost variables are usually used (by the Frama-C libc) to
       represent some internal invisible states in ACSL specifications. They do
       not correspond to something concrete *)
  (vi.vghost && vi.vstorage = Extern)
  ||
  (* incomplete types cannot be properly monitored. See BTS #2406. *)
  not (Cil.isCompleteType vi.vtype)
  ||
  (* function pointers are not yet supported. *)
  Cil.isFunctionType vi.vtype
  ||
  SpecialPointers.mem vi

(* ********************************************************************** *)
(* Backward dataflow analysis to compute a sound over-approximation of what
   left-values must be tracked by the memory model library *)
(* ********************************************************************** *)

module Env: sig
  val has_heap_allocations: unit -> bool
  val check_heap_allocations: kernel_function -> unit
  val default_varinfos: Varinfo.Hptset.t option -> Varinfo.Hptset.t
  val apply: (kernel_function -> 'a) -> kernel_function -> 'a
  val clear: unit -> unit
  val add: kernel_function -> Varinfo.Hptset.t option Stmt.Hashtbl.t -> unit
  val add_init: kernel_function -> Varinfo.Hptset.t option -> unit
  val mem_init: kernel_function -> Varinfo.Hptset.t option -> bool
  val find: kernel_function -> Varinfo.Hptset.t option Stmt.Hashtbl.t
  module StartData:
    Dataflow.StmtStartData with type data = Varinfo.Hptset.t option
  val is_consolidated: unit -> bool
  val consolidate: Varinfo.Hptset.t -> unit
  val consolidated_mem: varinfo -> bool
  val is_empty: unit -> bool
end = struct

  let heap_allocation_ref = ref false
  let has_heap_allocations () = !heap_allocation_ref
  let check_heap_allocations kf =
    (* a function with no definition potentially allocates memory *)
    heap_allocation_ref :=
      !heap_allocation_ref || not (Kernel_function.is_definition kf)

  let current_kf = ref None
  let default_varinfos = function None -> Varinfo.Hptset.empty | Some s -> s

  let apply f kf =
    let old = !current_kf in
    current_kf := Some kf;
    let res = f kf in
    current_kf := old;
    res

  let tbl = Kernel_function.Hashtbl.create 7
  let add = Kernel_function.Hashtbl.add tbl
  let find = Kernel_function.Hashtbl.find tbl

  module S = Set.Make(Datatype.Option(Varinfo.Hptset))

  let tbl_init = Kernel_function.Hashtbl.create 7
  let add_init kf init =
    let set =
      try Kernel_function.Hashtbl.find tbl_init kf
      with Not_found -> S.empty
    in
    let set = S.add init set in
    Kernel_function.Hashtbl.replace tbl_init kf set

  let mem_init kf init =
    try
      let set = Kernel_function.Hashtbl.find tbl_init kf in
      S.mem init set
    with Not_found ->
      false

  module StartData = struct
    type data = Varinfo.Hptset.t option
    let apply f =
      try
        let kf = Option.value ~default:(Kernel_function.dummy()) !current_kf in
        let h = Kernel_function.Hashtbl.find tbl kf in
        f h
      with Not_found ->
        assert false
    let clear () = apply Stmt.Hashtbl.clear
    let mem k = apply Stmt.Hashtbl.mem k
    let find k = apply Stmt.Hashtbl.find k
    let replace k v = apply Stmt.Hashtbl.replace k v
    let add k v = apply Stmt.Hashtbl.add k v
    let iter f = apply (Stmt.Hashtbl.iter f)
    let length () = apply Stmt.Hashtbl.length
  end

  (* TODO: instead of this costly consolidation, why do not take the state of
     the entry point of the function? *)

  let consolidated_set = ref Varinfo.Hptset.empty
  let is_consolidated_ref = ref false

  let consolidate set =
    let set = Varinfo.Hptset.union set !consolidated_set in
    consolidated_set := set

  let consolidated_mem v =
    is_consolidated_ref := true;
    Varinfo.Hptset.mem v !consolidated_set

  let is_consolidated () = !is_consolidated_ref

  let is_empty () =
    try
      Kernel_function.Hashtbl.iter
        (fun _ h ->
           Stmt.Hashtbl.iter
             (fun _ set -> match set with
                | None -> ()
                | Some s -> if not (Varinfo.Hptset.is_empty s) then raise Exit)
             h)
        tbl;
      true
    with Exit ->
      false

  let clear () =
    Kernel_function.Hashtbl.clear tbl;
    consolidated_set := Varinfo.Hptset.empty;
    is_consolidated_ref := false;
    heap_allocation_ref := false

end

let reset () =
  Options.feedback ~dkey ~level:2 "clearing environment.";
  SpecialPointers.clear ();
  Env.clear ()

module rec Transfer
  : Dataflow.BackwardsTransfer with type t = Varinfo.Hptset.t option
= struct

  let name = "E_ACSL.Pre_analysis"

  let debug = false

  type t = Varinfo.Hptset.t option

  module StmtStartData = Env.StartData

  let pretty fmt state = match state with
    | None -> Format.fprintf fmt "None"
    | Some s -> Format.fprintf fmt "%a" Varinfo.Hptset.pretty s

  (** The data at function exit. Used for statements with no successors.
      This is usually bottom, since we'll also use doStmt on Return
      statements. *)
  let funcExitData = None

  (** When the analysis reaches the start of a block, combine the old data with
      the one we have just computed. Return None if the combination is the same
      as the old data, otherwise return the combination. In the latter case, the
      predecessors of the statement are put on the working list. *)
  let combineStmtStartData stmt ~old state = match stmt.skind, old, state with
    | _, _, None -> assert false
    | _, None, Some _ -> Some state (* [old] already included in [state] *)
    | Return _, Some old, Some new_ ->
      Some (Some (Varinfo.Hptset.union old new_))
    | _, Some old, Some new_ ->
      if Varinfo.Hptset.equal old new_ then
        None
      else
        Some (Some (Varinfo.Hptset.union old new_))

  (** Take the data from two successors and combine it *)
  let combineSuccessors s1 s2 =
    Some
      (Varinfo.Hptset.union (Env.default_varinfos s1) (Env.default_varinfos s2))

  let is_ptr_or_array ty = Cil.isPointerType ty || Cil.isArrayType ty

  let is_ptr_or_array_exp e =
    let ty = Cil.typeOf e in
    is_ptr_or_array ty

  let may_alias li = match li.l_var_info.lv_type with
    | Ctype ty -> is_ptr_or_array ty
    | Lboolean | Linteger | Lreal -> false
    | Ltype _ -> Error.not_yet "user defined type"
    | Lvar _ -> Error.not_yet "named type"
    | Larrow _ -> Error.not_yet "functional type"

  let rec base_addr_node = function
    | Lval lv | AddrOf lv | StartOf lv ->
      (match lv with
       | Var vi, _ -> Some vi
       | Mem e, _ -> base_addr e)
    | BinOp((PlusPI | MinusPI), e1, e2, _) ->
      if is_ptr_or_array_exp e1 then base_addr e1
      else begin
        assert (is_ptr_or_array_exp e2);
        base_addr e2
      end
    | CastE(_, e) -> base_addr e
    | BinOp((MinusPP | PlusA | MinusA | Mult | Div | Mod |Shiftlt | Shiftrt
            | Lt | Gt | Le | Ge | Eq | Ne | BAnd | BXor | BOr | LAnd | LOr),
            _, _, _)
    | UnOp _ | Const _ | SizeOf _ | SizeOfE _ | SizeOfStr _ | AlignOf _
    | AlignOfE _ ->
      None

  and base_addr e = base_addr_node e.enode

  let extend_to_expr always state lhost e =
    let add_vi state vi =
      if is_ptr_or_array_exp e && (always || Varinfo.Hptset.mem vi state)
      then begin
        match base_addr e with
        | None -> state
        | Some vi_e ->
          if must_never_monitor vi then state
          else begin
            Options.feedback ~level:4 ~dkey
              "monitoring %a from %a."
              Printer.pp_varinfo vi_e
              Printer.pp_lval (lhost, NoOffset);
            Varinfo.Hptset.add vi_e state
          end
      end else
        state
    in
    match lhost with
    | Var vi -> add_vi state vi
    | Mem e ->
      match base_addr e with
      | None -> state
      | Some vi -> add_vi state vi

  (* if [e] contains a pointer left-value, then also monitor the host *)
  let rec extend_from_addr state lv e = match e.enode with
    | Lval(lhost, _) ->
      if is_ptr_or_array_exp e then
        extend_to_expr true state lhost (Cil.new_exp ~loc:e.eloc (Lval lv)),
        true
      else
        state, false
    | AddrOf(lhost, _) ->
      extend_to_expr true state lhost (Cil.new_exp ~loc:e.eloc (Lval lv)),
      true
    | BinOp((PlusPI | MinusPI), e1, e2, _) ->
      if is_ptr_or_array_exp e1 then extend_from_addr state lv e1
      else begin
        assert (is_ptr_or_array_exp e2);
        extend_from_addr state lv e2
      end
    | CastE(_, e) -> extend_from_addr state lv e
    | _ -> state, false

  let handle_assignment state (lhost, _ as lv) e =
    (* if [e] is a pointer left-value, then also monitor the host *)
    let state, always = extend_from_addr state lv e in
    extend_to_expr always state lhost e

  let rec register_term_lval kf varinfos (thost, _) =
    let add_vi kf vi =
      Options.feedback ~level:4 ~dkey "monitoring %a from annotation of %a."
        Printer.pp_varinfo vi
        Kernel_function.pretty kf;
      Varinfo.Hptset.add vi varinfos
    in
    match thost with
    | TVar { lv_origin = None } -> varinfos
    | TVar { lv_origin = Some vi } -> add_vi kf vi
    | TResult _ -> add_vi kf (Misc.result_vi kf)
    | TMem t -> register_term kf varinfos t

  and register_term kf varinfos term = match term.term_node with
    | TLval tlv | TAddrOf tlv | TStartOf tlv ->
      register_term_lval kf varinfos tlv
    | TCast (_, _, t) | Tat(t, _) ->
      register_term kf varinfos t
    | Tlet(li, t) ->
      if may_alias li then Error.not_yet "let-binding on array or pointer"
      else begin
        let varinfos = register_term kf varinfos t in
        register_body kf varinfos li.l_body
      end
    | Tif(_, t1, t2) ->
      let varinfos = register_term kf varinfos t1 in
      register_term kf varinfos t2
    | TBinOp((PlusPI | MinusPI), t1, t2) ->
      (match t1.term_type with
       | Ctype ty when is_ptr_or_array ty -> register_term kf varinfos t1
       | _ ->
         match t2.term_type with
         | Ctype ty when is_ptr_or_array ty -> register_term kf varinfos t2
         | _ ->
           if Misc.is_set_of_ptr_or_array t1.term_type ||
              Misc.is_set_of_ptr_or_array t2.term_type then
             (* Occurs for example from:
                \valid(&multi_dynamic[2..4][1..7])
                where multi_dynamic has been dynamically allocated *)
             let varinfos = register_term kf varinfos t1 in
             register_term kf varinfos t2
           else
             assert false)
    | TConst _ | TSizeOf _ | TSizeOfE _ | TSizeOfStr _ | TAlignOf _
    | TAlignOfE _ | Tnull | Ttype _ | TUnOp _ | TBinOp _ ->
      varinfos
    | Tlambda(_, _) -> Error.not_yet "lambda function"
    | Tapp(_, _, _) -> Error.not_yet "function application"
    | TDataCons _ -> Error.not_yet "data constructor"
    | Tbase_addr _ -> Error.not_yet "\\base_addr"
    | Toffset _ -> Error.not_yet "\\offset"
    | Tblock_length _ -> Error.not_yet "\\block_length"
    | TUpdate _ -> Error.not_yet "functional update"
    | Ttypeof _ -> Error.not_yet "typeof"
    | Tempty_set -> Error.not_yet "empty set"
    | Tunion _ -> Error.not_yet "set union"
    | Tinter _ -> Error.not_yet "set intersection"
    | Tcomprehension _ -> Error.not_yet "set comprehension"
    | Trange(Some t1, Some t2) ->
      let varinfos = register_term kf varinfos t1 in
      register_term kf varinfos t2
    | Trange(None, _) | Trange(_, None) ->
      Options.abort "unbounded ranges are not part of E-ACSL"

  and register_body kf varinfos = function
    | LBnone | LBreads _ -> varinfos
    | LBterm t -> register_term kf varinfos t
    | LBpred _ -> Options.fatal "unexpected predicate"
    | LBinductive _ -> Error.not_yet "inductive definitions"

  let register_object kf state_ref = object
    inherit Visitor.frama_c_inplace
    method !vpredicate_node = function
      | Pvalid(_, t) | Pvalid_read(_, t)
      | Pobject_pointer(_, t) | Pvalid_function t
      | Pinitialized(_, t) | Pfreeable(_, t) ->
        (* Options.feedback "REGISTER %a" Cil.d_term t;*)
        state_ref := register_term kf !state_ref t;
        Cil.DoChildren
      | Pseparated tlist ->
        state_ref :=
          List.fold_left
            (register_term kf)
            !state_ref
            tlist;
        Cil.DoChildren
      | Pallocable _ -> Error.not_yet "\\allocable"
      | Pfresh _ -> Error.not_yet "\\fresh"
      | Pdangling _ -> Error.not_yet "\\dangling"
      | Ptrue | Pfalse | Papp _ | Prel _
      | Pand _ | Por _ | Pxor _ | Pimplies _ | Piff _ | Pnot _ | Pif _
      | Pforall _ | Pexists _ | Pat _ ->
        Cil.DoChildren
      | Plet(li, _) ->
        if may_alias li then Error.not_yet "let-binding on array or pointer"
        else begin
          state_ref := register_term kf !state_ref (Misc.term_of_li li);
          Cil.DoChildren
        end
    method !vterm term = match term.term_node with
      | Tbase_addr(_, t) | Toffset(_, t) | Tblock_length(_, t) | Tlet(_, t) ->
        state_ref := register_term kf !state_ref t;
        Cil.DoChildren
      | TConst _ | TSizeOf _ | TSizeOfStr _ | TAlignOf _  | Tnull | Ttype _
      | Tempty_set ->
        (* no left-value inside inside: skip for efficiency *)
        Cil.SkipChildren
      | TUnOp _ | TBinOp _ | Ttypeof _ | TSizeOfE _
      | TLval _ | TAlignOfE _ | TCast _ | TAddrOf _
      | TStartOf _ | Tapp _ | Tlambda _ | TDataCons _ | Tif _ | Tat _
      | TUpdate _ | Tunion _ | Tinter _
      | Tcomprehension _ | Trange _  ->
        (* potential sub-term inside *)
        Cil.DoChildren
    method !vlogic_label _ = Cil.SkipChildren
    method !vterm_lhost = function
      | TMem t ->
        (* potential RTE *)
        state_ref := register_term kf !state_ref t;
        Cil.DoChildren
      | TVar _ | TResult _ ->
        Cil.SkipChildren
  end

  let register_predicate kf pred state =
    let state_ref = ref state in
    Error.handle
      (fun () ->
         ignore
           (Visitor.visitFramacIdPredicate (register_object kf state_ref) pred))
      ();
    !state_ref

  let register_code_annot kf a state =
    let state_ref = ref state in
    Error.handle
      (fun () ->
         ignore
           (Visitor.visitFramacCodeAnnotation (register_object kf state_ref) a))
      ();
    !state_ref

  let rec do_init vi init state = match init with
    | SingleInit e -> handle_assignment state (Var vi, NoOffset) e
    | CompoundInit(_, l) ->
      List.fold_left (fun state (_, init) -> do_init vi init state) state l

  let register_initializers state =
    let do_one vi init state = match init.init with
      | None -> state
      | Some init -> do_init vi init state
    in
    Globals.Vars.fold_in_file_rev_order do_one state
  (* below: compatibility with Fluorine *)
  (*    let l = Globals.Vars.fold_in_file_order (fun v i l -> (v, i) :: l) [] in
        List.fold_left (fun state (v, i) -> do_one v i state) state l*)

  (** The (backwards) transfer function for a branch. The [(Current_loc.get
      ())] is set before calling this. If it returns None, then we have some
      default handling. Otherwise, the returned data is the data before the
      branch (not considering the exception handlers) *)
  let doStmt stmt =
    let _, kf = Kernel_function.find_from_sid stmt.sid in
    let is_first = Kernel_function.is_first_stmt kf stmt in
    let is_last = Kernel_function.is_return_stmt kf stmt in
    Dataflow.Post
      (fun state ->
         let state = Env.default_varinfos state in
         let state =
           if Functions.check kf then
             let state =
               if (is_first || is_last) && Functions.RTL.is_generated_kf kf then
                 Annotations.fold_behaviors
                   (fun bhv s ->
                      let handle_annot test f s =
                        if test then
                          f
                            (fun _ p s -> register_predicate kf p s)
                            kf
                            bhv.b_name
                            s
                        else
                          s
                      in
                      let s =
                        handle_annot is_first Annotations.fold_requires s
                      in
                      let s =
                        handle_annot is_first Annotations.fold_assumes s
                      in
                      handle_annot
                        is_last
                        (fun f ->
                           Annotations.fold_ensures (fun e (_, p) -> f e p)) s)
                   kf
                   state
               else
                 state
             in
             let state =
               Annotations.fold_code_annot
                 (fun _ -> register_code_annot kf) stmt state
             in
             if stmt.ghost then
               let rtes = Rte.stmt kf stmt in
               let logic_env = Analyses_datatype.Logic_env.empty in
               List.iter (Typing.preprocess_rte ~logic_env) rtes;
               List.fold_left
                 (fun state a -> register_code_annot kf a state) state rtes
             else
               state
           else (* not (Options.Functions.check kf): do not monitor [kf] *)
             state
         in
         let state =
           (* take initializers into account *)
           if is_first then
             let main, lib = Globals.entry_point () in
             if Kernel_function.equal kf main && not lib then
               register_initializers state
             else
               state
           else
             state
         in
         Some state)

  let do_call res f args state =
    let kf = Globals.Functions.get f in
    Env.check_heap_allocations kf;
    let params = Globals.Functions.get_params kf in
    let state =
      if Kernel_function.is_definition kf then
        try
          (* compute the initial state of the called function *)
          let init =
            List.fold_left2
              (fun acc p a -> match base_addr a with
                 | None -> acc
                 | Some vi ->
                   if Varinfo.Hptset.mem vi state
                   then Varinfo.Hptset.add p acc
                   else acc)
              state
              params
              args
          in
          let init = match res with
            | None -> init
            | Some lv ->
              match base_addr_node (Lval lv) with
              | None -> init
              | Some vi ->
                if Varinfo.Hptset.mem vi state
                then Varinfo.Hptset.add (Misc.result_vi kf) init
                else init
          in
          let state = Compute.get ~init kf in
          (* compute the resulting state by keeping arguments whenever the
             corresponding formals must be kept *)
          List.fold_left2
            (fun acc p a -> match base_addr a with
               | None -> acc
               | Some vi ->
                 if Varinfo.Hptset.mem p state then Varinfo.Hptset.add vi acc
                 else acc)
            state
            params
            args
        with Invalid_argument _ ->
          Options.warning ~current:true
            "ignoring effect of variadic function %a"
            Kernel_function.pretty
            kf;
          state
      else
        state
    in
    let state = match res, Kernel_function.is_definition kf with
      | None, _ | _, false -> state
      | Some (lhost, _), true ->
        (* add the result if \result must be kept after calling the kf *)
        let vi = Misc.result_vi kf in
        if  Varinfo.Hptset.mem vi state then
          match lhost with
          | Var vi -> Varinfo.Hptset.add vi state
          | Mem e ->
            match base_addr e with
            | None -> state
            | Some vi -> Varinfo.Hptset.add vi state
        else
          state
    in
    Dataflow.Done (Some state)


  (** The (backwards) transfer function for an instruction. The
      [(Current_loc.get ())] is set before calling this. If it returns
      None, then we have some default handling. Otherwise, the returned data is
      the data before the branch (not considering the exception handlers) *)
  let doInstr _stmt instr state =
    let state = Env.default_varinfos state in
    match instr with
    | Set(lv, e, _) ->
      let state = handle_assignment state lv e in
      Dataflow.Done (Some state)
    | Local_init(v,AssignInit i,_) ->
      let state = do_init v i state in
      Dataflow.Done (Some state)
    | Local_init(v,ConsInit(f,args,Constructor),_) ->
      do_call None f (Cil.mkAddrOfVi v :: args) state
    | Local_init(v,ConsInit(f,args,Plain_func),_) ->
      do_call (Some (Cil.var v)) f args state
    | Call(result, f_exp, l, _) ->
      (match f_exp.enode with
       | Lval(Var vi, NoOffset) -> do_call result vi l state
       | _ ->
         Options.warning ~current:true
           "function pointers may introduce too limited instrumentation.";
         (* imprecise function call: keep each argument *)
         Dataflow.Done
           (Some
              (List.fold_left
                 (fun acc e -> match base_addr e with
                    | None -> acc
                    | Some vi -> Varinfo.Hptset.add vi acc)
                 state
                 l)))
    | Asm _ -> Error.not_yet "asm"
    | Skip _ | Code_annot _ -> Dataflow.Default

  (** Whether to put this statement in the worklist. This is called when a
      block would normally be put in the worklist. *)
  let filterStmt _predecessor _block = true

end

and Compute: sig
  val get: ?init:Varinfo.Hptset.t -> kernel_function -> Varinfo.Hptset.t
end = struct

  module D = Dataflow.Backwards(Transfer)

  let compute init_set kf =
    Options.feedback ~dkey ~level:2 "entering in function %a."
      Kernel_function.pretty kf;
    assert (not (Rtl.Symbols.mem_kf kf));
    let tbl, is_init =
      try Env.find kf, true
      with Not_found -> Stmt.Hashtbl.create 17, false
    in
    (*    Options.feedback "ANALYSING %a" Kernel_function.pretty kf;*)
    if not is_init then Env.add kf tbl;
    (try
       let fundec = Kernel_function.get_definition kf in
       (* FIXME: Since the memory tracking analysis is launched during the
          translation, we need to recompute the CFG of the function before the
          dataflow analysis.
          This fix is just temporary and should be removed once the correct fix
          is applied: identifying in an early pre-analysis if some memory
          annotations are used, and in that case launch the memory tracking in a
          pre-analysis. *)
       Cfg.clearCFGinfo ~clear_id:false fundec;
       Cfg.cfgFun fundec;
       let stmts, returns = Dataflow.find_stmts fundec in
       if is_init then
         Option.iter
           (fun set ->
              List.iter
                (fun s ->
                   let old =
                     try Option.get (Stmt.Hashtbl.find tbl s)
                     with Not_found -> assert false
                   in
                   Stmt.Hashtbl.replace
                     tbl
                     s
                     (Some (Varinfo.Hptset.union set old)))
                returns)
           init_set
       else begin
         List.iter (fun s -> Stmt.Hashtbl.add tbl s None) stmts;
         Option.iter
           (fun set ->
              List.iter
                (fun s -> Stmt.Hashtbl.replace tbl s (Some set))
                returns)
           init_set
       end;
       D.compute stmts
     with Kernel_function.No_Definition | Kernel_function.No_Statement ->
       ());
    Options.feedback ~dkey ~level:2 "function %a done."
      Kernel_function.pretty kf;
    tbl

  let get ?init kf =
    if Rtl.Symbols.mem_kf kf then
      Varinfo.Hptset.empty
    else
      try
        let stmt = Kernel_function.find_first_stmt kf in
        (*      Options.feedback "GETTING %a" Kernel_function.pretty kf;*)
        let tbl =
          if Env.mem_init kf init then
            try Env.find kf with Not_found -> assert false
          else begin
            (* WARN: potentially incorrect in case of recursive call *)
            Env.add_init kf init;
            Env.apply (compute init) kf
          end
        in
        try
          let set = Stmt.Hashtbl.find tbl stmt in
          Env.default_varinfos set
        with Not_found ->
          Options.fatal "[pre_analysis] stmt never analyzed: %a"
            Printer.pp_stmt stmt
      with Kernel_function.No_Statement ->
        Varinfo.Hptset.empty

end

let consolidated_must_monitor_vi vi =
  if Env.is_consolidated () then
    Env.consolidated_mem vi
  else begin
    Options.feedback ~level:2 "performing pre-analysis for minimal memory \
                               instrumentation.";
    (try
       let main, _ = Globals.entry_point () in
       let set = Compute.get main in
       Env.consolidate set
     with Globals.No_such_entry_point s ->
       Options.warning
         ~once:true
         "%s@ \
          @[The generated program may miss memory instrumentation@ \
          if there are memory-related annotations.@]"
         s);
    Options.feedback ~level:2 "pre-analysis done.";
    Env.consolidated_mem vi
  end

let concurrent_function_ref = ref None

let abort_because_of_concurrent ~loc vi =
  let open Current_loc.Operators in
  let<> UpdatedCurrentLoc = loc in
  Options.abort
    ~current:true
    "Found concurrent function %a and monitored memory properties.\n\
     Please use option '-e-acsl-concurrency' to add concurrency support."
    Printer.pp_varinfo vi


let must_monitor_vi ?kf ?stmt vi =
  let _kf = match kf, stmt with
    | None, None | Some _, _ -> kf
    | None, Some stmt -> Some (Kernel_function.find_englobing_kf stmt)
  in
  (* [JS 2013/05/07] that is unsound to take the env from the given stmt in
     presence of aliasing with an address (see tests address.i).
     TODO: could be optimized though *)
  let res = consolidated_must_monitor_vi vi in
  (*  match stmt, kf with
      | None, _ -> consolidated_must_monitor_vi vi
      | Some _, None ->
      assert false
      | Some stmt, Some kf  ->
      if not (Env.is_consolidated ()) then
        ignore (consolidated_must_monitor_vi vi);
      try
        let tbl = Env.find kf in
        try
      let set = Stmt.Hashtbl.find tbl stmt in
      Varinfo.Hptset.mem vi (Env.default_varinfos set)
        with Not_found ->
      (* new statement *)
      consolidated_must_monitor_vi vi
      with Not_found ->
        (* [kf] is dead code *)
        false
  *)
  match res, !concurrent_function_ref with
  | true, Some (loc, vi) -> abort_because_of_concurrent ~loc vi
  | _, _ -> res

let rec apply_on_vi_base_from_lval f ?kf ?stmt = function
  | Var vi, _ -> f ?kf ?stmt vi
  | Mem e, _ -> apply_on_vi_base_from_exp f ?kf ?stmt e

and apply_on_vi_base_from_exp f ?kf ?stmt e = match e.enode with
  | Lval lv | AddrOf lv | StartOf lv ->
    apply_on_vi_base_from_lval f ?kf ?stmt lv
  | BinOp((PlusPI | MinusPI), e1, _, _) ->
    apply_on_vi_base_from_exp f ?kf ?stmt e1
  | BinOp(MinusPP, e1, e2, _) ->
    apply_on_vi_base_from_exp f ?kf ?stmt e1
    || apply_on_vi_base_from_exp f ?kf ?stmt e2
  | CastE(_, e) -> apply_on_vi_base_from_exp f ?kf ?stmt e
  | BinOp((PlusA | MinusA | Mult | Div | Mod |Shiftlt | Shiftrt | Lt | Gt | Le
          | Ge | Eq | Ne | BAnd | BXor | BOr | LAnd | LOr), _, _, _)
  | Const _ -> (* possible in case of static address *) false
  | UnOp _ | SizeOf _ | SizeOfE _ | SizeOfStr _ | AlignOf _ | AlignOfE _ ->
    Options.fatal "[pre_analysis] unexpected expression %a" Exp.pretty e

let must_monitor_lval = apply_on_vi_base_from_lval must_monitor_vi
let must_monitor_exp = apply_on_vi_base_from_exp must_monitor_vi

let must_never_monitor_lval ?kf ?stmt lv =
  apply_on_vi_base_from_lval
    (fun ?kf:_ ?stmt:_ vi -> must_never_monitor vi)
    ?kf
    ?stmt
    lv

let must_never_monitor_exp ?kf ?stmt lv  =
  apply_on_vi_base_from_exp
    (fun ?kf:_ ?stmt:_ vi -> must_never_monitor vi)
    ?kf
    ?stmt
    lv

(* ************************************************************************** *)
(** {1 Public API} *)
(* ************************************************************************** *)

let must_monitor_vi ?kf ?stmt vi =
  not (must_never_monitor vi)
  &&
  (Options.Full_mtracking.get ()
   || Error.generic_handle (must_monitor_vi ?kf ?stmt) false vi)

let must_monitor_lval ?kf ?stmt lv =
  not (must_never_monitor_lval ?kf ?stmt lv)
  &&
  (Options.Full_mtracking.get ()
   || Error.generic_handle (must_monitor_lval ?kf ?stmt) false lv)

let must_monitor_exp ?kf ?stmt exp =
  not (must_never_monitor_exp ?kf ?stmt exp)
  &&
  (Options.Full_mtracking.get ()
   || Error.generic_handle (must_monitor_exp ?kf ?stmt) false exp)

let use_monitoring () =
  not (Env.is_empty ())
  || Options.Full_mtracking.get ()
  || Env.has_heap_allocations ()

let found_concurrent_function ~loc vi =
  if use_monitoring () then
    abort_because_of_concurrent ~loc vi
  else
    match !concurrent_function_ref with
    | None -> concurrent_function_ref := Some (loc, vi)
    | Some _ -> ()

(*
Local Variables:
compile-command: "make -C ../../../../.."
End:
*)
