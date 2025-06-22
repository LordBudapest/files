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

open Store

(**This functor offers a union-find data structure based on disjoint set
   forests, with path compression and linking by rank. It does not use
   primitive mutable state. Instead, it is parameterized over an
   implementation of stores. This allows the user to choose between many
   different representations of stores, such as stores based on primitive
   references, stores based on a (possibly extensible) primitive array, stores
   based on persistent maps, stores based on persistent or semi-persistent
   arrays, stores based on transactional references, and so on. The result of
   this functor is also an implementation of stores, extended with a [union]
   operation that merges two references. *)
module Make (S : STORE) : sig

  (**The abstract type ['a content] describes the meta-data that is required
     by the union-find machinery. Thus, a reference of type ['a rref] in the
     new store can also be viewed as a reference of type ['a content S.rref]
     in the original store. Similarly, a new store of type ['a store] is also
     an original store of type ['a content S.store]. By revealing this
     information, we advertise the fact that the new store is implemented on
     top of the original store [S] provided by the user. This means that some
     of the operations supported by the store [S] (such as copying, or (say)
     creating a transaction, assuming that the store [S] supports a form of
     transaction) are applicable to the new store as well. *)
  type 'a content

  include STORE
    with type 'a store = 'a content S.store
     and type 'a rref = 'a content S.rref

  (**If [eq s x y] is true, then [union s x y] has no observable effect.
     Otherwise, [union s x y] merges the references [x] and [y]. In either
     case, after the call [eq s x y] is true. [union s x y] returns either [x]
     or [y]. The content of the reference that is returned is unchanged. The
     content of the reference that is not returned is lost.*)
  val union: 'a store -> 'a rref -> 'a rref -> 'a rref

  (**If [eq s x y] is true initially, then [merge f s x y] has no observable
     effect. Otherwise, [merge s f x y] merges the references [x] and [y] and
     sets the content of the reference to [f vx vy], where [vx] and [vy] are
     the initial contents of the references [x] and [y]. The function [f] is
     {i not} allowed to access the union-find data structure.

     [merge s f x y] is equivalent to: {[
       if not (eq s x y) then
         let vx, vy = get s x, get s y in
         let v = f vx vy in
         set s (union s x y) v
     ]} *)
  val merge: 'a store -> ('a -> 'a -> 'a) -> 'a rref -> 'a rref -> 'a rref

  (**[find s x] returns a representative element of [x]'s equivalence class.
     This element is chosen in an unspecified but deterministic manner, so
     two calls to [find s x] must return the same result, provided no calls
     to [union] take place in between. [eq s x y] is equivalent to
     [find s x == find s y]. *)
  val find: 'a store -> 'a rref -> 'a rref

  (**[is_representative s x] determines whether [x] is the representative
     element of its equivalence class. It is equivalent to [find s x == x]. *)
  val is_representative: 'a store -> 'a rref -> bool

end
