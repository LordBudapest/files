
(* This file is free software, part of Dolmen. See file "LICENSE" for more details. *)

(** Pretty printing annotations

    This module defines types to specify pretty printing annotations
    (such as associtativity, infix notations, etc...).
*)


(* Pretty types *)
(* ************************************************************************ *)

type name = Dolmen_intf.Pretty.name =
  | Exact of string
  | Renamed of string

type pos = Dolmen_intf.Pretty.pos =
  | Infix
  | Prefix

type assoc = Dolmen_intf.Pretty.assoc =
  | Left
  | Right

type 'a print = 'a Dolmen_intf.Pretty.print =
  | Ignore : _ print
  | P : (Format.formatter -> 'a -> unit) -> 'a print

