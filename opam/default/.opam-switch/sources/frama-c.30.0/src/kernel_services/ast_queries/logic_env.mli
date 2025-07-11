(**************************************************************************)
(*                                                                        *)
(*  This file is part of Frama-C.                                         *)
(*                                                                        *)
(*  Copyright (C) 2007-2024                                               *)
(*    CEA   (Commissariat à l'énergie atomique et aux énergies            *)
(*           alternatives)                                                *)
(*    INRIA (Institut National de Recherche en Informatique et en         *)
(*           Automatique)                                                 *)
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

(** {1 Global Logic Environment} *)

open Cil_types

(** {2 registered ACSL extensions } *)

(** Return [true] if an extension is registered for the given plugin.
    @before Frama-C+def the function took one less argument, [plugin], which is
    now used to avoid ambiguity if plugins use the same name for an extension
*)
val is_extension: plugin:string -> string -> bool

(** Return [true] if an extension block is registered for the given plugin.
    @before Frama-C+def the function took one less argument, [plugin], which is
    now used to avoid ambiguity if plugins use the same name for an extension
*)
val is_extension_block: plugin:string -> string -> bool

(** Return [true] if a module importer is registered for the given name and
    plugin. @since 30.0-Zinc
*)
val is_importer: plugin:string -> string -> bool

(** Return the extension category.
    @raise Not_Found if the extension is not registered
    @before Frama-C+def the function took one less argument, [plugin], which is
    now used to avoid ambiguity if plugins use the same name for an extension
*)
val extension_category: plugin:string -> string -> ext_category

(** Return the extension preprocessor.
    @before Frama-C+def the function took one less argument, [plugin], which is
    now used to avoid ambiguity if plugins use the same name for an extension
*)
val preprocess_extension: plugin:string -> string ->
  Logic_ptree.lexpr list -> Logic_ptree.lexpr list

(** Return the extension block preprocessor.
    @before Frama-C+def the function took one less argument, [plugin], which is
    now used to avoid ambiguity if plugins use the same name for an extension
*)
val preprocess_extension_block:
  plugin:string -> string -> string * Logic_ptree.extended_decl list ->
  string * Logic_ptree.extended_decl list

(** Return the plugin name of the ACSL extension. If [~plugin] is [None], we try
    to find an extension with this [name] in our tables (can crash in case of
    ambiguity), if it is [Some] we check that this extension exists.
    @raise Not_Found If the extension does not exist
    @raise Log.AbortFatal If [~plugin] is [None] and two or more extensions have
    the same name
    @before 30.0-Zinc The [~plugin] parameter did not exist and the function
    only performed the [None] case.
*)
val extension_from : ?plugin:string -> string -> string
[@@alert acsl_extension_from
    "extension_from is for internal uses only to disambiguate usages of \
     acsl extensions during the lexing phase."]

(** Return the plugin name of the module importer extension. If [~plugin] is
    [None] we try to find an extension with this [name] in our tables, if it
    is [Some] we check that this extension exists.
    @raise Not_Found If the importer does not exist
    @raise Log.AbortFatal If [~plugin] is [None] and two or more extensions have
    the same name
    @since 30.0-Zinc
*)
val importer_from : ?plugin:string -> string -> string
[@@alert acsl_extension_from
    "importer_from is for internal uses only to disambiguate usages of \
     module importer extensions during the lexing phase."]

(** {2 Global Tables} *)
module Logic_info: State_builder.Hashtbl
  with type key = string and type data = Cil_types.logic_info list

module Logic_type_info: State_builder.Hashtbl
  with type key = string and type data = Cil_types.logic_type_info

module Logic_ctor_info: State_builder.Hashtbl
  with type key = string and type data = Cil_types.logic_ctor_info

(** @since Oxygen-20120901 *)
module Model_info: State_builder.Hashtbl
  with type key = string and type data = Cil_types.model_info

(** @since Oxygen-20120901 *)
module Lemmas: State_builder.Hashtbl
  with type key = string and type data = Cil_types.global_annotation

(** @since 23.0-Vanadium *)
module Axiomatics: State_builder.Hashtbl
  with type key = string and type data = Cil_types.location

(** @since 30.0-Zinc *)
module Modules: State_builder.Hashtbl
  with type key = string
   (* loader (name, plugin), location *)
   and type data = (string * string) option * Cil_types.location

val builtin_states: State.t list

(** {2 Shortcuts to the functions of the modules above} *)

(** Prepare all internal tables before their uses:
    clear all tables except builtins. *)
val prepare_tables : unit -> unit

(** {3 Add an user-defined object} *)

(** add_logic_function_gen takes as argument a function eq_logic_info
    which decides whether two logic_info are identical. It is intended
    to be Logic_utils.is_same_logic_profile, but this one can not be
    called from here since it will cause a circular dependency
    Logic_env <- Logic_utils <- Cil <- Logic_env.
    {b Do not use this function directly} unless you're really sure about
    what you're doing. Use {!Logic_utils.add_logic_function} instead.
*)
val add_logic_function_gen:
  (logic_info -> logic_info -> bool) -> logic_info -> unit
val add_logic_type: string -> logic_type_info -> unit
val add_logic_ctor: string -> logic_ctor_info -> unit

(**
   @since Oxygen-20120901
*)
val add_model_field: model_info -> unit

(** {3 Add a builtin object} *)

module Builtins: sig
  val apply: unit -> unit
  (** adds all requested objects in the environment. *)

  val extend: (unit -> unit) -> unit
  (** request an addition in the environment. Use one of the functions below
      in the body of the argument.
  *)
end

(** logic function/predicates that are effectively used in current project. *)
module Logic_builtin_used: sig
  val add: string -> logic_info list -> unit
  val mem: string -> bool
  val iter: (string -> logic_info list -> unit) -> unit
  val self: State.t
end

(** see add_logic_function_gen above *)
val add_builtin_logic_function_gen:
  (builtin_logic_info -> builtin_logic_info -> bool) ->
  builtin_logic_info -> unit
val add_builtin_logic_type: string -> logic_type_info -> unit
val add_builtin_logic_ctor: string -> logic_ctor_info -> unit

val is_builtin_logic_function: string -> bool
val is_builtin_logic_type: string -> bool
val is_builtin_logic_ctor: string -> bool

val iter_builtin_logic_function: (builtin_logic_info -> unit) -> unit
val iter_builtin_logic_type: (logic_type_info -> unit) -> unit
val iter_builtin_logic_ctor: (logic_ctor_info -> unit) -> unit

(** {3 searching the environment} *)

val find_all_logic_functions : string -> logic_info list

(** returns all model fields of the same name.
    @since Oxygen-20120901
*)
val find_all_model_fields: string -> model_info list

(** [find_model_info field typ] returns the model field associated to [field]
    in type [typ].
    @raise Not_found if no such type exists.
    @since Oxygen-20120901
*)
val find_model_field: string -> typ -> model_info

(** cons is a logic function with no argument. It is used as a variable,
    but may occasionally need to find associated logic_info.
    @raise Not_found if the given varinfo is not associated to a global logic
    constant.
*)
val find_logic_cons: logic_var -> logic_info
val find_logic_type: string -> logic_type_info
val find_logic_ctor: string -> logic_ctor_info

(** {3 tests of existence} *)
val is_logic_function: string -> bool
val is_logic_type: string -> bool
val is_logic_ctor: string -> bool

(** @since Oxygen-20120901 *)
val is_model_field: string -> bool

(** {3 removing} *)

(** removes {i all} overloaded bindings to a given symbol. *)
val remove_logic_function: string -> unit

(** [remove_logic_info_gen is_same_profile li]
    removes a specific logic info among all the overloaded ones.
    If the name corresponds to built-ins, all overloaded functions are
    removed at once (overloaded built-ins are always considered as a whole).
    Otherwise, does nothing if no logic info with the same profile as [li]
    is in the table.

    See {!Logic_env.add_logic_function_gen} for more information about the
    [is_same_profile] argument.

    @since Chlorine-20180501
*)
val remove_logic_info_gen:
  (logic_info -> logic_info -> bool) -> logic_info -> unit

(** [remove_logic_type s] removes the definition of logic type [s]. If [s] is
    a sum type, also removes the associated constructors. Does nothing in case
    [s] is not a known logic type.

*)
val remove_logic_type: string -> unit

(** removes the given logic constructor. Does nothing if no such constructor
    exists. *)
val remove_logic_ctor: string -> unit

(** @since Oxygen-20120901 *)
val remove_model_field: string -> unit

(** {2 Typename table} *)

(** marks an identifier as being a typename in the logic *)
val add_typename: string -> unit

(** marks temporarily a typename as being a normal identifier in the logic *)
val hide_typename: string -> unit

(** removes latest typename status associated to a given identifier *)
val remove_typename: string -> unit

(** erases all the typename status *)
val reset_typenames: unit -> unit

(** returns the typename status of the given identifier. *)
val typename_status: string -> bool

(** marks builtin logical types as logical typenames for the logic lexer. *)
val builtin_types_as_typenames: unit -> unit

(** {2 Internal use} *)

val set_extension_handler:
  category:(plugin:string -> string -> ext_category) ->
  is_extension:(plugin:string -> string -> bool) ->
  is_importer:(plugin:string -> string -> bool) ->
  preprocess: (plugin:string -> string -> Logic_ptree.lexpr list ->
               Logic_ptree.lexpr list) ->
  is_extension_block:(plugin:string -> string -> bool) ->
  preprocess_block:
    (plugin:string -> string -> string * Logic_ptree.extended_decl list ->
     string * Logic_ptree.extended_decl list) ->
  extension_from:(?plugin:string -> string -> string) ->
  importer_from:(?plugin:string -> string -> string) ->
  unit
(** Used to setup references related to the handling of ACSL extensions.
    If your name is not [Acsl_extension], do not call this.
    @since 21.0-Scandium
    @before 30.0-Zinc functions did not take a [plugin:string] parameter.
    [get_plugins], [is_importer] and [importer_from] did not exist, and
    [extension_from] did not take an optional plugin parameter.
*)
[@@alert acsl_extension_handler
    "This function can only be called by Acsl_extension"]

val init_dependencies: State.t -> unit
(** Used to postpone dependency of Lenv global tables wrt Cil_state, which
    is initialized afterwards. *)
