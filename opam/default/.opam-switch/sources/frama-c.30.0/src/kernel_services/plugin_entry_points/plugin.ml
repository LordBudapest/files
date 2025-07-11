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

module CamlString = String

let empty_string = ""

let positive_debug_ref = ref 0
let session_is_set_ref = Extlib.mk_fun "session_is_set_ref"
let session_ref = Extlib.mk_fun "session_ref"
let cache_is_set_ref = Extlib.mk_fun "cache_is_set_ref"
let cache_ref = Extlib.mk_fun "cache_ref"
let config_is_set_ref = Extlib.mk_fun "config_is_set_ref"
let config_ref = Extlib.mk_fun "config_ref"
let state_is_set_ref = Extlib.mk_fun "state_is_set_ref"
let state_ref = Extlib.mk_fun "state_ref"

(* ************************************************************************* *)
(** {2 Signatures} *)
(* ************************************************************************* *)

module type S_no_log = sig
  val add_group: ?memo:bool -> string -> Cmdline.Group.t
  module Verbose: Parameter_sig.Int
  module Debug: Parameter_sig.Int
  module Share: Parameter_sig.Site_root
  module Session: Parameter_sig.User_dir_opt
  module Cache_dir () : Parameter_sig.User_dir_opt
  module Config_dir () : Parameter_sig.User_dir_opt
  module State_dir () : Parameter_sig.User_dir_opt
  val help: Cmdline.Group.t
  val messages: Cmdline.Group.t
  val add_plugin_output_aliases:
    ?visible:bool -> ?deprecated:bool -> string list -> unit
end

module type S = sig
  include Log.Messages
  include S_no_log
end

module type General_services = sig
  include S
  include Parameter_sig.Builder
end

(* ************************************************************************* *)
(** {2 Optional parameters of functors} *)
(* ************************************************************************* *)

let kernel = ref false
let kernel_ongoing = ref false

let register_kernel =
  let used = ref false in
  fun () ->
    if !used then
      invalid_arg "The Frama-C kernel should be registered only once."
    else begin
      kernel := true;
      used := true
    end

let is_kernel () = !kernel

let share_visible_ref = ref false
let is_share_visible () = share_visible_ref := true

let session_visible_ref = ref false
let is_session_visible () = session_visible_ref := true

let plugin_subpath_ref = ref None
let plugin_subpath s = plugin_subpath_ref := Some s

let default_msg_keys_ref = ref []

let reset_plugin () =
  kernel := false;
  share_visible_ref := false;
  session_visible_ref := false;
  plugin_subpath_ref := None;
  default_msg_keys_ref := [];
;;

(* ************************************************************************* *)
(** {2 Generic functors} *)
(* ************************************************************************* *)

let kernel_name = "kernel"

type plugin =
  { p_name: string;
    p_shortname: string;
    p_help: string;
    p_parameters: (string, Typed_parameter.t list) Hashtbl.t }

let plugins: plugin list ref = ref []
let cmp_plugins p1 p2 =
  (* the kernel is the smallest plug-in *)
  match p1.p_name, p2.p_name with
  | s1, s2 when s1 = kernel_name && s2 = kernel_name -> 0
  | s1, _ when s1 = kernel_name -> -1
  | _, s2 when s2 = kernel_name -> 1
  | s1, s2 -> String.compare s1 s2
let iter_on_plugins f =
  List.iter f (List.sort cmp_plugins !plugins)

let fold_on_plugins (f : (plugin -> 'a -> 'a)) (acc : 'a) : 'a =
  List.fold_left (fun acc e -> f e acc) acc (List.sort cmp_plugins !plugins)

let is_present s = List.exists (fun p -> p.p_shortname = s) !plugins
let get_from_name s = List.find (fun p -> p.p_name = s) !plugins
let get_from_shortname s = List.find (fun p -> p.p_shortname = s) !plugins

(* ************************************************************************* *)
(** {2 Global data structures} *)
(* ************************************************************************* *)

(* File formatters used by options [-<plugin>-log]. *)
module File_formatters : sig
  val get : string -> Format.formatter
end =
struct
  (* File formatters must be globally defined so that if a new plugin
     wants to redirect output to an existing file, the same formatter
     must be used to avoid re-opening file descriptors and erasing data.
     E.g. in `frama-c -plugin1-log file.txt -then -plugin2-log file.txt`,
     the formatter avoids Frama-C from opening file.txt a second time, which
     would truncate its contents. *)
  let file_formatters : (string, Format.formatter) Hashtbl.t =
    Hashtbl.create 0

  (* Opens and returns a new file formatter if the file has not been opened
     yet, otherwise returns the existing formatter for the file. *)
  let get filename =
    (* Note: normalized paths are not necessarily canonical, so if the
       command-line arguments are unusual, this may fail to detect two
       filenames as referring to the same file. *)
    let normalized_filename = Filepath.normalize filename in
    try
      Hashtbl.find file_formatters normalized_filename
    with
    | Not_found ->
      let oc = open_out normalized_filename in
      let fmt = Format.formatter_of_out_channel oc in
      Hashtbl.add file_formatters normalized_filename fmt;
      Extlib.safe_at_exit (fun () -> close_out oc);
      fmt
end

(* ************************************************************************* *)
(** {2 The functor [Register]} *)
(* ************************************************************************* *)

module Register
    (P: sig
       val name: string (* the name is "" for the kernel *)
       val shortname: string
       val help: string
     end) =
struct

  let verbose_level = ref (fun () -> 1)
  let debug_level = ref (fun () -> 0)

  (* unused by the kernel: it uses Cmdline.Kernel_log instead;
     see module [L] below *)
  module Plugin_log = Log.Register
      (struct
        let channel = P.shortname
        let label = P.shortname
        let debug_atleast level = !debug_level () >= level
        let verbose_atleast level = !verbose_level () >= level
      end)

  (* we can't directly make L a Log, since this would require making
     Plugin.Register a generative functor. Instead, we provide a minimal
     signature for internal usage. It can be extended as needed, provided
     L.category is not exported. *)
  module type Log_skeleton = sig
    val warning: 'a Log.pretty_printer
    val abort: ('a, 'b) Log.pretty_aborter
    val register_and_add: string -> unit
    val add_or_warn: string -> unit
    val del_or_warn: string -> unit
    val set_warn_status: string -> Log.warn_status -> unit
    val is_registered_category: string -> bool
    val pp_all_categories: unit -> unit
    val pp_all_warn_categories_status: unit -> unit
  end

  module Auto_log(L: Log.Messages): Log_skeleton =
  struct
    include L
    let register_and_add s = add_debug_keys (register_category s)

    let warning ?current = let wkey = None in warning ?wkey ?current

    let add_or_warn s =
      match get_category s with
      | Some c -> add_debug_keys c
      | None -> warning "Unknown message key %s" s
    let del_or_warn s =
      match get_category s with
      | Some c -> del_debug_keys c
      | None -> warning "Unknown message key %s" s

    let set_warn_status s status =
      match get_warn_category s with
      | Some c -> set_warn_status c status
      | None -> warning "Unknown warning key %s" s
  end

  module L =
    (val if is_kernel ()
      then (module Auto_log(Cmdline.Kernel_log))
      else (module Auto_log(Plugin_log))
      : Log_skeleton)

  (* Add default message keys to the instance of Log.Messages *)
  let () = List.iter L.register_and_add !default_msg_keys_ref

  let plugin =
    let name = if is_kernel () then kernel_name else P.name in
    let tbl = Hashtbl.create 17 in
    Hashtbl.add tbl empty_string [];
    { p_name = name; p_shortname = P.shortname; p_help = P.help; p_parameters = tbl }

  let add_group ?memo name =
    let parameter_groups = plugin.p_parameters in
    let g, new_g = Cmdline.Group.add ?memo ~plugin:P.shortname name in
    if new_g then Hashtbl.add parameter_groups name [];
    g

  let () =
    (try Cmdline.add_plugin P.name ~short:P.shortname ~help:P.help
     with Invalid_argument s ->
       L.abort "cannot register plug-in `%s': %s" P.name s);
    kernel_ongoing := is_kernel ();
    plugins := plugin :: !plugins

  (* ************************************************************************ *)
  (** {3 Generic options for each plug-in} *)
  (* ************************************************************************ *)

  let messages = add_group "Output Messages"

  include Parameter_builder.Make
      (struct
        let shortname = P.shortname
        module L = L
        let messages_group = messages
        let parameters = plugin.p_parameters
      end)

  let prefix =
    if P.shortname = empty_string then "-kernel-" else "-" ^ P.shortname ^ "-"

  let plugin_subpath = match !plugin_subpath_ref with
    | None -> P.shortname
    | Some s -> s

  (* ************************************************************************ *)
  (** {3 Specific directories} *)
  (* ************************************************************************ *)

  module Share : Parameter_sig.Site_root = struct
    let is_visible = !share_visible_ref
    let is_kernel = is_kernel () (* the side effect must be applied right now *)

    let () =
      Parameter_customize.set_cmdline_stage Cmdline.Extended;
      if is_visible then Parameter_customize.is_reconfigurable ()
      else Parameter_customize.is_invisible ()

    module Dir_name =
      Filepath
        (struct
          let option_name = prefix ^ "share"
          let arg_name = "dir"
          let help =
            if is_visible then
              "set the plug-in share directory to <dir> (may be used if the \
               plug-in is not installed at the same place as Frama-C)"
            else empty_string
          let existence = Fc_Filepath.Must_exist
          let file_kind = ""
        end)

    let set filepath = Dir_name.set filepath
    let get () = Dir_name.get ()
    let is_set () = Dir_name.is_set ()

    let add_plugin path =
      if is_kernel then path
      else Fc_Filepath.Normalized.concat path plugin_subpath

    let dirs () =
      if is_visible && is_set () then [ get () ]
      else List.map add_plugin System_config.Share.dirs

    let find ~is_dir relative =
      let exception Found of Fc_Filepath.Normalized.t in
      let check_presence dir =
        let path = Fc_Filepath.Normalized.concat dir relative in
        if Fc_Filepath.exists path then raise (Found path)
      in
      try
        List.iter check_presence (dirs ()) ;
        L.abort
          "Could not find %s %s in Frama-C%s share"
          (if is_dir then "directory" else "file")
          relative
          (if is_kernel then "" else "/" ^ P.name)
      with
      | Found path when is_dir <> Fc_Filepath.is_dir path ->
        L.abort "%a is expected to be a %s"
          Fc_Filepath.Normalized.pretty path
          (if is_dir then "directory" else "file")
      | Found path -> path

    let get_dir = find ~is_dir:true
    let get_file = find ~is_dir:false
  end

  module Make_user_dir_root
      (D: sig
         val name : string
         val default_root : unit -> Fc_Filepath.Normalized.t
         val kernel_get : unit -> Fc_Filepath.Normalized.t
         val is_visible : bool
       end)
  =
  struct
    open Fc_Filepath.Normalized

    let is_visible = D.is_visible
    let is_kernel = P.name = ""

    let () =
      Parameter_customize.set_cmdline_stage Cmdline.Extended;
      if is_visible then Parameter_customize.is_reconfigurable ()
      else Parameter_customize.is_invisible ()

    let prefix = if is_kernel then "-" else prefix
    let var_name =
      Stdlib.String.uppercase_ascii
        ("FRAMAC_" ^ (if is_kernel then "" else P.shortname ^ "_") ^ D.name)

    module Dir_name =
      Filepath
        (struct
          let option_name = prefix ^ D.name
          let arg_name = "dir"
          let help =
            if is_visible && is_kernel
            then Format.asprintf "set the Frama-C %s directory to <dir>" D.name
            else
            if is_visible
            then Format.asprintf "set the plug-in %s directory to <dir>" D.name
            else empty_string

          let existence = Fc_Filepath.Indifferent
          let file_kind = ""
        end)

    let get () =
      if Dir_name.is_set () then Dir_name.get ()
      else match Sys.getenv_opt var_name with
        | Some s when s <> "" -> of_string s
        | _ when is_kernel -> D.default_root ()
        | _ -> concat (D.kernel_get ()) P.shortname

    let set = Dir_name.set
    let is_set = Dir_name.is_set

    let expected ~dir path =
      if dir <> Fc_Filepath.is_dir path then
        L.abort "%a is expected to be a %s"
          pretty path (if dir then "directory" else "file")

    let mk_dir d =
      try ignore @@ Extlib.mkdir ~parents:true d 0o755
      with Unix.Unix_error _ ->
        L.abort "cannot create %s directory `%a'" D.name pretty d

    let get_dir ?(create_path=false) s =
      let dir = concat (get ()) s in
      if Fc_Filepath.exists dir
      then (expected ~dir:true dir ; dir)
      else if create_path
      then (mk_dir dir ; dir)
      else dir

    let get_file ?create_path s =
      let base_dir = get_dir ?create_path @@ Filename.dirname s in
      (* No need to create anything here, as the path of sub-directories has
         been already created by [get_dir] for computing [base_dir]. *)
      let path = concat base_dir @@ Filename.basename s in
      if Fc_Filepath.exists path then expected ~dir:false path ;
      path
  end

  module Session = Make_user_dir_root
      (struct
        let name = "session"
        let default_root () = Fc_Filepath.Normalized.of_string "./.frama-c"
        let kernel_get () = !session_ref ()
        let is_visible = !session_visible_ref
      end)

  module Cache_dir () = Make_user_dir_root
      (struct
        let name = "cache"
        let default_root = System_config.User_dirs.cache
        let kernel_get () = !cache_ref ()
        let is_visible = !Parameter_customize.is_visible_ref
      end)

  module Config_dir () = Make_user_dir_root
      (struct
        let name = "config"
        let default_root = System_config.User_dirs.config
        let kernel_get () = !config_ref ()
        let is_visible = !Parameter_customize.is_visible_ref
      end)

  module State_dir () = Make_user_dir_root
      (struct
        let name = "state"
        let default_root = System_config.User_dirs.state
        let kernel_get () = !state_ref ()
        let is_visible = !Parameter_customize.is_visible_ref
      end)

  let help = add_group "Getting Information"

  let () = Parameter_customize.set_group help
  let () = Parameter_customize.set_cmdline_stage Cmdline.Exiting
  let () = if is_kernel () then Parameter_customize.set_module_name "Help"
  module Help =
    False
      (struct
        let option_name = prefix ^ "help"
        let help =
          if is_kernel () then "help of the Frama-C kernel"
          else "help of plug-in " ^ P.name
      end)
  let () =
    Cmdline.run_after_exiting_stage
      (fun () ->
         if Help.get () then Cmdline.plugin_help P.shortname else Cmdline.nop);
    Help.add_aliases [ prefix ^ "h" ]

  let output_mode modname optname =
    Parameter_customize.set_group messages;
    Parameter_customize.do_not_projectify ();
    Parameter_customize.is_reconfigurable ();
    if is_kernel () then begin
      Parameter_customize.set_cmdline_stage Cmdline.Early;
      Parameter_customize.set_module_name modname;
      "-" ^ kernel_name ^ "-" ^ optname
    end else begin
      Parameter_customize.set_cmdline_stage Cmdline.Extended;
      prefix ^ optname
    end

  let logfile_optname = output_mode "LogToFile" "log"
  module LogToFile = struct
    include String_map
        (struct
          include Datatype.String
          type key = string
          let of_string ~key:_ ~prev:_ s =
            match s with
            | None -> raise (Cannot_build "missing delimiter")
            | Some s when s = "" -> raise (Cannot_build "missing filename")
            | Some _ -> s
          let to_string ~key:_a b = b
        end)
        (struct
          let option_name = logfile_optname
          let arg_name = "K_1:file_1,..."
          let help = "copy log messages from " ^
                     (if is_kernel () then "the Frama-C kernel" else P.name) ^
                     " to a file. <K> is a combination of these characters:\n\
                      a: ALL messages (equivalent to 'dfiruw')\n\
                      d: debug       e: user or internal error (same as 'iu')\n\
                      f: feedback    i: internal error\n\
                      r: result      u: user error    w: warning\n\
                      An empty <K> (e.g. \":file.txt\") defaults to 'iruw'. \
                      One plug-in can output to several files and vice-versa."
          let default = Datatype.String.Map.empty
        end)

    type parse_result = | Parse_OK of Log.kind list
                        | Parse_Error of string (*msg*)

    (* default kinds when none are specified *)
    let default_kinds_str = "erw"

    (* all valid characters for specifying kinds *)
    let valid_kinds_str = "adefiruw"

    (* [parse_kinds str] parses [str] to return a list of [kind]s. *)
    let parse_kinds str =
      if Str.string_match (Str.regexp ("[^" ^ valid_kinds_str ^ "]")) str 0
      then
        Parse_Error
          ("invalid log kind character, must be one of: " ^ valid_kinds_str)
      else
        let str = if str = "" then default_kinds_str else str in
        let has_ch c =
          CamlString.contains str (Char.lowercase_ascii c)
        in
        let list_of_bool b e = if b then [e] else [] in
        let kinds =
          list_of_bool (has_ch 'd' || has_ch 'a') Log.Debug @
          list_of_bool (has_ch 'f' || has_ch 'a') Log.Feedback @
          list_of_bool (has_ch 'i' || has_ch 'a' || has_ch 'e') Log.Failure @
          list_of_bool (has_ch 'r' || has_ch 'a') Log.Result @
          list_of_bool (has_ch 'u' || has_ch 'a' || has_ch 'e') Log.Error @
          list_of_bool (has_ch 'w' || has_ch 'a') Log.Warning
        in
        Parse_OK kinds

    let pp_source fmt = function
      | None -> ()
      | Some src -> Format.fprintf fmt "%a:" Fc_Filepath.pp_pos src
  end

  (* Output must be synchronized with functions [prefix_*] in module Log. *)
  let pp_event_prefix fmt event =
    let pp_dkey fmt = (Pretty_utils.pp_opt ~pre:(format_of_string ":")
                         Format.pp_print_string) fmt event.Log.evt_category
    in
    match event.Log.evt_kind with
    | Log.Error ->
      Format.fprintf fmt "[%s%t] user error:" event.Log.evt_plugin pp_dkey
    | Log.Warning ->
      Format.fprintf fmt "[%s%t] warning:" event.Log.evt_plugin pp_dkey
    | Log.Failure ->
      Format.fprintf fmt "[%s%t] failure:" event.Log.evt_plugin pp_dkey
    | _ -> Format.fprintf fmt "[%s%t]" event.Log.evt_plugin pp_dkey

  (* Note: because of the imperative nature of Log listeners, and the
     fact that they cannot be removed, whenever the -log option is
     processed again (e.g. after a -then), we must only add new entries
     to the list of listeners, otherwise we will duplicate the output. *)
  (* Also note that this code CANNOT be put inside LogToFile, because it
     uses Datatype. *)
  let add_new_listeners plugin_name old_value new_value =
    let new_entries =
      Datatype.String.Map.filter
        (fun k _ -> not (Datatype.String.Map.mem k old_value)) new_value
    in
    Datatype.String.Map.iter (fun kinds_str filename ->
        match LogToFile.parse_kinds kinds_str with
        | LogToFile.Parse_Error msg -> L.abort "%s" msg
        | LogToFile.Parse_OK kinds ->
          let fmt = File_formatters.get filename in
          Log.add_listener ~plugin:plugin_name ~kind:kinds
            (fun event ->
               Format.fprintf fmt "%a%a %s@."
                 LogToFile.pp_source event.Log.evt_source
                 pp_event_prefix event
                 event.Log.evt_message);
      ) new_entries

  let () =
    LogToFile.add_set_hook
      (add_new_listeners
         (if is_kernel () then kernel_name else P.shortname)
      )

  let verbose_optname = output_mode "Verbose" "verbose"
  module Verbose = struct
    include
      Int(struct
        let default = !verbose_level ()
        let option_name = verbose_optname
        let arg_name = "n"
        let help =
          (if is_kernel () then "level of verbosity for the Frama-C kernel"
           else "level of verbosity for plug-in " ^ P.name)
          ^ " (default to " ^ string_of_int default ^ ")"
      end)
    let get () = if is_set () then get () else Cmdline.Verbose_level.get ()
    let () =
      verbose_level := get;
      (* line order below matters *)
      set_range ~min:0 ~max:max_int;
      if is_kernel () then begin
        Cmdline.kernel_verbose_atleast_ref := (fun n -> get () >= n);
        match !Cmdline.Kernel_verbose_level.value_if_set with
        | None -> ()
        | Some n -> set n
      end
  end

  let debug_optname = output_mode "Debug" "debug"
  module Debug = struct
    include
      Int(struct
        let default = !debug_level ()
        let option_name = debug_optname
        let arg_name = "n"
        let help =
          (if is_kernel () then "level of debug for the Frama-C kernel"
           else "level of debug for plug-in " ^ P.name)
          ^ " (default to " ^ string_of_int default ^ ")"
      end)
    let get () = if is_set () then get () else Cmdline.Debug_level.get ()
    let () =
      debug_level := get;
      (* line order below matters *)
      set_range ~min:0 ~max:max_int;
      add_set_hook
        (fun old n ->
           (* the level of verbose is at least the level of debug *)
           if n > Verbose.get () then Verbose.set n;
           if n = 0 then decr positive_debug_ref
           else if old = 0 then Stdlib.incr positive_debug_ref);
      if is_kernel () then begin
        Cmdline.kernel_debug_atleast_ref := (fun n -> get () >= n);
        match !Cmdline.Kernel_debug_level.value_if_set with
        | None -> ()
        | Some n -> set n
      end
  end

  type action = Print_help | Change_category of (bool * string) list

  let warn_status_of_string = function
    | "inactive" | "ignore" -> Log.Winactive
    | "feedback" -> Log.Wfeedback
    | "feedback-once" -> Log.Wfeedback_once
    | "once" -> Log.Wonce
    | "active" -> Log.Wactive
    | "err-once" -> Log.Werror_once
    | "error" -> Log.Werror
    | "abort" -> Log.Wabort
    | s -> L.abort "Unknown warning category status `%s'" s

  let parse_warn_directives is_kernel _old_s s =
    let set_status c s =
      if is_kernel && not (L.is_registered_category c) then
        Cmdline.run_after_extended_stage (fun () -> L.set_warn_status c s)
      else
        L.set_warn_status c s
    in
    let directives = CamlString.split_on_char ',' s in
    if List.mem "help" directives then begin
      match directives with
      | [ "help" ] ->
        Cmdline.run_after_exiting_stage
          (fun () -> L.pp_all_warn_categories_status (); raise Cmdline.Exit)
      | _ -> L.abort "mixing help with warning categories in `%s'" s
    end else begin
      let parse_single s =
        match CamlString.split_on_char '=' s with
        | [] -> assert false (* split_on_char should return at least an element
                                even if it is the empty string *)
        | [ c ] -> set_status c Log.Wactive
        | [ c; status ] -> set_status c (warn_status_of_string status)
        | _ -> L.abort "Ill-formed warn key directive `%s'" s
      in
      let non_empty s = s <> "" in
      List.iter parse_single (List.filter non_empty directives)
    end

  let parse_category s =
    let categories = CamlString.split_on_char ',' s in
    if List.mem "help" categories then Print_help
    else begin
      let parse_single s =
        match CamlString.get s 0 with
        | '-' -> false, CamlString.sub s 1 (CamlString.length s - 1)
        | '+' -> true, CamlString.sub s 1 (CamlString.length s - 1)
        | _ -> true, s
      in
      let non_empty_category s =
        if s <> "" then Some (parse_single s) else None in
      Change_category (List.filter_map non_empty_category categories)
    end

  let debug_category_optname = output_mode "Msg_key" "msg-key"
  module Debug_category =
    Empty_string(struct
      let option_name = debug_category_optname
      let arg_name="k1[,...,kn]"
      let help =
        "enables message display for categories <k1>,...,<kn>. Use "
        ^ debug_category_optname
        ^ " help to get a list of available categories, and * to enable \
           all categories"
    end)

  let () =
    let is_kernel = is_kernel () in
    Debug_category.add_set_hook
      (fun _ s ->
         match parse_category s with
         | Print_help ->
           Cmdline.run_after_exiting_stage
             (fun () -> L.pp_all_categories (); raise Cmdline.Exit)
         | Change_category l ->
           let add_or_del flag c () =
             if flag then L.add_or_warn c else L.del_or_warn c
           in
           let action (to_add, c) =
             (* Allow loaded modules to add categories to the kernel:
                Only categories that exist will be considered in the early
                stage where -kernel-msg-key is running. Of course, if
                none of the loaded modules register the given category,
                a warning will still be emitted. *)
             if is_kernel && not (L.is_registered_category c) then begin
               Cmdline.run_after_extended_stage (add_or_del to_add c)
             end else add_or_del to_add c ()
           in
           List.iter action l)

  let warn_category_optname = output_mode "Warn_key" "warn-key"
  module Warn_category =
    Empty_string(struct
      let option_name = warn_category_optname
      let arg_name="k1[=s1][,...,kn[=sn]]"
      let help =
        "set warning status for category <k1> to <s1>,...,<kn> to <sn>. Use "
        ^ warn_category_optname
        ^ " help to get a list of available categories, and * to enable \
           all categories. Possible statuses are inactive, feedback-once, \
           once, active, error-once, error, and abort. Defaults to active"
    end)

  let () =
    let is_kernel = is_kernel () in
    Warn_category.add_set_hook (parse_warn_directives is_kernel)

  let add_plugin_output_aliases ?visible ?deprecated aliases =
    let aliases = List.filter (fun alias -> alias <> "") aliases in
    let optname suffix = List.map (fun alias -> "-" ^ alias ^ suffix) aliases in
    Help.add_aliases ?visible ?deprecated (optname "-help");
    Verbose.add_aliases ?visible ?deprecated (optname "-verbose");
    Debug_category.add_aliases ?visible ?deprecated (optname "-msg-key");
    Warn_category.add_aliases ?visible ?deprecated (optname "-warn-key");
    LogToFile.add_aliases ?visible ?deprecated (optname "-log")

  let () = reset_plugin ()

  include Plugin_log

end (* Register *)
