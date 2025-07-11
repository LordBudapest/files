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

(** Abstract domains of the analysis. *)

(** An abstract domain is a collection of abstract states propagated through
    the control flow graph by a dataflow analysis. At a program point, they
    are abstractions of the set of possible concrete states that may arise
    during any execution of the program.

    In Eva, different abstract domains may communicate through alarms, values
    and locations.
    Alarms report undesirable behaviors that may occur during an execution
    of the program. They are defined in {!Alarmset}, while values and locations
    depend on the domain.
    Values are numerical and non-relational abstractions of the set of the
    possible values of expressions at a program point. Locations are similar
    abstractions for memory locations. The main values and locations used
    in the analyzer are respectively available in {!Main_values} and
    {!Main_locations}. Values and locations abstractions are extensible, should
    a domain requires new abstractions. Their signature are in
    {!Abstract_value.S} and {!Abstract_location.S}.

    Lvalues and expressions are cooperatively evaluated into locations and
    values using all the information provided by all domains. These computed
    values and locations are then available for the domain transformers which
    model the action of statements on abstract states.
    However, a domain could ignore this mechanism; its values and locations
    should then be the unit type.


    This file gathers the definition of the module types for an abstract
    domain.

    The module type {!S} requires all the functions to be implemented to define
    the abstract semantics of a domain, divided in four categories:
    - {!Lattice} gives a semi-lattice structure to the abstract states.
    - {!Queries} extracts information from a state, by giving a value to an
      expression. They are used when evaluating expressions.
    - {!Transfer} are the transfer functions of the domain for assignments,
      assumptions and function calls. These functions use the values and
      locations computed by the evaluation of the expressions involved in
      a given statement. These values and locations are made available through
      a {!valuation} record.
    - The remaining functions are essentially dedicated to the evaluation of
      logical predicates, to the initialization of an initial state, and to the
      {!Mem_exec} cache.

    The functor {!Domain_builder.Complete} automatically builds some of the
    functions required by the {!S} signature. However, these functions can
    also be redefined in the domain to achieve better precision or performance.

    Domains can then be lifted on more general values and locations through
    {!Domain_lift.Make}, and be combined through {!Domain_product.Make}.

    Finally, a new domain can be registered in the Eva engine via
    {!Abstractions.register}. See abstractions.mli for more details.
*)

(* The types of the Cil AST. *)
open Cil_types

type exp = Eva_ast.exp
type lval = Eva_ast.lval

(* Definition of the types frequently used in Eva. *)
open Eval


(** Lattice structure of a domain. *)
module type Lattice = sig
  type state

  val top: state
  (** Greatest element. *)

  val is_included: state -> state -> bool
  (** Inclusion test. *)

  val join: state -> state -> state
  (** Semi-lattice structure. *)

  val widen: kernel_function -> stmt -> state -> state -> state
  (** [widen h t1 t2] is an over-approximation of [join t1 t2].
      Assumes [is_included t1 t2] *)

  val narrow: state -> state -> state or_bottom
  (** Over-approximation of the intersection of two abstract states (called meet
      in the literature). Used only to gain some precision when interpreting the
      complete behaviors of a function specification. Can be very imprecise
      without impeding the analysis: [meet x y = `Value x] is always sound. *)
end

(** Context from the engine evaluation about a domain query. *)
type evaluation_context = {
  root: bool;
  (** Is the queried expression the "root" expression being evaluated, or is it
      a sub-expression? *)
  subdivision: int;
  (** Maximum number of subdivisions for the current evaluation.
      See {!Subdivided_evaluation} for more details. *)
  subdivided: bool;
  (** Is the current evaluation a subdivision of the complete evaluation? *)
}

(** Extraction of information: queries for values or locations inferred by a
    domain about expressions and lvalues.
    Used in the evaluation of expressions and lvalues. *)
module type Queries = sig

  (** Domain state. *)
  type state

  (** Domains can optionally provide a context to be used by value abstractions
      when evaluating expressions. This can be safely ignored for most domains.
      Defined as unit (no context) by {!Domain_builder.Complete}. *)
  type context

  (** Numerical values to which the expressions are evaluated. *)
  type value

  (** Abstract memory locations associated to left values. *)
  type location

  (** The [origin] is used by the domain combiners to track the origin
       of a value. An abstract domain can always use a dummy type unit for
       origin, or use it to encode some specific information about a value. *)
  type origin

  (** Queries functions return a pair of:
      - the set of alarms that ensures the of the soundness of the evaluation
        of [exp]. [Alarmset.all] is always a sound over-approximation of these
        alarms.
      - a value for the expression, which can be:
        – `Bottom if its evaluation is infeasible;
        – `Value (v, o) where [v] is an over-approximation of the abstract
           value of the expression [exp], and [o] is the origin of the value,
           which can be None. *)

  (** When evaluating an expression, the evaluation engine asks the domains
      for abstract values and alarms at each lvalue (via [extract_lval]) and
      each sub-expressions (via [extract_expr]).
      In these queries:
      - [oracle] is an evaluation function and can be used to find the answer
        by evaluating some others expressions, especially by relational domain.
        No recursive evaluation should be done by this function.
      - [context] record gives some information about
        the current evaluation. *)

  (** Query function for compound expressions:
      [extract_expr ~oracle context t exp] returns the known value of [exp]
      by the state [t]. See above for more details on queries. *)
  val extract_expr :
    oracle:(exp -> value evaluated) -> evaluation_context ->
    state -> exp -> (value * origin option) evaluated

  (** Query function for lvalues:
      [extract_lval ~oracle context t lval loc] returns the known value
      stored at the location [loc] of the left value [lval].
      See above for more details on queries. *)
  val extract_lval :
    oracle:(exp -> value evaluated) -> evaluation_context ->
    state -> lval -> location -> (value * origin option) evaluated

  (** [backward_location state lval typ loc v] reduces the location [loc] of the
      lvalue [lval], so that only the locations that may have value
      [v] are kept.
      The returned location must be included in [loc], but it is always sound
      to return [loc] itself.
      Also returns the value that may have the returned location, if not bottom.
      Defined by {!Domain_builder.Complete} with no reduction. *)
  val backward_location :
    state -> lval -> location -> value -> (location * value) or_bottom

  (** Given a reduction [expr] = [value], provides more reductions that may
      be performed.
      Defined by {!Domain_builder.Complete} with no reduction. *)
  val reduce_further : state -> exp -> value -> (exp * value) list

  (** Returns the current context to be used by value abstractions for the
      evaluation of expressions or lvalues.
      Defined by {!Domain_builder.Complete} with no context. *)
  val build_context : state -> context or_bottom

end

(** Results of an evaluation: the results of all intermediate calculation (the
    value of each (sub)expression and the location of each lvalue) are available
    to the domain. As the evaluation results into a mapping from [exp] to
    [record_val] and from [lval] to [record_loc], we define as {!valuation} the
    classic functions to retrieve information from a map.*)
type ('value, 'location, 'origin) valuation =
  {
    find: exp -> ('value, 'origin) record_val or_top;
    (** Finds the value computed for an expression. The returned record also
        contains the origin provided by the domain for the given expression, the
        alarms emitted by its evaluation and whether its value has been reduced.
        Returns `Top if the expression has not been evaluated. *)
    fold: 'a. (exp -> ('value, 'origin) record_val -> 'a -> 'a) -> 'a -> 'a;
    (** [fold f a] computes (f eN rN ... (f e1 r1 a)...), where e1 ... eN are
        the evaluated (sub)expressions and r1 ... rN are the computed records
        for each of these expressions. The record of an expression contains its
        value, reduction status, origin and alarms. *)
    find_loc: lval -> 'location record_loc or_top
    (** Finds the location computed for an lvalue. The returned record also
        contains the lvalue type and the alarms emitted by its evaluation.
        Returns `Top if the lvalue has not been evaluated. *)
  }

(** Transfer function of the domain. *)
module type Transfer = sig
  type state
  type value
  type location
  type origin

  (** [update valuation t] updates the state [t] with the values of expressions
      and the locations of lvalues available in the [valuation] record. *)
  val update : (value, location, origin) valuation -> state -> state or_bottom

  (** [assign kinstr lv expr v valuation state] is the transfer function for the
      assignment [lv = expr] for [state]. It must return the state where the
      assignment has been performed.
      - [kinstr] is the statement of the assignment, or Kglobal for the
        initialization of a global variable.
      - when the kinstr is a function call, [expr] is the special variable in
        [!Eval.call.return].
      - [v] carries the value being assigned to [lv], i.e. the value of the
        expression [expr]. [v] also denotes the kind of assignment: Assign for
        the default assignment of the value, or Copy for the exact copy of a
        location if the right expression [expr] is a lvalue.
      - [valuation] is a cache of all sub-expressions and locations computed
        for the evaluation of [lval] and [expr]; it can also be used to reduce
        the state. *)
  val assign :
    kinstr -> location left_value -> exp -> (location, value) assigned ->
    (value, location, origin) valuation -> state -> state or_bottom

  (** Transfer function for an assumption.
      [assume stmt expr bool valuation state] returns a state in which the
      boolean expression [expr] evaluates to [bool].
      - [stmt] is the statement of the assumption.
      - [valuation] is a cache of all sub-expressions and locations computed
        for the evaluation and the reduction of [expr]; it can also be used
        to reduce the state. *)
  val assume :
    stmt -> exp -> bool ->
    (value, location, origin) valuation -> state -> state or_bottom

  (** [start_call stmt call recursion valuation state] returns an initial state
      for the analysis of a called function. In particular, this function
      should introduce the formal parameters in the state, if necessary.
      - [stmt] is the statement of the call site;
      - [call] represents the call: the called function and the arguments;
      - [recursion] is the information needed to interpret a recursive call.
        It is None if the call is not recursive.
      - [state] is the abstract state at the call site, before the call;
      - [valuation] is a cache for all values and locations computed during
        the evaluation of the function and its arguments.

      On recursive calls, [recursion] contains some substitution of variables
      to be applied on the domain state to prevent mixing up local variables
      and formal parameters of different recursive calls.
      See {!Eval.recursion} for more details.
      This substitution has been applied on values and expressions in [call],
      but not in the [valuation] given as argument. If the domain uses some
      information from the [valuation] on a recursive call, it must apply the
      substitution on it. *)
  val start_call:
    stmt -> (location, value) call -> recursion option ->
    (value, location, origin) valuation -> state -> state or_bottom

  (** [finalize_call stmt call ~pre ~post] computes the state after a function
      call, given the state [pre] before the call, and the state [post] at the
      end of the called function.
      - [stmt] is the statement of the call site;
      - [call] represents the function call and its arguments.
      - [recursion] is the information needed to interpret a recursive call.
        It is None if the call is not recursive.
      - [pre] and [post] are the states before and at the end of the call
        respectively. *)
  val finalize_call:
    stmt -> (location, value) call -> recursion option ->
    pre:state -> post:state -> state or_bottom

  (** Called on the Frama_C_domain_show_each directive. Prints the internal
      properties inferred by the domain in the [state] about the expression
      [exp]. Can use the [valuation] resulting from the cooperative evaluation of
      the expression.
      Defined by {!Domain_builder.Complete} but prints nothing. *)
  val show_expr:
    (value, location, origin) valuation ->
    state -> Format.formatter -> exp -> unit
end


(** Environment for the logical evaluation of predicates. *)
type 'state logic_environment = {
  states: logic_label -> 'state;
  (** The logic can refer to the states at other points of the program using
      labels. [states] associates a state (which can be top) to each label. *)
  result: varinfo option;
  (** [result] contains the variable corresponding to \result. It is None when
      \result is meaningless. *)
}

type variable_kind =
  | Global                     (** Global variable. *)
  | Formal of kernel_function  (** Formal parameter of a function. *)
  | Local of kernel_function   (** Local variable of a function. *)
  | Result of kernel_function  (** Special variable storing the return value
                                   of a call. Assigned at the end of the called
                                   function, and used at the call site. Also
                                   used to model the ACSL \result construct. *)

(** Value for the initialization of variables. Can be either zero or top. *)
type init_value = Zero | Top

(** MemExec is a global cache for the complete analysis of functions.
    It avoids repeating the analysis of a function in equivalent entry states.
    It uses an over-approximation of the locations possibly read and written
    by a function, and compare the entry states for these locations. *)
module type Reuse = sig
  type t (** Type of states. *)

  (** [relate kf bases state] returns the set of bases [bases] in relation with
      [bases] in [state] — i.e. all bases other than [bases] whose value may
      affect the properties inferred on [bases] in [state].
      [state] is the initial state of an analysis of [kf].
      For a non-relational domain, it is always safe to return [empty].
      For a relational domain, it is always safe to return [top], but it
      disables MemExec. *)
  val relate: kernel_function -> Base.Hptset.t -> t -> Base.SetLattice.t

  (** [filter kind bases states] reduces the state [state] to only keep
      properties about [bases] — it is a projection on the set of [bases].
      It allows reusing an analysis of [kf] from an initial state [pre] to a
      final state [post].
      If [kind] is [`Pre kf], [state] is the initial state of function [kf],
      and [bases] includes all inputs of [kf] and satisfies
      [relate kf bases state = bases].
      If [kind] is [`Post kf], [state] is the final state of [kf], and [bases]
      includes all inputs and outputs of [kf].
      Afterwards, the two resulting states [reduced_pre] and [reduced_post] are
      used as follow: when [kf] should be analyzed with the initial state [s],
      if [filter kf `Pre s = reduced_pre], then the analysis is skipped, and
      [reuse kf s reduced_post] is used as its final state instead.
      If [kind] is [`Print], the state is reduced before printing it for the
      end-user. *)
  val filter:
    [`Pre of kernel_function | `Post of kernel_function | `Print ] ->
    Base.Hptset.t -> t -> t

  (** [reuse kf bases current_input previous_output] merges the initial state
      [current_input] with a final state [previous_output] from a previous
      analysis of [kf] started with an equivalent initial state.
      [reuse] must overwrite the properties on [bases] in [current_input] with
      the ones in [previous_output]. Properties on other bases must be left
      unchanged from [current_input]. *)
  val reuse:
    kernel_function -> Base.Hptset.t ->
    current_input:t -> previous_output:t -> t

  (** {!Domain_builtin.Complete} provides the simplest implementation of
      [filter] and [reuse], which is:
        let filter _ _ _ state = state
        let reuse _ _ ~current_input:_ ~previous_output = previous_output
      This is correct as the cache will be triggered only for an initial state
      exactly equal to the previous initial state, in which case the previous
      output state is indeed a correct final state on its own. *)
end

(** Signature for the abstract domains of the analysis. *)
module type S = sig
  type state
  include Datatype.S_with_collections with type t = state

  (* The domain name, shown in some logs and in the GUI. Be sure to redefine a
     clear and simple name instead of the default one coming from Datatype. *)
  val name: string

  (** {3 Lattice Structure } *)
  include Lattice with type state := t

  (** {3 Queries } *)
  include Queries with type state := t

  (** {3 Transfer Functions } *)

  (** Transfer functions from the result of evaluations.
      See {!Eval} for more details about valuation. *)
  include Transfer with type state := t
                    and type value := value
                    and type location := location
                    and type origin := origin

  (** {3 Logic } *)

  (** Logical evaluation. This API is subject to changes. *)
  (* TODO: cooperative evaluation of predicates in the engine. *)

  (** [logic_assign None loc state] removes from [state] all inferred properties
      that depend on the memory location [loc].
      If the first argument is not None, it contains the logical clause being
      interpreted and the pre-state in which the terms of the clause are
      evaluated. The clause can be an assigns, allocates or frees clause.
      [loc] is then the memory location concerned by the clause. *)
  val logic_assign:
    (location logic_assign * state) option -> location -> state -> state

  (** Evaluates a [predicate] to a logical status in the current [state].
      The [logic_environment] contains the states at some labels and the
      potential variable for \result.
      Defined by {!Domain_builder.Complete}: all predicates are Unknown. *)
  val evaluate_predicate:
    state logic_environment -> state -> predicate -> Alarmset.status

  (** [reduce_by_predicate env state pred b] reduces the current [state] by
      assuming that the predicate [pred] evaluates to [b]. [env] contains the
      states at some labels and the potential variable for \result.
      Defined by {!Domain_builder.Complete} with no reduction. *)
  val reduce_by_predicate:
    state logic_environment -> state -> predicate -> bool -> state or_bottom

  (** Interprets an ACSL extension.
      Defined by {!Domain_builder.Complete} as the identity. *)
  val interpret_acsl_extension:
    acsl_extension -> state logic_environment -> state -> state

  (** {3 Scoping and initialization } *)

  (** Scoping: abstract transformers for entering and exiting blocks.
      The variables should be added or removed from the abstract state here.
      Note that the formals of a called function enter the scope through the
      transfer function {!start_call}, and leave it through a call to
      {!leave_scope}. *)

  (** Introduces a list of variables in the state. At this point, the variables
      are uninitialized. Globals and formals of the 'main' will be initialized
      by {!initialize_variable} and {!initialize_variable_using_type}. Local
      variables remain uninitialized until an assignment through {!assign}.
      The formal parameters of a call enter the scope through {!start_call}. *)
  val enter_scope: variable_kind -> varinfo list -> t -> t

  (** Removes a list of local and formal variables from the state.
      The first argument is the englobing function. *)
  val leave_scope: kernel_function -> varinfo list -> t -> t

  (** The initial state with which the analysis start. *)
  val empty: unit -> t

  (** [initialize_variable lval loc ~initialized init_value state] initializes
      the value of the location [loc] of lvalue [lval] in [state] with:
      – bits 0 if init_value = Zero;
      – any bits if init_value = Top.
      The boolean initialized is true if the location is initialized, and false
      if the location may be not initialized. *)
  val initialize_variable:
    lval -> location -> initialized:bool -> init_value -> t -> t

  (** Initializes a variable according to its type.
      The variable can be:
      - a global variable on lib-entry mode.
      - a formal parameter of the 'main' function.
      - the return variable of a function specification. *)
  (* TODO: move some parts of the cvalue implementation of this function
     in the generic engine. *)
  val initialize_variable_using_type: variable_kind -> varinfo -> t -> t

  (** {3 Miscellaneous } *)

  (** Transfer functions called when entering/leaving a loop, and at each
      loop iteration. Defined as identity by {!Domain_builder.Complete}. *)

  val enter_loop: stmt -> state -> state
  val incr_loop_counter: stmt -> state -> state
  val leave_loop: stmt -> state -> state

  include Reuse with type t := t

  (** Category for the messages about the domain.
      Created by {!Domain_builder.Complete} using the domain name. *)
  val log_category : Self.category

  (** This function is called after the analysis. The argument is the state
      computed at the return statement of the main function. The function can
      also access all states stored in the Store module during the analysis.
      If the analysis aborted, this function is not called.
      Defined by {!Domain_builder.Complete} as doing nothing. *)
  val post_analysis: t or_bottom -> unit

  (** Storage of the states computed by the analysis.
      Automatically built by {!Domain_builder.Complete}. *)
  module Store: Domain_store.S with type t := t
end

type 't key = 't Structure.Key_Domain.key

(** Signature for a leaf abstract domain which can be registered
    via {!Abstractions.Domain.register}. *)
module type Leaf = sig
  include S

  (** The key identifies the domain and the type [t] of its states.
      Automatically created by {!Domain_builder.Complete}. *)
  val key: t key

  (** The abstract context used by the domain.
      It carries the [context] type used by the domain.
      Defined by {!Domain_builder.Complete} for the unit context. *)
  val context_dependencies : context Abstract_context.dependencies

  (** The abstract value used by the domain.
      It carries the [value] type used by the domain.
      See {!Main_values} for some abstract values available in Eva. *)
  val value_dependencies: value Abstract_value.dependencies

  (** The abstract location used by the domain.
      It carries the [location] type used by the domain.
      See {!Main_locations} for the abstract location available in Eva. *)
  val location_dependencies: location Abstract_location.dependencies
end



(*
Local Variables:
compile-command: "make -C ../../../.."
End:
*)
