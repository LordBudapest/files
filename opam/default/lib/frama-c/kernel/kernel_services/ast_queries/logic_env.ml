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

open Cil_types

module Extensions = struct
  let initialized = ref false
  let ref_is_extension = ref (fun ~plugin:_ _ -> assert false)
  let ref_is_importer = ref (fun ~plugin:_ _ -> assert false)
  let ref_category = ref (fun ~plugin:_ _ -> assert false)
  let ref_preprocess = ref (fun ~plugin:_ _ -> assert false)
  let ref_is_extension_block = ref (fun ~plugin:_ _ -> assert false)
  let ref_preprocess_block = ref (fun ~plugin:_ _ -> assert false)
  let ref_extension_from = ref (fun ?plugin:_ _ -> assert false)
  let ref_importer_from = ref (fun  ?plugin:_ _ -> assert false)

  let set_extension_handler ~category ~is_extension ~is_importer ~preprocess
      ~is_extension_block ~preprocess_block ~extension_from ~importer_from =
    assert (not !initialized) ;
    ref_is_extension := is_extension ;
    ref_is_importer := is_importer ;
    ref_category := category ;
    ref_preprocess := preprocess ;
    ref_is_extension_block := is_extension_block;
    ref_preprocess_block := preprocess_block;
    ref_extension_from := extension_from;
    ref_importer_from := importer_from;
    initialized := true ;
    ()

  let is_extension ~plugin name = !ref_is_extension ~plugin name
  let is_extension_block ~plugin name = !ref_is_extension_block ~plugin name
  let is_importer ~plugin name = !ref_is_importer ~plugin name
  let category ~plugin name = !ref_category ~plugin name
  let preprocess ~plugin name = !ref_preprocess ~plugin name
  let preprocess_block ~plugin name = !ref_preprocess_block ~plugin name
  let extension_from ?plugin name = !ref_extension_from ?plugin name
  let importer_from ?plugin name = !ref_importer_from ?plugin name
end

let set_extension_handler = Extensions.set_extension_handler
let is_extension = Extensions.is_extension
let is_extension_block = Extensions.is_extension_block
let is_importer = Extensions.is_importer
let extension_category = Extensions.category
let preprocess_extension = Extensions.preprocess
let preprocess_extension_block = Extensions.preprocess_block
let extension_from = Extensions.extension_from
let importer_from = Extensions.importer_from

let error (b,_e) fstring =
  Kernel.abort
    ~source:b
    ("In annotation: " ^^ fstring)

module Logic_builtin =
  State_builder.Hashtbl
    (Datatype.String.Hashtbl)
    (Datatype.List(Cil_datatype.Builtin_logic_info))
    (struct
      let name = "Logic_env.Logic_builtin"
      let dependencies = []
      let size = 17
    end)

module Logic_info =
  State_builder.Hashtbl
    (Datatype.String.Hashtbl)
    (Datatype.List(Cil_datatype.Logic_info))
    (struct
      let name = "Logic_env.Logic_info"
      let dependencies = [ Logic_builtin.self ]
      let size = 17
    end)

module Logic_builtin_used =
  State_builder.Hashtbl
    (Datatype.String.Hashtbl)
    (Datatype.List(Cil_datatype.Logic_info))
    (struct
      let name = "Logic_env.Logic_builtin_used"
      let dependencies = [ Logic_builtin.self; Logic_info.self ]
      let size = 17
    end)

module Logic_type_builtin =
  State_builder.Hashtbl
    (Datatype.String.Hashtbl)
    (Cil_datatype.Logic_type_info)
    (struct
      let name = "Logic_env.Logic_type_builtin"
      let dependencies = []
      let size = 17
    end)


let is_builtin_logic_type = Logic_type_builtin.mem

module Logic_type_info =
  State_builder.Hashtbl
    (Datatype.String.Hashtbl)
    (Cil_datatype.Logic_type_info)
    (struct
      let name = "Logic_env.Logic_type_info"
      let dependencies = [ Logic_type_builtin.self ]
      let size = 17
    end)

module Logic_ctor_builtin =
  State_builder.Hashtbl
    (Datatype.String.Hashtbl)
    (Cil_datatype.Logic_ctor_info)
    (struct
      let name = "Logic_env.Logic_ctor_builtin"
      let dependencies = []
      let size = 17
    end)

module Logic_ctor_info =
  State_builder.Hashtbl
    (Datatype.String.Hashtbl)
    (Cil_datatype.Logic_ctor_info)
    (struct
      let name = "Logic_env.Logic_ctor_info"
      let dependencies = [ Logic_ctor_builtin.self ]
      let size = 17
    end)

module Lemmas =
  State_builder.Hashtbl
    (Datatype.String.Hashtbl)
    (Cil_datatype.Global_annotation)
    (struct
      let name = "Logic_env.Lemmas"
      let dependencies = []
      let size = 17
    end)

module Axiomatics =
  State_builder.Hashtbl(Datatype.String.Hashtbl)(Cil_datatype.Location)
    (struct
      let name = "Logic_env.Axiomatics"
      let dependencies = []
      let size = 17
    end)

module ModuleOccurence =
  Datatype.Pair
    (Datatype.Option
       (Datatype.Pair
          (Datatype.String) (* external loader name *)
          (Datatype.String))) (* external loader plugin *)
    (Cil_datatype.Location)

module Modules =
  State_builder.Hashtbl(Datatype.String.Hashtbl)(ModuleOccurence)
    (struct
      let name = "Logic_env.Modules"
      let dependencies = []
      let size = 17
    end)

module Model_info =
  State_builder.Hashtbl
    (Datatype.String.Hashtbl)
    (Cil_datatype.Model_info)
    (struct
      let name = "Logic_env.Model_info"
      let dependencies = []
      let size = 17
    end)

(* We depend from ast, but it is initialized after Logic_typing... *)
let init_dependencies from =
  State_dependency_graph.add_dependencies
    ~from
    [ Logic_info.self;
      Logic_type_info.self;
      Logic_ctor_info.self;
      Lemmas.self;
      Axiomatics.self;
      Modules.self;
      Model_info.self;
    ]

let builtin_to_logic b =
  let params =
    List.map (fun (x, t) -> Cil_const.make_logic_var_formal x t) b.bl_profile
  in
  let li = Cil_const.make_logic_info b.bl_name in
  (* In case we have a logic constant, we might use the lv_type field
     as well as l_type. *)
  (match b.bl_type, b.bl_profile with
   | Some t, [] -> li.l_var_info.lv_type <- t;
   | None, _ | Some _, _::_ -> ());
  li.l_type <- b.bl_type;
  li.l_tparams <- b.bl_params;
  li.l_profile <- params;
  li.l_labels <- b.bl_labels;
  li

let is_builtin_logic_function = Logic_builtin.mem

let is_logic_function s = is_builtin_logic_function s || Logic_info.mem s

let find_all_logic_functions s =
  match Logic_info.find s with
  | l -> l
  | exception Not_found ->
    try
      let builtins = Logic_builtin.find s in
      let res = List.map builtin_to_logic builtins in
      Logic_builtin_used.add s res;
      Logic_info.add s res;
      res
    with Not_found -> []

let find_logic_cons vi =
  List.find
    (fun x -> Cil_datatype.Logic_var.equal x.l_var_info vi)
    (Logic_info.find vi.lv_name)

(* add_logic_function takes as argument a function eq_logic_info which
   decides whether two logic_info are identical. It is intended to be
   Logic_utils.is_same_logic_profile, but this one can not be called
   from here since it will cause a circular dependency Logic_env <-
   Logic_utils <- Cil <- Logic_env
*)

let add_logic_function_gen is_same_profile li =
  let name = li.l_var_info.lv_name in
  if is_builtin_logic_function name then
    error
      (Current_loc.get())
      "logic function or predicate %s is built-in. You cannot redefine it"
      name;
  match Logic_info.find name with
  | l ->
    List.iter
      (fun li' ->
         if is_same_profile li li' then
           error
             (Current_loc.get ())
             "already declared logic function or predicate %s \
              with same profile"
             name)
      l;
    Logic_info.replace name (li::l)
  | exception Not_found -> Logic_info.add name [li]

let remove_logic_function = Logic_info.remove

let remove_logic_info_gen is_same_profile li =
  let name = li.l_var_info.lv_name in
  if Logic_info.mem name then
    begin
      if is_builtin_logic_function name then Logic_info.remove name
      else
        begin
          let l = Logic_info.find name in
          let l' = List.filter (fun li' -> not (is_same_profile li li')) l in
          Logic_info.replace name l'
        end
    end

let is_logic_type = Logic_type_info.mem
let find_logic_type = Logic_type_info.find
let add_logic_type t infos =
  if is_logic_type t
  (* type variables hide type definitions on their scope *)
  then error (Current_loc.get ()) "logic type %s already declared" t
  else Logic_type_info.add t infos

let is_logic_ctor = Logic_ctor_info.mem
let find_logic_ctor = Logic_ctor_info.find
let add_logic_ctor c infos =
  if is_logic_ctor c
  then error (Current_loc.get ()) "logic constructor %s already declared" c
  else Logic_ctor_info.add c infos
let remove_logic_ctor = Logic_ctor_info.remove

let remove_logic_type s =
  try
    let info = Logic_type_info.find s in
    (match info.lt_def with
     | None | Some (LTsyn _) -> ()
     | Some (LTsum cons) ->
       List.iter (fun { ctor_name } -> remove_logic_ctor ctor_name) cons);
    Logic_type_info.remove s
  with Not_found -> ()

let is_model_field = Model_info.mem

let find_all_model_fields s = Model_info.find_all s

let find_model_field s typ =
  let l = Model_info.find_all s in
  let rec find_cons typ =
    try
      List.find (fun x -> Cil_datatype.Typ.equal x.mi_base_type typ) l
    with Not_found as e ->
      (* Don't use Cil.unrollType here:
         unrollType will unroll until it finds something other
         than TNamed. We want to go step by step.
      *)
      (match typ with
       | TNamed(ti,_) -> find_cons ti.ttype
       | _ -> raise e)
  in find_cons typ

let add_model_field m =
  try
    ignore (find_model_field m.mi_name m.mi_base_type);
    error (Current_loc.get())
      "Cannot add model field %s to type %a: it already exists."
      m.mi_name Cil_datatype.Typ.pretty m.mi_base_type
  with Not_found -> Model_info.add m.mi_name m

let remove_model_field = Model_info.remove

let is_builtin_logic_ctor = Logic_ctor_builtin.mem

let builtin_states =
  [ Logic_builtin.self; Logic_type_builtin.self; Logic_ctor_builtin.self ]

module Builtins= struct
  include Hook.Make()
  (* ensures we do not apply the hooks twice *)
  module Applied =
    State_builder.False_ref
      (struct
        let name = "Logic_env.Builtins.Applied"
        let dependencies = builtin_states
        (* if the built-in states are not kept, hooks must be replayed. *)
      end)

  let apply () =
    Kernel.feedback ~level:5 "Applying logic built-ins hooks for project %s"
      (Project.get_name (Project.current()));
    if Applied.get () then Kernel.feedback ~level:5 "Already applied"
    else begin Applied.set true; apply () end
end

let prepare_tables () =
  Logic_ctor_info.clear ();
  Logic_type_info.clear ();
  Logic_info.clear ();
  Lemmas.clear ();
  Axiomatics.clear();
  Modules.clear();
  Model_info.clear ();
  Logic_type_builtin.iter Logic_type_info.add;
  Logic_ctor_builtin.iter Logic_ctor_info.add;
  Logic_builtin_used.iter Logic_info.add

(** C typedefs *)

(**
   -  true => identifier is a type name
   -  false => identifier is a plain identifier
*)
let typenames: (string, bool) Hashtbl.t = Hashtbl.create 13

let add_typename t = Hashtbl.add typenames t true
let hide_typename t = Hashtbl.add typenames t false
let remove_typename t = Hashtbl.remove typenames t
let reset_typenames () = Hashtbl.clear typenames

let typename_status t =
  try Hashtbl.find typenames t with Not_found -> false

let builtin_types_as_typenames () =
  Logic_type_builtin.iter (fun x _ -> add_typename x)

let add_builtin_logic_function_gen is_same_profile bl =
  let name = bl.bl_name in
  if Logic_builtin.mem name then begin
    let l = Logic_builtin.find name in
    List.iter
      (fun bl' ->
         if is_same_profile bl bl' then
           error (Current_loc.get ())
             "already declared builtin logic function or predicate \
              %s with same profile"
             bl.bl_name)
      l;
    Logic_builtin.add name (bl::l)
  end else Logic_builtin.add name [bl]

let add_builtin_logic_type name infos =
  if not (Logic_type_builtin.mem name) then begin
    Logic_type_builtin.add name infos;
    add_typename name;
    add_logic_type name infos
  end

let add_builtin_logic_ctor name infos =
  if not (Logic_ctor_builtin.mem name) then begin
    Logic_ctor_builtin.add name infos;
    add_logic_ctor name infos
  end

let iter_builtin_logic_function f =
  Logic_builtin.iter (fun _ info -> List.iter f info)
let iter_builtin_logic_type f = Logic_type_builtin.iter (fun _ info -> f info)
let iter_builtin_logic_ctor f = Logic_ctor_builtin.iter (fun _ info -> f info)
