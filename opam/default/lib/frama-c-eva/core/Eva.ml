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

(** Eva public API.

    The main modules are:
    - Analysis: run the analysis.
    - Results: access analysis results, especially the values of expressions
      and memory locations of lvalues at each program point.

    The following modules allow configuring the Eva analysis:
    - Parameters: change the configuration of the analysis.
    - Eva_annotations: add local annotations to guide the analysis.
    - Builtins: register ocaml builtins to be used by the cvalue domain
      instead of analysing the body of some C functions.

    Other modules are for internal use only. *)

(* This file is generated. Do not edit. *)

module Analysis = Analysis
module Callstack = Callstack
module Deps = Deps
module Results = Results
module Parameters = Parameters
module Eva_annotations = Eva_annotations
module Eval = Eval
module Assigns = Assigns
module Eva_ast = Eva_ast
module Builtins = Builtins
module Cvalue_callbacks = Cvalue_callbacks
module Eva_perf = Eva_perf
module Logic_inout = Logic_inout
module Eva_results = Eva_results
module Unit_tests = Unit_tests
