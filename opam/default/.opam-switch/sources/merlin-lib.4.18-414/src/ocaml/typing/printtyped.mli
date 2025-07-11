(**************************************************************************)
(*                                                                        *)
(*                                 OCaml                                  *)
(*                                                                        *)
(*              Damien Doligez, projet Para, INRIA Rocquencourt           *)
(*                                                                        *)
(*   Copyright 1999 Institut National de Recherche en Informatique et     *)
(*     en Automatique.                                                    *)
(*                                                                        *)
(*   All rights reserved.  This file is distributed under the terms of    *)
(*   the GNU Lesser General Public License version 2.1, with the          *)
(*   special exception on linking described in the file LICENSE.          *)
(*                                                                        *)
(**************************************************************************)

open Typedtree;;
open Format;;

val interface : formatter -> signature -> unit;;
val implementation : formatter -> structure -> unit;;

val implementation_with_coercion :
  formatter -> Typedtree.implementation -> unit;;

(* Added by merlin for debugging purposes *)
val pattern : int -> formatter -> _ general_pattern -> unit
val expression : formatter -> expression -> unit
