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

include Plugin.S

val reset : unit -> unit
val hypothesis : 'a Log.pretty_printer
val is_interactive : unit -> bool

(** {2 Function Selection} *)

type functions =
  | Fct_none
  | Fct_all
  | Fct_skip of Cil_datatype.Kf.Set.t
  | Fct_list of Cil_datatype.Kf.Set.t

val get_fct : unit -> functions
val iter_fct : (Kernel_function.t -> unit) -> functions -> unit
val iter_kf : (Kernel_function.t -> unit) -> unit

(** {2 Goal Selection} *)

module WP          : Parameter_sig.Bool
module Dump        : Parameter_sig.Bool
module Behaviors   : Parameter_sig.String_list
module Properties  : Parameter_sig.String_list
module StatusAll   : Parameter_sig.Bool
module StatusTrue  : Parameter_sig.Bool
module StatusFalse : Parameter_sig.Bool
module StatusMaybe : Parameter_sig.Bool

(** {2 Model Selection} *)

val has_dkey : category -> bool

module Model : Parameter_sig.String_list
module ByValue : Parameter_sig.String_set
module ByRef : Parameter_sig.String_set
module InHeap : Parameter_sig.String_set
module AliasInit: Parameter_sig.Bool
module InCtxt : Parameter_sig.String_set
module ExternArrays: Parameter_sig.Bool
module Literals : Parameter_sig.Bool
module Volatile : Parameter_sig.Bool
module WeakIntModel : Parameter_sig.Bool

(** {2 Computation Strategies} *)

module Init: Parameter_sig.Bool
module InitWithForall: Parameter_sig.Bool
module BoundForallUnfolding: Parameter_sig.Int
module RTE: Parameter_sig.Bool
module Simpl: Parameter_sig.Bool
module Let: Parameter_sig.Bool
module Core: Parameter_sig.Bool
module Prune: Parameter_sig.Bool
module FilterInit: Parameter_sig.Bool
module Clean: Parameter_sig.Bool
module Filter: Parameter_sig.Bool
module Parasite: Parameter_sig.Bool
module Prenex: Parameter_sig.Bool
module Ground: Parameter_sig.Bool
module Reduce: Parameter_sig.Bool
module ExtEqual : Parameter_sig.Bool
module UnfoldAssigns : Parameter_sig.Int
module SplitBranch: Parameter_sig.Bool
module SplitSwitch: Parameter_sig.Bool
module SplitMax: Parameter_sig.Int
module SplitConj: Parameter_sig.Bool
module SplitCNF: Parameter_sig.Int
module DynCall : Parameter_sig.Bool
module SimplifyIsCint : Parameter_sig.Bool
module SimplifyLandMask : Parameter_sig.Bool
module SimplifyForall : Parameter_sig.Bool
module SimplifyType : Parameter_sig.Bool
module CalleePreCond : Parameter_sig.Bool
module PrecondWeakening : Parameter_sig.Bool
module TerminatesVariantHyp : Parameter_sig.Bool

(** {2 Prover Interface} *)

module Detect: Parameter_sig.Bool
module Tactics: Parameter_sig.String_list
module Generate:Parameter_sig.Bool
module ScriptOnStdout: Parameter_sig.Bool
module PrepareScripts: Parameter_sig.Bool
module FinalizeScripts: Parameter_sig.Bool
module DryFinalizeScripts: Parameter_sig.Bool
module Provers: Parameter_sig.String_list
module Interactive: Parameter_sig.String
module StrategyEngine: Parameter_sig.Bool
module ScriptMode: Parameter_sig.String
module DefaultStrategies: Parameter_sig.String_list
module RunAllProvers: Parameter_sig.Bool
module Cache: Parameter_sig.String
module CacheEnv: Parameter_sig.Bool
module CacheDir: Parameter_sig.String
module CachePrint: Parameter_sig.Bool
module Library: Parameter_sig.Filepath_list
module Drivers: Parameter_sig.Filepath_list
module Timeout: Parameter_sig.Int
module Memlimit: Parameter_sig.Int
module FctTimeout:
  Parameter_sig.Map
  with type key = Cil_types.kernel_function
   and type value = int
module SmokeTimeout: Parameter_sig.Int
module InteractiveTimeout: Parameter_sig.Int
module TimeExtra: Parameter_sig.Int
module TimeMargin: Parameter_sig.String
module Steps: Parameter_sig.Int
module Procs: Parameter_sig.Int
module ProofTrace: Parameter_sig.Bool
module Why3Flags: Parameter_sig.String_list
module Why3ExtraConfig: Parameter_sig.String_list

module Auto: Parameter_sig.String_list
module AutoDepth: Parameter_sig.Int
module AutoWidth: Parameter_sig.Int
module BackTrack: Parameter_sig.Int

(** {2 Proof Obligations} *)

module TruncPropIdFileName: Parameter_sig.Int
module Print: Parameter_sig.Bool
module Status: Parameter_sig.Bool
module Report: Parameter_sig.String_list
module ReportJson: Parameter_sig.Filepath
module OldReportJson: Parameter_sig.String
module ReportName: Parameter_sig.String
module MemoryContext: Parameter_sig.Bool
module CheckMemoryContext: Parameter_sig.Bool
module SmokeTests: Parameter_sig.Bool
module SmokeDeadassumes: Parameter_sig.Bool
module SmokeDeadcode: Parameter_sig.Bool
module SmokeDeadcall: Parameter_sig.Bool
module SmokeDeadlocalinit: Parameter_sig.Bool
module SmokeDeadloop: Parameter_sig.Bool
module Probes: Parameter_sig.Bool
module CounterExamples: Parameter_sig.Bool

(** {2 Getters} *)

val has_out : unit -> bool
val has_session : unit -> bool
val get_session : force:bool -> unit -> Datatype.Filepath.t
val get_session_dir : force:bool -> string -> Datatype.Filepath.t
val get_output : unit -> Datatype.Filepath.t
val get_output_dir : string -> Datatype.Filepath.t
val make_output_dir : Datatype.Filepath.t -> unit

(** {2 Debugging Categories} *)

val has_print_generated: unit -> bool
val print_generated: ?header:string -> Filepath.Normalized.t -> unit
(** print the given file if the debugging category
    "print-generated" is set *)

val cat_print_generated: category

val protect : exn -> bool
