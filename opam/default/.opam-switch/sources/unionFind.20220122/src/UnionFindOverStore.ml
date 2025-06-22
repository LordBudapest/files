(***************************************************************************)
(*                                                                         *)
(*                                 UnionFind                               *)
(*                                                                         *)
(*                       François Pottier, Inria Paris                     *)
(*                                                                         *)
(*  Copyright Inria. All rights reserved. This file is distributed under   *)
(*  the terms of the GNU Library General Public License version 2, with a  *)
(*  special exception on linking, as described in the file LICENSE.        *)
(***************************************************************************)

(* This module offers a union-find data structure based on disjoint set
   forests, with path compression and linking by rank. *)

open Store

module Make (S : STORE) = struct

(* -------------------------------------------------------------------------- *)

(* The rank of a vertex is the maximum length, in edges, of an uncompressed path
   that leads to this vertex. In other words, the rank of [x] is the height of
   the tree rooted at [x] that would exist if we did not perform path
   compression. *)

type rank =
  int

(* The content of a vertex is a pointer to a parent vertex (if the vertex
   has a parent) or a pair of a rank and a user value (if the vertex has no
   parent, and is thus the representative vertex for this equivalence
   class). *)

(* In this version the code, the type ['a content] must not mutable. Indeed,
   every mutation must be performed via [S.set]. *)

type 'a content =
| Link of 'a rref
| Root of rank * 'a

(* The type ['a rref] represents a vertex in the union-find data structure. *)

and 'a rref =
  'a content S.rref

(* -------------------------------------------------------------------------- *)

(* The type of stores, and the function for creating a new store, are those
   of the underlying implementation [S]. *)

type 'a store =
  'a content S.store

let new_store : unit -> 'a store =
  S.new_store

let copy : 'a store -> 'a store =
  S.copy

(* -------------------------------------------------------------------------- *)

(* [make s v] creates a new root of rank zero. *)

let make (s : 'a store) (v : 'a) : 'a rref =
  S.make s (Root (0, v))

(* -------------------------------------------------------------------------- *)

(* [find s x] finds the representative vertex of the equivalence class of [x].
   It does by following the path from [x] to the root. Path compression is
   performed (on the way back) by making every vertex along the path a
   direct child of the representative vertex. No rank is altered. *)

let rec find (s : 'a store) (x : 'a rref) : 'a rref =
  match S.get s x with
  | Root (_, _) ->
      x
  | Link y ->
      let z = find s y in
      if S.eq s y z then
        z
      else
        let link_to_z = S.get s y in
        S.set s x link_to_z;
        z

let is_representative (s : 'a store) (x : 'a rref) : bool =
  match S.get s x with
  | Root _ ->
      true
  | Link _ ->
      false

(* -------------------------------------------------------------------------- *)

(* [eq s x y] determines whether the vertices [x] and [y] belong in the same
   equivalence class. It does so via two calls to [find] and a physical
   equality test. As a fast path, we first test whether [x] and [y] are
   physically equal. *)

let eq (s : 'a store) (x : 'a rref) (y : 'a rref) : bool =
  S.eq s x y || S.eq s (find s x) (find s y)

(* -------------------------------------------------------------------------- *)

(* [get_ s x] returns the value stored at [x]'s representative vertex. *)

let get_ (s : 'a store) (x : 'a rref) : 'a =
  let x = find s x in
  match S.get s x with
  | Root (_, v) ->
      v
  | Link _ ->
      assert false

(* [get s x] returns the value stored at [x]'s representative vertex. *)

(* By not calling [find] immediately, we optimize the common cases where the
   path out of [x] has length 0 or 1, at the expense of the general case.
   Thus, we call [find] only if path compression must be performed. *)

let get (s : 'a store) (x : 'a rref) : 'a =
  match S.get s x with
  | Root (_, v) ->
      v
  | Link y ->
      match S.get s y with
      | Root (_, v) ->
          v
      | Link _ ->
          get_ s x

(* -------------------------------------------------------------------------- *)

(* [set_ s x] updates the value stored at [x]'s representative vertex. *)

let set_ (s : 'a store) (x : 'a rref) (v : 'a) : unit =
  let x = find s x in
  match S.get s x with
  | Root (r, _) ->
      S.set s x (Root (r, v))
  | Link _ ->
      assert false

(* [set s x] updates the value stored at [x]'s representative vertex. *)

(* By not calling [find] immediately, we optimize the common cases where the
   path out of [x] has length 0 or 1, at the expense of the general case.
   Thus, we call [find] only if path compression must be performed. *)

let set (s : 'a store) (x : 'a rref) (v : 'a) : unit =
  match S.get s x with
  | Root (r, _) ->
      S.set s x (Root (r, v))
  | Link y ->
      match S.get s y with
      | Root (r, _) ->
          S.set s y (Root (r, v))
      | Link _ ->
          set_ s x v

(* -------------------------------------------------------------------------- *)

(* [union s x y] merges the equivalence classes of [x] and [y] by installing a
   link from one root vertex to the other. *)

(* Linking is by rank: the smaller-ranked vertex is made to point to the
   larger. If the two vertices have the same rank, then an arbitrary choice
   is made, and the rank of the new root is incremented by one. *)

let union (s : 'a store) (x : 'a rref) (y : 'a rref) : 'a rref =
  let x = find s x
  and y = find s y in
  if S.eq s x y then x else
    match S.get s x, S.get s y with
    | Root (rx, vx), Root (ry, _) ->
        if rx < ry then begin
          S.set s x (Link y); y
        end
        else if rx > ry then begin
          S.set s y (Link x); x
        end
        else begin
          S.set s y (Link x);
          S.set s x (Root (rx + 1, vx));
          x
        end
    | Root _, Link _
    | Link _, Root _
    | Link _, Link _ ->
        assert false

(* -------------------------------------------------------------------------- *)

(* [merge] is analogous to [union], but invokes a user-specified function [f]
   to compute the new value [v] associated with the equivalence class. *)

(* The function [f] must not affect the union-find data structure by making
   re-entrant calls to [set], [union], or [merge]. There are two reasons for
   this. First, [f] may be invoked at a time when the invariant of the data
   structure is temporarily violated: in the third branch below, the rank of
   [x] has not yet been increased when [f] is invoked. Second, more seriously,
   if [f] could call, say, [union], then that could change a [Root] into a
   [Link], so the write that follows the call to [f] might change a [Link]
   back into a [Root], something that does not make any sense. Also, if [f]
   could call [set], then the write that follows the call to [f] might undo
   the effect of this [set] operation; this also does not make sense. *)

(* The tests [if v != vy then ...] and [if v != vx then ...] are intended to
   save an allocation and a write when possible. *)

(* We invoke [f] before performing any update, so that if [f] fails
   (by raising an exception), the state is unaffected. *)

let merge s (f : 'a -> 'a -> 'a) (x : 'a rref) (y : 'a rref) : 'a rref =
  let x = find s x
  and y = find s y in
  if S.eq s x y then x else
    match S.get s x, S.get s y with
    | Root (rx, vx), Root (ry, vy) ->
        let v = f vx vy in
        if rx < ry then begin
          S.set s x (Link y);
          if v != vy then S.set s y (Root (ry, v));
          y
        end else if rx > ry then begin
          S.set s y (Link x);
          if v != vx then S.set s x (Root (rx, v));
          x
        end else begin
          S.set s y (Link x);
          S.set s x (Root (rx+1, v));
          x
        end
    | Root _, Link _
    | Link _, Root _
    | Link _, Link _ ->
        assert false

end
