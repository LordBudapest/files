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

# 24 "src/kernel_internals/runtime/system_config.ml.in"

module Version = struct
  let id = "30.0"
  let codename = "Zinc"
  let id_and_codename = id ^ " (" ^ codename ^ ")"
  let major = 30
  let minor = 0
end

let is_gui = Frama_c_very_first.Gui_init.is_gui

module Share = struct
  let dirs = List.map Filepath.Normalized.of_string Config_data.Sites.share
  let path = String.concat ":" (Filepath.Normalized.to_string_list dirs)
  let main = List.hd (List.rev dirs)
  let libc = Filepath.Normalized.concat main "libc"

  let () = Filepath.add_symbolic_dir_list "FRAMAC_SHARE" dirs
end

module Lib = struct
  let dirs = List.map Filepath.Normalized.of_string Config_data.Sites.lib
  let path = String.concat ":" (Filepath.Normalized.to_string_list dirs)
  let main = List.hd (List.rev dirs)
end

module Plugins = struct
  let dirs = List.map Filepath.Normalized.of_string Config_data.Sites.plugins
  let path = String.concat ":" (Filepath.Normalized.to_string_list dirs)

  let () = Filepath.add_symbolic_dir_list "FRAMAC_PLUGIN" dirs

  let load name =
    Config_data.Plugins.Plugins.load name

  let try_load_list load list =
    let list = list () in
    List.iter (fun p ->
        try
          load p
        with e ->
          (* We don't have access to Kernel's log mechanisms here. *)
          Format.printf "Warning: failed to load plugin '%s' (exception: %s)@."
            p (Printexc.to_string e);
          Format.printf "         Try recompiling it or \
                         completely removing it from the plug-in load path:@.";
          List.iter (fun path -> Format.printf "         %s@." path)
            Config_data.Plugins.Plugins.paths
      ) list

  let load_all () =
    (* avoid calling Dune_site.Plugins.load_all () directly, so we can catch
       errors individually *)
    let open Config_data.Plugins in
    if is_gui then try_load_list Plugins_gui.load Plugins_gui.list;
    try_load_list Plugins.load Plugins.list
end

module Preprocessor = struct
  let default = "gcc -E -C -I."

  let default_args = " -E -C -I."

  let env_or_default f vdefault =
    try
      let env = Sys.getenv "CPP" ^ default_args in
      if env = default then vdefault else f env
    with Not_found -> vdefault

  let command = env_or_default (fun x -> x) default

  let is_default = env_or_default (fun _ -> false) true

  let is_gnu_like =
    env_or_default
      (fun _ ->
         (* be more lenient when trying to determine if the preprocessor
            is gnu-like: in Cygwin, for instance, CC is "<prefix>-gcc" but
            CPP is "<prefix>-cpp", so this extra test allows proper detection.
         *)
         let env = Sys.getenv "CC" ^ default_args in
         env=default) true

  let keep_comments =
    env_or_default (fun _ -> true) true

  let supported_arch_options = ["-m16"; "-m32"; "-m64"]
end

module User_dirs = struct
  include Unix_dirs
end
