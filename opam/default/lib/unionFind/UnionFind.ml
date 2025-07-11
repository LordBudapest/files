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

(* For convenience, the functionality of [UnionFindBasic] is offered
   at the root level, so the end user uses [UnionFind.find], etc. *)

(**This module offers a union-find data structure based on disjoint set
   forests, with path compression and linking by rank. *)

include UnionFindBasic

(* For convenience, the functionality of [UnionFindOverStore] is offered
   at the root level, so the end user uses [UnionFind.Make]. *)

include UnionFindOverStore

(* For convenience, the signature [STORE] is defined at the root level. *)

include Store

(* The various implementations of the signature [STORE]. *)

module StoreMap = StoreMap
module StoreRef = StoreRef
module StoreTransactionalRef = StoreTransactionalRef
module StoreVector = StoreVector
