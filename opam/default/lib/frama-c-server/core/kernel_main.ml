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

open Data
module Md = Markdown
module Pkg = Package
module Senv = Server_parameters

(* -------------------------------------------------------------------------- *)
(* --- Frama-C Parameters                                                 --- *)
(* -------------------------------------------------------------------------- *)

let package =
  Package.package ~name:"parameters" ~title:"All Frama-C parameters" ()

(* Translates a parameter name into a valid camlCase request. *)
let camlCaseParameter name =
  match String.split_on_char '-' name with
  | "" :: head :: tail ->
    List.fold_left (^) head (List.map String.capitalize_ascii tail)
  | _ -> Senv.fatal "Invalid parameter %s" name

(* Registers a synchronized state for the given parameter. *)
let register_parameter parameter =
  let open Typed_parameter in
  let parameter_name = parameter.name in
  let descr = Md.plain ("State of parameter " ^ parameter_name) in
  let name = camlCaseParameter parameter_name in
  let register data accessor =
    let add_hook f = accessor.add_update_hook (fun _ x -> f x) in
    ignore
      (States.register_state ~package ~name ~descr
         ~data ~get:accessor.get ~set:accessor.set ~add_hook ())
  in
  match parameter.accessor with
  | Bool (accessor, _) -> register (module Data.Jbool) accessor
  | Int (accessor, _) -> register (module Data.Jint) accessor
  | String (accessor, _) -> register (module Data.Jstring) accessor

(* Registers requests for all parameters of the given plugin. *)
let register_plugin_parameters plugin =
  let register_group _group list =
    let is_visible p = p.Typed_parameter.visible && p.reconfigurable in
    List.iter register_parameter (List.filter is_visible list)
  in
  Hashtbl.iter register_group plugin.Plugin.p_parameters

(* Automatically registers requests for all Frama-C parameters. *)
let register_all () =
  (* For now, only registers parameters from the kernel and some plugins. *)
  let whitelist = [ "kernel"; "Eva"; "WP"; "rtegen" ] in
  let register plugin =
    if List.mem plugin.Plugin.p_name whitelist
    then register_plugin_parameters plugin
  in
  Plugin.iter_on_plugins register

let apply_once =
  let once = ref true in
  fun f () -> if !once then (once := false; f())

let () = Cmdline.run_after_extended_stage (apply_once register_all)

(* -------------------------------------------------------------------------- *)
(* --- Frama-C Kernel Services                                            --- *)
(* -------------------------------------------------------------------------- *)

let package = Pkg.package
    ~name:"services"
    ~title:"Kernel Services"
    ~readme:"kernel.md" ()

(* -------------------------------------------------------------------------- *)
(* --- Config                                                             --- *)
(* -------------------------------------------------------------------------- *)

let () =
  let signature = Request.signature ~input:(module Junit) () in
  let result name descr =
    Request.result signature ~name ~descr:(Md.plain descr) (module Jstring) in
  let result_list name descr =
    Request.result signature ~name ~descr:(Md.plain descr) (module Jlist (Jstring)) in
  let set_version = result "version" "Frama-C version" in
  let set_datadir = result_list "datadir" "Shared directory (FRAMAC_SHARE)" in
  let set_pluginpath = result_list "pluginpath" "Plugin directories (FRAMAC_PLUGIN)" in
  Request.register_sig
    ~package ~kind:`GET ~name:"getConfig"
    ~descr:(Md.plain "Frama-C Kernel configuration")
    signature
    begin fun rq () ->
      set_version rq System_config.Version.id ;
      set_datadir rq (Filepath.Normalized.to_string_list System_config.Share.dirs);
      set_pluginpath rq
        (Filepath.Normalized.to_string_list System_config.Plugins.dirs) ;
    end

(* -------------------------------------------------------------------------- *)
(* --- Load saves                                                         --- *)
(* -------------------------------------------------------------------------- *)

let () =
  Request.register ~package ~kind:`SET ~name:"load"
    ~descr:(Md.plain "Load a save file. Returns an error, if not successfull.")
    ~input:(module Jfile)
    ~output:(module Joption(Jstring))
    (fun file ->
       try Project.load_all file; None
       with Project.IOError err -> Some err)


let () =
  Request.register ~package ~kind:`SET ~name:"save"
    ~descr:(Md.plain "Save the current session. Returns an error, if not successfull.")
    ~input:(module Jfile)
    ~output:(module Joption(Jstring))
    (fun file ->
       try Project.save_all file; None
       with Project.IOError err -> Some err)


(* -------------------------------------------------------------------------- *)
(* --- Log Lind                                                           --- *)
(* -------------------------------------------------------------------------- *)

module LogKind =
struct
  let kinds = Enum.dictionary ()

  let t_kind value name descr =
    Enum.tag ~name ~descr:(Md.plain descr) ~value kinds

  let t_error = t_kind Log.Error "ERROR" "User Error"
  let t_warning = t_kind Log.Warning "WARNING" "User Warning"
  let t_feedback = t_kind Log.Feedback "FEEDBACK" "Plugin Feedback"
  let t_result = t_kind Log.Result "RESULT" "Plugin Result"
  let t_failure = t_kind Log.Failure "FAILURE" "Plugin Failure"
  let t_debug = t_kind Log.Debug "DEBUG" "Analyser Debug"

  let () = Enum.set_lookup kinds
      begin function
        | Log.Error -> t_error
        | Log.Warning -> t_warning
        | Log.Feedback -> t_feedback
        | Log.Result -> t_result
        | Log.Failure -> t_failure
        | Log.Debug -> t_debug
      end

  let data = Request.dictionary ~package
      ~name:"logkind"
      ~descr:(Md.plain "Log messages categories.")
      kinds

  include (val data : S with type t = Log.kind)
end

(* -------------------------------------------------------------------------- *)
(* --- Synchronized array of log events                                   --- *)
(* -------------------------------------------------------------------------- *)

let model = States.model ()

let () = States.column model ~name:"kind"
    ~descr:(Md.plain "Message kind")
    ~data:(module LogKind)
    ~get:(fun (evt, _) -> evt.Log.evt_kind)

let () = States.column model ~name:"plugin"
    ~descr:(Md.plain "Emitter plugin")
    ~data:(module Jalpha)
    ~get:(fun (evt, _) -> evt.Log.evt_plugin)

let () = States.column model ~name:"message"
    ~descr:(Md.plain "Message text")
    ~data:(module Jstring)
    ~get:(fun (evt, _) -> evt.Log.evt_message)

let () = States.option model ~name:"category"
    ~descr:(Md.plain "Message category (only for debug or warning messages)")
    ~data:(module Jstring)
    ~get:(fun (evt, _) -> evt.Log.evt_category)

let () = States.option model ~name:"source"
    ~descr:(Md.plain "Source file position")
    ~data:(module Kernel_ast.Position)
    ~get:(fun (evt, _) -> evt.Log.evt_source)

let getMarker (evt, _id) =
  Option.bind evt.Log.evt_source Printer_tag.loc_to_localizable

let getDecl t =
  Option.bind (getMarker t) Printer_tag.declaration_of_localizable

let () = States.option model ~name:"marker"
    ~descr:(Md.plain "Marker at the message position (if any)")
    ~data:(module Kernel_ast.Marker)
    ~get:getMarker

let () = States.option model ~name:"decl"
    ~descr:(Md.plain "Declaration containing the message position (if any)")
    ~data:(module Kernel_ast.Decl)
    ~get:getDecl

let iter f = ignore (Messages.fold (fun i evt -> f (evt, i); succ i) 0)

let _array =
  States.register_array
    ~package
    ~name:"message"
    ~descr:(Md.plain "Log messages")
    ~key:(fun (_evt, i) -> string_of_int i)
    ~iter:iter
    ~add_reload_hook:Messages.add_global_hook
    model

(* -------------------------------------------------------------------------- *)
(* --- Log Events                                                         --- *)
(* -------------------------------------------------------------------------- *)

module LogEvent =
struct

  type rlog

  let jlog : rlog Record.signature = Record.signature ()

  let kind = Record.field jlog ~name:"kind"
      ~descr:(Md.plain "Message kind") (module LogKind)
  let plugin = Record.field jlog ~name:"plugin"
      ~descr:(Md.plain "Emitter plugin") (module Jalpha)
  let message = Record.field jlog ~name:"message"
      ~descr:(Md.plain "Message text") (module Jstring)
  let category = Record.option jlog ~name:"category"
      ~descr:(Md.plain "Message category (DEBUG or WARNING)") (module Jstring)
  let source = Record.option jlog ~name:"source"
      ~descr:(Md.plain "Source file position") (module Kernel_ast.Position)

  let data = Record.publish ~package ~name:"log"
      ~descr:(Md.plain "Message event record.") jlog

  module R : Record.S with type r = rlog = (val data)

  type t = Log.event

  let jtype = R.jtype

  let to_json evt =
    R.default |>
    R.set plugin evt.Log.evt_plugin |>
    R.set kind evt.Log.evt_kind |>
    R.set category evt.Log.evt_category |>
    R.set source evt.Log.evt_source |>
    R.set message evt.Log.evt_message |>
    R.to_json

  let of_json js =
    let r = R.of_json js in
    {
      Log.evt_plugin = R.get plugin r ;
      Log.evt_kind = R.get kind r ;
      Log.evt_category = R.get category r ;
      Log.evt_source = R.get source r ;
      Log.evt_message = R.get message r ;
    }

end

(* -------------------------------------------------------------------------- *)
(* --- Log Monitoring                                                     --- *)
(* -------------------------------------------------------------------------- *)

let monitoring = ref false
let monitored = ref false
let events : Log.event Queue.t = Queue.create ()

let set_monitoring flag =
  if flag != !monitoring then
    monitoring := flag ;
  if !monitoring && not !monitored then
    begin
      monitored := true ;
      Log.add_listener (fun evt -> if !monitoring then Queue.add evt events)
    end

let monitor_server activity =
  if not (Senv.AutoLog.get ()) then set_monitoring activity

let monitor_autologs () =
  if Senv.AutoLog.get () then
    begin
      Senv.feedback "Auto-log started." ;
      set_monitoring true ;
    end

let () =
  Main.on monitor_server ;
  Cmdline.run_after_configuring_stage monitor_autologs

(* -------------------------------------------------------------------------- *)
(* --- Log Requests                                                       --- *)
(* -------------------------------------------------------------------------- *)

(* TODO:LC: shall have an array here. *)

let () = Request.register
    ~package ~kind:`SET ~name:"setLogs"
    ~descr:(Md.plain "Turn logs monitoring on/off")
    ~input:(module Jbool) ~output:(module Junit)
    set_monitoring

let () = Request.register
    ~package ~kind:`GET ~name:"getLogs"
    ~descr:(Md.plain "Flush the last emitted logs since last call (max 100)")
    ~input:(module Junit) ~output:(module Jlist(LogEvent))
    begin fun () ->
      let pool = ref [] in
      let count = ref 100 in
      while not (Queue.is_empty events) && !count > 0 do
        decr count ;
        pool := Queue.pop events :: !pool
      done ;
      List.rev !pool
    end

(* -------------------------------------------------------------------------- *)
