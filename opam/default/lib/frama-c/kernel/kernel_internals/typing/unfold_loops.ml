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

(** Syntactic loop unfolding. *)

open Cil_types
open Cil
open Visitor

let dkey = Kernel.dkey_ulevel

type loop_pragmas_info =
  { unroll_number: int option;
    total_unroll: Emitter.t option;
    ignore_unroll: bool }

let empty_info =
  { unroll_number = None; total_unroll = None; ignore_unroll = false }

let update_info global_find_init emitter info spec =
  match spec with
  | {term_type=typ}  when Logic_typing.is_integral_type typ ->
    if Option.is_some info.unroll_number && not info.ignore_unroll then begin
      Kernel.warning ~once:true ~current:true
        "ignoring unfolding directive (directive already defined)";
      info
    end else begin
      try
        begin
          let t = Cil.visitCilTerm
              (new Logic_utils.simplify_const_lval global_find_init) spec
          in
          let i = Logic_utils.constFoldTermToInt t in
          match Option.bind i Integer.to_int_opt with
          | Some _ as unroll_number -> { info with unroll_number }
          | None ->
            Kernel.warning ~once:true ~current:true
              "ignoring unfolding directive (not an understood constant \
               expression)";
            info
        end
      with Invalid_argument s ->
        Kernel.warning ~once:true ~current:true
          "ignoring unfolding directive (%s)" s;
        info
    end
  | {term_node=TConst (LStr "done") } -> { info with ignore_unroll = true }
  | {term_node=TConst (LStr "completely") } ->
    if Option.is_some info.total_unroll then begin
      Kernel.warning ~once:true ~current:true
        "found two complete unfolding annotations";
      info
    end else { info with total_unroll = Some emitter }
  | _ ->
    Kernel.warning ~once:true ~current:true
      "ignoring invalid unfolding directive";
    info

let extract_unroll_spec global_find_init s =
  let infos = ref empty_info in
  Annotations.iter_code_annot (fun e (ca: code_annotation) ->
      match ca.annot_content with
      | AExtended (_,_, { ext_name = "unfold" ; ext_kind = Ext_terms args }) ->
        infos := List.fold_left (update_info global_find_init e) !infos args
      | _ -> ()
    ) s ;
  !infos

let fresh_label =
  let counter = ref (-1) in
  fun ?loc ?label_name () ->
    decr counter;
    let loc, orig = match loc with
      | None -> Current_loc.get (), false
      | Some loc -> loc, true
    and new_label_name =
      let prefix = match label_name with None -> "" | Some s -> s ^ "_"
      in Format.sprintf "%sunfolding_%d_loop" prefix (- !counter)
    in Label (new_label_name,
              loc,
              orig)

let copy_var =
  let counter = ref (-1) in
  (* [VP] I fail too see the purpose of this argument instead of changing
     the counter at each variable's copy: copy_var () is called once per
     copy of block with local variables, bearing no relationship with the
     number of unrolling. counter could thus be an arbitrary integer as well.
  *)
  fun () ->
    decr counter;
    fun vi ->
      let vi' = Cil_const.copy_with_new_vid vi in
      let name = vi.vname ^ "_unfold_" ^ (string_of_int (- !counter)) in
      Cil_const.change_varinfo_name vi' name;
      vi'

let refresh_vars old_var new_var =
  let assoc = List.combine old_var new_var in
  let visit = object
    inherit Visitor.frama_c_inplace
    method! vvrbl vi =
      try ChangeTo (snd (List.find (fun (x,_) -> x.vid = vi.vid) assoc))
      with Not_found -> SkipChildren

    method! vexpr e =
      (* Since we are not using a refresh or copy visitor, we must refresh
         eids ourselves *)
      let do_post e' =
        if e'.enode != e.enode then
          Cil.new_exp ~loc:e.eloc e'.enode
        else e
      in
      DoChildrenPost do_post
  end
  in
  fun b -> ignore (Visitor.visitFramacBlock visit b)

(* Takes care of local gotos and labels into C. *)
let update_gotos sid_tbl block =
  let goto_updater =
    object
      inherit nopCilVisitor
      method! vstmt s = match s.skind with
        | Goto(sref,_loc) ->
          (try (* A deep copy has already be done. Just modifies the reference in place. *)
             let new_stmt = Cil_datatype.Stmt.Map.find !sref sid_tbl in
             sref := new_stmt
           with Not_found -> ()) ;
          DoChildren
        | _ -> DoChildren
      (* speed up: skip non interesting subtrees *)
      method! vvdec _ = Cil.SkipChildren (* via visitCilFunction *)
      method! vspec _ = Cil.SkipChildren (* via visitCilFunction *)
      method! vcode_annot _ = Cil.SkipChildren (* via Code_annot stmt *)
      method! vexpr _ = Cil.SkipChildren (* via stmt such as Return, IF, ... *)
      method! vlval _ = Cil.SkipChildren (* via stmt such as Set, Call, Asm, ... *)
      method! vattr _ = Cil.SkipChildren (* via Asm stmt *)
    end
  in visitCilBlock (goto_updater:>cilVisitor) block

let is_referenced stmt l =
  let module Found = struct exception Found end in
  let vis = object
    inherit Visitor.frama_c_inplace
    method! vlogic_label l =
      match l with
      | StmtLabel s when !s == stmt -> raise Found.Found
      | _ -> DoChildren
  end
  in
  try
    List.iter (fun x -> ignore (Visitor.visitFramacStmt vis x)) l;
    false
  with Found.Found -> true

(* Deep copy of annotations taking care of labels into annotations. *)
let copy_annotations kf assoc labelled_stmt_tbl (break_continue_must_change, stmt_src,stmt_dst) =
  let fresh_annotation a =
    let visitor = object
      inherit Visitor.frama_c_copy (Project.current())
      method! vlogic_var_use vi =
        match vi.lv_origin with
          None -> SkipChildren
        | Some vi ->
          begin
            try
              let vi'= snd (List.find (fun (x,_) -> x.vid = vi.vid) assoc) in
              ChangeTo (Option.get vi'.vlogic_var_assoc)
            with Not_found -> SkipChildren
               | Invalid_argument _ ->
                 Kernel.abort
                   "Loop unfolding: cannot find new representative for \
                    local var %s"
                   vi.vname
          end
      method! vlogic_label (label:logic_label) =
        match label with
        | StmtLabel (stmt) ->
          (try (* A deep copy has already been done.
                  Just modifies the reference in place. *)
             let new_stmt = Cil_datatype.Stmt.Map.find !stmt labelled_stmt_tbl
             in ChangeTo (StmtLabel (ref new_stmt))
           with Not_found -> SkipChildren) ;
        | BuiltinLabel _ | FormalLabel _ -> SkipChildren
    end
    in visitCilCodeAnnotation (visitor:>cilVisitor) (Logic_const.refresh_code_annotation a)
  in
  let filter_annotation a = (* Special cases for some "breaks" and "continues" clauses. *)
    (* Note: it would be preferable to do that job in the visitor of 'fresh_annotation'... *)
    Kernel.debug ~dkey
      "Copying an annotation to stmt %d from stmt %d@."
      stmt_dst.sid stmt_src.sid;
    (* TODO: transforms 'breaks' and 'continues' clauses into unimplemented
       'gotos' clause (still undefined clause into ACSL!). *)
    (* WORKS AROUND: since 'breaks' and 'continues' clauses have not be preserved
       into the unrolled stmts, and are not yet transformed into 'gotos' (see. TODO),
       they are not copied. *)
    match break_continue_must_change, a  with
    | (None, None), _ -> Some a (* 'breaks' and 'continues' can be kept *)
    | _, { annot_content=AStmtSpec (s,spec) } ->
      let filter_post_cond = function
        | Breaks, _  when (fst break_continue_must_change) != None  ->
          Kernel.debug ~dkey "Uncopied 'breaks' clause to stmt %d@." stmt_dst.sid;
          false
        | Continues, _ when (snd break_continue_must_change) != None ->
          Kernel.debug ~dkey "Uncopied 'continues' clause to stmt %d@." stmt_dst.sid;
          false
        | _ -> true in
      let filter_behavior acc bhv =
        let bhv = { bhv with b_post_cond = List.filter filter_post_cond bhv.b_post_cond }  in
        (* The default behavior cannot be removed if another behavior remains... *)
        if (Cil.is_empty_behavior bhv) &&  not (Cil.is_default_behavior bhv) then acc
        else bhv::acc
      in
      let filter_behaviors bhvs =
        (*... so the default behavior is removed there if it is alone. *)
        match List.fold_left filter_behavior [] bhvs with
        | [bhv] when Cil.is_empty_behavior bhv -> []
        | bhvs -> List.rev bhvs
      in
      let spec = { spec with spec_behavior = filter_behaviors spec.spec_behavior } in
      if Cil.is_empty_funspec spec then None (* No statement contract will be added *)
      else Some { a with annot_content=AStmtSpec (s,spec) }
    | _, _ -> Some a
  in
  let new_annots =
    Annotations.fold_code_annot
      (fun emitter annot acc ->
         match filter_annotation annot with
         | None -> acc
         | Some filtred_annot -> (emitter, fresh_annotation filtred_annot) :: acc)
      stmt_src
      []
  in
  List.iter
    (fun (e, a) -> Annotations.add_code_annot e ~kf stmt_dst a)
    new_annots

let update_loop_current kf loop_current block =
  let vis = object(self)
    inherit Visitor.frama_c_inplace
    initializer self#set_current_kf kf
    method! vlogic_label =
      function
      | BuiltinLabel LoopCurrent -> ChangeTo (StmtLabel (ref loop_current))
      | BuiltinLabel _ | FormalLabel _ | StmtLabel _ -> DoChildren
    method! vstmt_aux s =
      match s.skind with
      | Loop _ -> SkipChildren (* loop init and current are not the same here. *)
      | _ -> DoChildren
  end in
  ignore (Visitor.visitFramacBlock vis block)

let update_loop_entry kf loop_entry stmt =
  let vis = object(self)
    inherit Visitor.frama_c_inplace
    initializer self#set_current_kf kf
    method! vlogic_label =
      function
      | BuiltinLabel LoopEntry -> ChangeTo (StmtLabel (ref loop_entry))
      | BuiltinLabel _ | FormalLabel _ | StmtLabel _ -> DoChildren
    method! vstmt_aux s =
      match s.skind with
      | Loop _ -> SkipChildren (* loop init and current are not the same here. *)
      | _ -> DoChildren
  end in
  ignore (Visitor.visitFramacStmt vis stmt)


(* Action to be performed when copying switch labels (Case and Default):
   - Copy: if we are copying the entire switch statement, then copy the labels
     as they are.
   - Move: if we had not copied the switch statement, then avoid duplicating
     the switch labels. For the first copy, move the label into the copied
     statement (the first copy in the AST order is done by the last iteration).
   - Ignore: For the other copies, ignore the switch label. *)
type switch_label_action = Ignore | Copy | Move

let is_case_stmt s = List.exists Cil.is_case_label s.labels

(* Deep copy of a block taking care of local gotos and labels into C code and
   annotations. Also returns the statements with a switch label that have been
   created to replace original switch cases. They must be set in the englobing
   switch (outside the copy).  *)
let copy_block kf switch_label_action break_continue_must_change bl =
  let new_switch_cases = ref [] in
  let assoc = ref [] in
  let fundec =
    try Kernel_function.get_definition kf
    with Kernel_function.No_Definition -> assert false
  and annotated_stmts = ref [] (* for copying the annotations later. *)
  and labelled_stmt_tbl = Cil_datatype.Stmt.Map.empty
  and calls_tbl = Cil_datatype.Stmt.Map.empty
  in
  let rec copy_stmt switch_label_action break_continue_must_change
      labelled_stmt_tbl calls_tbl stmt =
    let result =
      { labels = [];
        sid = Cil_const.Sid.next ();
        succs = [];
        preds = [];
        skind = stmt.skind;
        ghost = stmt.ghost;
        sattr = []}
    in
    let labelled_stmt_tbl =
      if stmt.labels = [] then
        labelled_stmt_tbl
      else
        let new_tbl = Cil_datatype.Stmt.Map.add stmt result labelled_stmt_tbl
        and new_labels =
          List.fold_left
            (fun new_lbls -> function
               | Label (s, loc, gen) ->
                 (if gen
                  then fresh_label ~label_name:s ()
                  else fresh_label ~label_name:s ~loc ()
                 ) :: new_lbls
               | Case _ | Default _ as lbl ->
                 if switch_label_action = Ignore
                 then new_lbls
                 else lbl :: new_lbls
            )
            []
            stmt.labels
        in
        let () =
          if switch_label_action = Move && is_case_stmt stmt then
            (* Removes the switch label from the original statement. *)
            let old_labels =
              List.filter (fun l -> not (Cil.is_case_label l)) stmt.labels
            in
            stmt.labels <- old_labels;
            new_switch_cases := result :: !new_switch_cases;
        in
        result.labels <- new_labels;
        new_tbl
    in
    let new_calls_tbl = match stmt.skind with
      | Instr(Call _ | Local_init(_,ConsInit _,_)) ->
        Cil_datatype.Stmt.Map.add stmt result calls_tbl
      | _ -> calls_tbl
    in
    let new_stmkind,new_labelled_stmt_tbl, new_calls_tbl =
      copy_stmtkind switch_label_action
        break_continue_must_change labelled_stmt_tbl new_calls_tbl stmt.skind
    in
    result.skind <- new_stmkind;
    if Annotations.has_code_annot stmt then
      begin
        Kernel.debug ~dkey
          "Found an annotation to copy for stmt %d from stmt %d@."
          result.sid stmt.sid;
        annotated_stmts := (break_continue_must_change, stmt,result) :: !annotated_stmts;
      end;
    result, new_labelled_stmt_tbl, new_calls_tbl

  and copy_stmtkind
      switch_label_action break_continue_must_change
      labelled_stmt_tbl calls_tbl stkind =
    let open Current_loc.Operators in
    let copy_block
        ?(switch_label_action = switch_label_action)
        ?(break_continue_must_change = break_continue_must_change) =
      copy_block ~switch_label_action ~break_continue_must_change
    in
    let<> UpdatedCurrentLoc = Cil_datatype.Stmt.loc_skind stkind in
    match stkind with
    | (Instr _ | Return _ | Throw _) as keep ->
      keep,labelled_stmt_tbl,calls_tbl
    | Goto (stmt_ref, loc) -> Goto (ref !stmt_ref, loc),labelled_stmt_tbl,calls_tbl
    | If (exp,bl1,bl2,loc) ->
      let new_block1,labelled_stmt_tbl,calls_tbl =
        copy_block labelled_stmt_tbl calls_tbl bl1
      in
      let new_block2,labelled_stmt_tbl,calls_tbl =
        copy_block labelled_stmt_tbl calls_tbl bl2
      in
      If(exp,new_block1,new_block2,loc),labelled_stmt_tbl,calls_tbl
    | Loop (a,bl,loc,_,_) ->
      let new_block,labelled_stmt_tbl,calls_tbl =
        copy_block
          (* from now on break and continue can be kept *)
          ~break_continue_must_change:(None, None)
          labelled_stmt_tbl
          calls_tbl
          bl
      in
      Loop (a,new_block,loc,None,None),labelled_stmt_tbl,calls_tbl
    | Block bl ->
      let new_block,labelled_stmt_tbl,calls_tbl =
        copy_block labelled_stmt_tbl calls_tbl bl
      in
      Block (new_block),labelled_stmt_tbl,calls_tbl
    | UnspecifiedSequence seq ->
      let change_calls lst calls_tbl =
        List.map
          (fun x -> ref (Cil_datatype.Stmt.Map.find !x calls_tbl)) lst
      in
      let new_seq,labelled_stmt_tbl,calls_tbl =
        List.fold_left
          (fun (seq,labelled_stmt_tbl,calls_tbl) (stmt,modified,writes,reads,calls) ->
             let stmt,labelled_stmt_tbl,calls_tbl =
               copy_stmt switch_label_action break_continue_must_change
                 labelled_stmt_tbl calls_tbl stmt
             in
             (stmt,modified,writes,reads,change_calls calls calls_tbl)::seq,
             labelled_stmt_tbl,calls_tbl)
          ([],labelled_stmt_tbl,calls_tbl)
          seq
      in
      UnspecifiedSequence (List.rev new_seq),labelled_stmt_tbl,calls_tbl
    | Break loc ->
      (match break_continue_must_change with
       | None, _ -> stkind (* kept *)
       | (Some (brk_lbl_stmt)), _ -> Goto ((ref brk_lbl_stmt),loc)),
      labelled_stmt_tbl,
      calls_tbl
    | Continue loc ->
      (match break_continue_must_change with
       | _,None -> stkind (* kept *)
       | _,(Some (continue_lbl_stmt)) ->
         Goto ((ref continue_lbl_stmt),loc)),
      labelled_stmt_tbl,
      calls_tbl
    | Switch (e,block,stmts,loc) ->
      (* from now on break only can be kept *)
      let new_block,new_labelled_stmt_tbl,calls_tbl =
        copy_block
          (* Copy the switch labels, as the englobing switch is in the copy. *)
          ~switch_label_action:Copy
          ~break_continue_must_change:(None, (snd break_continue_must_change))
          labelled_stmt_tbl calls_tbl block
      in
      let stmts' =
        List.map
          (fun s -> Cil_datatype.Stmt.Map.find s new_labelled_stmt_tbl) stmts
      in
      Switch(e,new_block,stmts',loc),new_labelled_stmt_tbl,calls_tbl
    | TryCatch(t,c,loc) ->
      let t', labs, calls = copy_block labelled_stmt_tbl calls_tbl t in
      let treat_one_extra_binding mv mv' (bindings, labs, calls) (v,b) =
        let v' = copy_var () v in
        assoc := (v,v')::!assoc;
        let b', labs', calls' = copy_block labs calls b in
        refresh_vars [mv; v] [mv'; v'] b';
        (v',b')::bindings, labs', calls'
      in
      let treat_one_catch (catches, labs, calls) (v,b) =
        let v', vorig, vnew, labs', calls' =
          match v with
          | Catch_all -> Catch_all, [], [], labs, calls
          | Catch_exn(v,l) ->
            let v' = copy_var () v in
            assoc:=(v,v')::!assoc;
            let l', labs', calls' =
              List.fold_left
                (treat_one_extra_binding v v') ([],labs, calls) l
            in
            Catch_exn(v', List.rev l'), [v], [v'], labs', calls'
        in
        let (b', labs', calls') = copy_block labs' calls' b in
        refresh_vars vorig vnew b';
        (v', b')::catches, labs', calls'
      in
      let c', labs', calls' =
        List.fold_left treat_one_catch ([],labs, calls) c
      in
      TryCatch(t',List.rev c',loc), labs', calls'
    | TryFinally _ | TryExcept _ -> assert false

  and copy_block
      ~switch_label_action ~break_continue_must_change
      labelled_stmt_tbl calls_tbl bl =
    let new_stmts,labelled_stmt_tbl,calls_tbl =
      List.fold_left
        (fun (block_l,labelled_stmt_tbl,calls_tbl) v ->
           let new_block,labelled_stmt_tbl,calls_tbl =
             copy_stmt switch_label_action break_continue_must_change
               labelled_stmt_tbl calls_tbl v
           in
           new_block::block_l, labelled_stmt_tbl,calls_tbl)
        ([],labelled_stmt_tbl,calls_tbl)
        bl.bstmts
    in
    let new_locals =
      List.map (copy_var ()) bl.blocals
    in
    fundec.slocals <- fundec.slocals @ new_locals;
    assoc:=(List.combine bl.blocals new_locals) @ !assoc;
    let new_block = mkBlock (List.rev new_stmts) in
    refresh_vars bl.blocals new_locals new_block;
    new_block.blocals <- new_locals;
    new_block,labelled_stmt_tbl,calls_tbl
  in
  let new_block, labelled_stmt_tbl, _calls_tbl =
    (* [calls_tbl] is internal. No need to fix references afterwards here. *)
    copy_block ~switch_label_action ~break_continue_must_change
      labelled_stmt_tbl calls_tbl bl
  in
  List.iter (copy_annotations kf !assoc labelled_stmt_tbl) !annotated_stmts ;
  update_gotos labelled_stmt_tbl new_block, !new_switch_cases

let ast_has_changed = ref false

(* Update to take into account annotations*)
class do_it global_find_init ((force:bool),(times:int)) = object(self)
  inherit Visitor.frama_c_inplace
  initializer ast_has_changed := false;
    (* We sometimes need to move labels between statements. This table
       maps the old statement to the new one *)
  val moved_labels = Cil_datatype.Stmt.Hashtbl.create 17
  (* The statements with a switch label that have been created in the copy.
     They must be added in the englobing switch, and the original statements
     must be removed (their switch labels have been removed by [copy_block]. *)
  val mutable cases = [] ;
  val mutable gotos = [] ;
  val mutable has_unrolled_loop = false ;

  val mutable file_has_unrolled_loop = false ;

  method get_file_has_unrolled_loop () = file_has_unrolled_loop ;

  method! vfunc fundec =
    assert (gotos = []) ;
    assert (not has_unrolled_loop) ;
    let post_goto_updater =
      (fun id ->
         if has_unrolled_loop then begin
           List.iter
             (fun s -> match s.skind with Goto(sref,_loc) ->
                 (try
                    let new_stmt =
                      Cil_datatype.Stmt.Hashtbl.find moved_labels !sref
                    in
                    sref := new_stmt
                  with Not_found -> ())
                                        | _ -> assert false)
             gotos;
           File.must_recompute_cfg id;
           ast_has_changed:=true
         end;
         has_unrolled_loop <- false ;
         gotos <- [] ;
         Cil_datatype.Stmt.Hashtbl.clear moved_labels ;
         id) in
    ChangeDoChildrenPost (fundec, post_goto_updater)

  method! vstmt_aux s =
    let open Current_loc.Operators in
    match s.skind with
    | Goto _ ->
      gotos <- s::gotos; (* gotos that may need to be updated *)
      DoChildren
    | Switch _ -> (* Update the labels pointed to by the switch if needed *)
      let update s =
        if has_unrolled_loop then
          (match s.skind with
           | Switch (e', b', lbls', loc') ->
             let labels_moved = ref false in
             let update_label s =
               try
                 let s = Cil_datatype.Stmt.Hashtbl.find moved_labels s
                 in labels_moved := true ; s
               with Not_found -> s
             in let moved_lbls = List.map update_label lbls' in
             let new_lbls =
               if cases = []
               then moved_lbls
               else
                 (* Removes the statements that have no more switch labels. *)
                 let lbls = List.filter is_case_stmt moved_lbls in
                 (* Adds the new statement with switch labels. *)
                 cases @ lbls
             in
             if !labels_moved || cases <> [] then begin
               s.skind <- Switch (e', b', new_lbls, loc');
               (* Resets the statement to be added to the englobing switch. *)
               cases <- [];
             end
           | _ -> ());
        s
      in
      ChangeDoChildrenPost (s, update)
    | Loop(_,_,loc,_,_) ->
      let infos = extract_unroll_spec global_find_init s in
      let number = Option.value ~default:times infos.unroll_number in
      let total_unrolling = infos.total_unroll in
      let is_ignored_unrolling = not force && infos.ignore_unroll in
      let f sloop =
        Kernel.debug ~dkey
          "unfolding loop stmt %d (%d times) inside function %a@."
          sloop.sid number Kernel_function.pretty (Option.get self#current_kf);
        file_has_unrolled_loop <- true ;
        has_unrolled_loop <- true ;
        match sloop.skind with
        | Loop(_,block,loc,_,_) ->
          (* Note: loop annotations are kept into the remaining loops,
             but are not transformed into statement contracts inside the
             unrolled parts. *)
          (* Note: a goto from outside a loop to inside that loop will still
                   goes into the remaining loop. *)
          (* TODO: transforms loop annotations into statement contracts
             inside the unrolled parts. *)
          let<> UpdatedCurrentLoc = loc in
          let break_lbl_stmt =
            let break_label = fresh_label () in
            let break_lbl_stmt = mkEmptyStmt () in
            break_lbl_stmt.labels <- [break_label];
            break_lbl_stmt.sid <- Cil_const.Sid.next ();
            break_lbl_stmt
          in
          let mk_continue () =
            let continue_label = fresh_label () in
            let continue_lbl_stmt = mkEmptyStmt () in
            continue_lbl_stmt.labels <- [continue_label] ;
            continue_lbl_stmt.sid <- Cil_const.Sid.next ();
            continue_lbl_stmt
          in
          let current_continue = ref (mk_continue ()) in
          let new_stmts = ref [sloop] in
          for i=0 to number-1 do
            new_stmts:=!current_continue::!new_stmts;
            let switch_label_action = if i = number-1 then Move else Ignore in
            let new_block, new_switch_cases =
              copy_block
                (Option.get self#current_kf)
                switch_label_action
                ((Some break_lbl_stmt),(Some !current_continue))
                block
            in
            cases <- new_switch_cases @ cases;
            current_continue := mk_continue ();
            update_loop_current (Option.get self#current_kf) !current_continue new_block;
            (match new_block.blocals with
               [] -> new_stmts:= new_block.bstmts @ !new_stmts;
             | _ -> (* keep the block in order to preserve locals decl *)
               new_stmts:= mkStmt (Block new_block) :: !new_stmts);
          done;
          let new_stmt = match !new_stmts with
            | [ s ] -> s
            | l ->
              List.iter (update_loop_entry (Option.get self#current_kf) !current_continue) l;
              let l = if is_referenced !current_continue l then !current_continue :: l else l in
              let new_stmts = l @ [break_lbl_stmt] in
              let new_block = mkBlock new_stmts in
              let snew = mkStmt (Block new_block) in
              (* Move the labels in front of the original loop at the top of the
                 new code *)
              Cil_datatype.Stmt.Hashtbl.add moved_labels sloop snew;
              snew.labels <- sloop.labels;
              sloop.labels <- [];
              snew
          in
          new_stmt
        | _ -> assert false
      in
      let g sloop new_stmts = (* Adds "loop invariant \false;" to the remaining
                                 loop when "completely" unrolled. *)
        (* Note: since a goto from outside the loop to inside the loop
                 still goes into the remaining loop...*)
        match total_unrolling with
        | None -> new_stmts
        | Some emitter ->
          let annot =
            Logic_const.new_code_annotation
              (AInvariant ([],true,Logic_const.(toplevel_predicate pfalse)))
          in
          Annotations.add_code_annot
            emitter ~kf:(Option.get self#current_kf) sloop annot;
          new_stmts
      in
      let h sloop new_stmts = (* To indicate that the unrolling has been done *)
        let kind = Ext_terms [
            (Logic_const.term (TConst (LStr "done")) (Ctype Cil_const.charPtrType)) ;
            Logic_const.tinteger number
          ] in
        let ext =
          Logic_const.new_acsl_extension ~plugin:"kernel" "unfold" loc
            false kind
        in
        let annot =Logic_const.new_code_annotation (AExtended([],true,ext)) in
        Annotations.add_code_annot
          Emitter.end_user ~kf:(Option.get self#current_kf) sloop annot;
        new_stmts
      in
      let fgh sloop = h sloop (g sloop (f sloop)) in
      let fgh =
        if (number > 0) && not is_ignored_unrolling then fgh else (fun s -> s)
      in
      ChangeDoChildrenPost (s, fgh)

    | _ -> DoChildren

  method! vinst _ = Cil.SkipChildren
  method! vexpr _ = Cil.SkipChildren
  method! vlval _ = Cil.SkipChildren
  method! vtype _ = Cil.SkipChildren
  method! vspec _ = Cil.SkipChildren
  method! vcode_annot _ = Cil.SkipChildren
end

(* Performs unrolling transformation without using -ulevel option.
   Do not forget to apply  [transformations_closure] afterwards. *)
let apply_transformation ?(force=true) nb file =
  (* [nb] default number of unrolling used when there is no loop unfold.
     When [nb] is negative, no unrolling is done and all loop unfold
     specifications are ignored. *)
  if nb >= 0 then
    let global_find_init vi =
      try (Globals.Vars.find vi).init with Not_found -> None
    in
    let visitor = new do_it global_find_init (force, nb) in
    Kernel.debug ~dkey "Using -ulevel %d option and loop unfold annotations@." nb;
    visitFramacFileFunctions (visitor:>Visitor.frama_c_visitor) file;
    if !ast_has_changed then Ast.mark_as_changed ()
    else begin
      Kernel.debug ~dkey
        "No unfolding is done; all loop unfold annotations are ignored@."
    end

(* Performs and closes all syntactic transformations *)
let compute file =
  let nb = Kernel.UnfoldingLevel.get () in
  let force = Kernel.UnfoldingForce.get () in
  apply_transformation ~force nb file

let transform =
  File.register_code_transformation_category "loop unfolding"

let () =
  File.add_code_transformation_after_cleanup
    ~deps:[(module Kernel.UnfoldingLevel:Parameter_sig.S);
           (module Kernel.UnfoldingForce:Parameter_sig.S)]
    transform compute

let unroll_typer (ctxt: Logic_typing.typing_context) (_loc:location) args =
  let open Logic_typing in
  let env =
    Lenv.empty () |> append_here_label |> append_init_label |> append_pre_label
  in Ext_terms (List.map (ctxt.type_term ctxt env) args)

let register_extensions () =
  Acsl_extension.register_code_annot_next_loop
    ~plugin:"kernel" "unfold" unroll_typer false

let register_once, _ =
  State_builder.apply_once "Unfold_loops.register_extensions" [] register_extensions

let () = Cmdline.run_after_early_stage register_once
