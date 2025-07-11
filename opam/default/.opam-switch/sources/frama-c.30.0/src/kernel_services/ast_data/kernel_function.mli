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

(** Operations to get info from a kernel function. This module does
    not give access to information about the set of all the registered kernel
    functions (like iterators over kernel functions). This kind of operations is
    stored in module {!Globals.Functions}.

    @see <https://frama-c.com/download/frama-c-plugin-development-guide.pdf> *)

open Cil_types

(* ************************************************************************* *)
(** {2 Kernel functions are comparable and hashable} *)
(* ************************************************************************* *)

include Datatype.S_with_collections with type t = kernel_function
                                     and module Set = Cil_datatype.Kf.Set
                                     and module Map = Cil_datatype.Kf.Map
                                     and module Hashtbl = Cil_datatype.Kf.Hashtbl

val id: t -> int
val auxiliary_kf_stmt_state: State.t

(* ************************************************************************* *)
(** {2 Searching} *)
(* ************************************************************************* *)

exception No_Statement
val find_first_stmt : t -> stmt
(** Find the first statement in a kernel function.
    @raise No_Statement if there is no first statement for the given
    function. *)

val find_return : t -> stmt
(** Find the return statement of a kernel function.
    @raise No_Statement is the kernel function is only a prototype.
*)

val find_label : t -> string -> stmt ref
(** Find a given label in a kernel function.
    @raise Not_found if the label does not exist in the given function. *)

val find_all_labels: t -> Datatype.String.Set.t
(** returns all labels present in a given function.
    @since Chlorine-20180501
*)

val clear_sid_info: unit -> unit
(** removes any information related to statements in kernel functions.
    (i.e. the table used by the function below).
    - Must be called when the Ast has silently changed
      (e.g. with an in-place visitor) before calling one of
      the functions below
    - Use with caution, as it is very expensive to re-populate the table. *)

val find_defining_kf: varinfo -> t option
(** Finds the kernel function defining the given varinfo as a local or a formal.
    Returns None if no such function exists.
    @since Chlorine-20180501 *)

val find_from_sid : int -> stmt * t
(** @return the stmt and its kernel function from its identifier.
    Complexity: the first call to this function is linear in the size of
    the cil file.
    @raise Not_found if there is no statement with such an identifier. *)

val find_englobing_kf : stmt -> t
(** @return the function to which the statement belongs. Same
    complexity as [find_from_sid]
    @raise Not_found if the given statement is not correctly registered *)

val find_enclosing_block: stmt -> block
(** @return the innermost block to which the given statement belongs. *)

val find_all_enclosing_blocks: stmt -> block list
(** same as above, but returns all enclosing blocks, starting with the
    innermost one. *)

val blocks_closed_by_edge: stmt -> stmt -> block list
(** [blocks_closed_by_edge s1 s2] returns the (possibly empty)
    list of blocks that are closed when going from [s1] to [s2].
    @raise Invalid_argument if [s2] is not a successor of [s1] in the cfg.
    @since Carbon-20101201 *)

val blocks_opened_by_edge: stmt -> stmt -> block list
(** [blocks_opened_by_edge s1 s2] returns the (possibly empty)
    list of blocks that are opened when going from [s1] to [s2].
    @raise Invalid_argument if [s2] is not a successor of [s1] in the cfg.
    @since Magnesium-20151001 *)

val common_block: stmt -> stmt -> block
(** [common_block s1 s2] returns the innermost block that contains
    both [s1] and [s2], provided the statements belong to the same function.
    raises a fatal error if this is not the case.

    @since 19.0-Potassium
*)

val stmt_in_loop: t -> stmt -> bool
(** [stmt_in_loop kf stmt] is [true] iff [stmt] strictly
    occurs in a loop of [kf].
    @since Oxygen-20120901 *)

val find_enclosing_loop: t -> stmt -> stmt
(** [find_enclosing_loop kf stmt] returns the statement corresponding
    to the innermost loop containing [stmt] in [kf]. If [stmt] itself is
    a loop, returns [stmt]
    @raise Not_found if [stmt] is not part of a loop of [kf]
    @since Oxygen-20120901 *)

val find_syntactic_callsites : t -> (t * stmt) list
(** [callsites f] collect the statements where [f] is called.  Same
    complexity as [find_from_sid].
    @return a list of [f',s] where function [f'] calls [f] at statement
    [stmt].
    @since Carbon-20110201 *)

val local_definition: t -> varinfo -> stmt
(** [local_definition f v] returns the statement initializing the (defined)
    local variable [v] of [f].
    @raise AbortFatal if [v] is not defined or is not a local of [f]
    @since 20.0-Calcium
*)

val var_is_in_scope: stmt -> varinfo -> bool
(** [var_is_in_scope stmt vi] returns [true] iff the local variable [vi]
    is syntactically visible from statement [stmt]. Note that on the contrary to
    {!Globals.Syntactic_search.find_in_scope}, the variable is searched
    according to its [vid], not its [vorig_name].

    @since 19.0-Potassium *)

val find_enclosing_stmt_in_block: block -> stmt -> stmt
(** [find_enclosing_stmt_in_block b s] returns the statements [s']
    inside [b.bstmts] that contains [s]. It might be [s] itself, but also
    an inner block (recursively) containing [s].

    @raise AbortFatal if [b] is not equal to [find_enclosing_block s]
    @since 19.0-Potassium
*)

val is_between: block -> stmt -> stmt -> stmt -> bool
(** [is_between b s1 s2 s3] returns [true] if the statement [s2] appears
    strictly between [s1] and [s3] inside the [b.bstmts] list.
    All three statements
    must actually occur in [b.bstmts], either directly or indirectly
    (see {!Kernel_function.find_enclosing_stmt_in_block}).

    @raise AbortFatal if pre-conditions are not met.

    @since 19.0-Potassium
*)


(* ************************************************************************* *)
(** {2 Checkers} *)
(* ************************************************************************* *)

val is_definition : t -> bool

val is_in_libc : t -> bool
(** @return true iff the given function attributes contain libc indicators.
    @since 24.0-Chromium *)

val has_noreturn_attr : t -> bool
(** @return true iff the given function contain the noreturn attribute.
    @since 30.0-Zinc *)

val is_not_called: t -> bool
(** @return true if the given function is not called in the program.
    Warning, return false does not ensure that the function is called.
    @since 28.0-Nickel *)

val is_entry_point: t -> bool
(** @return true iff the given function is the main of the program (as stated by
    option -main).
    @since Sodium-20150201 *)

val is_main: t -> bool
(** @return true iff the given function is the function called 'main' in the
    program.
    @since 21.0-Scandium *)

val returns_void : t -> bool

val is_first_stmt: t -> stmt -> bool
(** @return true iff the statement is the first statement of the given
    function.
    @since 21.0-Scandium *)

val is_return_stmt: t -> stmt -> bool
(** @return true iff the statement is the return statement of the given
    function.
    @since 21.0-Scandium *)

(* ************************************************************************* *)
(** {2 Getters} *)
(* ************************************************************************* *)

val dummy: unit -> t
(** @see <https://frama-c.com/download/frama-c-plugin-development-guide.pdf> Plug-in Development Guide *)

val get_vi : t -> varinfo
val get_id: t -> int
(** @return the identifier of the function (which is the identifier of the
    associated varinfo). *)

val get_name : t -> string

val get_type : t -> typ
(** Be careful! The return type, as normalized by Cabs2Cil does not have any
    qualifier at first level (e.g no ghost).
    @return the type of the given kernel function
*)

val get_return_type : t -> typ
(** Be careful! The return type, as normalized by Cabs2Cil does not have any
    qualifier at first level (e.g no ghost).
    @return the return type of the function
*)

val get_location: t -> Cil_types.location
val get_global : t -> global
(** For functions with a declaration and a definition, returns the definition.*)

val get_formals : t -> varinfo list
val get_locals : t -> varinfo list

val get_statics : t -> varinfo list
(** Returns the list of static variables declared inside the function.
    @since 18.0-Argon *)

exception No_Definition
val get_definition : t -> fundec
(** @raise No_Definition if the given function is not a definition.
    @see <https://frama-c.com/download/frama-c-plugin-development-guide.pdf> Plug-in Development Guide *)

val has_definition : t -> bool
(** @return [true] iff the given kernel function has a defintion.
    @since 21.0-Scandium *)

val is_ghost : t -> bool
(** @return [true] iff the given kernel function is ghost
    @since 26.0-Iron *)

(* ************************************************************************* *)
(** {2 Membership of variables} *)
(* ************************************************************************* *)

val is_formal: varinfo -> t -> bool
(** @return [true] if the given varinfo is a formal parameter of the given
    function. If possible, use this function instead of
    {!Ast_info.Function.is_formal}. *)

val get_formal_position: varinfo -> t -> int
(** [get_formal_position v kf] is the position of [v] as parameter of [kf].
    @raise Not_found if [v] is not a formal of [kf]. *)

val is_local : varinfo -> t -> bool
(** @return [true] if the given varinfo is a local variable of the given
    function. If possible, use this function instead of
    {!Ast_info.Function.is_local}. *)

val is_formal_or_local: varinfo -> t -> bool
(** @return [true] if the given varinfo is a formal parameter or a local
    variable of the given function.
    If possible, use this function instead of
    {!Ast_info.Function.is_formal_or_local}. *)

val get_called : exp -> t option
(** Returns the static call to function [expr], if any.
    [None] means a dynamic call through function pointer. *)

(* ************************************************************************* *)
(** {2 Collections} *)
(* ************************************************************************* *)

(** Hashtable indexed by kernel functions and dealing with project.
    @see <https://frama-c.com/download/frama-c-plugin-development-guide.pdf> *)
module Make_Table(Data: Datatype.S)(_: State_builder.Info_with_size):
  State_builder.Hashtbl with type key = t and type data = Data.t

(** Set of kernel functions. *)
module Hptset : Hptset.S
  with type elt = kernel_function
   and type 'a map = 'a Hptmap.Shape(Cil_datatype.Kf).t


(* ************************************************************************* *)
(** {2 Setters}

    Use carefully the following functions. *)
(* ************************************************************************* *)

val register_stmt: t -> stmt -> block list -> unit
(** Register a new statement in a kernel function, with the list of
    blocks that contain the statement (innermost first). *)

val self: State.t

(*
Local Variables:
compile-command: "make -C ../../.."
End:
*)
