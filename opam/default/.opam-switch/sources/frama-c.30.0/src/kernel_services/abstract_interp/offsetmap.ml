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

open Abstract_interp

(* This module uses Bigints everywhere. Set up some notations *)
let pretty_int = Int.pretty
let ( =~ ) = Integer.equal
let ( <>~ ) x y = not (Integer.equal x y)
let ( <~ ) = Integer.lt
let ( >~ ) = Integer.gt
let ( <=~ ) = Integer.le
let ( >=~ ) = Integer.ge
let ( +~ ) = Integer.add
let ( -~ ) = Integer.sub
(* let ( *~ ) = Integer.mul *)
let ( /~ ) = Integer.e_div
let ( %~ ) = Integer.e_rem
let succ = Integer.succ
let pred = Integer.pred

(** Offsetmaps are unbalanced trees that map intervals to values, with
    the additional properties that the shape of the tree is entirely determined
    by the intervals that are mapped (see function [is_above] for the ordering).
    The intervals are contiguous (offsetmaps cannot contain holes), and sorted
    from left to right in the tree.

    In this file, offsetmaps are represented in a relative way to maximise
    sharing. An offsetmap alone does not "know" which intervals it represents.
    When iterating on it, it is necessary to maintain a *current offset*, which
    is the lower index of the interval at the top of the tree. ( *Not* of the
    leftmost interval, which is the smallest binding.) *)
type 'a offsetmap =
  | Empty

  | Node of
      Integer.t *
      Integer.t * 'a offsetmap *
      Integer.t * 'a offsetmap *
      Rel.t * Integer.t * 'a *
      int
  (** [Node(i, offl, subl, offr, subr, rem, size, value, id)]
      - [i]: Relative, upper index of the interval. Thus the interval has length
        [max+1]. The relative lower index of the interval is always zero by
        definition
      - [offl, subl]: subtree on the left: the offset [offl] of its root
        (relative to 0), and the tree [subl]. If [subl] is not empty, it maps at
        least one interval, and [offl] is strictly negative. If [subl] is empty,
        then [offl] is zero
      - [offr, subr]: subtree on the right: the offset [offr] of its root
        (relative to 0), and the tree [subr]. [offr] is greater than [max+1] by
        definition, and equal to it if [subr] is empty. ([offr] may also be
        equal to [max+1] with a non-empty [subr],  when the interval at the root
        of [subr] starts exactly at [max+1]
      - [rem, size, value]: the value, its size [size] and its alignment
        [rem] relative to the start of the interval. [size] can be:
          * strictly more than [max+1], in which case the value is truncated
          * equal to [max+1]:
              + if [rem] is zero, the value is stored exactly once in the
                interval
              + otherwise, two truncated instances of the value are stored
                consecutively.
          * strictly less than [max+1]: the value is stored more than once,
            and implicitly repeats itself to fill the entire interval.
      - [id]: tag: hash-consing id of the node, plus an additional boolean.
        Not related to the contents of the tree.
  *)


(* In a node, the alignment of the value is relative to the start of the
   interval of the node. When splitting or merging nodes, this relative
   alignment must be recomputed wrt the offset of the new interval. The new
   alignment should be consistent with the size of the value. *)
let realign ~offset ~new_offset rem modu =
  Rel.e_rem (Rel.add (Rel.sub_abs offset new_offset) rem) modu

(** plevel-related operation: value + hooks to call when the value is modified*)
let plevel = ref 200
let plevel_hook = ref []
let set_plevel i =
  List.iter (fun f -> f ()) !plevel_hook;
  plevel := i
let add_plevel_hook f = plevel_hook := f :: !plevel_hook
let get_plevel () = !plevel

let debug = false


module type Parameters = sig
  val approximation_feedback: bool
end

module Default_Parameters = struct
  let approximation_feedback = false
end

module Make
    (V : Offsetmap_lattice_with_isotropy.S)
    (Params: Parameters)
= struct

  open Format

  type v = V.t
  type widen_hint = V.widen_hint

  let empty = Empty
  (** All high-level functions of this module must handle a size of 0, in which
      case it is sometimes necessary to return Empty. In the current
      implementation, sizes 0 are handled by the outer (exported) functions,
      while the inner functions assume that the arguments [size] are
      strictly positive. *)

  let equal (t1:V.t offsetmap) (t2:V.t offsetmap) = t1 == t2

  let compare t1 t2 = match t1, t2 with
    | Empty, Empty -> 0
    | Empty, Node _ -> -1
    | Node _, Empty -> 1
    | Node (_, _, _, _, _, _, _, _, h1), Node (_, _, _, _, _, _, _, _, h2) ->
      Datatype.Int.compare h1 h2

  (* Does not depend on keys. Exported here for convenience for the users *)
  let size_from_validity = function
    | Base.Invalid -> `Bottom
    | Base.Empty -> `Value Int.zero
    | Base.Known (_, m)
    | Base.Unknown (_, _, m) -> `Value (Int.succ m)
    | Base.Variable { Base.max_allocable } -> `Value (Int.succ max_allocable)

  (** Pretty printing *)

  let pretty_offset_aux s curr_off ppf tree =
    if tree == Empty
    then Format.fprintf ppf "@[empty at %a@]" pretty_int curr_off
    else
      let rec pretty_offset s curr_off ppf tree =
        match tree with
        | Empty -> ()
        | Node (max, offl, subl, offr, subr, rem, modu, v, _) ->
          pretty_offset "" (curr_off +~ offl) ppf subl;
          Format.fprintf ppf "@[%s[%a..%a] -> (%a, %a, %a);@]@ "
            s
            pretty_int curr_off
            pretty_int (max +~ curr_off)
            Rel.pretty rem
            pretty_int modu
            V.pretty v;
          pretty_offset "" (curr_off +~ offr) ppf subr;
      in pretty_offset s curr_off ppf tree
  ;;

  let _pretty_offset fmt (off, t) =
    Format.fprintf fmt "@[<v><off: %a>@ %a@]"
      pretty_int off (pretty_offset_aux "r" off) t;
  ;;

  let pretty fmt t =
    Format.fprintf fmt "@[<v>%a@]" (pretty_offset_aux "r" Integer.zero) t;
  ;;

  let pretty_debug_offset fmt (curr_off, tree) =
    let rec aux_pdebug fmt (curr_off, tree) =
      match tree with
      | Empty -> Format.fprintf fmt "empty"
      | Node (max, offl, subl, offr, subr, rem, modu, v, tag) ->
        Format.fprintf fmt "@[<h 2>@[[%a..%a]@ (%a, %a,@ %a){%d,%x}@]@\n@[<h 2>-- \
                            %a -->@\n%a@]@\n@[<h 2>-- %a -->@\n%a@]@]"
          pretty_int curr_off
          pretty_int (curr_off +~ max)
          Rel.pretty rem
          pretty_int modu
          V.pretty v
          tag
          (Extlib.address_of_value tree)
          pretty_int offl
          aux_pdebug (curr_off +~ offl, subl)
          pretty_int offr
          aux_pdebug (curr_off +~ offr, subr)
    in
    aux_pdebug fmt (curr_off, tree);
    Format.fprintf fmt "@\n";
  ;;

  let pretty_debug fmt m = pretty_debug_offset fmt (Integer.zero, m);;


  include
    (struct

      (* This function is almost injective. Can we do better, eg. by mapping Empty
         to 0 and skipping this value for all nodes? And it is worth it? *)
      let hash = function
        | Empty -> 311
        | Node(_,_,_,_,_,_,_,_,tag) -> tag

      let rehash_ref = ref (fun _ -> assert false)
      module D = Datatype.Make
          (struct
            type t = V.t offsetmap
            let name = Printf.sprintf "Offsetmap(%s)" V.name
            let reprs = [ Empty ]
            open Structural_descr
            let r = Recursive.create ()
            let structural_descr =
              let p_bint = Datatype.Integer.packed_descr in
              t_sum
                [| [| p_bint;
                      p_bint;
                      recursive_pack r;
                      p_bint;
                      recursive_pack r;
                      p_bint;
                      p_bint;
                      V.packed_descr;
                      p_int |] |]
            let () = Recursive.update r structural_descr
            let equal = equal
            let hash = hash
            let compare = compare
            let rehash x = !rehash_ref x
            let copy = Datatype.undefined
            let pretty = pretty
            let mem_project = Datatype.never_any_project
          end)
      include D

      (* Basic operations on nodes *)
      let m_empty = Empty (* Empty is not exported, and we cannot make it private.
                             Instead, we use m_empty to track the places where we
                             create something empty *)
      let is_empty t = t == Empty

      let equal_internal t1 t2 =
        match t1, t2 with
        | Empty, Empty -> true
        | Node _, Empty | Empty, Node _ -> false
        | Node (max1, offl1, subl1, offr1, subr1, rem1, modu1, v1, _),
          Node (max2, offl2, subl2, offr2, subr2, rem2, modu2, v2, _)
          ->
          subl1 == subl2 &&
          subr1 == subr2 &&
          offl1 =~ offl2 &&
          offr1 =~ offr2 &&
          V.equal v1 v2 &&
          max1 =~ max2 &&
          Rel.equal rem1 rem2 &&
          modu1 =~ modu2

      let hash_internal t =
        match t with
          Empty -> 97
        | Node (max, offl, subl, offr, subr, rem, modu, v, _) ->
          let h = Integer.hash max in
          let h = 31 * h + Integer.hash offl in
          let h = 31 * h + hash subl in
          let h = 31 * h + Integer.hash offr in
          let h = 31 * h + hash subr in
          let h = 31 * h + Rel.hash rem in
          let h = 31 * h + Integer.hash modu in
          let h = 31 * h + V.hash v in
          h

      module NewoHashconsTbl =
        State_builder.Hashconsing_tbl
          (struct
            include D
            let hash_internal = hash_internal
            let equal_internal = equal_internal
            let initial_values = []
          end)
          (struct
            let name = name
            let dependencies = [ Ast.self ]
            let size = 137
          end)
      let () = Ast.add_monotonic_state NewoHashconsTbl.self

      let counter = ref 0

      let singleton_tag t =
        match t with
          Empty -> min_int
        | Node(_, _, _, _, _, _, _, _, tag) ->
          tag land min_int

      let nNode cur offl subl offr subr f g v =
        if debug then assert (Integer.ge cur Integer.zero);
        let current_counter = !counter in
        let tag =
          if V.cardinal_zero_or_one v
          then (singleton_tag subl) land (singleton_tag subr)
          else 0
        in
        let tag = tag lor current_counter in
        let tentative_new_node = Node(cur, offl, subl, offr, subr, f, g, v,tag) in
        let hashed_node = NewoHashconsTbl.merge tentative_new_node in
        if hashed_node == tentative_new_node
        then begin
          if current_counter = max_int
          then Kernel.fatal "Offsetmap(%s): internal maximum exceeded" V.name;
          counter := Stdlib.succ current_counter;
        end;
        hashed_node

      let rehash_node x = match x with
        | Empty -> Empty
        | Node _ ->
          NewoHashconsTbl.merge x

      let () = rehash_ref := rehash_node

    end :
     sig
       include Datatype.S with type t = V.t offsetmap

       val m_empty : t
       val hash: t -> int
       val nNode :
         Integer.t ->
         Integer.t -> t ->
         Integer.t -> t ->
         Rel.t -> Integer.t -> V.t ->
         t
       val is_empty : t -> bool
       val singleton_tag : t -> int
     end)

  module Cacheable = struct
    type t = Integer.t * V.t offsetmap
    let hash (i, t: t) = Integer.hash i + 37 * hash t
    let equal (i1, t1: t) (i2, t2: t) = t1 == t2 && i1 =~ i2
    let sentinel = Integer.minus_one, m_empty
  end
  let clear_caches_ref = ref []


  let get_vv node =
    match node with
    | Empty -> assert false
    | Node (_, _, _, _, _, rem, modu, v, _) -> rem, modu, v
  ;;

  let _get_v = function
    | Empty -> assert false
    | Node (_, _, _, _, _, _, _, v, _) ->
      v
  ;;

  let get_max = function
    | Empty -> assert false
    | Node (max, _, _, _, _, _, _, _, _) ->
      max
  ;;

  (* [is_above] provides a static ordering between two adjacent intervals. This
     is used to decide which interval goes on top of the other in an offsetmap,
     and thus governs the shape of the tree. As for patricia trees, this static
     hierarchy optimizes the merge of two offsetmaps.
     [min1..max1] and [min2..max2] must be two adjacent non-overlapping
     intervals. Then:
     - the interval containing 0, if any, is put at the top;
     - otherwise, the interval containing the multiple of the largest power of 2
       is put at the top.
       This ordering of adjacent intervals is an invariant of the offsetmaps. *)
  let is_above min1 max1 min2 max2 =
    if min1 <=~ Integer.zero && max1 >=~ Integer.zero then true
    else if min2 <=~ Integer.zero && max2 >=~ Integer.zero then false
    else
      let signature_interval min max =
        Integer.logxor (pred min) max
      in
      signature_interval min1 max1 >~ signature_interval min2 max2


  (** Zippers : Offset of a node * Node * continuation of the zipper *)
  type zipper =
    | End
    | Right of Integer.t * t * zipper
    | Left of Integer.t * t * zipper;;

  exception End_reached;;
  exception Empty_tree;;

  let _pr_zipper ppf z  =
    printf "[Zipper]---@.";
    let rec aux ppf = function
      | End -> printf "@ E@."
      | Right (o, Node(max, _, _, _, _subr, _, _, _, _),z ) ->
        fprintf ppf "@[<h 2> [%a,%a] R@\n%a@]"
          pretty_int o
          pretty_int (o +~ max)
          aux z
      | Left (o, Node(max, _, _, _, _subr, _, _, _, _),z ) ->
        fprintf ppf "@[<h 2> [%a,%a] L@\n%a@]"
          pretty_int o
          pretty_int (o +~ max)
          aux z
      |  Right (_, Empty, _) | Left (_, Empty, _) -> assert false
    in aux ppf z;
    printf "[/Zipper]---@.@.";
  ;;

  (** Returns an absolute position and an associated new tree *)
  let rec rezip zipper curr_off node =
    match zipper with
    | End -> curr_off, node
    | Right (offset, Node(max, offl, subl, _offr, _subr, rem, modu, v, _), z)
      ->
      rezip z offset
        (nNode max offl subl (curr_off -~ offset) node rem modu v)
    | Left (offset, Node(max, _offl, _subl, offr, subr, rem, modu, v, _), z)
      ->
      rezip z offset
        (nNode max (curr_off -~ offset) node offr subr rem modu v)
    | Right (_, Empty, _) | Left (_, Empty, _) -> assert false
  ;;

  (** Returns an absolute position, a node and a zipper *)
  let rec leftmost_child curr_off zipper node =
    match node with
    | Empty -> raise Empty_tree
    | Node (_, _, Empty, _, _, _, _, _, _) -> curr_off, node, zipper
    | Node (_, offl, subl, _, _, _, _, _, _) ->
      let new_offset = curr_off +~ offl in
      leftmost_child new_offset (Left (curr_off, node, zipper)) subl
  ;;

  (** Returns an absolute position, a node and a zipper *)
  let rec rightmost_child curr_off zipper node =
    match node with
    | Empty -> raise Empty_tree
    | Node (_, _, _, _, Empty, _, _, _, _) -> curr_off, node, zipper
    | Node (_, _offl, _subl, offr, subr, _, _, _, _) ->
      let new_offset = curr_off +~ offr in
      rightmost_child new_offset (Right (curr_off, node, zipper)) subr
  ;;

  (** Move to the right of the current node.
      Uses a zipper for that.
  *)
  let move_right curr_off node zipper =
    match node with
    | Node (_, _, _, offr, ((Node _ ) as subr), _, _, _, _) ->
      let new_offset = curr_off +~ offr in
      leftmost_child new_offset (Right (curr_off, node, zipper)) subr
    | Node (_, _, _, _, Empty, _, _, _, _) ->
      begin
        let rec unzip_until_left zipper =
          match zipper with
          | End -> raise End_reached
          | Right (_, _, z) -> unzip_until_left z
          | Left (offset, tree, z) -> offset, tree, z
        in unzip_until_left zipper
      end
    | Empty -> assert false
  ;;

  type imp_zipper = {
    mutable offset: Integer.t;
    mutable node: t;
    mutable zipper: zipper;
  };;

  let imp_move_right imp_z =
    let o, n, z = move_right imp_z.offset imp_z.node imp_z.zipper in
    imp_z.offset <- o;
    imp_z.node <- n;
    imp_z.zipper <- z;
  ;;

  (* Minimum and maximum bit bounds in the offsetmap (inclusively), assuming
     that [m] starts at [curr_off]. Usually not required, as we use [validity]
     arguments, that give the size of the offsetmap. Beware that this function
     must not be called on empty offsetmaps. *)
  let bounds_offset curr_off m =
    let rec min curr_off = function
      | Empty -> curr_off (* This bit is bound, unless [m] itself is empty *)
      | Node (_, offl, subl, _, _, _, _, _, _) -> min (curr_off +~ offl) subl
    and max curr_off = function
      | Empty -> pred curr_off (* [curr_off] is not bound, [curr_off-1] is. *)
      | Node (_, _, _, offr, subr, _, _, _, _) -> max (curr_off +~ offr) subr
    in
    assert (m != Empty);
    (min curr_off m, max curr_off m)

  let _bounds m = bounds_offset Int.zero m

  (** Folding and iterating from the leftmost node to the rightmost one
      If t =  n0         fold f t i = f n2 (f n0 (f n1 i))
             / \         iter f t   = f n1; fn0; f n2;
            n1  n2
  *)
  let fold_offset f o t acc =
    if t = Empty then
      acc
    else
      let o, n, z = leftmost_child o End t in
      let rec aux_fold o t z pre =
        match t with
        | Empty -> pre
        | Node (max, _, _, _, _, r, m, v, _) ->
          let abs_max = max +~ o in
          let now = f (o, abs_max) (v, m, r) pre in
          match move_right o t z with
          | no, nt, nz -> aux_fold no nt nz now
          | exception End_reached -> now
      in
      aux_fold o n z acc
  ;;

  let fold f t = fold_offset f Integer.zero t
  ;;

  let iter_offset f o t =
    if t <> Empty then
      let o, n, z = leftmost_child o End t in
      let rec aux_iter o t z =
        match t with
        | Empty -> ()
        | Node (max, _, _, _, _, r, m, v, _) ->
          let abs_max = max +~ o in
          f (o, abs_max) (v, m, r);
          match move_right o t z with
          | no, nt, nz -> aux_iter no nt nz
          | exception End_reached -> ()
      in
      aux_iter o n z
  ;;

  let iter f t = iter_offset f Integer.zero t
  ;;

  (* Same as iter, but does not compute offsets (hence more efficient). *)
  let rec iter_on_values f t =
    match t with
    | Empty -> ()
    | Node (_, _, left, _, right, _, _, v, _) ->
      iter_on_values f left;
      f v;
      iter_on_values f right
  ;;

  let rec fold_on_values f t acc =
    match t with
    | Empty -> acc
    | Node (_, _, left, _, right, _, _, v, _) ->
      fold_on_values f right (f v ((fold_on_values f left acc)))
  ;;

  (* Two adjacent nodes can be merged into one when:
     - they contains the same value of the same size (thus repeated with the
       same modulo) and the same alignment wrt the offset of the left node
       (thus the alignment of the value in the right node must be converted
       wrt the left offset).
     - and the offset of the right node is aligned with the repeated value:
       the separation does not cut the value, and can safely be removed.
       Otherwise, a separation that cuts a value can only be removed if the
       concretization of the value is a singleton, ensuring that the two parts
       of the value are always consistent.  *)
  let are_mergeable_nodes ~left_offset ~left ~right_offset ~right =
    let lrem, lmodu, lv = left
    and rrem, rmodu, rv = right in
    V.equal lv rv && lmodu =~ rmodu &&
    let new_rrem =
      realign ~offset:right_offset ~new_offset:left_offset rrem rmodu
    in
    Rel.equal new_rrem lrem &&
    (Rel.is_zero rrem || V.cardinal_zero_or_one lv)

  (** Smart constructor for nodes:
      it glues the node being allocated to potential candidates if needed
      (i.e. leftmost node of right subtree and rightmost node of left subtree),
  *)
  let make_node curr_off max offl subl offr subr rem modu v =
    let rem, modu =
      if V.is_isotropic v
      then Rel.zero, Integer.one
      else rem, modu
    in
    let curr_vv = (rem, modu, v) in
    let max, offr, subr =
      try
        let offset, nr, zr = leftmost_child (curr_off +~ offr) End subr in
        match nr with
        | Node (nmax, _, nsubl , noffr, nsubr, nrem, nmodu, nv, _) ->
          assert (is_empty nsubl);
          let right = nrem, nmodu, nv in
          if are_mergeable_nodes
              ~left_offset:curr_off ~left:curr_vv ~right_offset:offset ~right
          then
            begin
              let curr_offr, new_subr = rezip zr (offset +~ noffr) nsubr in
              let new_max = succ (max +~ nmax) in
              let new_offr = curr_offr -~ curr_off
              in
              new_max, new_offr, new_subr
            end
          else max, offr, subr
        | Empty -> assert false
      with Empty_tree -> max, offr, subr
    in
    if debug then assert (Integer.ge max Integer.zero);
    let curr_off, max, rem, offl, subl, offr =
      try
        let offset, nl, zl =
          rightmost_child (curr_off +~ offl) End subl in
        match nl with
        | Node (nmax, noffl, nsubl , _, noffr, nrem, nmodu, nv, _) ->
          assert (is_empty noffr);
          let left = nrem, nmodu, nv in
          if are_mergeable_nodes
              ~left_offset:offset ~left ~right_offset:curr_off ~right:curr_vv
          then (
            let new_curr_offl, new_subl = rezip zl (offset +~ noffl) nsubl in
            let succ_nmax = succ nmax in
            let lmax = max +~ succ_nmax in
            let new_offl = new_curr_offl -~ offset in
            let new_offr = offr +~ succ_nmax in
            let new_coff = curr_off -~ succ_nmax in
            let rem = realign ~offset:curr_off ~new_offset:offset rem modu in
            (*assert (new_coff =~ offset);*)
            new_coff, lmax, rem, new_offl, new_subl, new_offr)
          else curr_off, max, rem, offl, subl, offr
        |Empty -> assert false
      with Empty_tree -> curr_off, max, rem, offl, subl, offr
    in
    curr_off, nNode max offl subl offr subr rem modu v
  ;;

  (* Creates the tree representing the interval [O..span], bound to [v] *)
  let interval_aux span rem modu v =
    let rem, modu =
      if V.is_isotropic v
      then Rel.zero, Integer.one
      else rem, modu
    in
    nNode span Integer.zero m_empty (succ span) m_empty rem modu v

  (* creates a fresh tree that binds [0..size-1] to the isotropic value [v].
     if [size] if 0, returns [Empty]. *)
  let isotropic_interval size v =
    if Int.(equal size zero) then Empty
    else
      nNode (pred size) Integer.zero m_empty size m_empty Rel.zero Integer.one v

  (** Smart add node:
      Adds a node to the current tree and merges (new) consecutive intervals
      containing the same values
      The node is [min..max] rem, modu, v and
      the tree to which it is added is rooted at offset curr_off
      Hypothesis: the tree is in canonical form w.r.t having no
      mergeable intervals.
  *)
  let add_node ~min ~max rem modu v curr_off tree =
    if debug then assert (min <=~ max);
    let rec aux_add curr_off tree =
      match tree with
      | Empty ->  min, interval_aux (max -~ min) rem modu v
      | Node (nmax, noffl, nsubl, noffr, nsubr, nrem, nmodu, nv, _) ->
        let abs_min = curr_off
        and abs_max = nmax +~ curr_off in
        if max <~ abs_min then
          begin
            if is_above min max abs_min abs_max then
              let new_offr = abs_min -~ min in
              (*Format.printf "add to the left above@."; *)
              make_node min (max -~ min) Integer.zero m_empty
                new_offr tree rem modu v
            else
              begin
                (*     Format.printf "L@ co:%a@ t:%a@ [%a...%a]@.@."
                       pretty_int curr_off
                       (pretty_offset curr_off) tree
                       pretty_int min pretty_int max
                       ; *)
                let new_curr_offl, new_node =
                  aux_add (curr_off +~ noffl) nsubl
                in
                let new_offl = new_curr_offl -~ curr_off in
                make_node
                  curr_off nmax new_offl new_node noffr nsubr nrem nmodu nv
              end
          end
        else
          begin
            if is_above min max abs_min abs_max then
              begin
                let new_offl = abs_min -~ min in
                let new_max = max -~ min in
                make_node
                  min new_max new_offl tree (succ new_max) m_empty rem modu v
              end
            else
              begin
                (*           Format.printf "add to the right Not ABOVE@."; *)
                let new_curr_offr, new_node =
                  aux_add (curr_off +~ noffr) nsubr
                in
                let new_offr = new_curr_offr -~ abs_min in
                make_node abs_min nmax noffl nsubl new_offr new_node nrem
                  nmodu nv
              end
          end

    in aux_add curr_off tree
  ;;

  (* Bind the interval [min..max] to [v], and append it to the zero-rooted
     map [t]. [rem] and [modu] are inferred by considering that [min..max] binds
     a single value (unless [v] is isotropic) *)
  let append_basic_itv ~min ~max ~v m =
    if V.is_isotropic v then
      snd (add_node ~min ~max Rel.zero Integer.one v Integer.zero(*co*) m)
    else
      let size = Integer.length min max in
      let v = V.anisotropic_cast ~size v in
      snd (add_node ~min ~max Rel.zero size v Integer.zero(*co*) m)

  (** Checks that [tree] is sanely built  *)
  let rec check_aux curr_off tree =
    match tree with
    | Empty -> ()
    | Node (max, offl, subl, offr, subr, rem, modu, _v, _) ->
      assert (Rel.check ~rem ~modu);
      assert (not (is_empty subl) || Integer.is_zero offl);
      assert (not (is_empty subr) || offr =~ succ max);
      let abs_min = curr_off
      and abs_max = curr_off +~ max in
      let aux offset tree =
        match tree with
        | Empty -> ()
        | Node (nmax, _, _, _, _, _, _, _, _) ->
          let nabs_min = curr_off +~ offset in
          let nabs_max = nmax +~ nabs_min in
          assert (is_above abs_min abs_max nabs_min nabs_max)
      in aux offl subl; aux offr subr;
      check_aux (curr_off +~ offl) subl;
      check_aux (curr_off +~ offr) subr;
  ;;

  let _check curr_off tree =
    try check_aux curr_off tree
    with Assert_failure _ as e ->
      Kernel.error "INVALID@.%a@." _pretty_offset (curr_off, tree);
      raise e


  (** Inclusion functions *)

  (* Auxiliary function for inclusion: check that, between [mabs_min] and
     [mabs_max], the values (r1, m1, v1) and (r2, m2, v2), respectively
     bound between (amin1, amax1) and (amin2, amax2), are included. *)
  let is_included_nodes_values (amin1 : Integer.t) (amax1 : Integer.t) r1 m1 v1 amin2 amax2 r2 m2 v2 mabs_min mabs_max =
    if V.is_isotropic v1 || V.is_isotropic v2 then
      V.is_included v1 v2
    else
      let max_test =
        if amax1 <~ amax2
        then (succ mabs_max) %~ m1 =~ r1
        else true
      in
      let ok_min = amin1 =~ amin2 || mabs_min %~ m1 =~ r1
      and ok_max = amax1 =~ amax2 || max_test
      in
      if r1 =~ r2 && m1 =~ m2 && ok_min && ok_max
      then V.is_included v1 v2
      else false

  (* Functional for inclusion test. For this function, the equality
     [bounds o1 t1 = bounds o2 t2] does not need to hold. We test the inclusion
     for the range that is common to both trees. *)
  let is_included_aux_cache cache (o1, t1) (o2, t2) =
    match t1, t2 with
    | Empty, _ | _, Empty ->
      true (* no common range. By definition, the inclusion holds *)
    | Node (max1, offl1, subl1, offr1, subr1, r1rel, m1, v1, _),
      Node (max2, offl2, subl2, offr2, subr2, r2rel, m2, v2, _) ->
      let amin1 = o1 in
      let amax1 = max1 +~ o1 in
      let amin2 = o2 in
      let amax2 = max2 +~ o2 in
      let ol1 = o1 +~ offl1 in
      let ol2 = o2 +~ offl2 in
      let or1 = o1 +~ offr1 in
      let or2 = o2 +~ offr2 in
      let r1 = (Rel.add_abs o1 r1rel) %~ m1 in
      let r2 = (Rel.add_abs o2 r2rel) %~ m2 in
      if amax1 <~ amin2  then
        cache (o1, t1) (ol2, subl2) &&
        cache (or1, subr1) (o2, t2)
      else if amin1 >~ amax2 then
        cache (o1, t1) (or2, subr2) &&
        cache (ol1, subl1) (o2, t2)
      else begin (* this node of t2 covers part of the interval of t1 we are
                    focused on *)
        if amin1 =~ amin2 then
          let mabs_min = amin1 in
          begin
            (if amax1 =~ amax2 then begin
                (if (r1 =~ r2 && m1 =~ m2) ||
                    V.is_isotropic v1 || V.is_isotropic v2
                 then V.is_included v1 v2
                 else false)
                &&
                cache (or1, subr1) (or2, subr2)
              end
             else if amax1 >~ amax2 then begin
               is_included_nodes_values
                 amin1 amax1 r1 m1 v1
                 amin2 amax2 r2 m2 v2 mabs_min amax2
               &&
               cache (o1, t1) (or2, subr2)
             end
             else
               begin (* amax1 <~ amax2 *)
                 is_included_nodes_values
                   amin1 amax1 r1 m1 v1
                   amin2 amax2 r2 m2 v2 mabs_min amax1
                 &&
                 cache (or1, subr1) (o2, t2)
               end
            ) &&
            cache (ol1, subl1) (ol2, subl2)
          end
        else
          (* treat the common interval and the right parts of the trees.
             The common interval starts at [mabs_min] and goes up to
             [min amax1 amax2]. *)
          let treat_current_right_nodes mabs_min =
            if amax1 =~ amax2 then begin
              is_included_nodes_values
                amin1 amax1 r1 m1 v1
                amin2 amax2 r2 m2 v2 mabs_min amax1
              &&
              cache (or1, subr1) (or2, subr2)
            end
            else if amax1 >~ amax2 then begin
              is_included_nodes_values
                amin1 amax1 r1 m1 v1
                amin2 amax2 r2 m2 v2 mabs_min amax2
              &&
              cache (o1, t1) (or2, subr2)
            end
            else
              begin (* amax1 <~ amax2 *)
                is_included_nodes_values
                  amin1 amax1 r1 m1 v1
                  amin2 amax2 r2 m2 v2 mabs_min amax1
                &&
                cache (or1, subr1) (o2, t2)
              end;
          in
          (* Find the beginning of the common part of the two intervals (ie.
             [mabs_min] above, which is by definition [max amin1 amin2]), and
             treat this interval and the right trees. Then, check the inclusion
             of the subtree that starts just before [mabs_min] with the
             entire other tree. *)
          if amin1 >~ amin2 then begin
            treat_current_right_nodes amin1 &&
            cache (ol1, subl1) (o2, t2)
          end
          else begin (* amin1 <~ amin2 *)
            treat_current_right_nodes amin2 &&
            cache (o1, t1) (ol2, subl2)
          end
      end
  ;;

  module IsIncludedCache = Binary_cache.Binary_Predicate(Cacheable)(Cacheable)
  let () = clear_caches_ref := IsIncludedCache.clear :: !clear_caches_ref;;

  let rec is_included_aux t1 t2 =
    Cacheable.equal t1 t2 ||
    is_included_aux_cache (IsIncludedCache.merge is_included_aux) t1 t2

  let is_included t1 t2 =
    is_included_aux (Integer.zero, t1) (Integer.zero, t2)
  ;;

  (** Joins two trees with no overlapping intervals.  *)

  let rec union t1_curr_off t1 t2_curr_off t2 =
    (* Format.printf "Union t1:%a t2:%a@."
       (pretty_offset t1_curr_off) t1
       (pretty_offset t2_curr_off) t2;
    *)
    match t1, t2 with
    | Empty, Empty ->
      assert (t1_curr_off =~ t2_curr_off);
      t1_curr_off, t1
    | Empty, Node _ -> t2_curr_off, t2
    | Node _, Empty -> t1_curr_off, t1
    | Node (lmax, loffl, lsubl, loffr, lsubr, lrem, lmodu, lv, _),
      Node (rmax, roffl, rsubl, roffr, rsubr, rrem, rmodu, rv, _) ->
      let labs_min = t1_curr_off
      and labs_max = lmax +~ t1_curr_off
      and rabs_min = t2_curr_off
      and rabs_max = rmax +~ t2_curr_off
      in
      if is_above labs_min labs_max rabs_min rabs_max
      then
        (* t2 is on the right of t1 *)
        let new_curr_offr, new_subr =
          union (t1_curr_off +~ loffr) lsubr t2_curr_off t2
        in
        make_node t1_curr_off lmax loffl lsubl
          (new_curr_offr -~ t1_curr_off) new_subr lrem lmodu lv
      else
        begin
          (* t1 is on the left of t2 *)
          (*            assert (is_above rabs_min rabs_max labs_min labs_max); *)
          let new_curr_offl, new_subl =
            union t1_curr_off t1 (t2_curr_off +~ roffl) rsubl
          in
          make_node t2_curr_off rmax
            (new_curr_offl -~ t2_curr_off) new_subl roffr rsubr
            rrem rmodu rv
        end
  ;;

  (** Merge two trees that span the same range. This function is a functional:
      [cache] must be used for recursive calls on subtrees.
      [f_aux] is the function that merges the intervals point-wise. *)
  let merge cache f_aux (o1, t1) (o2, t2) =
    if debug then (* the two trees must span the exact same range. *)
      assert ((t1 == Empty && t2 == Empty && o1 =~ o2) ||
              let ib1, ie1 = bounds_offset o1 t1 in
              let ib2, ie2 = bounds_offset o2 t2 in
              ib1 =~ ib2 && ie1 =~ ie2);
    match t1, t2 with
    | Empty, Empty -> o1, t1
    | Node _, Empty -> assert false
    | Empty, Node _ -> assert false
    | Node (max1, offl1, subl1, offr1, subr1, rem1, modu1, v1, _),
      Node (max2, offl2, subl2, offr2, subr2, rem2, modu2, v2, _) ->
      let abs_min1 = o1
      and abs_max1 = max1 +~ o1
      and abs_min2 = o2
      and abs_max2 = max2 +~ o2
      in
      if debug then assert (abs_min2 <=~ abs_max1 && abs_min1 <=~ abs_max2);
      (* here n1 \inter n2 <> \emptyset, given the invariants on offsetmaps
         shape and the fact that both trees cover the same range.
         - compute the intersection interval: middle_abs_min, middle_abs_max
         - recompute the alignment of the values wrt middle_abs_min
             (named middle_rem1 and middle_rem2)
         - add the rest of the nodes to their left/right subtree
           depending on the size of the node
         - add the new node in the merged left subtree
           and plug the merged right tree in
      *)
      let (curr_offl, left_t), middle_abs_min, middle_rem1, middle_rem2 =
        let abs_offl1 = o1 +~ offl1
        and abs_offl2 = o2 +~ offl2 in
        if abs_min1 =~ abs_min2  then
          cache (abs_offl1, subl1) (abs_offl2, subl2), abs_min1, rem1, rem2
        else if abs_min1 <~ abs_min2 then
          let new_offl1, new_subl1 =
            add_node ~min:abs_min1 ~max:(pred abs_min2)
              rem1 modu1 v1 abs_offl1 subl1
          in
          let new_rem1 = realign ~offset:o1 ~new_offset:o2 rem1 modu1 in
          cache (new_offl1, new_subl1) (abs_offl2, subl2),
          abs_min2, new_rem1, rem2
        else
          begin (* abs_min1 >~ abs_min2 *)
            let new_offl2, new_subl2 =
              add_node ~min:abs_min2 ~max:(pred abs_min1) rem2 modu2
                v2 abs_offl2 subl2
            in
            let new_rem2 = realign ~offset:o2 ~new_offset:o1 rem2 modu2 in
            cache (abs_offl1, subl1) (new_offl2, new_subl2),
            abs_min1, rem1, new_rem2
          end
      in
      let (curr_offr, right_t), middle_abs_max =
        let abs_offr1 = o1 +~ offr1
        and abs_offr2 = o2 +~ offr2 in
        if abs_max1 =~ abs_max2 then
          cache (abs_offr1, subr1) (abs_offr2, subr2), abs_max1
        else if abs_max1 <~ abs_max2 then
          let min = succ abs_max1 in
          let rem2 = realign ~offset:o2 ~new_offset:min rem2 modu2 in
          let new_offr2, new_subr2 =
            add_node ~min ~max:abs_max2 rem2 modu2 v2 abs_offr2 subr2
          in
          cache (abs_offr1, subr1) (new_offr2, new_subr2), abs_max1
        else
          begin (* abs_max1 >~ abs_max2 *)
            let min = succ abs_max2 in
            let rem1 = Rel.e_rem (Rel.add (Rel.sub_abs o1 min) rem1) modu1 in
            let new_offr1, new_subr1 =
              add_node ~min ~max:abs_max1 rem1 modu1 v1 abs_offr1 subr1
            in
            cache (new_offr1, new_subr1) (abs_offr2, subr2), abs_max2
          end
      in
      let rem, modu, v =
        f_aux middle_abs_min
          middle_abs_max middle_rem1 modu1 v1 middle_rem2 modu2 v2
      in
      let curr_offl, left_t =
        add_node ~min:middle_abs_min ~max:middle_abs_max
          rem modu v curr_offl left_t
      in union curr_offl left_t curr_offr right_t
  ;;

  let rec map_on_values_aux f curr_off t =
    match t with
    | Empty -> curr_off, t
    | Node (max, offl, subl, offr, subr, rem, modu, v, _) ->
      let v' = f v in
      let offl', l' = map_on_values_aux f (curr_off +~ offl) subl in
      let offr', r' = map_on_values_aux f (curr_off +~ offr) subr in
      if l' == subl && r' == subr && V.equal v v'
      then curr_off, t
      else
        make_node
          curr_off max (offl' -~ curr_off) l' (offr' -~ curr_off) r' rem modu v'
  ;;

  let map_on_values f t = snd (map_on_values_aux f Int.zero t);;

  let extract_bits ~start ~stop ~modu v =
    assert (start <=~ stop && stop <=~ modu);
    let start,stop =
      if Machine.little_endian () then
        start,stop
      else
        let mmodu = pred modu in
        mmodu -~ stop, mmodu -~ start
    in
    V.extract_bits ~start ~stop ~size:modu v
  ;;

  let merge_bits ~topify ~conflate_bottom ~offset ~length ~value ~total_length acc =
    assert (length +~ offset <=~ total_length);
    let offset =
      if Machine.little_endian () then
        offset
      else
        Int.sub (Int.sub total_length offset) length
    in
    let value = V.shift_bits ~topify ~size:length ~offset value in
    V.merge_distinct_bits ~topify ~conflate_bottom value acc
  ;;

 (*
   [offset] is the offset where the read has begun (ie the global read start).
   [size] is the total size we want to read from [offset].
   [curr_off] and [(rem, modu, v)] refer to the current node to be read.
   [acc] is the current state of accumulated reads.
 *)
  let extract_bits_and_stitch ~topify ~conflate_bottom ~offset ~size curr_off (rem, modu, v) max acc =
    let rem = (Rel.add_abs curr_off rem) %~ modu in
    let r =
      let abs_max = curr_off +~ max in
      (*  last bit to be read,
          be it in the current node or one of its successors *)
      let max_bit = pred (offset +~ size) in
      (* for this function, [min >= offset && min >= curr_off] holds *)
      let extract_single_step min acc =
        assert (not (V.is_isotropic v));
        let interval_offset = min -~ offset in
        let start = (min -~ rem) %~ modu in
        let modu_end = if rem =~ Integer.zero then pred modu else pred rem in
        (* where do we stop reading ?
           either at the end of the current slice (round_up_to_r min) or
           at the end of the interval (abs_max)
        *)
        let read_end =
          Integer.min
            (Integer.min (Integer.round_up_to_r ~min ~r:modu_end ~modu) abs_max)
            max_bit
        in
        let stop = (read_end -~ rem) %~ modu in
        (*       Format.printf "Single step: interval offset %a length %a \
                 start %a stop %a total length %a offset %a max bit %a\
                 @\n current offset %a Rem %a modu %a V %a@."
                 pretty_int interval_offset pretty_int (Integer.length start stop)
                 pretty_int start pretty_int stop pretty_int size
                 pretty_int offset pretty_int max_bit
                 pretty_int curr_off pretty_int rem pretty_int modu V.pretty v ; *)
        (* we ignore the 'inform' information here (and everywhere else in
           this module, since we do not propagate it), because it is mostly
           redundant with the 'origin' information in garbled mix *)
        let _inform, read_bits = extract_bits ~topify ~start ~stop ~modu v in
        (* Format.printf "After single step: read bits %a@." V.pretty read_bits; *)
        let result =
          merge_bits ~topify ~conflate_bottom
            ~offset:interval_offset ~length:(Integer.length start stop)
            ~value:read_bits ~total_length:size acc
        in
        (* Format.printf "After merge_bits: result %a@." V.pretty result; *)
        read_end, result
      in
      let start = Integer.max offset curr_off
      and stop = Integer.min max_bit abs_max in
      if V.is_isotropic v then
        let offset = start -~ offset in
        merge_bits ~topify ~conflate_bottom
          ~offset ~length:(Integer.length start stop)
          ~value:v ~total_length:size acc
      else
        let start_point = ref start in
        let acc = ref acc in
        while !start_point <=~ stop do
          let read_end, result = extract_single_step !start_point !acc in
          acc := result;
          start_point := succ read_end;
        done;
        !acc;
    in
    (* Format.printf "extract_bits_and_stitch istart@ %a@ size %a\
       coff %a abs_max -- val %a@\n  acc %a res %a@."
       pretty_int offset pretty_int size pretty_int curr_off
       (\* pretty_int (curr_off +~ (get_max node)) *\)
       V.pretty v  V.pretty acc V.pretty r; *)
    r
  ;;


  (** Auxiliary function to join 2 trees with {!merge} above. The merge on two
      values is done by [merge_v]. Since this function can be [V.widen], the
      left/right order of arguments must be preserved. When [merge_v] is
      narrow, it is important that [extract_bits_and_stitch] be canonical
      enough -- or that {!V.narrow} handles differences in representations
      soundly. *)
  let f_aux_merge_generic merge_v abs_min abs_max rem1 modu1 v1 rem2 modu2 v2 =
    if Rel.equal rem1 rem2 && modu1 =~ modu2
    then
      rem1, modu1, V.anisotropic_cast ~size:modu1 (merge_v modu1 v1 v2)
      (*  Format.printf "f_aux_merge: [%a, %a]@.(%a %a %a)@.(%a %a %a)@."
          pretty_int abs_min pretty_int abs_max pretty_int rem1 pretty_int
          modu1 V.pretty v1 pretty_int rem2 pretty_int modu2 V.pretty v2 ; *)
    else
      let topify = Origin.Merge in
      let offset = abs_min in
      let size = Integer.length abs_min abs_max in
      let v1_fit = modu1 =~ size && Rel.is_zero rem1
      and v2_fit = modu2 =~ size && Rel.is_zero rem2 in
      let v1', v2' =
        if (V.is_isotropic v1 || v1_fit) && (V.is_isotropic v2 || v2_fit)
        then v1, v2
        else
          let reinterpret_bits x =
            extract_bits_and_stitch ~topify ~conflate_bottom:false
              ~offset ~size offset x abs_max V.merge_neutral_element
          in
          reinterpret_bits (rem1, modu1, v1),
          reinterpret_bits (rem2, modu2, v2)
      in
      (* The values were already aligned with the offset or have been
         reinterpreted, so the alignment is always zero here. *)
      let rem = Rel.zero in
      (*     Format.printf "1: (%a, %a, %a);@.2: (%a, %a, %a);@.[%a--%a] -> %a/%a@."
             pretty_int rem1 pretty_int modu1 V.pretty v1
             pretty_int rem2 pretty_int modu2 V.pretty v2
             pretty_int abs_min pretty_int abs_max
             V.pretty v1' V.pretty v2'; *)
      rem, size, merge_v size v1' v2'
  ;;

  (* similar to [f_aux_merge_generic], but we perform a reinterpretation in
     all cases. This is to ensure that [V.narrow] can be applied soundly. *)
  let f_aux_merge_narrow merge_v abs_min abs_max rem1 modu1 v1 rem2 modu2 v2 =
    let topify = Origin.Merge in
    let offset = abs_min in
    let size = Integer.length abs_min abs_max in
    let v1' =
      extract_bits_and_stitch ~topify ~conflate_bottom:false
        ~offset ~size offset (rem1, modu1, v1) abs_max V.merge_neutral_element
    in
    let v2' =
      extract_bits_and_stitch ~topify ~conflate_bottom:false
        ~offset ~size offset (rem2, modu2, v2) abs_max V.merge_neutral_element
    in
    Rel.zero, size, (merge_v size v1' v2': v)
  ;;


  (** More efficient version of {!f_aux_merge_generic}, specialized for
      join-like functions. When one of the values is isotropic, we do not
      concretize the other one with {!extract_stitch_and_bits}. Instead,
      we implicitly "extend" the isotropic value to the full range,
      and merge on the whole range. This does not work with narrow, because
      [narrow {0} {1,2}] on the first bit is {0}, but the intersection
      of the two sets is bottom. *)
  let f_aux_merge_join merge_v abs_min abs_max rem1 modu1 v1 rem2 modu2 v2 =
    let joined size v1 v2 = V.anisotropic_cast ~size (merge_v size v1 v2) in
    if V.is_isotropic v2 then
      rem1, modu1, joined modu1 v1 v2
    else if V.is_isotropic v1 then
      rem2, modu2, joined modu2 v1 v2
    else
      f_aux_merge_generic merge_v abs_min abs_max rem1 modu1 v1 rem2 modu2 v2
  ;;


  module JoinCache = Binary_cache.Symmetric_Binary(Cacheable)(Cacheable)
  let () = clear_caches_ref := JoinCache.clear :: !clear_caches_ref;;

  (** Joining two trees that cover the same range *)
  let join t1 t2 =
    let f_join = f_aux_merge_join (fun _size v1 v2 -> V.join v1 v2) in
    let rec aux_cache t1 t2 =
      if Cacheable.equal t1 t2 then t1
      else JoinCache.merge (merge aux_cache f_join) t1 t2
    in
    let _, r = aux_cache (Integer.zero, t1) (Integer.zero, t2) in
    r
  ;;

  module Make_Narrow(X: sig
      include Lattice_type.With_Top with type t := V.t
      include Lattice_type.With_Narrow with type t := V.t
    end) =
  struct

    module NarrowCache = Binary_cache.Symmetric_Binary(Cacheable)(Cacheable)
    module NarrowReinterpretCache =
      Binary_cache.Symmetric_Binary(Cacheable)(Cacheable)
    let () = clear_caches_ref :=
        NarrowReinterpretCache.clear :: NarrowCache.clear :: !clear_caches_ref;;

    let is_top = function
      | Node (_, _, Empty, _, Empty, _ , _, v, _) -> V.equal v X.top
      | _ -> false

    (** Narrowing two trees that cover the same range *)
    let narrow t1 t2 =
      let f_join = f_aux_merge_generic (fun _size v1 v2 -> X.narrow v1 v2) in
      let rec aux_cache t1 t2 =
        if Cacheable.equal t1 t2 || is_top (snd t2) then t1
        else if is_top (snd t1) then t2
        else NarrowCache.merge (merge aux_cache f_join) t1 t2
      in
      let _, r = aux_cache (Integer.zero, t1) (Integer.zero, t2) in
      r
    ;;

    let narrow_reinterpret t1 t2 =
      let f_join = f_aux_merge_narrow (fun _size v1 v2 -> X.narrow v1 v2) in
      let rec aux_cache t1 t2 =
        if Cacheable.equal t1 t2 || is_top (snd t2) then t1
        else if is_top (snd t1) then t2
        else NarrowReinterpretCache.merge (merge aux_cache f_join) t1 t2
      in
      let _, r = aux_cache (Integer.zero, t1) (Integer.zero, t2) in
      r
    ;;

  end

  let widen ?hint t1 t2 =
    (* Due to the way f_aux_merge is designed, we can obtain intervals on which
       the two bindings do not verify [is_included v1 v2]. The widening
       operations require this, so we correct the arguments here. *)
    let widen size v1 v2 =
      let v2 = if not (V.is_included v1 v2) then V.join v1 v2 else v2 in
      V.widen ~size ?hint v1 v2
    in
    let f_widen = f_aux_merge_join widen in
    let rec aux t1 t2 =
      if Cacheable.equal t1 t2 then t1
      else merge aux f_widen t1 t2
    in
    let _, r = aux (Integer.zero, t1) (Integer.zero, t2) in
    r
  ;;


  type map2_decide =
      ReturnLeft | ReturnRight | ReturnConstant of V.t | Recurse

  let map2_on_values_offset cache decide (f: V.t -> V.t -> V.t) =
    let merge_cache =
      match cache with
      | Hptmap_sig.PersistentCache _ | Hptmap_sig.TemporaryCache _ ->
        let module Map2Cache =
          Binary_cache.Arity_Two(Cacheable)(Cacheable)(Cacheable)
        in
        (match cache with
         | Hptmap_sig.PersistentCache _ ->
           clear_caches_ref := Map2Cache.clear :: !clear_caches_ref
         | _ -> ());
        Map2Cache.merge
      | Hptmap_sig.NoCache -> fun f x y -> f x y
    in
    let f' _abs_min _abs_max _rem1 _modu1 v1 _rem2 _modu2 v2 =
      Rel.zero, Int.one, f v1 v2
    in
    (* See the invariants a the top of {!merge}: [bounds o1 n1 = bounds o2 n2]
       holds *)
    let rec aux (o1, n1 as t1) (_o2, n2 as t2) =
      match decide n1 n2 with
      | Recurse ->
        merge_cache (merge aux f') t1 t2
      | ReturnLeft -> t1
      | ReturnRight -> t2
      | ReturnConstant v ->
        if n1 == Empty then begin
          (o1, n1) (* [n2 == Empty] and [o1 =~ o2] hold. *)
        end else begin
          (* build an interval mapped to [v], of the same width as t1 and t2 *)
          let ib1, ie1 = bounds_offset o1 n1 in
          ib1, interval_aux (ie1 -~ ib1) Rel.zero Int.one v
        end
    in
    aux

  let map2_on_values cache decide (f: V.t -> V.t -> V.t) =
    let map2_on_values_cached = map2_on_values_offset cache decide f in
    fun t1 t2 -> snd (map2_on_values_cached (Int.zero, t1) (Int.zero, t2))


  (* Given an integer i,
     find the interval the ith bit belongs to (thus its node)
     Returns: the zipper to navigate from the root to the node found,
     and the node itself
  *)
  exception Bit_Not_found (* TODO: not clear it does not leak outside *)
  let find_bit_offset i zipper offset tree =
    let rec aux_find tree curr_off z =
      match tree with
      | Empty -> raise Bit_Not_found
      | Node (max, offl, subl, offr, subr, _, _modu, _v, _) ->
        let abs_max = curr_off +~ max in
        if (i >=~ curr_off) && (i <=~ abs_max)
        then (z, curr_off, tree)
        else if i <~ curr_off
        then
          aux_find subl (curr_off +~ offl) (Left(curr_off, tree, z))
        else begin
          assert (i >~ abs_max);
          aux_find subr (curr_off +~ offr) (Right(curr_off, tree, z))
        end
    in
    aux_find tree offset zipper
  ;;

  let find_bit i tree = find_bit_offset i End Integer.zero tree
  ;;


  (* First and last bits are included in the interval. The returned value
     is at the very least isotropic, possibly topified. *)
  let find_imprecise_between (first_bit, last_bit) tree =
    let rec aux tree_offset tree =
      match tree with
      | Empty -> V.bottom
      | Node (max, offl, subl, offr, subr, _rem, _m, v, _) ->
        let abs_max = max +~ tree_offset in
        let subl_value =
          if first_bit <~ tree_offset then
            let subl_abs_offset = tree_offset +~ offl in
            aux subl_abs_offset subl
          else V.bottom
        in
        let subr_value =
          if last_bit >~ abs_max then
            let subr_abs_offset = tree_offset +~ offr in
            aux subr_abs_offset subr
          else V.bottom
        in
        let current_node_value =
          if last_bit <~ tree_offset || first_bit >~ abs_max
          then V.bottom
          else
          if V.is_isotropic v
          then v
          else
            let origin = Origin.(current Misalign_read) in
            V.topify_with_origin origin v
        in
        V.join subl_value (V.join subr_value current_node_value)
    in
    aux Integer.zero tree

  (* Reads the interval [start, start + size - 1] in the offsetmap [tree].
     Assumes that the interval fits into the offsetmap, and that the offsetmap
     is rooted at offset 0.
     [read_value] and [read_nodes] are used to read the offsetmap:
     - [read_value v size] is used if the read matches exactly a value [v] of
       size [size].
     - otherwise, [read_nodes ~offset node zipper ~start ~size] is called, with
       [node] the node in which the read starts, [offset] the offset of [node],
       and [zipper] a zipper to navigate from the root of [node].
       When the read belongs to a series of periodic reads, [since_and_period]
       should be the first offset and the period of the reads. This function then
       returns the last offset of the node being read if the series of reads can
       skip the rest of the node: it means that all other reads within the node
       will give a value that has already been read in the series. Otherwise, the
       function returns None.  *)
  let read_itv ?since_and_period ~start ~size tree ~read_value ~read_nodes =
    let zipper, cur_off, root = find_bit start tree in
    match root with
    | Empty -> assert false
    | Node (max, _, _, _, _subr, rrel, m, v, _) ->
      let r = (Rel.add_abs cur_off rrel) %~ m in
      let read_ending = pred (start +~ size) in
      let node_ending = cur_off +~ max in
      let isotropic = V.is_isotropic v in
      let read_fit_in_node = read_ending <=~ node_ending in
      let value =
        if read_fit_in_node && (isotropic || (m =~ size && start %~ m =~ r))
        then read_value v size
        else read_nodes ~offset:cur_off root zipper ~start ~size
      in
      (* Could a series of periodic reads jump ahead in the offsetmap (for
         performance issue)? *)
      let read_ahead = match since_and_period with
        | None -> None
        | Some (since, period) ->
          (* If the next read reaches the next node, we cannot optimize *)
          if (read_ending +~ size) >~ node_ending
          then None
          (* If the value of the node is isotropic, or if the size of the
             repeated value divides the period, then all reads in this node
             are equivalent: jump to the next node. *)
          else if isotropic || (Int.is_zero (period %~ m))
          then Some node_ending
          else
            let since = Int.max since cur_off in
            (* The value in the node is repeated every [m] bits, and we have
               read every [period] bits. Once we have read [lcm period m] bits,
               we will have read all possible combinations. *)
            if start -~ since >= Int.ppcm period m
            then Some node_ending
            else None
      in
      read_ahead, value

  (* Reads only one interval by calling [read_itv]. Ignores the argument and
     result dedicated to periodic reads. *)
  let read_one_itv ~start ~size tree ~read_value ~read_nodes =
    snd (read_itv ~start ~size tree ~read_value ~read_nodes)

  (* Performs a series of periodic reads, starting at [min], ending at [max], and
     whose period is [period]. [size] is the size of each read. [read_value] and
     [read_nodes] are used to read the offsetmap (see read_itv for details).
     [join] is used to merge the result of each read, starting with [acc]. *)
  let read_series_itv ~min ~max ~period ~size tree ~read_value ~read_nodes ~join acc =
    let r = min %~ period in
    let since_and_period = min, period in
    let rec read_series start acc =
      let read_ahead, v =
        read_itv ~since_and_period ~start ~size tree ~read_value ~read_nodes
      in
      let acc = join v acc in
      (* Compute the offset of the next read. By default, add the [period] to the
         current [start], unless we can jump to the end of the current node. *)
      let next = match read_ahead with
        | None -> start +~ period
        | Some read_ahead ->
          (* [read_ahead] is the last offset of the node that has been read.
             The next reads within the node are unnecessary, so we could
             theoretically start at [succ read_ahead] (after re-alignement on
             [period]). However, the last read that starts on this node
             may overlap with the next node, and must be performed. So
             we rewind by [pred size] bits, then round up to the next periodic
             index that must be read. *)
          let min_next = (succ read_ahead) -~ (pred size) in
          Integer.round_up_to_r ~min:min_next ~r ~modu:period
      in
      (* Do not read past [max]. *)
      if next <=~ max
      then read_series next acc
      else acc
    in
    read_series min acc

  (* Reads [tree] at each offset of [offsets]. [size] is the size of each read.
     [read_value] and [read_nodes] perform the reads; [join] merges the result
     of each read, starting with [acc]. *)
  let read ~offsets ~size tree ~read_value ~read_nodes ~join acc =
    match offsets with
    | Tr_offset.Interval (min, max, period) ->
      read_series_itv
        ~min ~max ~period ~size tree ~read_value ~read_nodes ~join acc
    | Tr_offset.Set s ->
      List.fold_left
        (fun acc start ->
           let t = read_one_itv ~start ~size tree ~read_value ~read_nodes in
           join acc t)
        acc s
    | Tr_offset.Overlap(min, max, _origin) ->
      let v = find_imprecise_between (min, max) tree in
      read_value v size
    | Tr_offset.Invalid -> acc

  (* Transforms a function reading one node into a function reading successive
     nodes. The resulting function can be supplied to the [read_itv] function.
     It reads the interval [start, start + size - 1], which is supposed to start
     in the node [node]. [offset] is the offset of [node] in the offsetmap, and
     [zipper] is a zipper to navigate from the root of [node]. It is used to
     read the next nodes of the offsetmap if needed. The function [read_one_node]
     performs the read of each node. *)
  let read_successive_nodes ~read_one_node acc =
    fun ~offset node zipper ~start ~size ->
    let read_end = pred (start +~ size) in
    let rec read_nodes offset node zipper acc =
      let node_end = offset +~ (get_max node) in
      let t = read_one_node ~offset node ~start ~size acc in
      if node_end >=~ read_end
      then t
      else
        let offset, node, zipper = move_right offset node zipper in
        read_nodes offset node zipper t
    in
    read_nodes offset node zipper acc

  (*  Finds the value associated to some offsets represented as an ival. *)
  let find ~validity ?(conflate_bottom=true) ~offsets ~size tree =
    let offsets = Tr_offset.trim_by_validity offsets size validity in
    let topify = Origin.Misalign_read in
    let read_one_node ~offset node ~start ~size acc =
      extract_bits_and_stitch ~topify ~conflate_bottom
        ~offset:start ~size
        offset (get_vv node) (get_max node)
        acc
    in
    let neutral = V.merge_neutral_element in
    let read_nodes = read_successive_nodes ~read_one_node neutral in
    let read_value v _size = v in
    let join = V.join in
    read ~offsets ~size tree ~read_value ~read_nodes ~join V.bottom

  (* Copies the node [node] at the end of the offsetmap [acc], as part of the
     larger copy of the interval [start..start+size-1] from the englobing
     offsetmap of [node]. [offset] is the offset of [node] in this offsetmap.
     As the new offsetmap represents the interval [0..size-1], the offsets are
     shifted by [start]. *)
  let copy_one_node ~offset node ~start ~size acc  =
    match node with
    | Empty -> assert false
    | Node (max, _, _, _, _subr, rem, modu, v, _) ->
      (* The current copy starts at [offset], unless the overall copy starts in
         the middle of the node. The new start is then shifted by [start]. *)
      let min = (Integer.max offset start) -~ start in
      (* Same kind of reasoning for the end of the current copy. *)
      let node_end = offset +~ max in
      let read_end = pred (start +~ size) in
      let max = (Integer.min read_end node_end) -~ start in
      (* For the first node, if the read starts in the middle of the node,
         realign the value wrt the offset of the read (but not wrt the offset of
         the node in the new offsetmap). *)
      let new_rem =
        if offset <~ start
        then realign ~offset:offset ~new_offset:start rem modu
        else rem
      in
      let o, t = add_node ~min ~max new_rem modu v Integer.zero acc in
      assert (o =~ Integer.zero);
      t

  let copy_slice ~validity ~offsets ~size tree =
    let offsets = Tr_offset.trim_by_validity offsets size validity in
    if Int.(equal size zero) then `Value Empty
    else match offsets with
      | Tr_offset.Invalid -> `Bottom
      | _ ->
        let read_one_node = copy_one_node in
        let neutral = m_empty in
        let read_nodes = read_successive_nodes ~read_one_node neutral in
        let read_value v size = interval_aux (pred size) Rel.zero size v in
        let init = isotropic_interval size V.bottom in
        let t = read ~offsets ~size tree ~read_value ~read_nodes ~join init in
        `Value t

  (* Keep the part of the tree strictly under (i.e. strictly on the left) of a
     given offset. *)
  let rec keep_below ~offset curr_off tree =
    match tree with
    | Empty -> offset, tree
    | Node (max, offl, subl, offr, subr, rem, m, v, _) ->
      let new_offl = offl +~ curr_off in
      if offset <~ curr_off then
        keep_below ~offset new_offl subl
      else if offset =~ curr_off then
        new_offl, subl
      else
        let sup = curr_off +~ max in
        if offset >~ sup then
          let new_offr, new_subr = keep_below ~offset (curr_off +~ offr) subr in
          curr_off,
          nNode max offl subl (new_offr -~ curr_off) new_subr rem m v
        else
          let new_max = pred (offset -~ curr_off) in
          add_node
            ~min:curr_off ~max:(new_max +~ curr_off)
            rem m v
            (curr_off +~ offl ) subl
  ;;

  (* Keep the part of the tree strictly above (e.g. strictly on the right) of a
     given offset. *)
  let rec keep_above ~offset curr_off tree =
    match tree with
    | Empty -> (succ offset), tree
    | Node (max, offl, subl, offr, subr, rem, m, v, _) ->
      let new_offr = offr +~ curr_off in
      let abs_max = curr_off +~ max in
      if offset >~ abs_max then
        (* This node should be forgotten,
           let's look at the right subtree
        *)
        keep_above ~offset new_offr subr
      else if offset =~ abs_max then
        (* we are at the limit,
           the right subtree is the answer
        *)
        new_offr, subr
      else
      if offset <~ curr_off then
        (* we want to keep this node and part of its left subtree *)
        let new_offl, new_subl =
          keep_above ~offset (curr_off +~ offl) subl
        in
        curr_off,
        nNode max (new_offl -~ curr_off) new_subl offr subr rem m v
      else
        (* the cut happens somewhere in this node it should be cut
           accordingly and reinjected into its right subtree *)
        let min = succ offset in
        let new_reml = realign ~offset:curr_off ~new_offset:min rem m in
        add_node ~min ~max:abs_max new_reml m v new_offr subr
  ;;

  (* If [once] holds, interprets a single write from [offset] to [abs_max]
     of the value [v] of size [size], repeated to fill the interval.
     Otherwise, interprets independent writes of the value [v] of size [size]
     at possible offsets, starting from [offset] until [abs_max].  *)
  let update_itv_with_rem ~exact ~once ~offset ~abs_max ~size ~rem v curr_off tree =
    if Int.(equal size zero) then curr_off, tree else
      let off1, t1 = keep_above ~offset:abs_max curr_off tree in
      let off2, t2 = keep_below ~offset curr_off tree in
      if exact then
        let off_add, t_add =
          add_node ~min:offset ~max:abs_max rem size v off1 t1
        in
        union off2 t2 off_add t_add
      else
        let v_is_isotropic = V.is_isotropic v in
        let z, o, t = find_bit_offset offset End curr_off tree in
        let left_tree = ref t2 in
        let left_offset = ref off2 in
        let impz = { node = t; offset = o; zipper = z; } in
        while impz.offset <=~ abs_max do
          match impz.node with
          | Empty -> assert false
          | Node (max, _offl, _subl, _offr, _subr, r_node, m_node, v_node, _) ->
            let new_offset = Integer.max offset impz.offset in
            let rem = realign ~offset ~new_offset rem size in
            let r_node = realign ~offset:impz.offset ~new_offset r_node m_node in
            let node_abs_max = impz.offset +~ max in
            let end_reached, write_max =
              if node_abs_max >=~ abs_max
              then true, abs_max
              else false, node_abs_max
            in
            let new_node_size = write_max -~ new_offset in
            let new_r, new_m, new_v =
              let joined_value = V.join v_node v in
              (* If the write has the same size and alignment as the existing
                 node, then afterward each write location contains either the
                 previous node value or the written value. *)
              if Rel.equal rem r_node && m_node =~ size
              then rem, size, joined_value
              (* Each write location contains either the written value, or bits
                 from the previous node value, which is a proper value if it is
                 isotropic. *)
              else if V.is_isotropic v_node
              then rem, size, V.anisotropic_cast ~size joined_value
              (* If the new node is smaller than the write size, then either it
                 contains only the new value, or only the previous node value.
                 If the new value is isotropic, we can then reuse the alignment
                 and size of the existing node. *)
              else if v_is_isotropic && (once || size >~ new_node_size)
              then r_node, m_node, V.anisotropic_cast ~size:m_node joined_value
              else
                (* Otherwise, bits of the existing node value can be mixed with
                   the written value. We topify the joined value to be sound,
                   but this is imprecise. *)
                let origin = Origin.(current Merge) in
                let new_value = V.topify_with_origin origin joined_value in
                let new_rem = Rel.zero and new_modu = Integer.one in
                new_rem, new_modu, new_value
            in
            let new_left_offset, new_left_tree =
              add_node
                ~min:new_offset ~max:write_max
                new_r new_m new_v !left_offset !left_tree
            in
            left_tree := new_left_tree;
            left_offset := new_left_offset;
            if not end_reached then imp_move_right impz
            else impz.offset <- succ abs_max
        done;
        union !left_offset !left_tree off1 t1
  ;;

  let update_itv = update_itv_with_rem ~rem:Rel.zero ~once:false

  (* This should be in Int_Intervals, but is currently needed here.
     Returns an interval with reversed bounds when the intersection is empty. *)
  let clip_by_validity = function
    | Base.Empty | Base.Invalid ->
      (fun _-> Int.one, Int.zero (* reversed interval -> no intersection*))
    | Base.Known (min, max)
    | Base.Unknown (min, _, max) ->
      (fun (min', max') -> Integer.max min min', Integer.min max max')
    | Base.Variable variable_v ->
      (fun (min', max') -> Integer.max Int.zero min',
                           Integer.min variable_v.Base.max_alloc max')

  (** This function does a weak update of the entire [offsm], by adding the
      topification of [v]. The parameter [validity] is respected, and so is the
      current size of [offsm]: each interval already present in [offsm] and valid
      is overwritten. Interval already present but not valid are bound to
      [V.bottom]. *)
  (* TODO: the convention to write bottom on non-valid locations is strange,
     and only useful for the NULL base in Lmap.ml. It would be simpler an more
     elegant to keep the existing value on non-valid ranges instead. This
     function should also be written as a call to fold_between *)
  let update_imprecise_everywhere ~validity o v offsm =
    let v = V.topify_with_origin o v in
    if Base.Validity.equal validity Base.Invalid then
      `Bottom
    else
      let clip = clip_by_validity validity in
      let r = fold
          (fun (min, max as itv) (bound_v, _, _) acc ->
             let new_v = V.topify_with_origin o (V.join bound_v v) in
             let new_min, new_max = clip itv in
             if new_min <=~ new_max then (* [min..max] and validity intersect *)
               let acc =
                 if min <~ new_min (* Before validity *)
                 then append_basic_itv ~min ~max:(pred new_min) ~v:V.bottom acc
                 else acc
               in
               let acc = append_basic_itv ~min:new_min ~max:new_max ~v:new_v acc in
               let acc =
                 if new_max <~ max (* After validity *)
                 then append_basic_itv ~min:(succ new_max) ~max ~v:V.bottom acc
                 else acc
               in acc
             else
               append_basic_itv ~min ~max ~v:V.bottom acc
          ) offsm m_empty
      in
      `Value r
  ;;


  (** Update a set of intervals in a given rangemap all offsets starting from
      mn ending in mx must be updated with value v, every period *)
  let update_itvs ~exact ~mn ~mx ~period ~size v curr_off tree =
    assert(mx >=~ mn);
    let r = mn %~ period in
    let rec aux_update mn mx curr_off tree =
      match tree with
      | Empty -> curr_off, tree
      | Node (max, offl, subl, offr, subr, r_node, m_node, v_node, _) ->
        let abs_offl = offl +~ curr_off in
        let abs_offr = offr +~ curr_off in

        let new_offl, new_subl, undone_left =
          let last_read_max_offset = curr_off -~ size in
          if pred (mn +~ size) <~ curr_off then
            let new_mx = Integer.round_down_to_r
                ~max:last_read_max_offset ~r ~modu:period
            in
            let new_mx, undone =
              if new_mx >=~ mx
              then mx, None
              else new_mx, Some (new_mx +~ period)
            in
            let o, t = aux_update mn new_mx abs_offl subl in
            o, t, undone
          else abs_offl, subl, Some mn

        and new_offr, new_subr, undone_right =
          let abs_max = curr_off +~ max in
          let first_read_min_offset = succ abs_max in
          if mx >~ abs_max then
            let new_mn = Integer.round_up_to_r
                ~min:first_read_min_offset ~r ~modu:period
            in
            let new_mn, undone =
              if new_mn <=~ mn
              then mn, None
              else new_mn, Some (new_mn -~ period)
            in
            let o, t = aux_update new_mn mx abs_offr subr in
            o, t, undone
          else abs_offr, subr, Some mx

        in
        let o, t =
          add_node
            ~min:curr_off ~max:(curr_off +~ max)
            r_node m_node v_node new_offl new_subl
        in
        let curr_off, tree = union o t new_offr new_subr in
        match undone_left, undone_right with
        | Some min, Some max ->
          begin
            let update = update_itv ~exact in
            if size =~ period
            then
              let abs_max = pred (size +~ max) in
              update ~offset:min ~abs_max ~size v curr_off tree
            else
              let offset = ref min in
              let o = ref curr_off in
              let t = ref tree in
              while !offset <=~ max do
                let abs_max = pred (size +~ !offset) in
                let o', t' =
                  update ~offset:!offset ~abs_max ~size v !o !t
                in
                o := o';
                t := t';
                offset := !offset +~ period;
              done;
              !o, !t;
          end
        | Some _, None
        | None, Some _
        | None, None -> curr_off, tree
    in
    aux_update mn mx curr_off tree
  ;;

  exception Update_Result_is_bottom

  (* Returns [true] iff [update_aux_tr_offsets] will approximate the set
     of offsets written *)
  let update_aux_tr_offsets_approximates offsets size =
    match offsets with
    | Tr_offset.Overlap _ -> false
    | Tr_offset.Interval(mn, mx, period) ->
      let number = succ ((mx -~ mn) /~ period) in
      let plevel = !plevel in
      if number <=~ Integer.of_int plevel || period =~ size then false
      else true
    | Tr_offset.Set _
    | Tr_offset.Invalid  -> false

  (* Update [t] by writing [v] of size [size] every offsets. Make sure that this
     function over-approximates the set of location written
     iff [update_aux_approximates] returns [true] *)
  let update_aux_tr_offsets ~exact ~offsets ~size v curr_off t =
    match offsets with
    | Tr_offset.Overlap (mn, mx, origin) ->
      let origin =
        match origin with
        | Some origin -> origin
        | None -> Origin.(current Misalign_write)
      in
      let v = V.topify_with_origin origin v in
      (* TODO: check *)
      update_itv ~exact ~offset:mn ~abs_max:mx ~size:Integer.one v curr_off t

    | Tr_offset.Interval(mn, mx, period) ->
      let number = succ ((mx -~ mn) /~ period) in
      let plevel = !plevel in
      assert (period >=~ size); (* Checked by Tr_offset *)
      if number <=~ Integer.of_int plevel || period =~ size then
        update_itvs ~exact ~mn ~mx ~period ~size v curr_off t
      else begin
        if size <~ period && Params.approximation_feedback then
          (* We are going to write the locations that are between [size+1] and
             [period] unnecessarily, warn the user *)
          Abstract_interp.feedback_approximation
            "more than %d(%a) locations to update in array. Approximating."
            plevel pretty_int number;
        let abs_max = pred (mx +~ size) in
        let v =
          if Int.is_zero (period %~ size) then v
          else
            let origin = Origin.(current Misalign_write) in
            let v' = V.topify_with_origin origin v in
            if not (V.equal v v') && Params.approximation_feedback then
              Abstract_interp.feedback_approximation
                "approximating value to write.";
            v'
        in
        update_itv ~exact:false ~offset:mn ~abs_max ~size v curr_off t
      end

    | Tr_offset.Set s ->
      List.fold_left
        (fun (curr_off, m) offset ->
           update_itv ~exact ~offset ~size
             ~abs_max:(pred (offset +~ size)) v curr_off m
        ) (curr_off, t) s

    | Tr_offset.Invalid  ->
      raise Update_Result_is_bottom

  (* High-level update function (roughly of type [Ival.t -> v -> offsetmap ->
     offsetmap]. This function does not suppose that offsetmaps are zero-rooted.
     When too many locations must be updated, the result is approximated w.r.t
     the memory zones written. *)
  let update_aux ?origin ~validity ~exact ~offsets ~size v curr_off t =
    let v = V.anisotropic_cast ~size v in
    let reduced = Tr_offset.trim_by_validity ?origin offsets size validity in
    let exact = exact && not (Base.is_weak_validity validity) in
    update_aux_tr_offsets ~exact ~offsets:reduced ~size v curr_off t

  (* Same as update_aux, but on zero-rooted offsetmaps. *)
  let update ?origin ~validity ~exact ~offsets ~size v t =
    try
      let _curr_off, r =
        update_aux ?origin ~validity ~exact ~offsets ~size v Int.zero t
      in
      `Value r
    with Update_Result_is_bottom -> `Bottom

  (* High-level update function (roughly of type [Ival.t -> v -> offsetmap ->
     offsetmap]) that *under*-approximate the set of written locations, when
     there are too many of them. *)
  let update_under ~validity ~exact ~offsets ~size v t =
    let v = V.anisotropic_cast ~size v in
    let offsets = Tr_offset.trim_by_validity offsets size validity in
    if Base.is_weak_validity validity ||
       update_aux_tr_offsets_approximates offsets size
    then
      `Value t
    else
      try
        let _, t = update_aux_tr_offsets ~exact ~offsets ~size v Int.zero t in
        `Value t
      with Update_Result_is_bottom -> `Bottom

  let is_single_interval o =
    match o with
    | Node(_, _, Empty, _, Empty, _, _, _, _) -> true
    | _ -> false

  let single_interval_value o =
    match o with
    | Node(_, _, Empty, _, Empty, _, _, v, _) -> Some v
    | _ -> None

  let is_same_value o v =
    match o with
    | Empty -> true
    | Node(_, _, Empty, _, Empty, _, _, v', _) -> V.equal v v'
    | _ -> false

  let fold_between ?(direction=`LTR) ~entire (imin, imax) f t acc =
    let rec aux curr_off t acc = match t with
      | Empty -> acc
      | Node (max, offl, subl, offr, subr, rem, modu, v, _) ->
        let abs_max = max +~ curr_off in
        (* fold on the left subtree *)
        let acc_left acc =
          if imin <~ curr_off then (
            aux (offl +~ curr_off) subl acc)
          else acc
        in
        let acc_middle acc =
          if imax <~ curr_off || imin >~ abs_max
          then acc
          else
          if entire then
            (* Call f on the entire binding *)
            f (curr_off, abs_max) (v, modu, rem) acc
          else
            (* Cut the interval to [imin..imax] *)
            let lmin = Integer.max imin curr_off in
            let lmax = Integer.min imax abs_max in
            let lrem =
              Rel.e_rem (Rel.sub rem (Rel.sub_abs lmin curr_off)) modu
            in
            f (lmin, lmax) (v, modu, lrem) acc
        in
        (* fold on the right subtree *)
        let acc_right acc =
          if imax >~ abs_max
          then aux (offr +~ curr_off) subr acc
          else acc
        in
        match direction with
        | `LTR -> acc_right (acc_middle (acc_left acc))
        | `RTL -> acc_left (acc_middle (acc_right acc))
    in
    aux Integer.zero t acc
  ;;

  (* weak validity should be handled caller *)
  let paste_slice_itv ~exact from stop start_dest to_ =
    let update = update_itv_with_rem ~exact in
    let treat_interval (imin, imax) (v, modu, rem) acc =
      let dmin, dmax = imin +~ start_dest, imax +~ start_dest in
      snd (update ~once:true
             ~offset:dmin ~abs_max:dmax ~rem:rem ~size:modu v Integer.zero acc)
    in
    fold_between ~entire:false (Int.zero, stop) treat_interval from to_
  ;;

  (** pastes [from] (of size [size]) at all [offsets] in [dst]. Optimisations
      for the case where [size] and the periodicity of [offsets] match are
      treated in [paste_slice] below. [size] is supposed to be strictly
      positive. *)
  let paste_slice_not_contiguous ~validity ~exact ~from:src ~size ~offsets dst =
    try
      let plevel = !plevel in
      let stop_src = Int.pred size in
      ignore (Ival.cardinal_less_than offsets plevel);
      (* See explanations at the end of [Tr_offset] for what is computed here.*)
      let min_valid, max_maybe_valid = match validity with
        | Base.Invalid | Base.Empty (* size > 0 *) -> Int.zero, Int.minus_one
        | Base.Known (b, e) | Base.Unknown (b, _, e) -> b, e
        | Base.Variable { Base.max_alloc } -> Int.zero, max_alloc
      in
      let aux start_to (acc_offsm, acc_success) =
        let stop_to = Int.pred (Int.add start_to size) in
        (* check if at least one access is possibly valid *)
        if Int.lt start_to min_valid || Int.gt stop_to max_maybe_valid then
          (* at least one bit cannot be written => invalid access *)
          acc_offsm, acc_success
        else
          let exact = exact && not (Base.is_weak_validity validity) in
          paste_slice_itv ~exact src stop_src start_to acc_offsm, true
      in
      (* TODO: this should be improved if offsets if of the form [a..b]c%d
         with d >= size. In this case, the write do not overlap, and
         could be done in one run in the offsetmap itself, using a zipper *)
      let res, success = Ival.fold_int aux offsets (dst, false) in
      if success then `Value res else `Bottom
    with Not_less_than ->
      (* Value to paste, since we cannot be precise *)
      let v =
        (* Under this size, this may be an integer. Try to be a bit precise
           when doing 'find' *)
        if size <=~ Integer.of_int 128 then
          let validity_src = Base.validity_from_size size in
          find ~validity:validity_src ~conflate_bottom:false
            ~offsets:Ival.zero ~size src
        else
          (* This is a struct or an array. Either the result will be imprecise
             because catenating semi-imprecise values through merge_bits
             will result in something really imprecise at the end, or we will
             build very big integers, which is not really helpful either. *)
          find_imprecise_between (Int.zero, Int.pred size) src
      in
      (* Have we produced an imprecision when calling 'find' ? *)
      let imprecise = match src with
        | Node (_, _, Empty, _, Empty, _, _, v', _) -> not (V.equal v v')
        | _ -> true (* at least two nodes *)
      in
      if imprecise && Params.approximation_feedback then
        Abstract_interp.feedback_approximation
          "too many locations to update in array. Approximating.";
      update ~validity ~exact ~offsets ~size v dst

  (** pastes [from] (of size [size]) at all [offsets] in [dst] *)
  let paste_slice ~validity ~exact ~from:src ~size ~offsets dst =
    if Int.(equal size zero) then (* nothing to do *) `Value dst
    else
      let size_ok =
        Ival.is_singleton_int offsets
        || let _, _, _, modu = Ival.min_max_r_mod offsets in size =~ modu
      in
      match src with
      (*Special case: [from] contains a single (aligned) binding [v], and [size]
        matches the periodicity of [offsets] and the size of [v]. In this case,
        it is more efficient to perform an interval update instead of an
        offsetmap copy. *)
      | Node (_,_, Empty,_, Empty, vrem, vsize, v,_)
        when Rel.is_zero vrem && size_ok && (size =~ vsize || V.is_isotropic v)
        ->
        update ~validity ~exact ~offsets ~size v dst
      | _ ->
        paste_slice_not_contiguous ~validity ~exact ~from:src ~size ~offsets dst

  let skip_v v = V.equal V.bottom v

  let pretty_generic ?typ ?(pretty_v=V.pretty_typ) ?(skip_v=skip_v) ?(sep=Unicode.inset_string ()) () fmt m =
    let is_first = ref true in
    let pretty_binding fmt (bk, ek) (v, modu, rel_offs) =
      if not (skip_v v) then begin
        if !is_first then is_first:=false
        else Format.fprintf fmt "@\n";
        Format.fprintf fmt "@[" ;
        (* Print left-member and return misalign condition *)
        let force_misalign, printed_type =
          match typ with
          | None ->
            Format.fprintf fmt "[rbits %a to %a]"
              pretty_int bk pretty_int ek ;
            (* misalign condition: *)
            (not (Rel.is_zero rel_offs) || (ek -~ bk <>~ pred modu))
            && not (V.is_isotropic v),
            None

          | Some typ ->
            (* returns misalign condition. *)
            Bit_utils.pretty_bits typ
              ~use_align:(not (V.is_isotropic v))
              ~align:rel_offs ~rh_size:modu ~start:bk ~stop:ek fmt
        in
        Format.fprintf fmt " %s@ @[<hv 1>%a@]" sep (pretty_v printed_type) v ;
        if force_misalign
        then
          if Rel.is_zero rel_offs && (Int.length bk ek) %~ modu =~ Integer.zero
          then
            (if Int.length bk ek >~ modu then
               Format.fprintf fmt " repeated %%%a " pretty_int modu)
          else (
            let b_bits = Rel.e_rem (Rel.sub Rel.zero rel_offs) modu  in
            let e_bits = Rel.add_abs (ek -~ bk) b_bits in
            Format.fprintf fmt "%s%%%a, bits %a to %a "
              (if e_bits >~ modu then " repeated " else "")
              pretty_int modu Rel.pretty b_bits pretty_int e_bits
          );
        Format.fprintf fmt "@]";
      end
    in
    if is_empty m then
      Format.fprintf fmt "@[[?] %s EMPTY@]" sep
    else begin
      Format.fprintf fmt "@[";
      iter (pretty_binding fmt) m;
      if !is_first then
        Format.fprintf fmt "%s@ %s" sep (Unicode.emptyset_string ());
      Format.fprintf fmt "@]";
    end

  let create_isotropic ~size v =
    assert (Int.ge size Int.zero);
    if Int.(equal size zero) then Empty
    else begin
      assert (V.is_isotropic v);
      isotropic_interval size v
    end

  let create ~size v ~size_v =
    assert (Int.ge size Int.zero);
    if Int.(equal size zero) then Empty
    else snd (Int.zero, interval_aux (pred size) Rel.zero size_v v)

  let cardinal_zero_or_one offsetmap =
    (singleton_tag offsetmap) <> 0

  let of_list fold l size_elt =
    let s = pred size_elt in
    let n = ref Integer.zero in
    let addw acc v =
      let e = !n +~ s in
      let r = append_basic_itv ~min:!n ~max:e ~v acc in
      n := succ e;
      r
    in
    let r = fold addw m_empty l in
    assert (!n >~ Int.zero); (* implies that r <> Empty *)
    r

  let add ?(exact=true) (min, max) (v, modu, rem) m =
    snd (update_itv_with_rem ~exact ~once:true
           ~offset:min ~abs_max:max ~rem ~size:modu v Integer.zero m)

  let find_imprecise ~validity m =
    match validity with
    | Base.Known (min, max) | Base.Unknown (min, _, max) ->
      find_imprecise_between (min, max) m
    | Base.Variable variable_v ->
      find_imprecise_between (Int.zero, variable_v.Base.max_alloc) m
    | Base.Invalid | Base.Empty -> V.bottom

  let find_imprecise_everywhere m =
    match m with
    | Empty -> V.bottom
    | Node _ ->
      let bounds = bounds_offset Int.zero m in
      find_imprecise_between bounds m


  let clear_caches () = List.iter (fun f -> f ()) !clear_caches_ref
end

(* Generic implementation of {Offsetmap_lattice_with_isotropy} for values
   that are all isotropic. *)
module FullyIsotropic = struct
  let is_isotropic _ = true
  let anisotropic_cast ~size:_ v = v

  let topify_with_origin _o v = v

  let extract_bits ~topify:_ ~start:_ ~stop:_ ~size:_ m = false, m
  let merge_distinct_bits ~topify:_ ~conflate_bottom:_ _ _ =
    assert false (* not called on isotropic values *)
  let shift_bits ~topify:_ ~offset:_ ~size:_ v = v
  let cardinal_zero_or_one _ = false

  type widen_hint = unit
  let widen ?size:_ ?hint:_ _ m = m
end


(* -------------------------------------------------------------------------- *)
(* --- Intervals                                                          --- *)
(* -------------------------------------------------------------------------- *)

module Boolean_Value = struct
  include Datatype.Bool

  let bottom = false
  let join = (||)
  let is_included b1 b2 = b2 || not b1
  let merge_neutral_element = bottom

  let pretty_typ _ fmt v = pretty fmt v

  include FullyIsotropic
end

module Int_Intervals_Map = struct

  include Make (Boolean_Value) (Default_Parameters)

  include Make_Narrow(struct
      let top = true
      let narrow = (&&)
    end)

  (* In this auxiliary module, intervals are pairs [(curr_off, m)] where [m]
     has type [bool Offsetmap.t]. However, in order to avoid boxing,
     functions sometimes take two arguments: first the current offset,
     then the map. *)
  type itvs = Int.t * t

  let join : itvs -> itvs -> itvs =
    let stop_join m1 m2 =
      if m1 == m2 then ReturnLeft (* idempotency *)
      (* true everywhere leads to true everywhere. false everywhere leads
         to the other tree. *)
      else match m1 with
        | Node (_, _, Empty, _, Empty, _ , _, b, _) ->
          if b then ReturnLeft else ReturnRight
        | _ ->
          match m2 with
          | Node (_, _, Empty, _, Empty, _ , _, b, _) ->
            if b then ReturnRight else ReturnLeft
          | _ -> Recurse
    in
    let cache = Hptmap_sig.PersistentCache "Int_Intervals.join" in
    map2_on_values_offset cache stop_join (||)

  let narrow : itvs -> itvs -> itvs =
    let stop_narrow m1 m2 =
      if m1 == m2 then ReturnLeft (* idempotency *)
      (* false everywhere leads to false everywhere. true everywhere leads
         to the other tree. *)
      else match m1 with
        | Node (_, _, Empty, _, Empty, _ , _, b, _) ->
          if b then ReturnRight else ReturnLeft
        | _ ->
          match m2 with
          | Node (_, _, Empty, _, Empty, _ , _, b, _) ->
            if b then ReturnLeft else ReturnRight
          | _ -> Recurse
    in
    let cache = Hptmap_sig.PersistentCache "Int_Intervals.narrow" in
    map2_on_values_offset cache stop_narrow (&&)

  let diff : itvs -> itvs -> itvs =
    let stop_diff m1 m2 =
      if m1 == m2 then ReturnConstant false
      else
        match m2 with
        | Node (_, _, Empty, _, Empty, _ , _, false, _) ->
          ReturnLeft (* diff with empty *)
        | _ -> Recurse
    in
    let cache = Hptmap_sig.PersistentCache "Int_Intervals.diff" in
    map2_on_values_offset
      cache stop_diff (fun b1 b2 -> if b2 then false else b1)


  (* Auxiliary function that binds [b] to the interval [min..max], which
     is assumed not to be bound in [m] *)
  let add_itv ~min ~max b co m : itvs =
    add_node ~min ~max Rel.zero Int.one b co m

  (* enlarges the offsetmap [m] from range [prev_min..prev_max] to
     [new_min..new_max], by adding an interval bound to [false] at the left
     and right ends. The inclusion [prev_min..prev_max \subset new_min..new_max]
     must hold *)
  let enlarge_itv co m ~prev_min ~new_min ~prev_max ~new_max : itvs =
    let co, m as i =
      if new_max >~ prev_max then
        add_itv ~min:(succ prev_max) ~max:new_max false co m
      else co, m
    in
    if new_min <~ prev_min then
      add_itv ~min:new_min ~max:(pred prev_min) false co m
    else i

  (* shrinks the offsetmap [m] from range [prev_min..prev_max] to
     [new_min..new_max], by dropping the superfluous intervals. The inclusion
     [new_min..new_max \subset prev_min..prev_max] must hold *)
  let shrink_itv co m ~prev_min ~new_min ~prev_max ~new_max : itvs =
    let co, m as i =
      if new_max <~ prev_max then
        keep_below ~offset:(succ new_max) co m
      else co, m
    in
    if new_min >~ prev_min then
      keep_above ~offset:(pred new_min) co m
    else i

  (* Resize size [m] to size [new_min..new_max], by enlarging or shrinking
     it on both ends. *)
  let resize_itv co m ~prev_min ~new_min ~prev_max ~new_max : itvs =
    let co, m as i =
      if new_max =~ prev_max then co, m
      else if new_max >~ prev_max then
        add_itv ~min:(succ prev_max) ~max:new_max false co m
      else (* new_max <~ prev_max *)
        keep_below ~offset:(succ new_max) co m
    in
    if new_min =~ prev_min then i
    else if new_min <~ prev_min then
      add_itv ~min:new_min ~max:(pred prev_min) false co m
    else (* new_min >~ prev_min *)
      keep_above ~offset:(pred new_min) co m


  (* normalizes a non-empty offsetmap [m], by removing an eventual rightmost
     interval bound to false. Returns the new rightmost bit bound to [true].*)
  let rec drop_righmost_false curr_off node =
    match node with
    | Empty -> assert false
    | Node (max, _, _, _, Empty, _, _, true, _) ->
      (* we are the rightmost interval, and not equal to false: no change *)
      curr_off, node, curr_off +~ max
    | Node (_, offl, subl, _, Empty, _, _, false, _) ->
      (* we are the rightmost interval, and false; keep only the left tree *)
      curr_off +~ offl, subl, pred curr_off
    | Node (max, offl, subl, offr, (Node _ as subr), _, _, v, _) ->
      (* Normalize the right tree and rebuild. *)
      let new_rcurr_off, new_rtree, rbit =
        drop_righmost_false (curr_off +~ offr) subr
      in
      (* We cannot have [v = false] and [new_rtree = empty]: [subr] would need
         contain only [false], and it should have been merged with us. *)
      if new_rtree == subr then
        curr_off, node, rbit
      else
        let curr_off', node' =
          make_node
            curr_off max offl subl (new_rcurr_off -~ curr_off) new_rtree
            Rel.zero Integer.one v
        in
        curr_off', node', rbit

  (* normalizes a non-empty offsetmap [m], by removing an eventual leftmost
     interval bound to false. Returns the new leftmost bit bound to [true].*)
  let rec drop_leftmost_false curr_off node =
    match node with
    | Empty -> assert false
    | Node (_, _, Empty, _, _, _, _, true, _) ->
      (* we are the leftmost interval, and not equal to false: no change *)
      curr_off, node, curr_off
    | Node (max, _, Empty, offr, subr, _, _, false, _) ->
      (* we are the leftmost interval, and false; keep only the right tree *)
      curr_off +~ offr, subr, succ (curr_off +~ max)
    | Node (max, offl, (Node _ as subl), offr, subr, _, _, v, _) ->
      (* normalize the left subtree and rebuild *)
      let new_lcurr_off, new_ltree, lbit =
        drop_leftmost_false (curr_off +~ offl) subl
      in
      if new_ltree == subl then
        curr_off, node, lbit
      else
        let curr_off', node' =
          make_node
            curr_off max (new_lcurr_off -~ curr_off) new_ltree offr subr
            Rel.zero Integer.one v
        in
        curr_off', node', lbit

end

module Int_Intervals = struct

  type intervals =
    | Top
    | Intervals of Int.t * Int_Intervals_Map.t * Int.t * Int.t
    (* The arguments of {!Intervals} are [curr_off, m, min, max] in this
       order. [min] and [max] are the the first and last bit bound to true
       in the map, which is supposed to be non-empty. All operations must
       maintain those two invariants. *)
    | Bottom

  let pretty_debug fmt t =
    match t with
    | Top -> Format.pp_print_string fmt "TopISet"
    | Bottom -> Format.pp_print_string fmt "BottomISet"
    | Intervals (curr_off, i, min, max) ->
      Format.fprintf fmt "@[I(%a-%a, @[%a])@]"
        Int.pretty min Int.pretty max
        Int_Intervals_Map.pretty_debug_offset (curr_off, i)

  include Datatype.Make(struct
      type t = intervals
      let name = "Int_Intervals.t"

      let pretty fmt t =
        match t with
        | Top -> Format.pp_print_string fmt "TopISet"
        | Bottom -> Format.pp_print_string fmt "BottomISet"
        | Intervals (curr_off, i, _, _) ->
          let first = ref true in
          Format.fprintf fmt "@[<hov >{";
          Int_Intervals_Map.iter_offset
            (fun (b, e) (v, _, _) ->
               if v then begin
                 if !first then first := false else Format.pp_print_space fmt ();
                 Format.fprintf fmt "[%a..%a]" Int.pretty b Int.pretty e
               end
            ) curr_off i;
          Format.fprintf fmt "}@]"

      let hash = function
        | Top -> 37
        | Bottom -> 73
        | Intervals (curr_off, i, _, _) ->
          (* Ignore min and max, which are redundant with curr_off + i *)
          Int.hash curr_off + 143 * Int_Intervals_Map.hash i

      let equal i1 i2 = match i1, i2 with
        | Top, Top | Bottom, Bottom -> true
        | Intervals (curr_off1, i1, _, _), Intervals (curr_off2, i2, _, _) ->
          curr_off1 =~ curr_off2 && Int_Intervals_Map.equal i1 i2
        | (Top | Bottom | Intervals _), _ -> false

      let compare i1 i2 = match i1, i2 with
        | Bottom, Bottom
        | Top, Top -> 0
        | Intervals (curr_off1, i1, _, _), Intervals (curr_off2, i2, _, _) ->
          let c = Int.compare curr_off1 curr_off2 in
          if c = 0 then Int_Intervals_Map.compare i1 i2
          else c
        | Bottom, (Intervals _ | Top)
        | Intervals _, Top -> -1
        | Intervals _, Bottom | Top, (Bottom | Intervals _) -> 1

      let reprs = [Bottom; Top]
      let rehash = Datatype.identity
      (* type intervals =
         Top | Intervals of Int.t * Int_Intervals_Map.t * Int.t * Int.t| Bottom *)
      let structural_descr =
        Structural_descr.t_sum
          [| [| Int.packed_descr; Int_Intervals_Map.packed_descr;
                Int.packed_descr; Int.packed_descr |] |]

      let mem_project = Datatype.never_any_project
      let copy = Datatype.undefined
    end)

  let top = Top
  let bottom = Bottom

  let is_top = function
    | Top -> true
    | _ -> false

  let aux_create_interval ~min ~max v =
    (* Use [min] as current offset *)
    Int_Intervals_Map.add_itv ~min ~max v min Int_Intervals_Map.m_empty

  let inject_bounds min max =
    if Int.gt min max then
      Bottom
    else
      let curr_off, i = aux_create_interval ~min ~max true in
      Intervals (curr_off, i, min, max)

  let inject_itv (b, e) = inject_bounds b e

  let is_included i1 i2 = match i1, i2 with
    | Bottom, Bottom
    | Top, Top
    | Bottom, (Intervals _ | Top)
    | Intervals _, Top ->
      true
    | Intervals (co1, i1, min1, max1),
      Intervals (co2, i2, min2, max2) ->
      min1 >=~ min2 && max1 <=~ max2 &&
      Int_Intervals_Map.is_included_aux (co1, i1) (co2, i2)
    | Intervals _, Bottom | Top, (Bottom | Intervals _) -> false

  let join m1 m2 =
    match m1, m2 with
    | Top, _ | _, Top -> Top
    | Bottom, i | i, Bottom -> i
    | Intervals (co1, i1, min1, max1), Intervals (co2, i2, min2, max2) ->
      let new_min = Int.min min1 min2 in
      let new_max = Int.max max1 max2 in
      (* Enlarge both intervals to the largest bounds. *)
      let coi1' =
        Int_Intervals_Map.enlarge_itv
          co1 i1 ~prev_min:min1 ~new_min ~prev_max:max1 ~new_max
      in
      let coi2' =
        Int_Intervals_Map.enlarge_itv
          co2 i2 ~prev_min:min2 ~new_min ~prev_max:max2 ~new_max
      in
      (* No need to normalize, the leftmost and rightmost bits are still there*)
      let co, i = Int_Intervals_Map.join coi1' coi2' in
      Intervals (co, i, new_min, new_max)

  let link = join  (* all constructors but Top, which is never returned,
                       are exact. *)

  (* Drop the leftmost and rightmost intervals if they are equal to
     [false], and detect if the result is [Bottom] *)
  let normalize_itv curr_off m =
    match m with
    | Empty | Node (_, _, Empty, _, Empty, _ ,_, false, _) -> Bottom
    | Node _ ->
      let curr_off, m, right_bit =
        Int_Intervals_Map.drop_righmost_false curr_off m
      in
      let curr_off, m, left_bit =
        Int_Intervals_Map.drop_leftmost_false curr_off m
      in
      if m == Empty then Bottom
      else (Intervals (curr_off, m, left_bit, right_bit))

  let narrow m1 m2 =
    match m1, m2 with
    | Bottom, _ | _, Bottom -> Bottom
    | Top, i | i, Top -> i
    | Intervals (co1, i1, min1, max1), Intervals (co2, i2, min2, max2) ->
      if min1 >~ max2 || min2 >~ max1 then Bottom
      else
        (* Keep only the part common to both intervals *)
        let new_min = Int.max min1 min2 in
        let new_max = Int.min max1 max2 in
        let coi1' =
          Int_Intervals_Map.shrink_itv
            co1 i1 ~prev_min:min1 ~new_min ~prev_max:max1 ~new_max
        in
        let coi2' =
          Int_Intervals_Map.shrink_itv
            co2 i2 ~prev_min:min2 ~new_min ~prev_max:max2 ~new_max
        in
        let co, i = Int_Intervals_Map.narrow coi1' coi2' in
        (* Normalize *)
        normalize_itv co i

  let meet = narrow (* all constructors but Top, which is never returned,
                       are exact. *)

  let intersects_map =
    let rec aux (o1, t1) (o2, t2) =
      match t1, t2 with
      | Empty, Empty | Empty, _ | _, Empty -> false

      | Node (_, offl1, subl1, offr1, subr1, _, _, false, _), Node _ ->
        aux (o1 +~ offl1, subl1) (o2, t2) || aux (o1 +~ offr1, subr1) (o2, t2)

      | Node _, Node (_, offl2, subl2, offr2, subr2, _, _, false, _) ->
        aux (o1, t1) (o2 +~ offl2, subl2) || aux (o1, t1) (o2 +~ offr2, subr2)

      | Node (max1, offl1, subl1, offr1, subr1, _, _, true, _),
        Node (max2, offl2, subl2, offr2, subr2, _, _, true, _) ->
        if max1 +~ o1 <~ o2  then
          aux (o1, t1) (o2 +~ offl2, subl2) || aux (o1 +~ offr1, subr1) (o2, t2)
        else if o1 >~ max2 +~ o2 then
          aux (o1, t1) (o2 +~ offr2, subr2) || aux (o1 +~ offl1, subl1) (o2, t2)
        else true (* the two intervals have a non-empty intersection *)
    in
    aux
  ;;

  let intersects i1 i2 = match i1, i2 with
    | Top, Top | Top, Intervals _ | Intervals _, Top -> true
    | Bottom, Bottom | Bottom, (Top | Intervals _)
    | (Top | Intervals _), Bottom -> false
    | Intervals (co1, i1, min1, max1), Intervals (co2, i2, min2, max2) ->
      min1 <=~ max2 && min2 <=~ max1 && intersects_map (co1, i1) (co2, i2)

  let diff m1 m2 =
    match m1, m2 with
    | Bottom, _ -> Bottom
    | Top, (Bottom | Intervals _ | Top) -> Top
    | Intervals _, Top -> Bottom
    | Intervals _, Bottom -> m1
    | Intervals (co1, i1, min1, max1), Intervals (co2, i2, min2, max2) ->
      if max1 >~ max2 && min1 <~ min2 then
        (* The last bits of i1 will not be unset; grow i2 to the size of i1,
           then no need to renormalize afterwards . *)
        let coi2' =
          Int_Intervals_Map.enlarge_itv
            co2 i2 ~prev_min:min2 ~new_min:min1 ~prev_max:max2 ~new_max:max1
        in
        let co, i = Int_Intervals_Map.diff (co1, i1) coi2' in
        Intervals (co, i, min1, max1)
      else
        (* The result cannot be bigger than i1: resize i2 to the same of i1.
           But some bits may be diffed to false, we need to renormalize *)
        let coi2' =
          Int_Intervals_Map.resize_itv
            co2 i2 ~prev_min:min2 ~new_min:min1 ~prev_max:max2 ~new_max:max1
        in
        let co, i = Int_Intervals_Map.diff (co1, i1) coi2' in
        normalize_itv co i

  let fold f m acc =
    match m with
    | Bottom -> acc
    | Top -> raise Error_Top
    | Intervals (curr_off, i, _, _) ->
      let aux_itv itv (v, _, _) acc =
        if v then f itv acc else acc
      in
      Int_Intervals_Map.fold_offset aux_itv curr_off i acc

  (* Could be slightly improved *)
  let inject l =
    List.fold_left (fun acc itv -> join (inject_itv itv) acc) Bottom l

  let iter f m =
    match m with
    | Bottom -> ()
    | Top -> raise Error_Top
    | Intervals (curr_off, i, _, _) ->
      let aux_itv itv (v, _, _) =
        if v then f itv
      in
      Int_Intervals_Map.iter_offset aux_itv curr_off i

  let project_set i = List.rev (fold (fun x y -> x :: y) i [])

  let project_singleton m =
    match m with
    | Bottom | Top -> None
    | Intervals (curr_offset, i, _, _) ->
      match i with
      | Node (max, _, Empty, _, Empty, _, _, true, _) ->
        Some (curr_offset, curr_offset +~ max)
      | _ -> None

  let pretty_typ typ fmt i =
    let typ =
      match typ with
      | Some t -> t
      | None ->
        Cil_types.(TArray (TInt(IUChar,[]), None, []))
    in
    match i with
    | Top -> Format.pp_print_string fmt "[..]"
    | Bottom -> Format.fprintf fmt "[%s]" (Unicode.emptyset_string ())
    | Intervals _ ->
      let pp_one fmt (b,e)=
        assert (Int.le b e) ;
        ignore (Bit_utils.pretty_bits typ
                  ~use_align:false
                  ~align:Rel.zero
                  ~rh_size:Int.one
                  ~start:b ~stop:e fmt)
      in
      match project_singleton i with
      | Some itv -> pp_one fmt itv
      | None ->
        Pretty_utils.pp_iter ~pre:"@[<hov 1>{" ~sep:";@ " ~suf:"}@]"
          iter pp_one fmt i
  ;;

  (* Conversion from ival+size to integers. The result is cached, and
     over-approximated when the ival points to too many locations. *)
  let from_ival_size_over_cached =
    (* This function uses an internal cache *)
    let module Arg1 = struct include Ival let sentinel = bottom end in
    let module Arg2 = struct include Integer let sentinel = zero end in
    let module Result = struct type t = intervals let sentinel = bottom end in
    let module Cache = Binary_cache.Arity_Two(Arg1)(Arg2)(Result) in
    Int_Intervals_Map.(clear_caches_ref := Cache.clear :: !clear_caches_ref);
    add_plevel_hook Cache.clear;
    (* Uncached version *)
    let from_ival_size_aux ival size =
      (* Auxiliary function when [ival] is precise. The result will be contained
         in [min..start_max+size-1]. Create an englobing offsetmap, then update
         it for all intervals. *)
      let aux_min_max min start_max =
        if Int.(equal size zero) then Bottom else
          let max = pred (start_max +~ size) in
          let curr_off, ifalse = aux_create_interval ~min ~max false in
          let validity = Base.Known (min, max) in
          let curr_off', i =
            try
              Int_Intervals_Map.update_aux
                ~validity ~exact:true ~offsets:ival ~size true curr_off ifalse
            with Int_Intervals_Map.Update_Result_is_bottom ->
              assert false (* in bounds by construction *)
          in
          Intervals (curr_off', i, min, max)
      in
      try
        match Ival.min_and_max ival with
        | None, _ | _, None -> top
        | Some min, Some max -> aux_min_max min max
      with Error_Bottom -> bottom
    in
    Cache.merge from_ival_size_aux

  (* Over-approximation of the conversion of an ival+size to a set of
     intervals *)
  let from_ival_size ival size =
    match size with
    | Int_Base.Top -> top
    | Int_Base.Value size -> from_ival_size_over_cached ival size

  (* Under-approximation of the conversion of an ival+size to a set of
     intervals. Basically, we see if we are going to over-approximate (in which
     case we return Bottom). Otherwise, we use the over-approximating function,
     which is by definition exact in this case, and has a cache *)
  let from_ival_size_under ival size =
    match size with
    | Int_Base.Top -> Bottom (* imprecise *)
    | Int_Base.Value size ->
      if Ival.is_small_set ival
      then from_ival_size_over_cached ival size (* precise *)
      else
        match Ival.min_and_max ival with
        | None, _ | _, None -> Bottom (* imprecise *)
        | Some min, Some start_max ->
          (* See if using [from_ival_size] would cause an approximation *)
          let max = pred (start_max +~ size) in
          let validity = Base.Known (min, max) in
          let offsets = Tr_offset.trim_by_validity ival size validity in
          if Int_Intervals_Map.update_aux_tr_offsets_approximates offsets size
          then bottom (* imprecise *)
          else from_ival_size_over_cached ival size (* precise *)

  let range_covers_whole_type typ itvs =
    match project_singleton itvs with
    | Some (b, e) ->
      (try
         let s = Cil.bitsSizeOf typ in
         Int.equal b Int.zero && Int.equal e (Int.of_int (s-1))
       with Cil.SizeOfError _ -> false)
    | None -> false

  (* Interval bound in a zero-rooted offsetmap, expressed as a value of this
     module. Not currently exported *)
  let bounds_as_itv map =
    match map with
    | Empty -> bottom
    | Node _ ->
      let min, max = Int_Intervals_Map.bounds_offset Int.zero map in
      inject_bounds min max

  (* Although interval functions do not depend on the AST itself, there are
     numerous problems with not clearing the caches when the AST is reset.
     Hence, the weak hash table for boolean offsetmaps depends on Ast.self,
     and the caches are reset on an ast update. *)
  let () = Ast.add_hook_on_update
      (fun () ->
         (* Kernel.debug ~dkey:dkey_caches "Clearing interval caches"; *)
         Int_Intervals_Map.clear_caches ())

end

(* -------------------------------------------------------------------------- *)
(* --- Bitwise offsetmaps                                                 --- *)
(* -------------------------------------------------------------------------- *)


module Make_bitwise(V: sig
    include Lattice_type.Bounded_Join_Semi_Lattice
    include Lattice_type.With_Narrow with type t := t
    include Lattice_type.With_Top with type t := t
  end) = struct

  module Isotropic_Value = struct
    include V
    include FullyIsotropic
    let merge_neutral_element = bottom
    let pretty_typ _ fmt v = pretty fmt v
  end

  include Make (Isotropic_Value) (Default_Parameters)

  type intervals = Int_Intervals.intervals

  let create = create_isotropic

  let v_size_mod v = (v, Int.one, Rel.zero)

  let add_binding_intervals ~validity ~exact itvs v m =
    try
      match Base.valid_range validity with
      | Base.Invalid_range -> `Bottom
      | Base.Valid_range None -> (* empty validity *) `Value m
      | Base.Valid_range (Some _) ->
        let clip = clip_by_validity validity in
        let aux_itv itv m =
          let itv = clip itv in
          if Int.le (fst itv) (snd itv) then
            add ~exact itv (v_size_mod v) m
          else m
        in
        `Value (Int_Intervals.fold aux_itv itvs m)
    with Error_Top ->
      update_imprecise_everywhere ~validity Origin.(current Misalign_write) v m

  let add_binding_ival ~validity ~exact offsets ~size v m =
    match size with
    | Int_Base.Value size ->
      update ~validity ~exact ~offsets ~size v m
    | Int_Base.Top ->
      update_imprecise_everywhere ~validity Origin.(current Misalign_write) v m

  let fold_itv ?direction ~entire f itv m acc =
    let f' itv (v, _, _) acc = f itv v acc in
    fold_between ?direction ~entire itv f' m acc

  let find = find_imprecise_between

  let find_iset ~validity itvs m =
    try
      let aux_itv i acc =  V.join acc (find i m) in
      Int_Intervals.fold aux_itv itvs V.bottom
    with Error_Top -> find_imprecise ~validity m

  module V_Hashtbl = FCHashtbl.Make(V)

  (* Map indexed by sorted lists of integers. Used by function [fold_fuse_same]
     below, to sort bound values by increasing intervals. *)
  module MapIntervals =
    Map.Make(struct
      type t = (Int.t * Int.t) list
      let compare_itv (b1, e1) (b2, e2) =
        let c = Integer.compare b1 b2 in
        if c = 0
        then Integer.compare e1 e2
        else c
      let compare = Extlib.list_compare compare_itv
    end)

  let fold_fuse_same f m acc =
    let h = V_Hashtbl.create 17 in
    (* Map the various values in m to the intervals they appear in*)
    let sort_by_content itv (v, _, _) () =
      let cur =
        try V_Hashtbl.find h v
        with Not_found -> []
      in
      V_Hashtbl.replace h v (itv :: cur)
    in
    fold sort_by_content m ();
    (* Now sort the contents of h by increasing intervals *)
    let m = V_Hashtbl.fold
        (fun v itvs acc -> MapIntervals.add (List.rev itvs) v acc)
        h MapIntervals.empty
    in
    (* Call f on those intervals *)
    MapIntervals.fold
      (fun itvs v acc -> f (Int_Intervals.inject itvs) v acc) m acc

  let fold f m acc =
    let f' (ib, ie) (v, _, _) acc =
      let itv = Int_Intervals.inject_bounds ib ie in
      f itv v acc
    in
    fold f' m acc

  let default_skip _ = false

  let pretty_generic ?typ ?(pretty_v=V.pretty) ?(skip_v=default_skip) ?(sep="<:") () fmt m =
    let range_covers_whole_type itvs =
      match typ with
      | None -> false
      | Some typ -> Int_Intervals.range_covers_whole_type typ itvs
    in
    let pp_itv = Int_Intervals.pretty_typ typ in
    let first = ref true in
    let pretty_binding fmt itvs v () =
      if not (skip_v v) then begin
        if !first then first := false else Format.fprintf fmt "@," ;
        Format.fprintf fmt "@[<hv>@[%a@]%(%)@[%s @[%a@]@]@]"
          pp_itv itvs
          (if range_covers_whole_type itvs
           then (" ": (unit,Format.formatter,unit) format) else "@ ")
          sep pretty_v v
      end
    in
    Format.fprintf fmt "@[<v>";
    fold_fuse_same (pretty_binding fmt) m ();
    if !first then Format.fprintf fmt "%s@ %s" sep (Unicode.emptyset_string ());
    Format.fprintf fmt "@]"

  let map = map_on_values
  let map2 = map2_on_values

  (* Simultaneous recursive descent on an offsetmap bitwise and on an interval
     map. This function handles the case where the intervals and the offsetmap
     do not cover the same range. *)
  let fold_join_itvs_map_offset cache (type r) f join empty =
    let module R = struct type t = r let sentinel = empty end in
    let merge = match cache with
      | Hptmap_sig.PersistentCache _ | Hptmap_sig.TemporaryCache _ ->
        let module Cache =
          Binary_cache.Arity_Two(Cacheable)(Int_Intervals_Map.Cacheable)(R)
        in
        (match cache with
         | Hptmap_sig.PersistentCache _ ->
           clear_caches_ref := Cache.clear :: !clear_caches_ref
         | _ -> ());
        Cache.merge
      | Hptmap_sig.NoCache -> fun f x y -> f x y
    in
    let rec aux cache (o1, t1) (o2, t2) =
      match t1, t2 with
      | Empty, _ | _, Empty
      | _, Node (_, _, Empty, _, Empty, _, _, false, _) ->
        empty (* Notice that we do not present to [f] the intervals that
                 are present in [o2] but not in [o1] (i.e. in the zone but
                 not in the map). For the current users of this module,
                 the map is always of the size of the validity of the base,
                 hence this is not a problem. *)
      | _, Node (_, _, Empty, offr2, (Node _ as subr2), _, _, false, _) ->
        aux cache (o1, t1) (o2 +~ offr2, subr2)
      | _, Node (_, offl2, (Node _ as subl2), _, Empty, _, _, false, _) ->
        aux cache (o1, t1) (o2 +~ offl2, subl2)
      | _, Node (_, offl2, (Node _ as subl2), offr2, (Node _ as subr2),
                 _, _, false, _) ->
        (* This special case seems redundant with the ones above and the next
           one, but it speeds up dramatically this function. Otherwise, we
           would recurse on t1 until the interval bound to false is split in
           many small parts, without never adding anything. *)
        join
          (cache (o1, t1) (o2 +~ offl2, subl2))
          (cache (o1, t1) (o2 +~ offr2, subr2))
      | Node (max1, offl1, subl1, offr1, subr1, _, _, v, _),
        Node (max2, offl2, subl2, offr2, subr2, _, _, true, _) ->
        let amin1 = o1 in
        let amax1 = max1 +~ o1 in
        let amin2 = o2 in
        let amax2 = max2 +~ o2 in
        let ol1 = o1 +~ offl1 in
        let ol2 = o2 +~ offl2 in
        let or1 = o1 +~ offr1 in
        let or2 = o2 +~ offr2 in
        if amax1 <~ amin2  then begin
          join (cache (o1, t1) (ol2, subl2)) (cache (or1, subr1) (o2, t2))
        end else if amin1 >~ amax2 then begin
          join (cache (o1, t1) (or2, subr2)) (cache (ol1, subl1) (o2, t2))
        end else begin
          if amin1 =~ amin2 then begin
            let foo =
              if amax1 =~ amax2 then begin
                join (f amin1 amax1 v) (cache (or1, subr1) (or2, subr2))
              end
              else if amax1 >~ amax2 then begin
                join (f amin1 amax2 v) (cache (o1, t1) (or2, subr2))
              end
              else begin
                join (f amin1 amax1 v) (cache (or1, subr1) (o2, t2))
              end
            in
            join foo (cache (ol1, subl1) (ol2, subl2))
          end
          else
            let treat_right_nodes mabs_min =
              if amax1 =~ amax2 then begin
                join (f mabs_min amax1 v) (cache (or1, subr1) (or2, subr2))
              end
              else if amax1 >~ amax2 then begin
                join (f mabs_min amax2 v) (cache (o1, t1) (or2, subr2))
              end
              else begin
                join (f mabs_min amax1 v) (cache (or1, subr1) (o2, t2))
              end
            in
            if amin1 >~ amin2 then begin
              join (treat_right_nodes amin1) (cache (ol1, subl1) (o2, t2))
            end
            else begin
              join (treat_right_nodes amin2) (cache (o1, t1) (ol2, subl2))
            end
        end
    and compute (_, t1 as v1) (_, t2 as v2) =
      if t1 == Empty || t2 == Empty then empty
      else
        merge (aux compute) v1 v2
    in
    compute
  ;;

  (* Simultaneous recursive descent on an offsetmap bitwise and on an
     interval. *)
  let fold_join_itvs ~cache f join empty =
    (* fold_join on non-degenerate intervals. Partial application is important*)
    let aux_intervals = fold_join_itvs_map_offset cache f join empty in
    fun itvs m ->
      match itvs with
      | Int_Intervals.Bottom -> empty
      | Int_Intervals.Intervals (curr_off, itvs, _, _) ->
        aux_intervals (Int.zero, m) (curr_off, itvs)
      | Int_Intervals.Top ->
        (* Find the range that is bound in [m], and use this as interval.
           We would not return anything outside anyway. *)
        match Int_Intervals.bounds_as_itv m with
        | Int_Intervals.Bottom -> empty
        | Int_Intervals.Intervals (curr_off, itvs, _, _) ->
          aux_intervals (Int.zero, m) (curr_off, itvs)
        | Int_Intervals.Top -> assert false

end

[@@@warning "-60"]
(* The module below is template destined to be copy-pasted. We need to silence
   the warning about unused modules. *)

module Aux
    (V1 : Offsetmap_lattice_with_isotropy.S)
    (V2 : Offsetmap_lattice_with_isotropy.S)
= struct

  module M1 = Make(V1)
  module M2 = Make(V2)

  (* This function is there as a template for people wanting to write a fold-like
      iterator on two offsetmaps simultaneously. [bounds o1 t1 = bounds o2 t2]
      need not to hold; the function returns [empty] when the maps
     have no overlap. Currently, this functor  is not exported. *)
  let _map_fold2 (type s) (type t) f join empty o1 (t1: s offsetmap) o2 (t2: t offsetmap) =
    let rec aux  (o1, t1) (o2, t2) =
      match t1, t2 with
      | Empty, Empty -> empty
      | Empty, _ | _, Empty -> assert false
      | Node (max1, offl1, subl1, offr1, subr1, _, _, v1, _),
        Node (max2, offl2, subl2, offr2, subr2, _, _, v2, _) ->
        let amin1 = o1 in
        let amax1 = max1 +~ o1 in
        let amin2 = o2 in
        let amax2 = max2 +~ o2 in
        let ol1 = o1 +~ offl1 in
        let ol2 = o2 +~ offl2 in
        let or1 = o1 +~ offr1 in
        let or2 = o2 +~ offr2 in
        if amax1 <~ amin2  then begin
          join (aux (o1, t1) (ol2, subl2)) (aux (or1, subr1) (o2, t2))
        end else if amin1 >~ amax2 then begin
          join (aux (o1, t1) (or2, subr2)) (aux (ol1, subl1) (o2, t2))
        end else begin
          if amin1 =~ amin2 then begin
            let foo =
              if amax1 =~ amax2 then begin
                join (f amin1 amax1 v1 v2) (aux (or1, subr1) (or2, subr2))
              end
              else if amax1 >~ amax2 then begin
                join (f amin1 amax2 v1 v2) (aux (o1, t1) (or2, subr2))
              end
              else begin
                join (f amin1 amax1 v1 v2) (aux (or1, subr1) (o2, t2))
              end
            in
            join foo (aux (ol1, subl1) (ol2, subl2))
          end
          else
            let treat_right_nodes mabs_min =
              if amax1 =~ amax2 then begin
                join (f mabs_min amax1 v1 v2) (aux (or1, subr1) (or2, subr2))
              end
              else if amax1 >~ amax2 then begin
                join (f mabs_min amax2 v1 v2) (aux (o1, t1) (or2, subr2))
              end
              else begin
                join (f mabs_min amax1 v1 v2) (aux (or1, subr1) (o2, t2))
              end;
            in
            if amin1 >~ amin2 then begin
              join (treat_right_nodes amin1) (aux (ol1, subl1) (o2, t2))
            end
            else begin
              join (treat_right_nodes amin2) (aux (o1, t1) (ol2, subl2))
            end
        end
    in
    aux (o1, t1) (o2, t2)
  ;;

end

[@@@warning "+60"]

(*
Local Variables:
compile-command: "make -C ../../.."
End:
*)
