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

(** Useful operations.
    This module does not depend of any of frama-c module. *)

val nop: 'a -> unit
(** Do nothing. *)

val adapt_filename: string -> string
(** Ensure that the given filename has the extension "cmo" in bytecode
    and "cmxs" in native *)

val max_cpt: int -> int -> int
(** [max_cpt t1 t2] returns the maximum of [t1] and [t2] wrt the total ordering
    induced by tags creation. This ordering is defined as follows:
    forall tags t1 t2, t1 <= t2 iff t1 is before t2 in the finite sequence
    [0; 1; ..; max_int; min_int; min_int-1; -1] *)

val number_to_color: int -> int

(* ************************************************************************* *)
(** {2 Function builders} *)
(* ************************************************************************* *)

exception Unregistered_function of string
(** Never catch it yourself: let the kernel do the job.
    @since Oxygen-20120901 *)

val mk_labeled_fun: string -> 'a
(** To be used to initialized a reference over a labeled function.
    @since Oxygen-20120901
    @raise Unregistered_function when not properly initialized *)

val mk_fun: string -> ('a -> 'b) ref
(** Build a reference to an uninitialized function
    @raise Unregistered_function when not properly initialized *)

(* ************************************************************************* *)
(** {2 Function combinators} *)
(* ************************************************************************* *)

val ($) : ('b -> 'c) -> ('a -> 'b) -> 'a -> 'c
(** Composition. *)

val uncurry: ('a -> 'b -> 'c) -> ('a * 'b) -> 'c

val iter_uncurry2:
  (('a -> 'b -> unit) -> 'c -> unit) ->
  (('a * 'b -> unit) -> 'c -> unit)

(* ************************************************************************* *)
(** {2 Tuples} *)
(* ************************************************************************* *)

val nest: 'b -> 'a * 'c -> ('a * 'b) * 'c
(** Nest the first argument with the first element of the pair given as second
    argument. *)

val flatten: ('a * 'b) * 'c -> 'a * 'b * 'c
(** Flatten the pairs into a triplet. *)

(* ************************************************************************* *)
(** {2 Lists} *)
(* ************************************************************************* *)

val as_singleton: 'a list -> 'a
(** returns the unique element of a singleton list.
    @raise Invalid_argument on a non singleton list. *)

val last: 'a list -> 'a
(** returns the last element of a list.
    @raise Invalid_argument on an empty list
    @since Nitrogen-20111001 *)

val replace: ('a -> 'a -> bool) -> 'a -> 'a list -> 'a list
(** [replace cmp x l] replaces the first element [y] of [l] such that
    [cmp x y] is true by [x]. If no such element exists, [x] is added
    at the tail of [l].
    @since Neon-20140301
*)

val product_fold: ('a -> 'b -> 'c -> 'a) -> 'a -> 'b list -> 'c list -> 'a
(** [product f acc l1 l2] is similar to [fold_left f acc l12] with l12 the
    list of all pairs of an elt of [l1] and an elt of [l2]
*)

val product: ('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
(** [product f l1 l2] applies [f] to all the pairs of an elt of [l1] and
    an element of [l2].
*)

val find_index: ('a -> bool) -> 'a list -> int
(** returns the index (starting at 0) of the first element verifying the
    condition
    @raise Not_found if no element in the list matches the condition
*)

val list_compare : ('a -> 'a -> int) -> 'a list -> 'a list -> int
(** Generic list comparison function, where the elements are compared
    with the specified function
    @since Boron-20100401 *)

val opt_of_list: 'a list -> 'a option
(** converts a list with 0 or 1 element into an option.
    @raise Invalid_argument on lists with more than one argument
    @since Oxygen-20120901 *)

val subsets: int -> 'a list -> 'a list list
(** [subsets k l] computes the combinations of [k] elements from list [l].
    E.g. subsets 2 [1;2;3;4] = [[1;2];[1;3];[1;4];[2;3];[2;4];[3;4]].
    This function preserves the order of the elements in [l] when
    computing the sublists. [l] should not contain duplicates.
    @since Aluminium-20160501 *)

val list_first_n : int -> 'a list -> 'a list
(** [list_first_n n l] returns the first [n] elements of the list. Tail
    recursive.
    It returns an empty list if [n] is nonpositive and the whole list if [n] is
    greater than [List.length l].
    It is equivalent to [list_slice ~last:n l]. *)

val list_slice: ?first:int -> ?last:int -> 'a list -> 'a list
(** [list_slice ?first ?last l] is equivalent to Python's slice operator
    (l[first:last]): returns the range of the list between [first] (inclusive)
    and [last] (exclusive), starting from 0.
    If omitted, [first] defaults to 0 and [last] to [List.length l].
    Negative indices are allowed, and count from the end of the list.
    [list_slice] never raises exceptions: out-of-bounds arguments are clipped,
    and inverted ranges result in empty lists.
    @since 18.0-Argon *)

val map_no_copy: ('a -> 'a) -> 'a list -> 'a list
(** Like map but try not to make a copy of the list
    @since 30.0-Zinc *)

val map_no_copy_list: ('a -> 'a list) -> 'a list -> 'a list
(** Like map but each call can return a list. Try not to make a copy of the list
    @since 30.0-Zinc *)

(* ************************************************************************* *)
(** {2 Options} *)
(* ************************************************************************* *)

(** [merge f k a b]  returns
    - [None] if both [a] and [b] are [None]
    - [Some a'] (resp. [b'] if [b] (resp [a]) is [None]
      and [a] (resp. [b]) is [Some]
    - [f k a' b'] if both [a] and [b] are [Some]

    It is mainly intended to be used with Map.merge

    @since Oxygen-20120901
*)
val merge_opt:
  ('a -> 'b -> 'b -> 'b) -> 'a -> 'b option -> 'b option -> 'b option

val opt_filter: ('a -> bool) -> 'a option -> 'a option

val the: exn:exn -> 'a option -> 'a
(** @raise Exn if the value is [None] and [exn] is specified.
    @raise Invalid_argument if the value is [None] and [exn] is not specified.
    @return v if the value is [Some v].
    @before 23.0-Vanadium [exn] was an optional argument.
*)

val opt_hash: ('a -> int) -> 'a option -> int
(** @since Sodium-20150201 *)

val opt_map2: ('a -> 'b -> 'c) -> 'a option -> 'b option -> 'c option
(** @return [f a b] if arguments are [Some a] and [Some b], orelse return
    [None].
    @since 24.0-Chromium *)

val opt_map_no_copy: ('a -> 'a) -> 'a option -> 'a option
(** same as map_no_copy for options.
    @since 30.0-Zinc *)

(* ************************************************************************* *)
(** {2 Strings} *)
(* ************************************************************************* *)

val string_del_prefix: ?strict:bool -> string -> string -> string option
(** [string_del_prefix ~strict p s] returns [None] if [p] is not a prefix of
    [s] and Some [s1] iff [s=p^s1].
    @since Oxygen-20120901 *)

val string_del_suffix: ?strict:bool -> string -> string -> string option
(** [string_del_suffix ~strict suf s] returns [Some s1] when [s = s1 ^ suf]
    and None of [suf] is not a suffix of [s].
    @since Aluminium-20160501
*)

val make_unique_name:
  (string -> bool) -> ?sep:string -> ?start:int -> string -> int*string
(** [make_unique_name mem s] returns [(0, s)] when [(mem s)=false]
    otherwise returns [(n,new_string)] such that [new_string] is
    derived from [(s,sep,start)] and [(mem new_string)=false] and [n<>0]
    @since Oxygen-20120901 *)

val strip_underscore: string -> string
(** remove underscores at the beginning and end of a string. If a string
    is composed solely of underscores, return the empty string

    @since 18.0-Argon
*)

val html_escape: string -> string

(** [format_string_of_stag stag] returns the string corresponding to [stag],
    or raises an exception if the tag extension is unsupported.

    @since 22.0-Titanium
*)
val format_string_of_stag: Format.stag -> string

(* ************************************************************************* *)
(** {2 Performance} *)
(* ************************************************************************* *)

external address_of_value: 'a -> int = "address_of_value" [@@noalloc]

(* ************************************************************************* *)
(** {2 System commands} *)
(* ************************************************************************* *)

val mkdir : ?parents:bool -> Filepath.Normalized.t -> Unix.file_perm -> bool
(** [mkdir ?parents name perm] creates directory [name] with permission
    [perm]. If [parents] is true, recursively create parent directories
    if needed. [parents] defaults to false.
    Note that this function may create some of the parent directories
    and then fail to create the children, e.g. if [perm] does not allow
    user execution of the created directory. This will leave the filesystem
    in a modified state before raising an exception.
    Returns [true] if the directory was created, [false] otherwise.
    @raise Unix.Unix_error if cannot create [name] or its parents.
    @since 19.0-Potassium
    @since 28.0-Nickel added check for existence of path (error if exists
    but not a directory, otherwise do nothing if directory already exists).
    Changed type of [name] argument and return type.
*)

val safe_at_exit : (unit -> unit) -> unit
(** Register function to call with [Stdlib.at_exit], but only
    for non-child process (fork). The order of execution is preserved
    {i wrt} ordinary calls to [Stdlib.at_exit]. *)

val cleanup_at_exit: string -> unit
(** [cleanup_at_exit file] indicates that [file] must be removed when the
    program exits (except if exit is caused by a signal).
    If [file] does not exist, nothing happens. *)

exception Temp_file_error of string

val temp_file_cleanup_at_exit: ?debug:bool -> string -> string -> string
(** Similar to [Filename.temp_file] except that the temporary file will be
    deleted at the end of the execution (see above), unless [debug] is set
    to true, in which case a message with the name of the kept file will be
    printed.
    @raise Temp_file_error if the temp file cannot be created.
*)

val temp_dir_cleanup_at_exit: ?debug:bool -> string -> Filepath.Normalized.t
(** @raise Temp_file_error if the temp dir cannot be created.
    @since 28.0-Nickel modify return type *)

val safe_remove: string -> unit
(** Tries to delete a file and never fails. *)

val safe_remove_dir: string -> unit

(* ************************************************************************* *)
(** {2 Comparison functions} *)
(* ************************************************************************* *)

(** Use this function instead of [Stdlib.compare], as this makes
    it easier to find incorrect uses of the latter *)
external compare_basic: 'a -> 'a -> int = "%compare"

(** Case-insensitive string comparison. Only ISO-8859-1 accents are handled.
    @since Silicon-20161101 *)
val compare_ignore_case: string -> string -> int

(*
Local Variables:
compile-command: "make -C ../../.."
End:
*)
