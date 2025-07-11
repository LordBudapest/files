(**************************************************************************)
(*                                                                        *)
(*  This file is part of WP plug-in of Frama-C.                           *)
(*                                                                        *)
(*  Copyright (C) 2007-2024                                               *)
(*    CEA (Commissariat a l'energie atomique et aux energies              *)
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

(* -------------------------------------------------------------------------- *)
(* --- Warning Manager                                                    --- *)
(* -------------------------------------------------------------------------- *)

module SELF =
struct

  type t = {
    loc : Filepath.position ;
    severe : bool ;
    source : string ;
    reason : string ;
    fallback : string ;
  }

  let compare w1 w2 =
    if w1 == w2 then 0 else
      let f1 = w1.loc.Filepath.pos_path in
      let f2 = w2.loc.Filepath.pos_path in
      let fc = Datatype.Filepath.compare f1 f2 in
      if fc <> 0 then fc else
        let l1 = w1.loc.Filepath.pos_lnum in
        let l2 = w2.loc.Filepath.pos_lnum in
        let lc = l1 - l2 in
        if lc <> 0 then lc else
          match w1.severe , w2.severe with
          | true , false -> (-1)
          | false , true -> 1
          | _ -> Stdlib.compare w1 w2

end

include SELF
module Map = Map.Make(SELF)
module Set = Set.Make(SELF)

let severe s = Set.exists (fun w -> w.severe) s

let pretty fmt w =
  begin
    Format.fprintf fmt
      "@[<v 0>%a: warning from %s:@\n"
      Cil_datatype.Position.pretty w.loc
      w.source ;
    if w.severe then
      Format.fprintf fmt " - Warning: %s, looking for context inconsistency"
        w.fallback
    else
      Format.fprintf fmt " - Warning: %s" w.fallback ;
    Format.fprintf fmt "@\n   Reason: %s@]" w.reason ;
  end

type collector = {
  default : string ;
  mutable warnings : Set.t ;
}

let collector : collector Context.value = Context.create "Warning"
let default () = (Context.get collector).default

(* -------------------------------------------------------------------------- *)
(* --- Contextual Errors                                                  --- *)
(* -------------------------------------------------------------------------- *)

exception Error of string * string (* source , reason *)

let error ?(source="wp") text =
  let buffer = Buffer.create 120 in
  Format.kfprintf
    (fun fmt ->
       Format.pp_print_flush fmt () ;
       let text = Buffer.contents buffer in
       if Context.defined collector then
         raise (Error (source,text))
       else
         Wp_parameters.abort ~current:true "%s" text
    ) (Format.formatter_of_buffer buffer) text


(* -------------------------------------------------------------------------- *)
(* --- Contextual Errors                                                  --- *)
(* -------------------------------------------------------------------------- *)

type context = collector option
let context ?(source="wp") () =
  Context.push collector { default = source ; warnings = Set.empty }

let flush old =
  let c = Context.get collector in
  Context.pop collector old ; c.warnings

let add w =
  let c = Context.get collector in
  c.warnings <- Set.add w c.warnings

let kprintf phi ?(log=true) ?(severe=false) ?source ~fallback message =
  let source = match source with Some s -> s | None -> default () in
  let buffer = Buffer.create 80 in
  Format.kfprintf
    (fun fmt ->
       Format.pp_print_flush fmt () ;
       let text = Buffer.contents buffer in
       let loc = Current_loc.get () in
       if log then
         Wp_parameters.warning ~source:(fst loc) "%s" text ~once:true ;
       phi {
         loc = fst loc ;
         severe = severe ;
         source = source ;
         fallback = fallback ;
         reason = text ;
       })
    (Format.formatter_of_buffer buffer)
    message

let create ?log ?severe ?source ~fallback msg =
  kprintf (fun w -> w) ?log ?severe ?source ~fallback msg

let emit ?severe ?source ~fallback msg =
  kprintf add ~log:true ?severe ?source ~fallback msg

let handle ?(severe=false) ~fallback ~handler cc x =
  try cc x
  with Error(source,reason) ->
    if Context.defined collector then
      ( emit ~severe ~source ~fallback "%s" reason ; handler x )
    else
    if source <> "wp" then
      Wp_parameters.fatal ~current:true "[%s] %s" source reason
    else
      Wp_parameters.fatal ~current:true "%s" reason

type 'a outcome =
  | Result of Set.t * 'a
  | Failed of Set.t

let catch ?source ?(severe=true) ~fallback cc x =
  let wrn = context ?source () in
  try let y = cc x in Result(flush wrn,y) (* DO NOT inline this let *)
  with Error(source,reason) ->
    emit ~severe ~source ~fallback "%s" reason ;
    Failed (flush wrn)
