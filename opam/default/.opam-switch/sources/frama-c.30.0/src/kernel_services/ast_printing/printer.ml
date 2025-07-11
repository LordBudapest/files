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

(* Modified by TrustInSoft *)

open Cil_types

let compare_annotations la1 la2 =
  let total_order = Datatype.Int.compare la1.annot_id la2.annot_id in
  match la1.annot_content,la2.annot_content with
  | AAssert _, AAssert _ -> total_order
  | AAssert _,_ -> -1
  | AStmtSpec _, AStmtSpec _ -> total_order
  | AStmtSpec _, AAssert _ -> 1
  | AStmtSpec _,_ -> -1
  | AInvariant _, AAssert _ -> 1
  | AInvariant _, AStmtSpec _ -> 1
  | AInvariant ([],_,_), AInvariant ([],_,_) -> total_order
  | AInvariant ([],_,_), AAssigns ([],_) -> total_order
  | AInvariant ([],_,_), AAllocation ([],_) -> total_order
  | AInvariant ([],_,_),_ -> -1
  | AInvariant _, AInvariant([],_,_) -> 1
  | AInvariant _, AAssigns([],_) -> 1
  | AInvariant _, AAllocation([],_) -> 1
  | AInvariant _, AInvariant _ -> total_order
  | AInvariant _, AAssigns _ -> total_order
  | AInvariant _, AAllocation _ -> total_order
  | AInvariant _, _ -> -1

  | AAssigns _, AAssert _ -> 1
  | AAssigns _, AStmtSpec _ -> 1
  | AAssigns([],_),  AInvariant ([],_,_) -> total_order
  | AAssigns([],_), AAssigns ([],_) -> total_order
  | AAssigns([],_), AAllocation ([],_) -> total_order
  | AAssigns ([],_), _ -> -1
  | AAssigns _, AInvariant([],_,_) -> 1
  | AAssigns _, AAssigns([],_) -> 1
  | AAssigns _, AAllocation([],_) -> 1
  | AAssigns _, AInvariant _ -> total_order
  | AAssigns _, AAssigns _ -> total_order
  | AAssigns _, AAllocation _ -> total_order
  | AAssigns _, _ -> -1

  | AAllocation _, AAssert _ -> 1
  | AAllocation _, AStmtSpec _ -> 1
  | AAllocation([],_),  AInvariant ([],_,_) -> total_order
  | AAllocation([],_), AAssigns ([],_) -> total_order
  | AAllocation([],_), AAllocation ([],_) -> total_order
  | AAllocation ([],_), _ -> -1
  | AAllocation _, AInvariant([],_,_) -> 1
  | AAllocation _, AAssigns([],_) -> 1
  | AAllocation _, AAllocation([],_) -> 1
  | AAllocation _, AInvariant _ -> total_order
  | AAllocation _, AAssigns _ -> total_order
  | AAllocation _, AAllocation _ -> total_order
  | AAllocation _, _ -> -1

  | AVariant _, AExtended _ -> -1
  | AVariant _, AVariant _ -> total_order
  | AVariant _, _ -> 1
  | AExtended _, AExtended _ -> total_order
  | AExtended _, _ -> 1

(* All annotations are extracted from module [Annotations].
   Generated global annotations are inserted before
   the very first function definition. User-defined global annotations are
   pretty-printed at their own place in the code. *)
class printer_with_annot () = object (self)

  inherit Cil_printer.extensible_printer () as super

  val mutable declared_globs = Cil_datatype.Varinfo.Set.empty
  val mutable print_spec = false

  method! reset () =
    super#reset ();
    declared_globs <- Cil_datatype.Varinfo.Set.empty;
    print_spec <- false

  method private current_kf = match self#current_function with
    | None -> assert false
    | Some vi -> Globals.Functions.get vi

  method private current_kinstr = match self#current_stmt with
    | None -> Kglobal
    | Some st -> Kstmt st

  method private current_sid = match self#current_stmt with
    | None -> assert false
    | Some st -> st.sid

  method! private may_be_skipped s =
    super#may_be_skipped s && not (Annotations.has_code_annot s)

  method private pretty_funspec fmt kf =
    let spec = Annotations.funspec kf in
    self#opt_funspec fmt spec

  method! private stmt_has_annot s = Annotations.has_code_annot s

  method! private has_annot =
    Option.fold ~some:self#stmt_has_annot ~none:false self#current_stmt

  method! private inline_block ctxt blk =
    super#inline_block ctxt blk
    && (match blk.bstmts with
        | [] -> true
        | [ s ] ->
          not (Annotations.has_code_annot s && logic_printer_enabled)
          && (match s.skind with
              | Block blk -> self#inline_block ctxt blk
              | _ -> true)
        | _ :: _ -> false)

  method! vdecl fmt vi =
    Format.open_vbox 0;
    (try
       let kf = Globals.Functions.get vi in
       if not (Cil_datatype.Varinfo.Set.mem vi declared_globs) && print_spec
       then begin
         declared_globs <- Cil_datatype.Varinfo.Set.add vi declared_globs;
         (* pretty prints the spec, but not for built-ins*)
         if not (Cil_builtins.Builtin_functions.mem vi.vname) then
           self#pretty_funspec fmt kf
       end
     with Not_found ->
       ());
    print_spec <- false;
    super#vdecl fmt vi;
    Format.close_box ()

  method! global fmt glob =
    if Kernel.PrintComments.get () && Cil_printer.print_global glob then begin
      let comments = Globals.get_comments_global glob in
      Pretty_utils.pp_list
        ~sep:"@\n" ~suf:"@\n"
        (fun fmt s ->
           if String.contains s '\n' || String.contains s '\r' then
             Format.fprintf fmt "/*%s*/" s
           else
             Format.fprintf fmt "//%s" s
        ) fmt comments
    end;
    (* Out of tree global annotations are pretty printed before the first
       variable declaration of the first function definition. *)
    (match glob with
     | GFunDecl _ | GFun _ -> print_spec <- Ast.is_def_or_last_decl glob;
     | _ -> ());
    super#global fmt glob

  method private begin_annotation fmt =
    self#pp_open_annotation ~block:false fmt

  method private end_annotation fmt =
    self#pp_close_annotation ~block:false fmt

  method private loop_annotations fmt annots =
    if annots <> [] then
      let annots = List.sort compare_annotations annots in
      Pretty_utils.pp_open_block fmt "%t " self#begin_annotation;
      Pretty_utils.pp_list ~sep:"@\n" self#code_annotation fmt annots;
      Pretty_utils.pp_close_block fmt "%t@\n" self#end_annotation;

  method private annotations fmt annots =
    let annots = List.sort compare_annotations annots in
    Pretty_utils.pp_list ~sep:"@\n" ~suf:"@]@\n"
      (fun fmt annot ->
         Pretty_utils.pp_open_block fmt "%t " self#begin_annotation;
         self#code_annotation fmt annot;
         Pretty_utils.pp_close_block fmt "%t" self#end_annotation)
      fmt
      annots

  method! annotated_stmt next fmt s =
    (* To debug location setting:
       (let loc = fst (Cil_datatype.Stmt.loc s.skind) in
       Format.fprintf fmt "/*Loc=%s:%d*/" loc.Lexing.pos_fname
       loc.Lexing.pos_lnum); *)
    Format.pp_open_hvbox fmt 0;
    (* print the labels *)
    if Kernel.PrintComments.get () then begin
      let comments = Globals.get_comments_stmt s in
      if comments <> [] then
        Pretty_utils.pp_list ~sep:"@\n" ~suf:"@]@\n"
          (fun fmt s ->
             if String.contains s '\n' || String.contains s '\r' then
               Format.fprintf fmt "@[/*%s*/@]" s
             else
               Format.fprintf fmt "@[//%s@]" s
          ) fmt comments
    end;
    if verbose || Kernel.is_debug_key_enabled Kernel.dkey_print_sid then
      Format.fprintf fmt "@[/* sid:%d */@]@\n" s.sid ;
    (* print the annotations *)
    if logic_printer_enabled then
      begin
        let all_annot =
          List.sort
            Cil_datatype.Code_annotation.compare
            (Annotations.code_annot s)
        in
        self#in_ghost_if_needed fmt s.ghost ~post_fmt:"%t"
          (fun () ->
             self#stmt_labels fmt s;
             match all_annot with
             | [] ->  self#stmtkind s.sattr next fmt s.skind;
             | [ a ] when Cil.is_skip s.skind && not s.ghost ->
               Format.fprintf fmt "@[<hv>@[%t@ %a@;<1 1>%t@]@ %a@]"
                 self#begin_annotation
                 self#code_annotation a
                 self#end_annotation
                 (self#stmtkind s.sattr next) s.skind;
             | _ ->
               let loop_annot, stmt_annot =
                 List.partition Logic_utils.is_loop_annot all_annot
               in
               self#annotations fmt stmt_annot;
               self#loop_annotations fmt loop_annot;
               self#stmtkind s.sattr next fmt s.skind) ;
      end
    else
      begin
        self#stmt_labels fmt s;
        self#stmtkind s.sattr next fmt s.skind;
      end;
    Format.pp_close_box fmt ()

  method! stmtkind sattr (next: stmt) fmt skind =
    super#stmtkind sattr next fmt
      begin
        match skind with
        | Goto({ contents = { skind = (Return _) as return }},_)
          when Kernel.PrintReturn.get () -> return
        | _ -> skind
      end

end (* class printer_with_annot *)

include Printer_builder.Make(struct class printer = printer_with_annot end)

(* initializing Cil_datatype's pretty printers *)
let () = Cil_datatype.Location.pretty_ref := pp_location
let () = Cil_datatype.Constant.pretty_ref := pp_constant
let () = Cil_datatype.Exp.pretty_ref := pp_exp
let () = Cil_datatype.Varinfo.pretty_ref := pp_varinfo
let () = Cil_datatype.Lval.pretty_ref := pp_lval
let () = Cil_datatype.Offset.pretty_ref := pp_offset
let () = Cil_datatype.Typ.pretty_ref := pp_typ
let () = Cil_datatype.Attribute.pretty_ref := pp_attribute
let () = Cil_datatype.Stmt.pretty_ref := pp_stmt
let () = Cil_datatype.Block.pretty_ref := pp_block
let () = Cil_datatype.Instr.pretty_ref := pp_instr
let () = Cil_datatype.Logic_var.pretty_ref := pp_logic_var
let () = Cil_datatype.Model_info.pretty_ref := pp_model_info
let () = Cil_datatype.Logic_type.pretty_ref := pp_logic_type
let () = Cil_datatype.Term.pretty_ref := pp_term
let () = Cil_datatype.Term_lval.pretty_ref := pp_term_lval
let () = Cil_datatype.Term_offset.pretty_ref := pp_term_offset
let () = Cil_datatype.Code_annotation.pretty_ref := pp_code_annotation
let () = Cil_datatype.Funspec.pretty_ref := pp_funspec
let () = Cil_datatype.Funbehavior.pretty_ref := pp_behavior

let () = Cil_datatype.Label.pretty_ref := pp_label
let () = Cil_datatype.Compinfo.pretty_ref := pp_compinfo
let () = Cil_datatype.Fieldinfo.pretty_ref := (fun fmt f -> pp_varname fmt f.fname)
let () = Cil_datatype.Builtin_logic_info.pretty_ref := pp_builtin_logic_info
let () = Cil_datatype.Logic_type_info.pretty_ref := pp_logic_type_info
let () = Cil_datatype.Logic_ctor_info.pretty_ref := pp_logic_ctor_info
let () = Cil_datatype.Initinfo.pretty_ref := pp_initinfo
let () = Cil_datatype.Logic_info.pretty_ref := pp_logic_info
let () = Cil_datatype.Logic_constant.pretty_ref := pp_logic_constant
let () = Cil_datatype.Identified_term.pretty_ref := pp_identified_term
let () = Cil_datatype.Term_lhost.pretty_ref := pp_term_lhost
let () = Cil_datatype.Logic_label.pretty_ref := pp_logic_label
let () = Cil_datatype.Global_annotation.pretty_ref := pp_global_annotation
let () = Cil_datatype.Global.pretty_ref := pp_global
let () = Cil_datatype.Predicate.pretty_ref := pp_predicate
let () = Cil_datatype.Toplevel_predicate.pretty_ref := pp_toplevel_predicate
let () = Cil_datatype.Identified_predicate.pretty_ref := pp_identified_predicate
let () = Cil_datatype.Fundec.pretty_ref := pp_fundec



(*
Local Variables:
compile-command: "make -C ../../.."
End:
*)
