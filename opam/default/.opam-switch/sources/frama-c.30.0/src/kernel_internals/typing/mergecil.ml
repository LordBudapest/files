(****************************************************************************)
(*                                                                          *)
(*  Copyright (C) 2001-2003                                                 *)
(*   George C. Necula    <necula@cs.berkeley.edu>                           *)
(*   Scott McPeak        <smcpeak@cs.berkeley.edu>                          *)
(*   Wes Weimer          <weimer@cs.berkeley.edu>                           *)
(*   Ben Liblit          <liblit@cs.berkeley.edu>                           *)
(*  All rights reserved.                                                    *)
(*                                                                          *)
(*  Redistribution and use in source and binary forms, with or without      *)
(*  modification, are permitted provided that the following conditions      *)
(*  are met:                                                                *)
(*                                                                          *)
(*  1. Redistributions of source code must retain the above copyright       *)
(*  notice, this list of conditions and the following disclaimer.           *)
(*                                                                          *)
(*  2. Redistributions in binary form must reproduce the above copyright    *)
(*  notice, this list of conditions and the following disclaimer in the     *)
(*  documentation and/or other materials provided with the distribution.    *)
(*                                                                          *)
(*  3. The names of the contributors may not be used to endorse or          *)
(*  promote products derived from this software without specific prior      *)
(*  written permission.                                                     *)
(*                                                                          *)
(*  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS     *)
(*  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT       *)
(*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS       *)
(*  FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE          *)
(*  COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,     *)
(*  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,    *)
(*  BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;        *)
(*  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER        *)
(*  CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT      *)
(*  LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN       *)
(*  ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE         *)
(*  POSSIBILITY OF SUCH DAMAGE.                                             *)
(*                                                                          *)
(*  File modified by CEA (Commissariat à l'énergie atomique et aux          *)
(*                        énergies alternatives)                            *)
(*               and INRIA (Institut National de Recherche en Informatique  *)
(*                          et Automatique).                                *)
(*                                                                          *)
(****************************************************************************)

(* mergecil.ml *)
(* This module is responsible for merging multiple CIL source trees into
 * a single, coherent CIL tree which contains the union of all the
 * definitions in the source files.  It effectively acts like a linker,
 * but at the source code level instead of the object code level. *)

open Extlib
open Cil_types
open Cil
module H = Hashtbl

open Logic_utils

let debugInlines = false

(* Try to merge structure with the same name. However, do not complain if
 * they are not the same *)
let mergeSynonyms = true


(** Whether to use path compression *)
let usePathCompression = true

(* The default value has been changed to false after Boron to fix bts#524.
   But this behavior is very convenient to parse the Linux kernel. *)
let mergeInlinesWithAlphaConvert () = Kernel.AggressiveMerging.get ()


(* when true, merge duplicate definitions of externally-visible functions;
 * this uses a mechanism which is faster than the one for inline functions,
 * but only probabilistically accurate *)
let mergeGlobals = true

(* Return true if 's' starts with the prefix 'p' *)
let prefix p s =
  let lp = String.length p in
  let ls = String.length s in
  lp <= ls && String.sub s 0 lp = p

let d_nloc fmt (lo: (location * int) option) =
  match lo with
    None -> Format.fprintf fmt "None"
  | Some (l, idx) ->
    Format.fprintf fmt "Some(%d at %a)" idx Cil_printer.pp_location l

type ('a, 'b) node =
  { nname: 'a;   (* The actual name *)
    nfidx: int;      (* The file index *)
    ndata: 'b;       (* Data associated with the node *)
    mutable nloc: (location * int) option;
    (* location where defined and index within the file of the definition.
     * If None then it means that this node actually DOES NOT appear in the
     * given file. In rare occasions we need to talk in a given file about
     * types that are not defined in that file. This happens with undefined
     * structures but also due to cross-contamination of types in a few of
     * the cases of combineType (see the definition of combineTypes). We
     * try never to choose as representatives nodes without a definition.
     * We also choose as representative the one that appears earliest *)
    mutable nrep: ('a, 'b) node;
    (* A pointer to another node in its class (one
     * closer to the representative). The nrep node
     * is always in an earlier file, except for the
     * case where a name is undefined in one file
     * and defined in a later file. If this pointer
     * points to the node itself then this is the
     * representative.  *)
    mutable nmergedSyns: bool (* Whether we have merged the synonyms for
                               * the node of this name *)
  }

module Merging
    (H:
     sig
       include Hashtbl.HashedType
       val merge_synonym: t -> bool (* whether this name should be considered
                                       for merging or not.
                                    *)
       val compare: t -> t -> int
       val output: Format.formatter -> t -> unit
     end
    ):
sig
  type 'a eq_table
  type 'a syn_table
  val create_eq_table: int -> 'a eq_table
  val find_eq_table: 'a eq_table -> (int * H.t) -> (H.t, 'a) node
  val add_eq_table: 'a eq_table -> (int * H.t) -> (H.t,'a) node -> unit
  val iter_eq_table:
    ((int * H.t) -> (H.t,'a) node -> unit) -> 'a eq_table -> unit
  val clear_eq: 'a eq_table -> unit
  val create_syn_table: int -> 'a syn_table
  val clear_syn: 'a syn_table -> unit
  val mkSelfNode:
    'a eq_table -> 'a syn_table -> int -> H.t -> 'a ->
    (location * int) option -> (H.t, 'a) node
  val find: bool -> (H.t, 'a) node -> (H.t, 'a) node
  val union: (H.t, 'a) node -> (H.t,'a) node -> (H.t, 'a) node * (unit -> unit)
  val findReplacement:
    bool -> 'a eq_table -> int -> H.t -> ('a * int) option
  val getNode: 'a eq_table -> 'a syn_table -> int ->
    H.t -> 'a -> (location * int) option -> (H.t, 'a) node
  (* [doMergeSynonyms eq compare]
     tries to merge synonyms. Do not give an error if they fail to merge
     compare is a comparison function that throws Failure if no match *)
  val doMergeSynonyms: 'a syn_table -> (int -> 'a -> int -> 'a -> unit) -> unit
  val dumpGraph: string -> 'a eq_table -> unit
end
=
struct
  module Elts =
  struct
    type t = int * H.t
    let hash (d,x) = 19 * d + H.hash x
    let equal (d1,x1) (d2,x2) = d1 = d2 && H.equal x1 x2
    let compare (d1,x1) (d2,x2) =
      let res = compare d1 d2 in
      if res = 0 then H.compare x1 x2 else res
  end

  (* Find the representative for a node and compress the paths in the process *)
  module Heq = Hashtbl.Make (Elts)

  module Iter_sorted = Map.Make(Elts)

  module Hsyn = Hashtbl.Make(H)

  type 'a eq_table = (H.t,'a) node Heq.t
  type 'a syn_table = (H.t,'a) node Hsyn.t

  let create_eq_table x = Heq.create x
  let create_syn_table x = Hsyn.create x

  let clear_eq = Heq.clear
  let clear_syn = Hsyn.clear

  let find_eq_table = Heq.find

  let add_eq_table = Heq.add

  let iter_eq_table f t =
    let sorted = Heq.fold Iter_sorted.add t Iter_sorted.empty in
    Iter_sorted.iter f sorted

  (* Make a node with a self loop. This is quite tricky. *)
  let mkSelfNode eq syn fidx name data l =
    let rec res = { nname = name; nfidx = fidx; ndata = data; nloc = l;
                    nrep  = res; nmergedSyns = false; }
    in
    Heq.add eq (fidx, name) res; (* Add it to the proper table *)
    (* mergeSynonyms is not active for anonymous types, probably because it is
       licit to have two distinct anonymous types in two different files
       (which should not be merged). However, for anonymous enums, they
       can, and are, in fact merged by CIL. Hence, we permit the merging of
       anonymous enums with the same base name *)
    if mergeSynonyms && H.merge_synonym name
    then Hsyn.add syn name res;
    res

  (* Find the representative with or without path compression *)
  let rec find pathcomp nd =
    let dkey = Kernel.dkey_linker_find in
    Kernel.debug ~dkey "find %a(%d)" H.output nd.nname nd.nfidx ;
    if nd.nrep == nd then begin
      Kernel.debug ~dkey "= %a(%d)" H.output nd.nname nd.nfidx ;
      nd
    end else begin
      let res = find pathcomp nd.nrep in
      if usePathCompression && pathcomp && nd.nrep != res then
        nd.nrep <- res; (* Compress the paths *)
      res
    end


  (* Union two nodes and return the new representative. We prefer as the
   * representative a node defined earlier. We try not to use as
   * representatives nodes that are not defined in their files. We return a
   * function for undoing the union. Make sure that between the union and the
   * undo you do not do path compression *)
  let union nd1 nd2 =
    (* Move to the representatives *)
    let nd1 = find true nd1 in
    let nd2 = find true nd2 in
    if nd1 == nd2 then begin
      (* It can happen that we are trying to union two nodes that are already
       * equivalent. This is because between the time we check that two nodes
       * are not already equivalent and the time we invoke the union operation
       * we check type isomorphism which might change the equivalence classes *)
(*
    ignore (warn "unioning already equivalent nodes for %s(%d)"
              nd1.nname nd1.nfidx);
*)
      nd1, fun x -> x
    end else begin
      let rep, norep = (* Choose the representative *)
        if (nd1.nloc != None) =  (nd2.nloc != None) then
          (* They have the same defined status. Choose the earliest *)
          if nd1.nfidx < nd2.nfidx then nd1, nd2
          else if nd1.nfidx > nd2.nfidx then nd2, nd1
          else (* In the same file. Choose the one with the earliest index *)
            begin
              match nd1.nloc, nd2.nloc with
                Some (_, didx1), Some (_, didx2) ->
                if didx1 < didx2 then nd1, nd2 else
                if didx1 > didx2 then nd2, nd1
                else begin
                  Kernel.warning
                    "Merging two elements (%a and %a) \
                     in the same file (%d) \
                     with the same idx (%d) within the file"
                    H.output nd1.nname H.output nd2.nname nd1.nfidx didx1 ;
                  nd1, nd2
                end
              | _, _ ->
                (* both none. Does not matter which one we choose. Should not happen
                   though. *)
                (* sm: it does happen quite a bit when, e.g. merging STLport with
                   some client source; I'm disabling the warning since it supposedly
                   is harmless anyway, so is useless noise *)
                (* sm: re-enabling on claim it now will probably not happen *)
                Kernel.warning ~current:true
                  "Merging two undefined elements in the same file: %a and %a"
                  H.output nd1.nname H.output nd2.nname ;
                nd1, nd2
            end
        else (* One is defined, the other is not. Choose the defined one *)
        if nd1.nloc != None then nd1, nd2 else nd2, nd1
      in
      let oldrep = norep.nrep in
      norep.nrep <- rep;
      rep, (fun () -> norep.nrep <- oldrep)
    end

  let findReplacement pathcomp eq fidx name =
    let dkey = Kernel.dkey_linker_find in
    Kernel.debug ~dkey "findReplacement for %a(%d)" H.output name fidx;
    match Heq.find_opt eq (fidx, name) with
    | None ->
      Kernel.debug ~dkey "not found in the map";
      None
    | Some nd ->
      if nd.nrep == nd then begin
        Kernel.debug ~dkey "is a representative";
        None (* No replacement if this is the representative of its class *)
      end else
        let rep = find pathcomp nd in
        if rep != rep.nrep then
          Kernel.abort "find does not return the representative" ;
        Kernel.debug ~dkey "RES = %a(%d)" H.output rep.nname rep.nfidx;
        Some (rep.ndata, rep.nfidx)

  (* Make a node if one does not already exist. Otherwise return the
   * representative *)
  let getNode eq syn fidx name data l =
    let dkey = Kernel.dkey_linker_find in
    Kernel.debug ~dkey "getNode(%a(%d), %a)" H.output name fidx d_nloc l;
    match Heq.find_opt eq (fidx, name) with
    | None ->
      let res = mkSelfNode eq syn fidx name data l in
      Kernel.debug ~dkey "made a new one";
      res
    | Some res ->
      (match res.nloc, l with
       (* Maybe we have a better location now *)
         None, Some _ -> res.nloc <- l
       | Some (old_l, old_idx), Some (l, idx) ->
         if old_idx != idx  then
           Kernel.warning ~current:true
             "Duplicate definition of node %a(%d) at indices %d(%a) and %d(%a)"
             H.output name fidx old_idx
             Cil_printer.pp_location old_l idx
             Cil_printer.pp_location l
       | _, _ -> ());
      Kernel.debug ~dkey "node already found";
      find false res (* No path compression *)

  let doMergeSynonyms syn compare =
    Hsyn.iter
      (fun n node ->
         if not node.nmergedSyns then begin
           (* find all the nodes for the same name *)
           let all = Hsyn.find_all syn n in
           (* classes are a list of representative for the nd name.
              We'll select an appropriate one according to the comparison
              function. *)
           let tryone classes nd =
             nd.nmergedSyns <- true;
             (* Compare in turn with all the classes we have so far *)
             let rec compareWithClasses = function
               | [] -> [nd] (* No more classes. Add this as a new class *)
               | c :: restc ->
                 try
                   compare c.nfidx c.ndata  nd.nfidx nd.ndata;
                   (* Success. Stop here the comparison *)
                   c :: restc
                 with Failure _ -> (* Failed. Try next class *)
                   c :: (compareWithClasses restc)
             in
             compareWithClasses classes
           in
           (* Start with an empty set of classes for this name *)
           let _ = List.fold_left tryone [] all in
           ()
         end)
      syn

  (* Dump a graph. No need to use ~dkey, this function is never called unless
     we are in proper debug mode. *)
  let dumpGraph what eq : unit =
    Kernel.debug "Equivalence graph for %s is:" what;
    iter_eq_table
      (fun (fidx, name) nd ->
         Kernel.debug "  %a(%d) %s-> "
           H.output name fidx (if nd.nloc = None then "(undef)" else "");
         if nd.nrep == nd then
           Kernel.debug "*"
         else
           Kernel.debug " %a(%d)" H.output nd.nrep.nname nd.nrep.nfidx
      ) eq

end

(** A number of alpha conversion tables. We ought to keep one table for each
 * name space. Unfortunately, because of the way the C lexer works, type
 * names must be different from variable names!! We one alpha table both for
 * variables and types. *)
let vtAlpha: location Alpha.alphaTable
  = H.create 57 (* Variables and
                 * types *)
let sAlpha: location Alpha.alphaTable
  = H.create 57 (* Structures and
                 * unions have
                 * the same name
                 * space *)
let eAlpha: location Alpha.alphaTable
  = H.create 57 (* Enumerations *)

let aeAlpha = H.create 57 (* Anonymous enums. *)

(* The original mergecil uses plain old Hashtbl for everything. *)
module PlainMerging =
  Merging
    (struct
      type t = string
      let hash = Hashtbl.hash
      let equal = (=)
      let compare = compare
      let merge_synonym name = not (prefix "__anon" name)
      let output = Format.pp_print_string
    end)

module LogicMerging =
  Merging
    (struct
      type t = logic_info
      let hash li =
        Hashtbl.hash li.l_var_info.lv_name + 3 * List.length li.l_profile
      let equal li1 li2 =
        Datatype.String.equal li1.l_var_info.lv_name li2.l_var_info.lv_name
        &&
        Logic_utils.is_same_logic_profile li1 li2
      let compare li1 li2 =
        let res =
          String.compare li1.l_var_info.lv_name li2.l_var_info.lv_name
        in
        if res <> 0 then res
        else
          let rec aux l1 l2 =
            match l1, l2 with
            | [], [] -> 0
            | _, [] -> 1
            | [], _ -> -1
            | h1::t1, h2::t2 ->
              let res =
                Cil_datatype.Logic_type_ByName.compare h1.lv_type h2.lv_type
              in
              if res <> 0 then res
              else aux t1 t2
          in
          aux li1.l_profile li2.l_profile
      let merge_synonym _ = true
      let output = Cil_datatype.Logic_info.pretty
    end)

let hash_list f l =
  let rec aux acc n = function
    | [] -> acc
    | x::l when n > 0 -> aux (3 * acc + f x) (n-1) l
    | _ -> acc
  in aux 47 3 l


module ExtMerging =
  Merging
    (struct
      type t = acsl_extension
      let rec hash (e : acsl_extension) =
        let hash_ext_kind = function
          | Ext_id i -> Datatype.Int.hash i
          | Ext_terms terms -> 29 * (hash_list Logic_utils.hash_term terms)
          | Ext_preds preds -> 47 * (hash_list Logic_utils.hash_predicate preds)
          | Ext_annot (id, annots) -> Datatype.String.hash id + 5 * (hash_list hash annots)
        in
        Datatype.String.hash e.ext_name + 5 * hash_ext_kind e.ext_kind
      let rec compare (e1 : acsl_extension) (e2 : acsl_extension) =
        let compare_ext_kind k1 k2 =
          match k1, k2 with
          | Ext_id i1, Ext_id i2 -> Datatype.Int.compare i1 i2
          | Ext_id _, _ -> 1 | _, Ext_id _ -> -1
          | Ext_terms terms1, Ext_terms terms2 ->
            Extlib.list_compare Logic_utils.compare_term terms1 terms2
          | Ext_terms _, _ -> 1 | _, Ext_terms _ -> -1
          | Ext_preds p1, Ext_preds p2 ->
            Extlib.list_compare Logic_utils.compare_predicate p1 p2
          | Ext_preds _, _ -> 1 | _, Ext_preds _ -> -1
          | Ext_annot (id1, a1) , Ext_annot (id2, a2)  ->
            match String.compare id1 id2 with
            | 0 -> Extlib.list_compare compare a1 a2
            | n -> n
        in
        let res = Datatype.String.compare e1.ext_name e2.ext_name in
        if res <> 0 then res
        else
          let res = Datatype.Bool.compare e1.ext_has_status e2.ext_has_status in
          if res <> 0 then res
          else
            compare_ext_kind e1.ext_kind e2.ext_kind
      let equal x y = compare x y = 0
      let merge_synonym _ = true
      let output fmt {ext_name} =
        Format.fprintf fmt "global ACSL extension %s" ext_name
    end)

type volatile_kind = R | W

let equal_volatile_kind v1 v2 =
  match v1, v2 with
  | R, R | W, W -> true
  | (R | W), _ -> false

let compare_volatile_kind v1 v2 =
  match v1, v2 with
  | R, W -> 1
  | R, R -> 0
  | W, W -> 0
  | W, R -> -1

let pretty_volatile_kind fmt v =
  let s = match v with
    | R -> "reads"
    | W -> "writes"
  in
  Format.pp_print_string fmt s

module VolatileMerging =
  Merging
    (struct
      type t = identified_term * volatile_kind
      let hash_term it = Logic_utils.hash_term it.it_content
      let hash = function
        | ts,R -> 1 + 5 * hash_term ts
        | ts,W -> 2 + 5 * hash_term ts
      let equal (t1,v1) (t2,v2) =
        equal_volatile_kind v1 v2 &&
        Logic_utils.is_same_identified_term t1 t2
      let compare (t1,v1) (t2,v2) =
        let cmp = compare_volatile_kind v1 v2 in
        if cmp <> 0 then cmp else
          Logic_utils.compare_term t1.it_content t2.it_content

      let merge_synonym _ = true
      let output fmt (hs,kind) =
        Format.fprintf fmt "%a function for %a volatile location"
          pretty_volatile_kind kind
          Cil_printer.pp_identified_term hs
    end)

let hash_type t =
  let rec aux acc depth = function
    | TVoid _ -> acc
    | TInt (ikind,_) -> 3 * acc + Hashtbl.hash ikind
    | TFloat (fkind,_) -> 5 * acc + Hashtbl.hash fkind
    | TPtr(t,_) when depth < 5 -> aux (7*acc) (depth+1) t
    | TPtr _ -> 7 * acc
    | TArray (t,_,_) when depth < 5 -> aux (9*acc) (depth+1) t
    | TArray _ -> 9 * acc
    | TFun (r,_,_,_) when depth < 5 -> aux (11*acc) (depth+1) r
    | TFun _ -> 11 * acc
    | TNamed (t,_) -> 13 * acc + Hashtbl.hash t.tname
    | TComp(c,_) ->
      let mul = if c.cstruct then 17 else 19 in
      mul * acc + Hashtbl.hash c.cname
    | TEnum (e,_) -> 23 * acc + Hashtbl.hash e.ename
    | TBuiltin_va_list _ -> 29 * acc
  in
  aux 117 0 t

module ModelMerging =
  Merging
    (struct
      type t = string * typ
      let hash (s,t) =
        Datatype.String.hash s + 3 * hash_type t
      let equal (s1,t1 : t) (s2,t2) =
        s1 = s2 && Cil_datatype.TypByName.equal t1 t2
      let compare (s1,t1) (s2, t2) =
        let res = String.compare s1 s2 in
        if res = 0 then Cil_datatype.TypByName.compare t1 t2 else res
      let merge_synonym _ = true
      let output fmt (s,t) =
        Format.fprintf fmt "model@ %a@ { %s }" Cil_printer.pp_typ t s
    end)


let compare_int e1 e2 =
  match (constFold true e1), (constFold true e2) with
  | {enode = Const(CInt64(i, _, _))}, {enode = Const(CInt64(i', _, _))} ->
    Integer.compare i i'
  | e1,e2 -> Cil_datatype.Exp.compare e1 e2
(* not strictly accurate, but should do the trick anyway *)

let have_same_enum_items oldei ei =
  if List.length oldei.eitems <> List.length ei.eitems then
    raise (Failure "different number of enumeration elements");
  (* We check that they are defined in the same way. This is a fairly
   * conservative check. *)
  List.iter2
    (fun old_item item ->
       if old_item.einame <> item.einame then
         raise (Failure
                  "different names for enumeration items");
       if not (same_int64 old_item.eival item.eival) then
         raise (Failure "different values for enumeration items"))
    oldei.eitems ei.eitems

let compare_enum_item e1 e2 =
  let res = String.compare e1.einame e2.einame in
  if res = 0 then compare_int e1.eival e2.eival else res

let same_enum_items oldei ei =
  try have_same_enum_items oldei ei; true
  with Failure _ -> false

let is_anonymous_enum e = prefix "__anonenum" e.ename

module EnumMerging =
  Merging
    (struct
      type t = enuminfo
      let hash s =
        let key =
          if is_anonymous_enum s && s.eitems <> [] (*should always be true *)
          then (List.hd s.eitems).einame
          else s.ename
        in
        Datatype.String.hash key
      let equal e1 e2 =
        (is_anonymous_enum e1 && is_anonymous_enum e2 &&
         (same_enum_items e1 e2 ||
          (e1.ename = e2.ename &&
           (e2.ename <-
              fst
                (Alpha.newAlphaName
                   ~alphaTable:aeAlpha ~undolist:None ~lookupname:e2.ename
                   ~data:Cil_datatype.Location.unknown);
            Kernel.debug ~dkey:Kernel.dkey_linker
              "new anonymous name %s" e2.ename;
            false))))
        || e1.ename = e2.ename
      let compare e1 e2 =
        if is_anonymous_enum e1 then
          if is_anonymous_enum e2 then
            Extlib.list_compare compare_enum_item e1.eitems e2.eitems
          else -1
        else if is_anonymous_enum e2 then 1
        else String.compare e1.ename e2.ename
      let merge_synonym _ = true
      let output fmt e =
        Cil_printer.pp_global fmt (GEnumTag (e, Cil_datatype.Location.unknown))
    end)

open PlainMerging

(* For each name space we define a set of equivalence classes *)
let vEq = PlainMerging.create_eq_table 111 (* Vars *)
let sEq = PlainMerging.create_eq_table 111 (* Struct + union *)
let eEq = EnumMerging.create_eq_table 111 (* Enums *)
let tEq = PlainMerging.create_eq_table 111 (* Type names*)
let iEq = PlainMerging.create_eq_table 111 (* Inlines *)

let lfEq = LogicMerging.create_eq_table 111 (* Logic functions *)
let ltEq = PlainMerging.create_eq_table 111 (* Logic types *)
let lcEq = PlainMerging.create_eq_table 111 (* Logic constructors *)

let laEq = PlainMerging.create_eq_table 111 (* Axiomatics & Modules *)
let llEq = PlainMerging.create_eq_table 111 (* Lemmas *)

let lvEq = VolatileMerging.create_eq_table 111
let mfEq = ModelMerging.create_eq_table 111
let extEq = ExtMerging.create_eq_table 111

(* Sometimes we want to merge synonyms. We keep some tables indexed by names.
 * Each name is mapped to multiple entries *)
let vSyn = PlainMerging.create_syn_table 111
let iSyn = PlainMerging.create_syn_table 111
let sSyn = PlainMerging.create_syn_table 111
let eSyn = EnumMerging.create_syn_table 111
let tSyn = PlainMerging.create_syn_table 111
let lfSyn = LogicMerging.create_syn_table 111
let ltSyn = PlainMerging.create_syn_table 111
let lcSyn = PlainMerging.create_syn_table 111
let laSyn = PlainMerging.create_syn_table 111
let llSyn = PlainMerging.create_syn_table 111
let lvSyn = VolatileMerging.create_syn_table 111
let mfSyn = ModelMerging.create_syn_table 111
let extSyn = ExtMerging.create_syn_table 111

(** A global environment for variables. Put in here only the non-static
  * variables, indexed by their name.  *)
let vEnv : (string, (string, varinfo) node) H.t = H.create 111

(* A set of inline functions indexed by their printout ! *)
let inlineBodies : (string, (string, varinfo) node) H.t = H.create 111

(** Keep track, for all global function definitions, of the names of the formal
 * arguments. They might change during merging of function types if the
 * prototype occurs after the function definition and uses different names.
 * We'll restore the names at the end *)
let formalNames: (int * string, string list) H.t = H.create 111


(* Accumulate here the globals in the merged file *)
let theFileTypes = ref []
let theFile      = ref []

(*  we keep only one declaration for each function. The other ones are simply
    discarded, but we need to merge their spec. This is done at the end
    of the 2nd pass, to avoid going through theFile too many times.
*)
let spec_to_merge = Cil_datatype.Varinfo.Hashtbl.create 59;;

(* renaming to be performed in spec found in declarations when there is
   a definition for the given function. Similar to spec_to_merge table.
*)
let formals_renaming = Cil_datatype.Varinfo.Hashtbl.create 59;;

(* add 'g' to the merged file *)
let mergePushGlobal (g: global) : unit =
  pushGlobal g ~types:theFileTypes ~variables:theFile

let mergePushGlobals gl = List.iter mergePushGlobal gl

let add_to_merge_spec vi spec =
  let l =
    try Cil_datatype.Varinfo.Hashtbl.find spec_to_merge vi
    with Not_found -> []
  in Cil_datatype.Varinfo.Hashtbl.replace spec_to_merge vi (spec::l)

let add_alpha_renaming old_vi old_args new_args =
  try
    Cil_datatype.Varinfo.Hashtbl.add formals_renaming old_vi
      (Cil.create_alpha_renaming old_args new_args)
  with Invalid_argument _ ->
    (* [old_args] and [new_args] haven't the same length.
       May occur at least when trying to merge incompatible declarations. *)
    ()

let mergeSpec vi_ref vi_disc spec =
  if not (Cil.is_empty_funspec spec) then begin
    let spec =
      try
        let my_vars = Cil.getFormalsDecl vi_disc in
        let to_rename = Cil.getFormalsDecl vi_ref in
        Kernel.debug ~dkey:Kernel.dkey_linker "Renaming arguments: %a -> %a"
          (Pretty_utils.pp_list ~sep:",@ " Cil_datatype.Varinfo.pretty)
          my_vars
          (Pretty_utils.pp_list ~sep:",@ " Cil_datatype.Varinfo.pretty)
          to_rename;
        let alpha = Cil.create_alpha_renaming my_vars to_rename in
        Kernel.debug ~dkey:Kernel.dkey_linker
          "Renaming spec of function %a" Cil_datatype.Varinfo.pretty vi_disc;
        Kernel.debug  ~dkey:Kernel.dkey_linker
          "original spec is %a" Cil_printer.pp_funspec spec;
        try
          let res = Cil.visitCilFunspec alpha spec in
          Kernel.debug ~dkey:Kernel.dkey_linker
            "renamed spec is %a" Cil_printer.pp_funspec spec;
          res
        with Not_found -> assert false
      with Not_found -> spec
    in
    let spec =
      try
        let alpha = Cil_datatype.Varinfo.Hashtbl.find formals_renaming vi_ref in
        let res = Cil.visitCilFunspec alpha spec in
        Kernel.debug ~dkey:Kernel.dkey_linker
          "renamed spec with definition's formals is %a"
          Cil_printer.pp_funspec res;
        res
      with Not_found -> spec
    in
    add_to_merge_spec vi_ref spec
  end (* else no need to keep empty specs *)

(* The index of the current file being scanned *)
let currentFidx = ref 0

let currentDeclIdx = ref 0 (* The index of the definition in a file. This is
                            * maintained both in pass 1 and in pass 2. Make
                            * sure you count the same things in both passes. *)
(* Keep here the file names *)
let fileNames : (int, Datatype.Filepath.t) H.t = H.create 113



(* Remember the composite types that we have already declared *)
let emittedCompDecls: (string, bool) H.t = H.create 113
(* Remember the variables also *)
let emittedVarDecls: (string, bool) H.t = H.create 113

(* also keep track of externally-visible function definitions;
 * name maps to declaration, location, and semantic checksum *)
let emittedFunDefn: (string, fundec * location * int) H.t = H.create 113
(* and same for variable definitions; name maps to GVar fields *)
let emittedVarDefn: (string, varinfo * init option * location) H.t = H.create 113

(** A mapping from the new names to the original names. Used in PASS2 when we
 * rename variables. *)
let originalVarNames: (string, string) H.t = H.create 113

(* Initialize the module *)
let init ?(all=true) () =
  H.clear sAlpha;
  H.clear eAlpha;
  H.clear vtAlpha;

  H.clear vEnv;

  if all then PlainMerging.clear_eq vEq;

  PlainMerging.clear_eq sEq;
  EnumMerging.clear_eq eEq;
  PlainMerging.clear_eq tEq;
  PlainMerging.clear_eq iEq;

  LogicMerging.clear_eq lfEq;
  PlainMerging.clear_eq ltEq;
  PlainMerging.clear_eq lcEq;
  PlainMerging.clear_eq laEq;
  PlainMerging.clear_eq llEq;
  VolatileMerging.clear_eq lvEq;
  ModelMerging.clear_eq mfEq;
  ExtMerging.clear_eq extEq;

  PlainMerging.clear_syn vSyn;
  PlainMerging.clear_syn sSyn;
  EnumMerging.clear_syn eSyn;
  PlainMerging.clear_syn tSyn;
  PlainMerging.clear_syn iSyn;

  LogicMerging.clear_syn lfSyn;
  PlainMerging.clear_syn ltSyn;
  PlainMerging.clear_syn lcSyn;
  PlainMerging.clear_syn laSyn;
  PlainMerging.clear_syn llSyn;
  VolatileMerging.clear_syn lvSyn;
  ModelMerging.clear_syn mfSyn;
  ExtMerging.clear_syn extSyn;

  theFile := [];
  theFileTypes := [];

  H.clear formalNames;
  H.clear inlineBodies;

  currentFidx := 0;
  currentDeclIdx := 0;
  H.clear fileNames;

  H.clear emittedVarDecls;
  H.clear emittedCompDecls;

  H.clear emittedFunDefn;
  H.clear emittedVarDefn;

  H.clear originalVarNames;
  if all then Logic_env.prepare_tables ()

(* Ignores some attributes that are irrelevant for mergecil, e.g. fc_stdlib *)
let drop_attributes_for_merge attrs =
  Cil.dropAttributes ["fc_stdlib"; "fc_stdlib_generated"] attrs

let equal_attributes_for_merge attrs1 attrs2 =
  Cil_datatype.Attributes.equal (drop_attributes_for_merge attrs1)
    (drop_attributes_for_merge attrs2)

let logic_type_info_without_irrelevant_attributes lti =
  { lt_name = lti.lt_name;
    lt_params = lti.lt_params;
    lt_attr = drop_attributes_for_merge lti.lt_attr;
    lt_def = lti.lt_def }

let rec global_annot_without_irrelevant_attributes ga =
  match ga with
  | Dvolatile(vi,rd,wr,attr,loc) ->
    Dvolatile(vi,rd,wr,drop_attributes_for_merge attr,loc)
  | Daxiomatic(n,l,attr,loc) ->
    Daxiomatic(n,List.map global_annot_without_irrelevant_attributes l,
               drop_attributes_for_merge attr,loc)
  | Dmodule(n,l,attr,loader,loc) ->
    Dmodule(n,List.map global_annot_without_irrelevant_attributes l,
            drop_attributes_for_merge attr,loader,loc)
  | Dlemma (id,labs,typs,st,attr,loc) ->
    Dlemma (id,labs,typs,st,drop_attributes_for_merge attr,loc)
  | Dtype (lti,loc) ->
    Dtype (logic_type_info_without_irrelevant_attributes lti, loc)
  | Dextended (ext, attr, loc) ->
    Dextended(ext, drop_attributes_for_merge attr, loc)
  | Dfun_or_pred _ | Dtype_annot _ | Dmodel_annot _ | Dinvariant _ -> ga

let rec global_annot_pass1 g =
  let open Current_loc.Operators in
  let<> UpdatedCurrentLoc = Cil_datatype.Global_annotation.loc g in
  match g with
  | Dvolatile(hs,rvi,wvi,_,loc) ->
    let process_term_kind (t,k as id) =
      let node =
        VolatileMerging.getNode
          lvEq lvSyn !currentFidx id (id, g) (Some (loc, !currentFidx))
      in
      let g = global_annot_without_irrelevant_attributes g in
      let g' = global_annot_without_irrelevant_attributes (snd node.ndata) in
      if not (Logic_utils.is_same_global_annotation g g') then
        Kernel.warning ~source:(fst loc)
          "Overlapping volatile specification: \
           volatile location %a already associated to a %a function in \
           annotation at loc %a. Ignoring new binding."
          Cil_printer.pp_identified_term t
          pretty_volatile_kind k
          Cil_printer.pp_location (fst (Option.get node.nloc))
    in
    List.iter
      (fun x ->
         if Option.is_some rvi then process_term_kind (x,R);
         if Option.is_some wvi then process_term_kind (x,W))
      hs
  | Daxiomatic(id,decls,_,l) ->
    ignore (PlainMerging.getNode laEq laSyn !currentFidx id (id,decls,None)
              (Some (l,!currentDeclIdx)));
    List.iter global_annot_pass1 decls
  | Dmodule(id,decls,_,loader,l) ->
    ignore (PlainMerging.getNode laEq laSyn !currentFidx id (id,decls,loader)
              (Some (l,!currentDeclIdx)));
    List.iter global_annot_pass1 decls
  | Dfun_or_pred (li,l) ->
    let mynode =
      LogicMerging.getNode
        lfEq lfSyn !currentFidx li li None
    in
    (* NB: in case of mix decl/def it is the decl location that is taken. *)
    if mynode.nloc = None then
      ignore
        (LogicMerging.getNode lfEq lfSyn !currentFidx li li
           (Some (l, !currentDeclIdx)))
  | Dtype_annot (pi,l) ->
    ignore (LogicMerging.getNode
              lfEq lfSyn !currentFidx pi pi
              (Some (l, !currentDeclIdx)))
  | Dmodel_annot (mfi,l) ->
    ignore (ModelMerging.getNode
              mfEq mfSyn !currentFidx (mfi.mi_name,mfi.mi_base_type) mfi
              (Some (l, !currentDeclIdx)))
  | Dinvariant (pi,l)  ->
    ignore (LogicMerging.getNode
              lfEq lfSyn !currentFidx pi pi
              (Some (l, !currentDeclIdx)))
  | Dtype (info,l) ->
    ignore (PlainMerging.getNode ltEq ltSyn !currentFidx info.lt_name info
              (Some (l, !currentDeclIdx)))

  | Dlemma (n,labs,typs,st,attr,l) ->
    ignore (PlainMerging.getNode
              llEq llSyn !currentFidx n (n,(labs,typs,st,attr,l))
              (Some (l, !currentDeclIdx)))
  | Dextended(ext,_,l) ->
    ignore
      (ExtMerging.getNode extEq extSyn !currentFidx
         ext ext (Some (l,!currentDeclIdx)))

(* Some enumerations have to be turned into an integer. We implement this by
 * introducing a special enumeration type which we'll recognize later to be
 * an integer *)
let intEnumInfo =
  let name = "!!!intEnumInfo!!!"
  (* invalid C name. Can't clash with anything. *)
  in
  { eorig_name = name;
    ename = name;
    eitems = [];
    eattr = [];
    ereferenced = false;
    ekind = IInt;
  }
(* And add it to the equivalence graph *)
let intEnumInfoNode =
  EnumMerging.getNode eEq eSyn 0 intEnumInfo intEnumInfo
    (Some (Cil_datatype.Location.unknown, 0))


(* When comparing composite types for equality, we tolerate
   some differences related to packed/aligned attributes:
   if the offsets of each field are the same regardless of these
   attributes, we allow them to merge (arbitrarily choosing whether
   to keep or to drop such attributes). *)
let equalModuloPackedAlign attrs1 attrs2 =
  let drop = Cil.dropAttributes ["packed"; "aligned"] in
  equal_attributes_for_merge (drop attrs1) (drop attrs2)



(* Checks if fields [f1] and [f2] (contained in the composite types
   [typ_ci1] and [typ_ci2] respectively) are equal except for
   alignment-related attributes.
   Raises [Failure] if the fields are not equivalent.
   If [mustCheckOffsets] is true, then there is already a difference in the
   composite type, so each field must be checked. *)
let checkFieldsEqualModuloPackedAlign ~mustCheckOffsets f1 f2 =
  if f1.fbitfield <> f2.fbitfield then
    raise (Failure "different bitfield info");
  if mustCheckOffsets || not (equal_attributes_for_merge f1.fattr f2.fattr) then
    (* different attributes: check if the difference is only due
       to aligned/packed attributes, and if the offsets are the same,
       in which case the difference may be safely ignored *)
    try
      let offs1, width1 = Cil.fieldBitsOffset f1
      and offs2, width2 = Cil.fieldBitsOffset f2
      in
      if not (equalModuloPackedAlign f1.fattr f2.fattr)
      || offs1 <> offs2 || width1 <> width2 then
        if mustCheckOffsets then
          let err = "incompatible attributes in composite types and/or field "
                    ^ f1.fname in
          raise (Failure err)
        else
          let err = "incompatible attributes for field " ^ f1.fname in
          raise (Failure err)
    with Not_found ->
      Kernel.fatal
        "field offset not found in table: %a or %a"
        Printer.pp_field f1 Printer.pp_field f2

module Fidx: sig
  val get_oldfidx : unit -> int
  val get_fidx : unit -> int
  val setTempFidx: oldfidx:int -> fidx:int -> (unit -> 'a) -> 'a
end
=
struct

  let ref_oldfidx = ref 0
  let ref_fidx = ref 0

  let get_oldfidx () = !ref_oldfidx
  let get_fidx () = !ref_fidx

  let set_oldfidx v = ref_oldfidx := v
  let set_fidx v = ref_fidx := v

  let setTempFidx ~oldfidx ~fidx f =
    let oldfidx_before = get_oldfidx () in
    let fidx_before = get_fidx () in
    let finally () =
      set_oldfidx oldfidx_before;
      set_fidx fidx_before
    in
    set_oldfidx oldfidx;
    set_fidx fidx;
    Fun.protect ~finally f

end




(* Match two enuminfos and throw a Failure if they do not match *)
let matchEnumInfoGen (oldei: enuminfo) (ei: enuminfo) : unit =
  (* Find the node for this enum, no path compression. *)
  let oldeinode = EnumMerging.getNode eEq eSyn (Fidx.get_oldfidx ()) oldei oldei None in
  let einode = EnumMerging.getNode eEq eSyn (Fidx.get_fidx ()) ei ei None in
  if oldeinode == einode then (* We already know they are the same *)
    ()
  else
    (* Replace with the representative data *)
    let oldei = oldeinode.ndata in
    let ei = einode.ndata in
    (* Try to match them. But if you cannot just make them both integers *)
    try
      have_same_enum_items oldei ei;
      (* Set the representative *)
      let newrep, _ = EnumMerging.union oldeinode einode in
      (* We get here if the enumerations match *)
      newrep.ndata.eattr <- addAttributes oldei.eattr ei.eattr
    with (Cannot_combine msg | Failure msg) ->
      let pp_items = Pretty_utils.pp_list ~pre:"{" ~suf:"}" ~sep:",@ "
          (fun fmt item ->
             Format.fprintf fmt "%s=%a" item.eiorig_name
               Cil_printer.pp_exp item.eival)
      in
      if oldeinode != intEnumInfoNode && einode != intEnumInfoNode then
        Kernel.warning
          "@[merging definitions of enum %s using int type@ (%s);@ items %a and@ %a@]"
          oldei.ename msg
          pp_items oldei.eitems pp_items ei.eitems;
      (* Get here if you cannot merge two enumeration nodes *)
      if oldeinode != intEnumInfoNode then
        ignore(EnumMerging.union oldeinode intEnumInfoNode);
      if einode != intEnumInfoNode then
        ignore(EnumMerging.union einode intEnumInfoNode)


let matchCompInfoGen (combineF : combineFunction)
    (oldci: compinfo) (ci: compinfo) : unit =
  let cstruct = oldci.cstruct in
  if cstruct <> ci.cstruct then
    raise (Failure "different struct/union types");
  (* See if we have a mapping already *)
  (* Make the nodes if not already made. Actually return the
   * representatives *)
  let oldcinode =
    PlainMerging.getNode sEq sSyn (Fidx.get_oldfidx ()) oldci.cname oldci None
  in
  let cinode = PlainMerging.getNode sEq sSyn (Fidx.get_fidx ()) ci.cname ci None in
  if oldcinode == cinode then (* We already know they are the same *)
    ()
  else
    (* Replace with the representative data *)
    let oldci = oldcinode.ndata in
    let ci = cinode.ndata in
    (* We check that they are defined in the same way. While doing this there
     * might be recursion and we have to watch for going into an infinite
     * loop. So we add the assumption that they are equal *)
    let newrep, undo = union oldcinode cinode in
    Fidx.setTempFidx ~oldfidx:oldcinode.nfidx ~fidx:cinode.nfidx (fun () ->
        (match oldci.cfields, ci.cfields with
         | _, None -> () (* new struct is not defined, just keep using the old one *)
         | None, Some fields ->
           (* old struct is not defined, but new one is. Use its fields. *)
           oldci.cfields <- Some fields
         | Some oldfields, Some fields ->
           let old_len = List.length oldfields in
           let len = List.length fields in
           if old_len <> len then begin
             let aggregate_name = if cstruct then "struct" else "union" in
             let msg = Printf.sprintf
                 "different number of fields in %s %s and %s %s: %d != %d."
                 aggregate_name oldci.cname aggregate_name ci.cname
                 old_len len
             in
             undo ();
             raise (Failure msg)
           end;
           (* We check the fields but watch for Failure. We only do the check when
            * the lengths are the same. Due to the code above this the other
            * possibility is that one of the length is 0, in which case we reuse the
            * old compinfo. *)
           begin
             try
               (* mustCheckOffsets indicates that composite type attributes are
                  different, which may impact field offsets *)
               let mustCheckOffsets =
                 if equal_attributes_for_merge ci.cattr oldci.cattr then false
                 else if equalModuloPackedAlign ci.cattr oldci.cattr then true
                 else raise
                     (Failure
                        (let attrs = drop_attributes_for_merge ci.cattr in
                         let oldattrs = drop_attributes_for_merge oldci.cattr in
                         (* we do not use Cil_datatype.Attributes.pretty because it
                            may not print some relevant attributes *)
                         let pp_attrs =
                           Pretty_utils.pp_list ~sep:", " Printer.pp_attribute
                         in
                         Format.asprintf
                           "different/incompatible composite type attributes: \
                            [%a] vs [%a]"
                           pp_attrs attrs pp_attrs oldattrs))
               in
               List.iter2
                 (fun oldf f ->
                    checkFieldsEqualModuloPackedAlign ~mustCheckOffsets f oldf;
                    (* Make sure the types are compatible *)
                    (* Note: 6.2.7 §1 states that the names of the fields
                       should be the same.
                       We do not force this for now, but could do it. *)
                    let newtype =
                      combineF.typ_combine combineF
                        ~strictInteger:false ~strictReturnTypes:true
                        CombineOther oldf.ftype f.ftype in
                    (* Change the type in the representative *)
                    oldf.ftype <- newtype)
                 oldfields fields
             with (Cannot_combine reason | Failure reason) ->
               (* Our assumption was wrong. Forget the isomorphism *)
               undo ();
               let fields_old =
                 Format.asprintf "%a"
                   Cil_printer.pp_global
                   (GCompTag(oldci, Cil_datatype.Location.unknown))
               in
               let fields =
                 Format.asprintf "%a"
                   Cil_printer.pp_global
                   (GCompTag(ci, Cil_datatype.Location.unknown))
               in
               let fullname_old = compFullName oldci in
               let fullname = compFullName ci in
               let msg =
                 match fullname_old = fullname,
                       fields_old = fields (* Could also use a special comparison *)
                 with
                   true, true ->
                   Format.asprintf
                     "Definitions of %s are not isomorphic. Reason follows:@\n@?%s"
                     fullname_old reason
                 | false, true ->
                   Format.asprintf
                     "%s and %s are not isomorphic. Reason follows:@\n@?%s"
                     fullname_old fullname reason
                 | true, false ->
                   Format.asprintf
                     "Definitions of %s are not isomorphic. \
                      Reason follows:@\n@?%s@\n@?%s@?%s"
                     fullname_old reason
                     fields_old fields
                 | false, false ->
                   Format.asprintf
                     "%s and %s are not isomorphic. \
                      Reason follows:@\n@?%s@\n@?%s@?%s"
                     fullname_old fullname reason
                     fields_old fields
               in
               raise (Failure msg)
           end);
        (* We get here when we succeeded checking that they are equal, or one of
         * them was empty *)
        newrep.ndata.cattr <- addAttributes oldci.cattr ci.cattr)


(* Match two typeinfos and throw a Failure if they do not match *)
let matchTypeInfoGen (combineF : combineFunction)
    (oldti: typeinfo) (ti: typeinfo) : unit =
  if oldti.tname = "" || ti.tname = "" then
    Kernel.fatal "matchTypeInfo for anonymous type";
  (* Find the node for this enum, no path compression. *)
  let oldtnode = PlainMerging.getNode tEq tSyn (Fidx.get_oldfidx ()) oldti.tname oldti None in
  let tnode = PlainMerging.getNode tEq tSyn (Fidx.get_fidx ()) ti.tname    ti None in
  if oldtnode == tnode then (* We already know they are the same *)
    ()
  else
    (* Replace with the representative data *)
    let oldti = oldtnode.ndata in
    let ti = tnode.ndata in
    (* Check that they are the same *)
    Fidx.setTempFidx ~oldfidx:oldtnode.nfidx ~fidx:tnode.nfidx (fun () ->
        (try
           ignore (combineF.typ_combine combineF
                     ~strictInteger:false ~strictReturnTypes:true
                     CombineOther oldti.ttype ti.ttype);
         with (Cannot_combine reason | Failure reason) ->
           let msg =
             let oldname = oldti.tname in
             let name = ti.tname in
             if oldname = name
             then
               Format.sprintf
                 "Definitions of type %s are not isomorphic. \
                  Reason follows:@\n@?%s"
                 oldname reason
             else
               Format.sprintf
                 "Types %s and %s are not isomorphic. Reason follows:@\n@?%s"
                 oldname name reason
           in
           raise (Failure msg));
        ignore(union oldtnode tnode))

let conflict_detected = ref false

let combines = {
  typ_combine = (fun combF ~strictInteger ~strictReturnTypes what t1 t2 ->
      let find_names_file = H.find fileNames in
      let oldfidx = Fidx.get_oldfidx () in
      let fidx = Fidx.get_fidx () in
      let old_file = find_names_file oldfidx in
      let pre_msg =
        Format.asprintf
          "Conflicting definitions for types '%a' and '%a' \
           (previous definition was in file %s)."
          Cil_printer.pp_typ t1
          Cil_printer.pp_typ t2
          (Filepath.Normalized.to_pretty_string old_file)
      in
      let emitwith _ =
        if (not !conflict_detected) && oldfidx <> fidx
        then
          begin
            conflict_detected := true;
            Kernel.warning ~current:true
              ~wkey:Kernel.wkey_merge_conversion
              "%s" pre_msg
          end
      in
      combineTypesGen
        ~emitwith combF ~strictInteger ~strictReturnTypes what t1 t2);
  enum_combine = (fun _ oldei ei ->
      matchEnumInfoGen oldei ei;
      oldei);
  comp_combine = (fun c oldci ci ->
      matchCompInfoGen c oldci ci;
      oldci);
  name_combine = (fun c _ oldti ti ->
      matchTypeInfoGen c oldti ti;
      oldti);
}

let setFidCall f oldfidx oldt fidx t =
  Fidx.setTempFidx ~oldfidx ~fidx (fun () -> f oldt t)

let matchEnumInfo = setFidCall matchEnumInfoGen

let matchCompInfo = setFidCall (matchCompInfoGen combines)

let matchTypeInfo = setFidCall (matchTypeInfoGen combines)

let combineTypes what =
  setFidCall (combines.typ_combine combines
                ~strictInteger:false ~strictReturnTypes:true what)

(* Match two compinfos and throw a Failure if they do not match *)

let update_compinfo ci =
  let node =
    PlainMerging.getNode sEq sSyn !currentFidx ci.cname ci None
  in
  let loc =
    match node.nloc with
    | Some (loc,_) -> loc
    | None -> Cil_datatype.Location.unknown
  in
  Alpha.registerAlphaName ~alphaTable:sAlpha ~lookupname:ci.cname ~data:loc;
  let orig_name = if ci.corig_name = "" then ci.cname else ci.corig_name in
  let n, _ =
    Alpha.newAlphaName ~alphaTable:sAlpha ~undolist:None
      ~lookupname:orig_name ~data:loc
  in
  let oldnode = PlainMerging.find true node in
  if oldnode == node then begin
    let node =
      PlainMerging.mkSelfNode
        sEq sSyn !currentFidx ci.cname ci (Some (loc, !currentFidx))
    in
    let renamed_node = { oldnode with nname = n } in
    renamed_node.ndata.cname <- n;
    renamed_node.nrep <- renamed_node;
    node.nrep <- node;
    oldnode.nrep <- node;
    PlainMerging.add_eq_table sEq (!currentFidx,ci.cname) node;
    PlainMerging.add_eq_table sEq (oldnode.nfidx, n) renamed_node
  end else begin
    let renamed_node = { oldnode with nname = n } in
    renamed_node.ndata.cname <- n;
    renamed_node.nrep <- renamed_node;
    oldnode.nrep <- node;
    node.nrep <- node;
    PlainMerging.add_eq_table sEq (oldnode.nfidx, n) renamed_node;
  end;
  node.ndata

let rec update_type_repr t =
  match t with
  | TNamed (ti,attrs) ->
    ti.ttype <- update_type_repr ti.ttype;
    let node =
      PlainMerging.getNode tEq tSyn !currentFidx ti.tname ti None
    in
    let loc =
      match node.nloc with
      | Some (loc,_) -> loc
      | None -> Cil_datatype.Location.unknown
    in
    Alpha.registerAlphaName ~alphaTable:vtAlpha ~lookupname:ti.tname ~data:loc;
    let n,_ =
      Alpha.newAlphaName ~alphaTable:vtAlpha ~undolist:None
        ~lookupname:ti.torig_name ~data:loc
    in
    let oldnode = PlainMerging.find true node in
    if oldnode == node then begin
      let node =
        PlainMerging.mkSelfNode
          tEq tSyn !currentFidx ti.tname ti (Some (loc,!currentFidx))
      in
      let renamed_node = { oldnode with nname = n } in
      renamed_node.ndata.tname <- n;
      renamed_node.nrep <- renamed_node;
      node.nrep <- node;
      oldnode.nrep <- node;
      PlainMerging.add_eq_table tEq (!currentFidx,ti.tname) node;
      PlainMerging.add_eq_table tEq (oldnode.nfidx, n) renamed_node
    end else begin
      let renamed_node = { oldnode with nname = n } in
      renamed_node.ndata.tname <- n;
      renamed_node.nrep <- renamed_node;
      oldnode.nrep <- node;
      node.nrep <- node;
      PlainMerging.add_eq_table tEq (oldnode.nfidx, n) renamed_node;
    end;
    TNamed(node.ndata,attrs)
  | TComp (ci,attrs) ->
    TComp (update_compinfo ci, attrs)
  | _ -> t

let static_var_visitor = object
  inherit Cil.nopCilVisitor
  method! vvrbl vi = if vi.vstorage = Static then raise Exit; DoChildren
end

(*
let has_static_ref_predicate pred_info =
  try
    ignore (visitCilPredicateInfo static_var_visitor pred_info); false
  with Exit -> true
*)

let has_static_ref_logic_function lf_info =
  try
    ignore (visitCilLogicInfo static_var_visitor lf_info); false
  with Exit -> true

let matchLogicInfo oldfidx oldpi fidx pi =
  let oldtnode =
    LogicMerging.getNode lfEq lfSyn oldfidx oldpi oldpi None
  in
  let tnode =
    LogicMerging.getNode lfEq lfSyn fidx pi pi None
  in
  if oldtnode == tnode then (* We already know they are the same *)
    ()
  else begin
    let oldpi = oldtnode.ndata in
    let oldfidx = oldtnode.nfidx in
    let pi = tnode.ndata in
    let fidx = tnode.nfidx in
    if Logic_utils.is_same_logic_info oldpi pi then begin
      if has_static_ref_logic_function oldpi then
        Kernel.abort
          "multiple inclusion of logic function %s referring to a static variable"
          oldpi.l_var_info.lv_name
      else  if oldfidx < fidx then
        tnode.nrep <- oldtnode.nrep
      else
        oldtnode.nrep <- tnode.nrep
    end else
      Kernel.abort "invalid multiple logic function declarations %s" pi.l_var_info.lv_name
  end

let matchLogicType oldfidx oldnode fidx node =
  let oldtnode =
    PlainMerging.getNode ltEq ltSyn oldfidx oldnode.lt_name oldnode None
  in
  let tnode = PlainMerging.getNode ltEq ltSyn fidx oldnode.lt_name node None in
  if oldtnode == tnode then (* We already know they are the same *)
    ()
  else begin
    let oldinfo = oldtnode.ndata in
    let oldfidx = oldtnode.nfidx in
    let info = tnode.ndata in
    let fidx = tnode.nfidx in
    let oldinfo = logic_type_info_without_irrelevant_attributes oldinfo in
    let info = logic_type_info_without_irrelevant_attributes info in
    if Logic_utils.is_same_logic_type_info oldinfo info then begin
      if oldfidx < fidx then
        tnode.nrep <- oldtnode.nrep
      else
        oldtnode.nrep <- tnode.nrep
    end else
      Kernel.error ~current:true
        "invalid multiple logic type declarations %s" node.lt_name
  end

let matchLogicCtor oldfidx oldpi fidx pi =
  let oldtnode =
    PlainMerging.getNode lcEq lcSyn oldfidx oldpi.ctor_name oldpi None
  in
  let tnode = PlainMerging.getNode lcEq lcSyn fidx pi.ctor_name pi None in
  if oldtnode != tnode then
    Kernel.error ~current:true
      "invalid multiple logic constructors declarations %s" pi.ctor_name

(* ignores irrelevant attributes such as __fc_stdlib *)
let matchLogicAxiomatic oldfidx (oldid,_,_ as oldnode) fidx (id,_,_ as node) =
  let oldanode = PlainMerging.getNode laEq laSyn oldfidx oldid oldnode None in
  let anode = PlainMerging.getNode laEq laSyn fidx id node None in
  if oldanode != anode then begin
    let _, oldax, oloader = oldanode.ndata in
    let oldaidx = oldanode.nfidx in
    let _, ax, loader = anode.ndata in
    let aidx = anode.nfidx in
    let ax = List.map global_annot_without_irrelevant_attributes ax in
    let oldax = List.map global_annot_without_irrelevant_attributes oldax in
    if Logic_utils.is_same_axiomatic oldax ax && oloader = loader then begin
      if oldaidx < aidx then
        anode.nrep <- oldanode.nrep
      else
        oldanode.nrep <- anode.nrep
    end else
      Kernel.error ~current:true
        "invalid multiple axiomatic declarations %s" id
  end

let matchLogicLemma oldfidx (oldid, _ as oldnode) fidx (id, _ as node) =
  let oldlnode = PlainMerging.getNode llEq llSyn oldfidx oldid oldnode None in
  let lnode = PlainMerging.getNode llEq llSyn fidx id node None in
  if oldlnode != lnode then begin
    let (oldid,(oldlabs,oldtyps,oldst,oldattr,oldloc)) = oldlnode.ndata in
    let oldfidx = oldlnode.nfidx in
    let (id,(labs,typs,st,attr,loc)) = lnode.ndata in
    let fidx = lnode.nfidx in
    let oldattr = drop_attributes_for_merge oldattr in
    let attr = drop_attributes_for_merge attr in
    if Logic_utils.is_same_global_annotation
        (Dlemma (oldid,oldlabs,oldtyps,oldst,oldattr,oldloc))
        (Dlemma (id,labs,typs,st,attr,loc))
    then begin
      if oldfidx < fidx then
        lnode.nrep <- oldlnode.nrep
      else
        oldlnode.nrep <- lnode.nrep
    end else
      Kernel.error ~current:true
        "invalid multiple lemmas or axioms  declarations for %s" id
  end

let matchVolatileClause
    oldfidx (oldid, oldannot as oldnode) fidx (id, annot as node) =
  let oldlnode =
    VolatileMerging.getNode lvEq lvSyn oldfidx oldid oldnode None
  in
  let lnode =
    VolatileMerging.getNode lvEq lvSyn fidx id node None
  in
  if oldlnode != lnode then begin
    let oldannot = global_annot_without_irrelevant_attributes oldannot in
    let annot = global_annot_without_irrelevant_attributes annot in
    if Logic_utils.is_same_global_annotation oldannot annot
    then begin
      if oldfidx < fidx then
        lnode.nrep <- oldlnode.nrep
      else
        oldlnode.nrep <- lnode.nrep
    end else
      let (loc, kind) = oldid in
      Kernel.error ~current:true
        "invalid multiple volatile %a function for locations %a"
        pretty_volatile_kind kind
        Cil_printer.pp_identified_term loc
  end

let matchModelField
    oldfidx ({ mi_name = oldname; mi_base_type = oldtyp } as oldnode)
    fidx ({mi_name = name; mi_base_type = typ } as node)
  =
  let oldlnode =
    ModelMerging.getNode mfEq mfSyn oldfidx (oldname,oldtyp) oldnode None
  in
  let lnode = ModelMerging.getNode mfEq mfSyn fidx (name,typ) node None in
  if oldlnode != lnode then begin
    let oldmf = oldlnode.ndata in
    let oldfidx = oldlnode.nfidx in
    let mf = lnode.ndata in
    let fidx = oldlnode.nfidx in
    if Logic_utils.is_same_type oldmf.mi_field_type mf.mi_field_type then
      begin
        if oldfidx < fidx then
          lnode.nrep <- oldlnode.nrep
        else
          oldlnode.nrep <- lnode.nrep
      end
    else
      Kernel.error ~current:true
        "Model field %s of type %a is declared with different logic type: \
         %a and %a"
        mf.mi_name Cil_printer.pp_typ mf.mi_base_type
        Cil_printer.pp_logic_type mf.mi_field_type
        Cil_printer.pp_logic_type oldmf.mi_field_type
  end

(* Scan all files and do two things *)
(* 1. Initialize the alpha renaming tables with the names of the globals so
 * that when we come in the second pass to generate new names, we do not run
 * into conflicts.  *)
(* 2. For all declarations of globals unify their types. In the process
 * construct a set of equivalence classes on type names, structure and
 * enumeration tags  *)
(* 3. We clean the referenced flags *)

(* First pass might decide to ignore some globals that are not used in their
   own translation unit and have type incompatible with the one associated
   to the symbol names in already preprocessed files. We store
   the corresponding varinfos here and ensure that we do not attempt to extract
   some information (notably function contract or function definition)
   from them in pass 2.
*)

let ignored_vi = ref Cil_datatype.Varinfo.Set.empty

let ignore_vi vi =
  ignored_vi := Cil_datatype.Varinfo.Set.add vi !ignored_vi

let is_ignored_vi vi = Cil_datatype.Varinfo.Set.mem vi !ignored_vi

let remove_function_statics fdec =
  let statics =
    Cil_datatype.Varinfo.Set.of_list (Ast_info.Function.get_statics fdec)
  in
  theFile :=
    List.filter (fun g ->
        match g with
        | GVar (vi, _, _) -> not (Cil_datatype.Varinfo.Set.mem vi statics)
        | _ -> true
      ) !theFile

let oneFilePass1 (f:file) : unit =
  let open Current_loc.Operators in
  H.add fileNames !currentFidx f.fileName;
  Kernel.feedback ~dkey:Kernel.dkey_linker
    "Pre-merging (%d) %a" !currentFidx Filepath.Normalized.pp_abs f.fileName ;
  currentDeclIdx := 0;
  if f.globinitcalled || f.globinit <> None then
    Kernel.warning ~current:true
      "Merging file %a has global initializer"
      Datatype.Filepath.pretty f.fileName;

  (* We scan each file and we look at all global varinfo. We see if globals
   * with the same name have been encountered before and we merge those types
   * *)
  let matchVarinfo ~fromGFun (vi: varinfo) (loc, _ as l) =
    ignore (Alpha.registerAlphaName ~alphaTable:vtAlpha
              ~lookupname:vi.vname ~data:(Current_loc.get ()));
    (* Make a node for it and put it in vEq *)
    let vinode =
      PlainMerging.mkSelfNode vEq vSyn !currentFidx vi.vname vi (Some l)
    in
    match H.find_opt vEnv vi.vname with
    | None ->
      (* Not present in the previous files. Remember it for later  *)
      H.add vEnv vi.vname vinode
    | Some oldvi ->
      let oldvinode = PlainMerging.find true oldvi in
      let oldloc, _ =
        match oldvinode.nloc with
          None ->  (Kernel.fatal "old variable is undefined")
        | Some l -> l
      in
      let oldvi = oldvinode.ndata in
      Kernel.debug ~dkey:Kernel.dkey_linker "Merging %s(%d) to %s(%d)"
        vi.vname vi.vid oldvi.vname oldvi.vid;
      (* There is an old definition. We must combine the types. Do this first
       * because it might fail *)
      let newtype, newrep =
        try
          combineTypes CombineOther
            oldvinode.nfidx oldvi.vtype
            !currentFidx vi.vtype, fst (union oldvinode vinode);
        with (Cannot_combine reason | Failure reason) -> begin
            (* If one of the variable is currently unused, we can ignore it.
               If both are unused and only one is defined, we keep this one.
               Otherwise, we keep the old variable by default. *)
            let msg =
              Format.asprintf
                "@[<hov>Incompatible declaration for %s:@ %s@\n\
                 First declaration was at %a@\nCurrent declaration is at %a@]"
                vi.vname reason
                Cil_printer.pp_location oldloc
                Cil_printer.pp_location loc
            in
            (* If the new variable is unused, ignore it, unless it is defined
               while the old variable was also unused but not defined. *)
            if not vi.vreferenced
            && (oldvi.vreferenced || oldvi.vdefined || not vi.vdefined)
            then begin
              Kernel.warning ~wkey:Kernel.wkey_drop_unused
                "%s@\nCurrent declaration is unused, silently removing it"
                msg;
              ignore_vi vi;
              oldvi.vtype, fst (union oldvinode vinode)
            end else if not oldvi.vreferenced then begin
              Kernel.warning ~wkey:Kernel.wkey_drop_unused
                "%s@\nOld declaration is unused, silently removing it"
                msg;
              ignore_vi oldvi;
              Cil.update_var_type vi (update_type_repr vi.vtype);
              H.replace vEnv vi.vname vinode;
              vinode.nrep <- vinode;
              oldvinode.nrep <- vinode;
              vi.vtype, vinode
            end else Kernel.abort "%s" msg (* Fail if both variables are used. *)
          end
      in
      if Cil.hasAttribute "fc_stdlib" oldvi.vattr then begin
        let attrprm = Cil.findAttribute "fc_stdlib" oldvi.vattr in
        let attrprm =
          if Cil.hasAttribute "fc_stdlib" vi.vattr then begin
            Cil.findAttribute "fc_stdlib" vi.vattr @ attrprm
          end else attrprm
        in
        let attrs = Cil.dropAttribute "fc_stdlib" newrep.ndata.vattr in
        let attrs = Cil.addAttribute (Attr ("fc_stdlib", attrprm)) attrs in
        newrep.ndata.vattr <- attrs;
      end;
      newrep.ndata.vdefined <- vi.vdefined || oldvi.vdefined;
      newrep.ndata.vreferenced <- vi.vreferenced || oldvi.vreferenced;
      (* We do not want to turn non-"const" globals into "const" one. That
       * can happen if one file declares the variable a non-const while
       * others declare it as "const". *)
      if typeHasAttribute "const" vi.vtype !=
         typeHasAttribute "const" oldvi.vtype then begin
        Cil.update_var_type
          newrep.ndata (typeRemoveAttributes ["const"] newtype);
      end else Cil.update_var_type newrep.ndata newtype;
      (* clean up the storage. also update the location of the variable
         declaration, but only if the new one should be preferred. *)
      let newstorage, newdecl =
        match oldvi.vstorage, vi.vstorage with
        | Static, (Static | Extern) -> Static, oldvi.vdecl
        | NoStorage, NoStorage -> NoStorage, oldvi.vdecl
        | NoStorage, Extern -> (if oldvi.vdefined then NoStorage else Extern), oldvi.vdecl
        | Extern, NoStorage when vi.vdefined -> NoStorage, vi.vdecl
        | Extern, (Extern | NoStorage) -> Extern, vi.vdecl
        | _ ->
          Kernel.abort ~current:true
            "Inconsistent storage specification for %s. \
             Now is %a and previous was %a at %a"
            vi.vname
            Cil_printer.pp_storage vi.vstorage
            Cil_printer.pp_storage oldvi.vstorage
            Cil_printer.pp_location oldloc
      in
      newrep.ndata.vstorage <- newstorage;
      (* Special handling for 'weak' attributes: since we cannot properly
         handle the case where the first function definition is to be
         overridden by the second one, we try to detect whether an old
         definition had a 'weak' attribute and a later one didn't; in this case,
         the only way to obtain the "correct" function is to tell the user to
         invert the order of source files given in the command line.
      *)
      if fromGFun && hasAttribute "weak" oldvi.vattr &&
         not (hasAttribute "weak" vi.vattr) then
        begin
          let open Filepath in
          let oldpath = (fst oldvi.vdecl).pos_path in
          let newpath = (fst vi.vdecl).pos_path in
          Kernel.abort ~current:true
            "weak definition at %a cannot be overridden with \
             this non-weak definition. @ \
             Please exchange command-line arguments to put '%a' \
             before '%a'.@."
            Printer.pp_location oldvi.vdecl
            Normalized.pretty newpath Normalized.pretty oldpath
        end;
      newrep.ndata.vattr <- addAttributes oldvi.vattr vi.vattr;
      newrep.ndata.vdecl <- newdecl
  in
  let iter g =
    let<> UpdatedCurrentLoc = Cil_datatype.Global.loc g in
    match g with
    | GVarDecl (vi, l) | GVar (vi, _, l) | GFunDecl (_, vi, l)->
      incr currentDeclIdx;
      if vi.vstorage <> Static then begin
        matchVarinfo ~fromGFun:false vi (l, !currentDeclIdx);
      end

    | GFun (fdec, l) ->
      incr currentDeclIdx;
      (* Save the names of the formal arguments *)
      let _, args, _, _ = splitFunctionTypeVI fdec.svar in
      H.add formalNames (!currentFidx, fdec.svar.vname)
        (List.map (fun (n,_,_) -> n) (argsToList args));
      (* Force inline functions to be static. *)
      (* GN: This turns out to be wrong. inline functions are external,
        * unless specified to be static. *)
          (*
            if fdec.svar.vinline && fdec.svar.vstorage = NoStorage then
            fdec.svar.vstorage <- Static;
          *)
      if fdec.svar.vstorage <> Static then begin
        matchVarinfo ~fromGFun:true fdec.svar (l, !currentDeclIdx)
      end else begin
        if fdec.svar.vinline && mergeInlinesWithAlphaConvert() then
          (* Just create the nodes for inline functions *)
          ignore (PlainMerging.getNode iEq iSyn !currentFidx
                    fdec.svar.vname fdec.svar (Some (l, !currentDeclIdx)))
      end
    (* Make nodes for the defined type and structure tags *)
    | GType (t, l) ->
      incr currentDeclIdx;
      t.treferenced <- false;
      if t.tname <> "" then (* The empty names are just for introducing
                             * undefined comp tags *)
        ignore (PlainMerging.getNode tEq tSyn !currentFidx t.tname t
                  (Some (l, !currentDeclIdx)))
      else begin (* Go inside and clean the referenced flag for the
                  * declared tags *)
        match t.ttype with
          TComp (ci, _ ) ->
          ci.creferenced <- false;
          (* Create a node for it *)
          ignore
            (PlainMerging.getNode sEq sSyn !currentFidx ci.cname ci None)

        | TEnum (ei, _) ->
          ei.ereferenced <- false;
          ignore
            (EnumMerging.getNode eEq eSyn !currentFidx ei ei None)

        | _ ->  (Kernel.fatal "Anonymous Gtype is not TComp")
      end

    | GCompTag (ci, l) ->
      incr currentDeclIdx;
      ci.creferenced <- false;
      ignore (PlainMerging.getNode sEq sSyn !currentFidx ci.cname ci
                (Some (l, !currentDeclIdx)))
    | GCompTagDecl (ci,_) -> ci.creferenced <- false
    | GEnumTagDecl (ei,_) -> ei.ereferenced <- false
    | GEnumTag (ei, l) ->
      incr currentDeclIdx;
      let orig_name =
        if ei.eorig_name = "" then ei.ename else ei.eorig_name
      in
      ignore (Alpha.newAlphaName ~alphaTable:aeAlpha ~undolist:None
                ~lookupname:orig_name ~data:l);
      ei.ereferenced <- false;
      ignore
        (EnumMerging.getNode eEq eSyn !currentFidx ei ei
           (Some (l, !currentDeclIdx)))
    | GAnnot (gannot, _) ->
      incr currentDeclIdx;
      global_annot_pass1 gannot
    | GText _ | GPragma _ | GAsm _ -> ()
  in
  List.iter iter f.globals

let matchInlines (oldfidx: int) (oldi: varinfo)
    (fidx: int) (i: varinfo) =
  let oldinode = PlainMerging.getNode iEq iSyn oldfidx oldi.vname oldi None in
  let    inode = PlainMerging.getNode iEq iSyn    fidx    i.vname    i None in
  if oldinode != inode then begin
    (* Replace with the representative data *)
    let oldi = oldinode.ndata in
    let oldfidx = oldinode.nfidx in
    let i = inode.ndata in
    let fidx = inode.nfidx in
    (* There is an old definition. We must combine the types. Do this first
     * because it might fail *)
    Cil.update_var_type
      oldi (combineTypes CombineOther oldfidx oldi.vtype fidx i.vtype);
    (* We get here if we have success *)
    (* Combine the attributes as well *)
    oldi.vattr <- addAttributes oldi.vattr i.vattr
    (* Do not union them yet because we do not know that they are the same.
     * We have checked only the types so far *)
  end

(************************************************************
 *
 *  PASS 2
 *
 *
 ************************************************************)


(** Keep track of the functions we have used already in the file. We need
  * this to avoid removing an inline function that has been used already.
  * This can only occur if the inline function is defined after it is used
  * already; a bad style anyway *)
let varUsedAlready: (string, unit) H.t = H.create 111

let pp_profiles fmt li =
  Pretty_utils.pp_list ~sep:",@ " Cil_printer.pp_logic_type
    fmt
    (List.map (fun v -> v.lv_type) li.l_profile)

let logic_info_of_logic_var lv =
  let rec extract_tparams tparams = function
    | Ctype _ | Linteger | Lreal | Lboolean -> tparams
    | Ltype (_,l) -> List.fold_left extract_tparams tparams l
    | Lvar s -> Datatype.String.Set.add s tparams
    | Larrow (l,t) ->
      List.fold_left extract_tparams (extract_tparams tparams t) l
  in
  let tparams = extract_tparams Datatype.String.Set.empty lv.lv_type in
  let rt, args =
    match lv.lv_type with
    | Larrow (l, Ctype (TVoid _)) -> None, l
    | Larrow(l,t) -> Some t, l
    | Ctype (TVoid _) -> None, []
    | t -> Some t, []
  in
  { l_var_info = lv;
    l_labels = [];
    l_tparams = Datatype.String.Set.elements tparams;
    l_type = rt;
    l_profile = List.map (Cil_const.make_logic_var_formal "") args;
    l_body = LBnone
  }

(** A visitor that renames uses of variables and types *)
class renameVisitorClass =
  let rename_associated_logic_var lv =
    match lv.lv_kind with
    | LVGlobal ->
      let li = logic_info_of_logic_var lv in
      (match LogicMerging.findReplacement true lfEq !currentFidx li
       with
       | None -> DoChildren
       | Some (li,_) ->
         let lv' = li.l_var_info in
         if lv == lv' then DoChildren (* Replacement already done... *)
         else ChangeTo lv')
    | LVC ->
      let vi = Option.get lv.lv_origin in
      if not vi.vglob then DoChildren
      else begin
        match PlainMerging.findReplacement true vEq !currentFidx vi.vname
        with
        | None -> DoChildren
        | Some (vi',_) ->
          vi'.vreferenced <- true;
          if vi == vi' then DoChildren (* replacement was done already*)
          else begin
            (match vi'.vlogic_var_assoc with
               None ->
               vi'.vlogic_var_assoc <- Some lv; DoChildren
             | Some lv' -> ChangeTo lv')
          end
      end
    | LVFormal | LVQuant | LVLocal -> DoChildren
  in
  let find_enumitem_replacement ei =
    match EnumMerging.findReplacement true eEq !currentFidx ei.eihost with
      None -> None
    | Some (enum,_) ->
      if enum == intEnumInfo then begin
        (* Two different enums have been merged into an int type.
           Switch to an integer constant. *)
        match (constFold true ei.eival).enode with
        | Const c -> Some c
        | _ ->
          Kernel.fatal ~current:true "non constant value for an enum item"
      end else begin
        (* Merged with an isomorphic type. Find the appropriate enumitem *)
        let n = Extlib.find_index (fun e -> e.einame = ei.einame)
            ei.eihost.eitems in
        let ei' = List.nth enum.eitems n in
        assert (same_int64 ei.eival ei'.eival);
        Some (CEnum ei')
      end
  in
  object (self)
    inherit nopCilVisitor

    method! vvdec (_vi: varinfo) = DoChildren

    (* This is a variable use. See if we must change it *)
    method! vvrbl (vi: varinfo) : varinfo visitAction =
      if not vi.vglob then DoChildren
      else begin
        match PlainMerging.findReplacement true vEq !currentFidx vi.vname with
          None -> DoChildren
        | Some (vi', oldfidx) ->
          Kernel.debug ~dkey:Kernel.dkey_linker
            "Renaming use of var %s(%d) to %s(%d)"
            vi.vname !currentFidx vi'.vname oldfidx;
          H.add varUsedAlready vi'.vname ();
          ChangeTo vi'
      end

    method! vlogic_var_decl lv = rename_associated_logic_var lv

    method! vlogic_var_use lv = rename_associated_logic_var lv

    method! vlogic_info_use li =
      match LogicMerging.findReplacement true lfEq !currentFidx li with
      | None ->
        Kernel.debug ~dkey:Kernel.dkey_linker "Using logic function %s(%a)(%d)"
          li.l_var_info.lv_name
          (Pretty_utils.pp_list ~sep:",@ " Cil_printer.pp_logic_type)
          (List.map (fun v -> v.lv_type) li.l_profile)
          !currentFidx;
        DoChildren
      | Some(li',oldfidx) ->
        Kernel.debug ~dkey:Kernel.dkey_linker
          "Renaming use of logic function %s(%a)(%d) to %s(%a)(%d)"
          li.l_var_info.lv_name pp_profiles li !currentFidx
          li'.l_var_info.lv_name pp_profiles li' oldfidx;
        ChangeTo li'

    method! vlogic_info_decl li =
      match LogicMerging.findReplacement true lfEq !currentFidx li with
        None ->
        Kernel.debug ~dkey:Kernel.dkey_linker "Using logic function %s(%a)(%d)"
          li.l_var_info.lv_name pp_profiles li !currentFidx;
        DoChildren
      | Some(li',oldfidx) ->
        Kernel.debug ~dkey:Kernel.dkey_linker
          "Renaming use of logic function %s(%a)(%d) to %s(%a)(%d)"
          li.l_var_info.lv_name pp_profiles li !currentFidx
          li'.l_var_info.lv_name pp_profiles li' oldfidx;
        ChangeTo li'

    method! vlogic_type_info_use lt =
      match PlainMerging.findReplacement true ltEq !currentFidx lt.lt_name with
        None ->
        Kernel.debug ~dkey:Kernel.dkey_linker
          "Using logic type %s(%d)" lt.lt_name !currentFidx;
        DoChildren
      | Some(lt',oldfidx) ->
        Kernel.debug ~dkey:Kernel.dkey_linker
          "Renaming use of logic type %s(%d) to %s(%d)"
          lt.lt_name !currentFidx lt'.lt_name oldfidx;
        ChangeTo lt'

    method! vlogic_type_info_decl lt =
      match PlainMerging.findReplacement true ltEq !currentFidx lt.lt_name with
      | None ->
        Kernel.debug ~dkey:Kernel.dkey_linker
          "Using logic type %s(%d)" lt.lt_name !currentFidx;
        DoChildren
      | Some(lt',oldfidx) ->
        Kernel.debug ~dkey:Kernel.dkey_linker
          "Renaming use of logic function %s(%d) to %s(%d)"
          lt.lt_name !currentFidx lt'.lt_name oldfidx;
        ChangeTo lt'

    method! vlogic_ctor_info_use lc =
      match PlainMerging.findReplacement true lcEq !currentFidx lc.ctor_name with
        None ->
        Kernel.debug ~dkey:Kernel.dkey_linker "Using logic constructor %s(%d)"
          lc.ctor_name !currentFidx;
        DoChildren
      | Some(lc',oldfidx) ->
        Kernel.debug ~dkey:Kernel.dkey_linker
          "Renaming use of logic type %s(%d) to %s(%d)"
          lc.ctor_name !currentFidx lc'.ctor_name oldfidx;
        ChangeTo lc'

    method! vlogic_ctor_info_decl lc =
      match PlainMerging.findReplacement true lcEq !currentFidx lc.ctor_name with
        None ->
        Kernel.debug ~dkey:Kernel.dkey_linker "Using logic constructor %s(%d)"
          lc.ctor_name !currentFidx;
        DoChildren
      | Some(lc',oldfidx) ->
        Kernel.debug ~dkey:Kernel.dkey_linker
          "Renaming use of logic function %s(%d) to %s(%d)"
          lc.ctor_name !currentFidx lc'.ctor_name oldfidx;
        ChangeTo lc'

    (* The use of a type. Change only those types whose underlying info
     * is not a root. *)
    method! vtype (t: typ) =
      match t with
        TComp (ci, a) when not ci.creferenced -> begin
          match PlainMerging.findReplacement true sEq !currentFidx ci.cname with
            None ->
            Kernel.debug ~dkey:Kernel.dkey_linker "No renaming needed %s(%d)"
              ci.cname !currentFidx;
            DoChildren
          | Some (ci', oldfidx) ->
            Kernel.debug ~dkey:Kernel.dkey_linker
              "Renaming use of %s(%d) to %s(%d)"
              ci.cname !currentFidx ci'.cname oldfidx;
            ChangeTo (TComp (ci', visitCilAttributes (self :> cilVisitor) a))
        end
      | TComp(ci,_) ->
        Kernel.debug ~dkey:Kernel.dkey_linker
          "%s(%d) referenced. No change" ci.cname !currentFidx;
        DoChildren
      | TEnum (ei, a) when not ei.ereferenced -> begin
          match EnumMerging.findReplacement true eEq !currentFidx ei with
            None -> DoChildren
          | Some (ei', _) ->
            if ei' == intEnumInfo then
              (* This is actually our friend intEnumInfo *)
              ChangeTo (TInt(IInt, visitCilAttributes (self :> cilVisitor) a))
            else
              ChangeTo (TEnum (ei', visitCilAttributes (self :> cilVisitor) a))
        end

      | TNamed (ti, a) when not ti.treferenced -> begin
          match PlainMerging.findReplacement true tEq !currentFidx ti.tname with
            None -> DoChildren
          | Some (ti', _) ->
            ChangeTo (TNamed (ti', visitCilAttributes (self :> cilVisitor) a))
        end

      | _ -> DoChildren

    method! vexpr e =
      match e.enode with
      | Const (CEnum ei) ->
        (match find_enumitem_replacement ei with
           None -> DoChildren
         | Some c ->
           ChangeTo { e with enode = Const c })
      | CastE _ ->
        (* Maybe the cast is no longer necessary if an enum has been replaced
           by an integer type. *)
        let post_action e = match e.enode with
          | CastE(typ,exp) when
              Cil_datatype.TypByName.equal (typeOf exp) typ ->
            exp
          | _ -> e
        in
        ChangeDoChildrenPost (e,post_action)
      | _ -> DoChildren

    method! vterm e =
      match e.term_node with
      | TConst(LEnum ei) ->
        (match find_enumitem_replacement ei with
           None -> DoChildren
         | Some c ->
           let t = visitCilLogicType (self:>cilVisitor) e.term_type in
           ChangeTo
             { e with
               term_node = TConst (Logic_utils.constant_to_lconstant c);
               term_type = t
             })
      | _ -> DoChildren

    method private update_field f =
      (* See if the compinfo was changed *)
      if f.fcomp.creferenced then None
      else begin
        match
          PlainMerging.findReplacement true sEq !currentFidx f.fcomp.cname
        with
          None -> None (* We did not replace it *)
        | Some (ci', _oldfidx) -> begin
            (* First, find out the index of the original field *)
            let rec indexOf (i: int) = function
              | [] -> Kernel.fatal "Cannot find field %s in %s"
                        f.fname (compFullName f.fcomp)
              | f' :: _ when f' == f -> i
              | _ :: rest -> indexOf (i + 1) rest
            in
            let idx = indexOf 0 (Option.value ~default:[] f.fcomp.cfields) in
            let ci'_fields = Option.value ~default:[] ci'.cfields in
            if List.length ci'_fields <= idx then
              Kernel.fatal "Too few fields in replacement %s for %s"
                (compFullName ci')
                (compFullName f.fcomp);
            Some (List.nth ci'_fields idx)
          end
      end

    (* The Field offset might need to be changed to use new compinfo *)
    method! voffs = function
        Field (f, o) -> begin
          match self#update_field f with
          | None -> DoChildren
          | Some f' -> ChangeDoChildrenPost (Field (f', o), fun x -> x)
        end
      | _ -> DoChildren

    method! vterm_offset = function
        TField (f, o) -> begin
          match self#update_field f with
          | None -> DoChildren
          | Some f' -> ChangeDoChildrenPost (TField (f', o), fun x -> x)
        end
      | TModel(f,o) ->
        (match
           ModelMerging.findReplacement
             true mfEq !currentFidx (f.mi_name, f.mi_base_type)
         with
         | None ->
           (* We might have changed the field before choosing it as
              representative. Check that. *)
           let f' =
             (ModelMerging.find_eq_table
                mfEq (!currentFidx,(f.mi_name, f.mi_base_type))).ndata
           in
           if f == f' then DoChildren (* already the representative. *)
           else ChangeDoChildrenPost (TModel(f',o),fun x -> x)
         | Some (f',_) ->
           ChangeDoChildrenPost (TModel(f',o), fun x -> x))

      | _ -> DoChildren

    method! vinitoffs o =
      (self#voffs o)      (* treat initializer offsets same as lvalue offsets *)

  end

let renameVisitor = new renameVisitorClass


(** A visitor that renames uses of inline functions that were discovered in
 * pass 2 to be used before they are defined. This is like the renameVisitor
 * except it only looks at the variables (thus it is a bit more efficient)
 * and it also renames forward declarations of the inlines to be removed. *)

class renameInlineVisitorClass = object(self)
  inherit nopCilVisitor

  val mutable visited = Cil_datatype.Varinfo.Set.empty

  method private visit vi =
    visited <- Cil_datatype.Varinfo.Set.add vi visited

  (* This is a variable use. See if we must change it *)
  method! vvrbl (vi: varinfo) : varinfo visitAction =
    if not vi.vglob || Cil_datatype.Varinfo.Set.mem vi visited then DoChildren
    else begin
      match PlainMerging.findReplacement true vEq !currentFidx vi.vname with
        None -> self#visit vi; DoChildren
      | Some (vi', oldfidx) ->
        Kernel.debug ~dkey:Kernel.dkey_linker "Renaming var %s(%d) to %s(%d)"
          vi.vname !currentFidx vi'.vname oldfidx;
        self#visit vi';
        ChangeTo vi'
    end

  (* And rename some declarations of inlines to remove. We cannot drop this
   * declaration (see small1/combineinline6) *)
  method! vglob = function
    | GFunDecl(spec,vi, l) when vi.vinline -> begin
        (* Get the original name *)
        let origname =
          try H.find originalVarNames vi.vname
          with Not_found -> vi.vname
        in
        (* Now see if this must be replaced *)
        match PlainMerging.findReplacement true vEq !currentFidx origname with
          None -> self#visit vi; DoChildren
        | Some (vi', _) ->
          (*TODO: visit the spec to change references to formals *)
          self#visit vi';
          ChangeTo [GFunDecl (spec,vi', l)]
      end
    | _ -> DoChildren

end
let renameInlinesVisitor = new renameInlineVisitorClass

type context = Toplevel of global | InAxiomatic | InModule

let errorContext context toplevel =
  Kernel.abort ~current:true "%s not allowed inside %s" toplevel context

let checkContext ~toplevel = function
  | Toplevel _ -> ()
  | InAxiomatic -> errorContext "axiomatic" toplevel
  | InModule -> errorContext "module" toplevel

let pushGlobal ?toplevel = function
  | Toplevel g -> mergePushGlobals (visitCilGlobal renameVisitor g)
  | InAxiomatic -> Option.iter (errorContext "axiomatic") toplevel
  | InModule -> Option.iter (errorContext "module") toplevel

let rec logic_annot_pass2 context a =
  let open Current_loc.Operators in
  let<> UpdatedCurrentLoc = Cil_datatype.Global_annotation.loc a in
  match a with
  | Dfun_or_pred (li, _) ->
    begin
      match LogicMerging.findReplacement true lfEq !currentFidx li with
      | None ->
        pushGlobal context ;
        Logic_utils.add_logic_function li;
      | Some _ -> ()
      (* FIXME: should we perform same actions
          as the case Dlogic_reads above ? *)
    end
  | Dtype (t, _) ->
    begin
      match PlainMerging.findReplacement true ltEq !currentFidx t.lt_name with
      | None ->
        pushGlobal context ;
        let node = PlainMerging.find_eq_table ltEq (!currentFidx,t.lt_name) in
        let def = node.ndata in
        Logic_env.add_logic_type t.lt_name def;
        begin
          match def.lt_def with
          | Some (LTsum l) ->
            List.iter (fun c -> Logic_env.add_logic_ctor c.ctor_name c) l
          | Some (LTsyn _) | None -> ()
        end
      | Some _ -> ()
    end
  | Dinvariant (li, _) ->
    begin
      match LogicMerging.findReplacement true lfEq !currentFidx li with
      | None ->
        pushGlobal ~toplevel:"invariant" context ;
        Logic_utils.add_logic_function
          (LogicMerging.find_eq_table lfEq (!currentFidx,li)).ndata
      | Some _ -> ()
    end
  | Dtype_annot (n, _) ->
    begin
      match LogicMerging.findReplacement true lfEq !currentFidx n with
      | None ->
        pushGlobal context ;
        Logic_utils.add_logic_function
          (LogicMerging.find_eq_table lfEq (!currentFidx,n)).ndata
      | Some _ -> ()
    end
  | Dmodel_annot (mf, l) ->
    begin
      match
        ModelMerging.findReplacement
          true mfEq !currentFidx (mf.mi_name,mf.mi_base_type)
      with
      | None ->
        let mf' = visitCilModelInfo renameVisitor mf in
        if mf' != mf then begin
          let my_node =
            ModelMerging.find_eq_table
              mfEq (!currentFidx,(mf'.mi_name,mf'.mi_base_type))
          in
          (* Adds a new representative. Do not replace directly
              my_node, as there might be some pointers to it from
              other files.
          *)
          let my_node' = { my_node with ndata = mf' } in
          my_node.nrep <- my_node'; (* my_node' represents my_node *)
          my_node'.nrep <- my_node';
          (* my_node' is the canonical representative. *)
          ModelMerging.add_eq_table
            mfEq
            (!currentFidx,(mf'.mi_name,mf'.mi_base_type))
            my_node';
        end;
        checkContext ~toplevel:"model annotation" context ;
        mergePushGlobal (GAnnot (Dmodel_annot(mf',l),l)) ;
        Logic_env.add_model_field
          (ModelMerging.find_eq_table
             mfEq (!currentFidx,(mf'.mi_name,mf'.mi_base_type))).ndata;
      | Some _ -> ()
    end
  | Dlemma (n, _, _, _, _, _) ->
    begin
      match PlainMerging.findReplacement true llEq !currentFidx n with
        None -> pushGlobal context
      | Some _ -> ()
    end
  | Dvolatile(vi, rd, wr, attr, loc) ->
    let is_representative id =
      Option.is_none
        (VolatileMerging.findReplacement true lvEq !currentFidx id)
    in
    let push_volatile l rd wr =
      match l with
      | [] -> ()
      | _ ->
        let annot = Dvolatile(l,rd,wr,attr,loc) in
        mergePushGlobals
          (visitCilGlobal renameVisitor (GAnnot (annot,loc)))
    in
    (* check whether some volatile location clashes with a previous
       annotation. Warnings about that have been generated during pass 1
    *)
    let check_one_location
        (no_drop, full_representative, only_reads, only_writes) v =
      (* if there's only one function, only full_representative list will
         be filled. If both are provided, we maintain three lists of volatile
         locations:
         - the ones which take both their reads and writes function from
           current annotation
         - the ones which only use rd
         - the ones which only use wr
           Additionally, we maintain a boolean flag indicating whether the
           annotation can be used as is (i.e. does not overlap with a
           preceding annotation.
      *)
      let reads = Option.is_none rd || is_representative (v,R) in
      let writes = Option.is_none wr || is_representative (v,W) in
      if reads then
        if writes then
          no_drop, v::full_representative, only_reads, only_writes
        else
          false, full_representative, v::only_reads, only_writes
      else if writes then
        false, full_representative, only_reads, v::only_writes
      else
        false, full_representative, only_reads, only_writes
    in
    let no_drop, full_representative, only_reads, only_writes =
      List.fold_left check_one_location (true,[],[],[]) vi
    in
    if no_drop then pushGlobal ~toplevel:"volatile" context
    else begin
      checkContext ~toplevel:"volatile" context;
      push_volatile full_representative rd wr;
      if Option.is_some rd then push_volatile only_reads rd None;
      if Option.is_some wr then push_volatile only_writes None wr
    end
  | Daxiomatic(n, l, _, _) ->
    begin
      match PlainMerging.findReplacement true laEq !currentFidx n with
      | None ->
        pushGlobal context ;
        List.iter (logic_annot_pass2 InAxiomatic) l
      | Some _ -> ()
    end
  | Dmodule(n, l, _, _, _) ->
    begin
      match PlainMerging.findReplacement true laEq !currentFidx n with
        None ->
        pushGlobal context ;
        List.iter (logic_annot_pass2 InModule) l
      | Some _ -> ()
    end
  | Dextended(ext, _, _) ->
    begin
      match ExtMerging.findReplacement true extEq !currentFidx ext with
      | None -> pushGlobal context
      | Some _ -> ()
    end

let global_annot_pass2 g a = logic_annot_pass2 (Toplevel g) a

(* sm: First attempt at a semantic checksum for function bodies.
 * Ideally, two function's checksums would be equal only when their
 * bodies were provably equivalent; but I'm using a much simpler and
 * less accurate heuristic here.  It should be good enough for the
 * purpose I have in mind, which is doing duplicate removal of
 * multiply-instantiated template functions. *)
let functionChecksum (dec: fundec) : int =
  begin
    (* checksum the structure of the statements (only) *)
    let rec stmtListSum (lst : stmt list) : int =
      (List.fold_left (fun acc s -> acc + (stmtSum s)) 0 lst)
    and stmtSum (s: stmt) : int =
      (* strategy is to just throw a lot of prime numbers into the
       * computation in hopes of avoiding accidental collision.. *)
      match s.skind with
      | UnspecifiedSequence seq ->
        131*(stmtListSum (List.map (fun (x,_,_,_,_) -> x) seq)) + 127
      | Instr _ -> 13 + 67
      | Return(_) -> 17
      | Goto(_) -> 19
      | Break(_) -> 23
      | Continue(_) -> 29
      | If(_,b1,b2,_) -> 31 + 37*(stmtListSum b1.bstmts)
                         + 41*(stmtListSum b2.bstmts)
      | Switch(_,b,_,_) -> 43 + 47*(stmtListSum b.bstmts)
      (* don't look at stmt list b/c is not part of tree *)
      | Loop(_,b,_,_,_) -> 49 + 53*(stmtListSum b.bstmts)
      | Block(b) -> 59 + 61*(stmtListSum b.bstmts)
      | TryExcept (b, (_, _), h, _) ->
        67 + 83*(stmtListSum b.bstmts) + 97*(stmtListSum h.bstmts)
      | TryFinally (b, h, _) ->
        103 + 113*(stmtListSum b.bstmts) + 119*(stmtListSum h.bstmts)
      | Throw(_,_) -> 137
      | TryCatch (b,l,_) ->
        139 + 149*(stmtListSum b.bstmts) +
        151 *
        (List.fold_left (fun acc (_,b) -> acc + stmtListSum b.bstmts) 0 l)
    in

    (* disabled 2nd and 3rd measure because they appear to get different
     * values, for the same code, depending on whether the code was just
     * parsed into CIL or had previously been parsed into CIL, printed
     * out, then re-parsed into CIL *)
    let a,b,c,d,e =
      (List.length dec.sformals),        (* # formals *)
      0 (*(List.length dec.slocals)*),         (* # locals *)
      0 (*dec.smaxid*),                        (* estimate of internal statement count *)
      (List.length dec.sbody.bstmts),    (* number of statements at outer level *)
      (stmtListSum dec.sbody.bstmts) in  (* checksum of statement structure *)
    2*a + 3*b + 5*c + 7*d + 11*e
  end


(* sm: equality for initializers, etc.; this is like '=', except
 * when we reach shared pieces (like references into the type
 * structure), we use '==', to prevent circularity *)
(* update: that's no good; I'm using this to find things which
 * are equal but from different CIL trees, so nothing will ever
 * be '=='.. as a hack I'll just change those places to 'true',
 * so these functions are not now checking proper equality..
 * places where equality is not complete are marked "INC" *)
let rec equalInits (x: init) (y: init) : bool =
  begin
    match x,y with
    | SingleInit(xe), SingleInit(ye) -> (equalExps xe ye)
    | CompoundInit(_xt, xoil), CompoundInit(_yt, yoil) ->
      (*(xt == yt) &&*)  (* INC *)       (* types need to be identically equal *)
      let rec equalLists xoil yoil : bool =
        match xoil,yoil with
        | ((xo,xi) :: xrest), ((yo,yi) :: yrest) ->
          (equalOffsets xo yo) &&
          (equalInits xi yi) &&
          (equalLists xrest yrest)
        | [], [] -> true
        | _, _ -> false
      in
      (equalLists xoil yoil)
    | _, _ -> false
  end

and equalOffsets (x: offset) (y: offset) : bool =
  begin
    match x,y with
    | NoOffset, NoOffset -> true
    | Field(xfi,xo), Field(yfi,yo) ->
      (xfi.fname = yfi.fname) &&     (* INC: same fieldinfo name.. *)
      (equalOffsets xo yo)
    | Index(xe,xo), Index(ye,yo) ->
      (equalExps xe ye) &&
      (equalOffsets xo yo)
    | _,_ -> false
  end

and equalExps (x: exp) (y: exp) : bool =
  begin
    match x.enode,y.enode with
    | Const(xc), Const(yc) ->
      Cil.compareConstant xc yc  ||
      ((* CIL changes (unsigned)0 into 0U during printing.. *)
        match xc,yc with
        | CInt64(xv,_,_),CInt64(yv,_,_) ->
          (Integer.equal xv Integer.zero)
          && (* ok if they're both 0 *)
          (Integer.equal yv Integer.zero)
        | _,_ -> false
      )
    | Lval(xl), Lval(yl) ->          (equalLvals xl yl)
    | SizeOf(_xt), SizeOf(_yt) ->      true (*INC: xt == yt*)  (* identical types *)
    | SizeOfE(xe), SizeOfE(ye) ->    (equalExps xe ye)
    | AlignOf(_xt), AlignOf(_yt) ->    true (*INC: xt == yt*)
    | AlignOfE(xe), AlignOfE(ye) ->  (equalExps xe ye)
    | UnOp(xop,xe,_xt), UnOp(yop,ye,_yt) ->
      xop = yop &&
      (equalExps xe ye) &&
      true  (*INC: xt == yt*)
    | BinOp(xop,xe1,xe2,_xt), BinOp(yop,ye1,ye2,_yt) ->
      xop = yop &&
      (equalExps xe1 ye1) &&
      (equalExps xe2 ye2) &&
      true  (*INC: xt == yt*)
    | CastE(_xt,xe), CastE(_yt,ye) ->
      (*INC: xt == yt &&*)
      (equalExps xe ye)
    | AddrOf(xl), AddrOf(yl) ->      (equalLvals xl yl)
    | StartOf(xl), StartOf(yl) ->    (equalLvals xl yl)

    (* initializers that go through CIL multiple times sometimes lose casts they
     * had the first time; so allow a different of a cast *)
    | CastE(_xt,xe),_ ->
      (equalExps xe y)
    | _, CastE(_yt,ye) ->
      (equalExps x ye)

    | _,_ -> false
  end

and equalLvals (x: lval) (y: lval) : bool =
  begin
    match x,y with
    | (Var _xv,xo), (Var _yv,yo) ->
      (* I tried, I really did.. the problem is I see these names
       * before merging collapses them, so __T123 != __T456,
       * so whatever *)
      (*(xv.vname = vy.vname) &&      (* INC: same varinfo names.. *)*)
      (equalOffsets xo yo)

    | (Mem(xe),xo), (Mem(ye),yo) ->
      (equalExps xe ye) &&
      (equalOffsets xo yo)
    | _,_ -> false
  end

let equalInitOpts (x: init option) (y: init option) : bool =
  begin
    match x,y with
    | None,None -> true
    | Some(xi), Some(yi) -> (equalInits xi yi)
    | _,_ -> false
  end

let update_formals_names merged_vi curr_vi =
  (* if the reference varinfo already has formals, everything
     is renamed accordingly. However, if the old prototype contains
     anonymous formal declarations, while the corresponding current formal
     has a name, we keep the new name. *)
  match Cil.getFormalsDecl curr_vi with
  | curr_args ->
    (match Cil.getFormalsDecl merged_vi with
     | _ -> ()
     | exception Not_found ->
       (*existing prototype does not have formals list. Just use current one*)
       Cil.unsafeSetFormalsDecl merged_vi curr_args)
  | exception Not_found -> ()
(* current prototype does not have formals list, nothing to merge. *)

(* Now we go once more through the file and we rename the globals that we
 * keep. We also scan the entire body and we replace references to the
 * representative types or variables. We set the referenced flags once we
 * have replaced the names. *)
let oneFilePass2 (f: file) =
  Kernel.feedback ~level:2 "Final merging phase: %a"
    Datatype.Filepath.pretty f.fileName;
  currentDeclIdx := 0; (* Even though we don't need it anymore *)
  H.clear varUsedAlready;
  H.clear originalVarNames;
  (* If we find inline functions that are used before being defined, and thus
   * before knowing that we can throw them away, then we mark this flag so
   * that we can make another pass over the file *)
  let repeatPass2 = ref false in

  (* set to true if we need to make an additional path for changing tentative
     definition into plain declaration because a real definition has been found.
  *)
  let replaceTentativeDefn = ref false in

  (* Keep a pointer to the contents of the file so far *)
  let savedTheFile = !theFile in
  let visited = ref Cil_datatype.Varinfo.Set.empty in
  let visit vi = visited := Cil_datatype.Varinfo.Set.add vi !visited in
  let processOneGlobal (g: global) : unit =
    let open Current_loc.Operators in
    (* Process a varinfo. Reuse an old one, or rename it if necessary *)
    let processVarinfo (vi: varinfo) (vloc: location) : varinfo =
      if Cil_datatype.Varinfo.Set.mem vi !visited then vi
      else begin
        (* Maybe it is static. Rename it then *)
        if vi.vstorage = Static then begin
          let newName, _ =
            Alpha.newAlphaName ~alphaTable:vtAlpha ~undolist:None
              ~lookupname:vi.vname ~data:(Current_loc.get ())
          in
          let formals_decl =
            try Some (Cil.getFormalsDecl vi)
            with Not_found -> None
          in
          (* Remember the original name *)
          H.add originalVarNames newName vi.vname;
          Kernel.debug ~dkey:Kernel.dkey_linker "renaming %s at %a to %s"
            vi.vname Cil_printer.pp_location vloc newName;
          vi.vname <- newName;
          Cil_const.set_vid vi;
          visit vi;
          (match formals_decl with
           | Some formals -> Cil.unsafeSetFormalsDecl vi formals
           | None -> ());
          vi
        end else begin
          (* Find the representative *)
          match PlainMerging.findReplacement true vEq !currentFidx vi.vname with
            None -> visit vi; vi (* This is the representative *)
          | Some (vi', _) -> (* Reuse some previous one *)
            visit vi';
            vi'.vaddrof <- vi.vaddrof || vi'.vaddrof;
            vi'.vdefined <- vi.vdefined || vi'.vdefined;
            if vi'.vghost <> vi.vghost then
              Kernel.abort
                "Cannot merge: Global %a has both ghost and non-ghost status"
                Cil_printer.pp_varinfo vi';
            (* If vi has a logic binding, add one to
               the representative if needed. *)
            (match vi'.vlogic_var_assoc, vi.vlogic_var_assoc with
             | _, None -> ()
             | Some _, _ -> ()
             | None, Some _ -> ignore (Cil.cvar_to_lvar vi'));
            vi'
        end
      end
    in
    let<> UpdatedCurrentLoc = Cil_datatype.Global.loc g in
    match g with
    | GVarDecl (vi, l) as g ->
      incr currentDeclIdx;
      let vi' = processVarinfo vi l in
      if vi == vi' && not (H.mem emittedVarDecls vi'.vname) then begin
        H.add emittedVarDecls vi'.vname true; (* Remember that we emitted
                                               * it  *)
        mergePushGlobals (visitCilGlobal renameVisitor g)
      end

    | GFunDecl (spec,vi, l) as g ->
      incr currentDeclIdx;
      let vi' = processVarinfo vi l in
      let spec' = visitCilFunspec renameVisitor spec in
      if vi != vi' then begin
        (* if vi is supposed to be ignored, do nothing. *)
        if not (is_ignored_vi vi) then begin
          (* Drop the decl, keep the spec *)
          mergeSpec vi' vi spec';
          update_formals_names vi' vi;
        end;
        Cil.removeFormalsDecl vi
      end
      else if H.mem emittedVarDecls vi'.vname then begin
        mergeSpec vi' vi spec'
      end else begin
        H.add emittedVarDecls vi'.vname true; (* Remember that we emitted
                                               * it  *)
        mergePushGlobals (visitCilGlobal renameVisitor g)
      end

    | GVar (vi, init, l) ->
      incr currentDeclIdx;
      if not (is_ignored_vi vi) then begin
        let vi' = processVarinfo vi l in
        (* We must keep this definition even if we reuse this varinfo,
         * because maybe the previous one was a declaration *)
        H.add emittedVarDecls vi.vname true;
        (* Remember that we emitted it*)

        let emitIt:bool =
          (not mergeGlobals) ||
          match H.find_opt emittedVarDefn vi'.vname with
          | None ->
            (* no previous definition *)
            H.add emittedVarDefn vi'.vname (vi', init.init, l);
            true (* emit it *)
          | Some (_prevVar, prevInitOpt, prevLoc) ->
            (* previously defined; same initializer? *)
            if (equalInitOpts prevInitOpt init.init)
            then (
              false  (* do not emit *)
            )
            else (
              (* Both GVars have initializers. Note that None in this
                 context means a tentative definition turned into
                 a default 0-initialization. *)
              Kernel.error ~current:true
                "global var %s at %a has different initializer than %a"
                vi'.vname
                Cil_printer.pp_location l Cil_printer.pp_location prevLoc;
              false
            )
        in

        if emitIt then
          mergePushGlobals
            (visitCilGlobal renameVisitor (GVar(vi', init, l)))
      end

    | GFun (fdec, l) as g ->
      incr currentDeclIdx;
      if not (is_ignored_vi fdec.svar) then begin
        (* We apply the renaming *)
        let vi = processVarinfo fdec.svar l in
        if fdec.svar != vi then begin
          Kernel.debug ~dkey:Kernel.dkey_linker
            "%s: %d -> %d" vi.vname fdec.svar.vid vi.vid;
          (try add_alpha_renaming vi (Cil.getFormalsDecl vi) fdec.sformals
           with Not_found -> ());
          fdec.svar <- vi
        end;
        (* Get the original name. *)
        let origname =
          try H.find originalVarNames fdec.svar.vname
          with Not_found -> fdec.svar.vname
        in
        (* Go in there and rename everything as needed *)
        let fdec' =
          match visitCilGlobal renameVisitor g with
          | [ GFun(fdec', _) ] -> fdec'
          | _ ->
            Kernel.fatal "renameVisitor for GFun returned something else"
        in
        let g' = GFun(fdec', l) in
        (* Now restore the parameter names *)
        let _, args, _, _ = splitFunctionTypeVI fdec'.svar in
        let oldnames, foundthem =
          try H.find formalNames (!currentFidx, origname), true
          with Not_found -> begin
              [], false
            end
        in
        let defn_formals =
          try Some (Cil.getFormalsDecl fdec.svar)
          with Not_found -> None
        in
        if foundthem then begin
          let _argl = argsToList args in
          if List.length oldnames <> List.length fdec.sformals then
            Kernel.fatal ~current:true
              "After merging the function has different arguments";
          List.iter2
            (fun oldn a -> if oldn <> "" then a.vname <- oldn)
            oldnames fdec.sformals;
          (* Reflect them in the type *)
          setFormals fdec fdec.sformals
        end;
        (* See if we can remove this inline function *)
        if fdec'.svar.vinline && mergeInlinesWithAlphaConvert() then begin
          let printout =
            (* Temporarily turn of printing of lines *)
            let oldprintln =
              Cil_printer.state.Printer_api.line_directive_style in
            Cil_printer.state.Printer_api.line_directive_style <- None;
            (* Temporarily set the name to all functions in the same way *)
            let newname = fdec'.svar.vname in
            (* If we must do alpha conversion then temporarily set the
             * names of the function, local variables and formals in a
             * standard way *)
            fdec'.svar.vname <- "@@alphaname@@";
            let nameId = ref 0 in
            let oldNames : string list ref = ref [] in
            let renameOne (v: varinfo) =
              oldNames := v.vname :: !oldNames;
              incr nameId;
              v.vname <- "___alpha" ^ string_of_int !nameId
            in
            let undoRenameOne (v: varinfo) =
              match !oldNames with
                n :: rest ->
                oldNames := rest;
                v.vname <- n
              | _ ->  Kernel.fatal "undoRenameOne"
            in
            (* Remember the original type *)
            let origType = fdec'.svar.vtype in
            (* Rename the formals *)
            List.iter renameOne fdec'.sformals;
            (* Reflect in the type *)
            setFormals fdec' fdec'.sformals;
            (* Now do the locals *)
            List.iter renameOne fdec'.slocals;
            (* Now print it *)
            let res = Format.asprintf "%a" Cil_printer.pp_global g' in
            Cil_printer.state.Printer_api.line_directive_style
            <- oldprintln;
            fdec'.svar.vname <- newname;
            (* Do the locals in reverse order *)
            List.iter undoRenameOne (List.rev fdec'.slocals);
            (* Do the formals in reverse order *)
            List.iter undoRenameOne (List.rev fdec'.sformals);
            (* Restore the type *)
            Cil.update_var_type fdec'.svar origType;
            res
          in
          (* Make a node for this inline function using the original
             name. *)
          let inode =
            PlainMerging.getNode vEq vSyn !currentFidx origname fdec'.svar
              (Some (l, !currentDeclIdx))
          in
          if debugInlines then begin
            Kernel.debug "getNode %s(%d) with loc=%a. declidx=%d"
              inode.nname inode.nfidx
              d_nloc inode.nloc
              !currentDeclIdx;
            Kernel.debug
              "Looking for previous definition of inline %s(%d)"
              origname !currentFidx;
          end;
          let finalize_process_varinfo () =
            if debugInlines then Kernel.debug " Not found";
            H.add inlineBodies printout inode;
            mergePushGlobal g'
          in
          match H.find_opt inlineBodies printout with
          | None -> finalize_process_varinfo ()
          | Some oldinode ->
            if debugInlines then
              Kernel.debug "  Matches %s(%d)"
                oldinode.nname oldinode.nfidx;
            (* There is some other inline function with the same printout.
             * We should reuse this, but watch for the case when the inline
             * was already used. *)
            if H.mem varUsedAlready fdec'.svar.vname then begin
              if mergeInlinesWithAlphaConvert() then begin
                repeatPass2 := true
              end else begin
                Kernel.warning ~current:true
                  "Inline function %s because \
                   it is used before it is defined"
                  fdec'.svar.vname;
                finalize_process_varinfo ()
              end
            end;
            let _ = union oldinode inode in
            (* Clean up the vreferenced bit in the new inline, so that we
             * can rename it. Reset the name to the original one so that
             * we can find the replacement name. *)
            fdec'.svar.vname <- origname;
            () (* Drop this definition *)
        end else begin
          (* either the function is not inline, or we're not attempting to
           * merge inlines *)
          if mergeGlobals
          && not fdec'.svar.vinline
          && fdec'.svar.vstorage <> Static
          then begin
            (* sm: this is a non-inline, non-static function.  I want to
             * consider dropping it if a same-named function has already
             * been put into the merged file *)
            let curSum = (functionChecksum fdec') in
            match H.find_opt emittedFunDefn fdec'.svar.vname with
            | None ->
              (* there was no previous definition *)
              (mergePushGlobal g');
              (H.add emittedFunDefn fdec'.svar.vname (fdec', l, curSum))
            | Some (_prevFun, prevLoc, prevSum) ->
              (* previous was found *)
              (* restore old binding for vi, as we are about to drop
                 the new definition and its formals.
              *)
              Cil_datatype.Varinfo.Hashtbl.remove formals_renaming vi;
              (* Restore the formals from the old definition. We always have
                 Some l from getFormalsDecl
                 in case of a defined function. *)
              Cil.setFormals fdec (Option.get defn_formals);
              (* Remove static variables (avoids dangling globals in the AST *)
              remove_function_statics fdec';
              if hasAttribute "weak" fdec'.svar.vattr then begin
                Kernel.warning ~current:true ~wkey:Kernel.wkey_linker_weak
                  "dropping weak def'n of func %s at %a in favor of \
                   that at %a"
                  fdec'.svar.vname
                  Cil_printer.pp_location l Cil_printer.pp_location prevLoc;
                (* We remove the 'weak' attribute, assuming the 'strong'
                   version overrode it. *)
                fdec'.svar.vattr <- dropAttribute "weak" fdec'.svar.vattr;
              end else
              if (curSum = prevSum) then
                Kernel.warning ~current:true
                  "dropping duplicate def'n of func %s at %a in favor of \
                   that at %a"
                  fdec'.svar.vname
                  Cil_printer.pp_location l Cil_printer.pp_location prevLoc
              else begin
                (* the checksums differ, so print a warning but keep the
                 * older one to avoid a link error later.  I think this is
                 * a reasonable approximation of what ld does. *)
                Kernel.warning ~current:true
                  "def'n of func %s at %a (sum %d) conflicts with the one \
                   at %a (sum %d); keeping the one at %a."
                  fdec'.svar.vname
                  Cil_printer.pp_location l
                  curSum
                  Cil_printer.pp_location prevLoc
                  prevSum Cil_printer.pp_location prevLoc
              end
          end else begin
            (* not attempting to merge global functions, or it was static
             * or inline *)
            mergePushGlobal g'
          end;
        end
      end

    | GCompTag (ci, _) as g -> begin
        incr currentDeclIdx;
        if ci.creferenced then
          ()
        else begin
          match
            PlainMerging.findReplacement true sEq !currentFidx ci.cname
          with
            None ->
            (* A new one, we must rename it and keep the definition *)
            (* Make sure this is root *)
            (try
               let nd =
                 PlainMerging.find_eq_table sEq (!currentFidx, ci.cname)
               in
               if nd.nrep != nd then
                 Kernel.fatal "Setting creferenced for struct %s which is \
                               not root!"
                   ci.cname;
             with Not_found -> begin
                 Kernel.fatal "Setting creferenced for struct %s which \
                               is not in the sEq!"
                   ci.cname;
               end);
            let orig_name =
              if ci.corig_name = "" then ci.cname else ci.corig_name
            in
            let newname, _ =
              Alpha.newAlphaName ~alphaTable:sAlpha ~undolist:None
                ~lookupname:orig_name ~data:(Current_loc.get ())
            in
            ci.cname <- newname;
            ci.creferenced <- true;
            (* Now we should visit the fields as well *)
            H.add emittedCompDecls ci.cname true; (* Remember that we
                                                   * emitted it  *)
            mergePushGlobals (visitCilGlobal renameVisitor g)
          | Some (_oldci, _oldfidx) -> begin
              (* We are not the representative. Drop this declaration
               * because we'll not be using it. *)
              ()
            end
        end
      end
    | GEnumTag (ei, _) as g -> begin
        incr currentDeclIdx;
        if ei.ereferenced then
          ()
        else begin
          match
            EnumMerging.findReplacement true eEq !currentFidx ei
          with
          | None -> (* We must rename it *)
            let orig_name =
              if ei.eorig_name = "" then ei.ename else ei.eorig_name
            in
            let newname, _ =
              Alpha.newAlphaName ~alphaTable:eAlpha ~undolist:None
                ~lookupname:orig_name ~data:(Current_loc.get ())
            in
            ei.ename <- newname;
            ei.ereferenced <- true;
            (* And we must rename the items to using the same name space
             * as the variables *)
            List.iter
              (fun item ->
                 let newname,_ =
                   Alpha.newAlphaName ~alphaTable:vtAlpha ~undolist:None
                     ~lookupname:item.eiorig_name ~data:item.eiloc
                 in
                 item.einame <- newname)
              ei.eitems;
            mergePushGlobals (visitCilGlobal renameVisitor g);
          | Some (_ei', _) -> (* Drop this since we are reusing it from
                               * before *)
            ()
        end
      end
    | GCompTagDecl (ci, _) -> begin
        (* This is here just to introduce an undefined
         * structure. But maybe the structure was defined
         * already.  *)
        (* Do not increment currentDeclIdx because it is not incremented in
         * pass 1*)
        if H.mem emittedCompDecls ci.cname then
          () (* It was already declared *)
        else begin
          H.add emittedCompDecls ci.cname true;
          (* Keep it as a declaration *)
          mergePushGlobal g;
        end
      end

    | GEnumTagDecl (_ei, _) ->
      (* Do not increment currentDeclIdx because it is not incremented in
       * pass 1*)
      (* Keep it as a declaration *)
      mergePushGlobal g


    | GType (ti, _) as g -> begin
        incr currentDeclIdx;
        if ti.treferenced then
          ()
        else begin
          match
            PlainMerging.findReplacement true tEq !currentFidx ti.tname
          with
            None -> (* We must rename it and keep it *)
            let newname, _ =
              Alpha.newAlphaName ~alphaTable:vtAlpha ~undolist:None
                ~lookupname:ti.torig_name ~data:(Current_loc.get ())
            in
            ti.tname <- newname;
            ti.treferenced <- true;
            mergePushGlobals (visitCilGlobal renameVisitor g);
          | Some (_ti', _) ->(* Drop this since we are reusing it from
                              * before *)
            ()
        end
      end
    | GAnnot (a, _) as g ->
      incr currentDeclIdx;
      global_annot_pass2 g a
    | g -> mergePushGlobals (visitCilGlobal renameVisitor g)
  in
  (* Now do the real PASS 2 *)
  List.iter processOneGlobal f.globals;
  (* Replace tentative definition by a declaration when we found a real
     definition somewhere else *)
  if !replaceTentativeDefn then begin
    (* Stay tail-recursive, the list of globals can be huge. *)
    theFile :=
      List.rev
        (List.rev_map
           (function
             | GVar(vi,{init=None},loc) as g ->
               (try let (_,real_init,_) = H.find emittedVarDefn vi.vname
                  in match real_init with
                  | None -> g
                  | Some _ -> GVarDecl(vi,loc)
                with Not_found -> g)
             | g -> g)
           !theFile)
  end;
  (* See if we must re-visit the globals in this file because an inline that
   * is being removed was used before we saw the definition and we decided to
   * remove it *)
  if mergeInlinesWithAlphaConvert() && !repeatPass2 then begin
    Kernel.feedback "Repeat final merging phase: %a"
      Datatype.Filepath.pretty f.fileName;
    (* We are going to rescan the globals we have added while processing this
     * file. *)
    let theseGlobals : global list ref = ref [] in
    (* Scan a list of globals until we hit a given tail *)
    let rec scanUntil (tail: 'a list) (l: 'a list) =
      if tail == l then ()
      else
        match l with
        | [] ->  Kernel.fatal "mergecil: scanUntil could not find the marker"
        | g :: rest ->
          theseGlobals := g :: !theseGlobals;
          scanUntil tail rest
    in
    (* Collect in theseGlobals all the globals from this file *)
    theseGlobals := [];
    scanUntil savedTheFile !theFile;
    (* Now reprocess them *)
    theFile := savedTheFile;
    List.iter (fun g ->
        theFile := (visitCilGlobal renameInlinesVisitor g) @ !theFile)
      !theseGlobals;
    (* Now check if we have inlines that we could not remove
       H.iter (fun name _ ->
       if not (H.mem inlinesRemoved name) then
       ignore (warn "Could not remove inline %s. I have no idea why!\n"
       name))
       inlinesToRemove *)
  end


let merge_specs orig to_merge =
  let initial = { orig with spec_behavior = orig.spec_behavior } in
  let merge_one_spec spec =
    if is_same_spec initial spec then ()
    else Logic_utils.merge_funspec orig spec
  in
  List.iter merge_one_spec to_merge

let global_merge_spec g =
  let open Current_loc.Operators in
  Kernel.debug ~dkey:Kernel.dkey_linker
    "Merging global %a" Cil_printer.pp_global g;
  let rename v spec =
    try
      let alpha = Cil_datatype.Varinfo.Hashtbl.find formals_renaming v in
      ignore (visitCilFunspec alpha spec)
    with Not_found -> ()
  in
  let<> UpdatedCurrentLoc = Cil_datatype.Global.loc g in
  match g with
  | GFun(fdec, _) ->
    Kernel.debug ~dkey:Kernel.dkey_linker
      "Merging global definition %a" Cil_printer.pp_global g;
    (match Cil_datatype.Varinfo.Hashtbl.find_opt spec_to_merge fdec.svar with
     | None ->
       Kernel.debug ~dkey:Kernel.dkey_linker "No spec_to_merge";
       rename fdec.svar fdec.sspec
     | Some specs ->
       List.iter
         (fun s ->
            Kernel.debug ~dkey:Kernel.dkey_linker
              "Found spec to merge %a" Cil_printer.pp_funspec s;
            rename fdec.svar s;
            Kernel.debug ~dkey:Kernel.dkey_linker
              "After renaming:@\n%a" Cil_printer.pp_funspec s)
         specs;
       Kernel.debug ~dkey:Kernel.dkey_linker
         "Merging with %a" Cil_printer.pp_funspec fdec.sspec ;
       rename fdec.svar fdec.sspec;
       merge_specs fdec.sspec specs
    )
  | GFunDecl(spec, v, _) ->
    Kernel.debug ~dkey:Kernel.dkey_linker
      "Merging global declaration %a" Cil_printer.pp_global g;
    (match Cil_datatype.Varinfo.Hashtbl.find_opt spec_to_merge v with
     | None ->
       Kernel.debug ~dkey:Kernel.dkey_linker "No spec_to_merge for declaration" ;
       rename v spec;
       Kernel.debug ~dkey:Kernel.dkey_linker
         "Renamed to %a" Cil_printer.pp_funspec spec ;
     | Some specs ->
       List.iter
         (fun s ->
            Kernel.debug ~dkey:Kernel.dkey_linker
              "Found spec to merge %a" Cil_printer.pp_funspec s)
         specs;
       Kernel.debug ~dkey:Kernel.dkey_linker
         "Renaming %a" Cil_printer.pp_funspec spec ;
       rename v spec;
       (* The registered specs might also need renaming up to
          definition's formals instead of declaration's ones. *)
       List.iter (rename v) specs;
       Kernel.debug ~dkey:Kernel.dkey_linker
         "Renamed to %a" Cil_printer.pp_funspec spec;
       merge_specs spec specs;
       Kernel.debug ~dkey:Kernel.dkey_linker
         "Merged into %a" Cil_printer.pp_funspec spec ;
    )
  | _ -> ()

let find_decls g =
  let c_res = ref Cil_datatype.Varinfo.Set.empty in
  let res = ref Cil_datatype.Logic_var.Set.empty in
  let visit =
    object(self)
      inherit Cil.nopCilVisitor
      method! vvdec v =
        c_res:=Cil_datatype.Varinfo.Set.add v !c_res; DoChildren
      method! vlogic_var_decl lv =
        res := Cil_datatype.Logic_var.Set.add lv !res;
        SkipChildren
      method! vspec _ = Cil.SkipChildren
      method! vfunc f =
        ignore (self#vvdec f.svar);
        Option.iter (ignore $ self#vlogic_var_decl) f.svar.vlogic_var_assoc;
        SkipChildren
    end
  in
  ignore (visitCilGlobal visit g); !c_res, !res

let used_vars g =
  let res = ref Cil_datatype.Logic_var.Set.empty in
  let locals = ref Cil_datatype.Logic_var.Set.empty in
  let visit =
    object
      inherit Cil.nopCilVisitor
      method! vlogic_var_decl lv =
        locals := Cil_datatype.Logic_var.Set.add lv !locals;
        SkipChildren
      method! vlogic_var_use lv =
        if not (Cil_datatype.Logic_var.Set.mem lv !locals)
        && not (Logic_env.is_builtin_logic_function lv.lv_name)
        && not (lv.lv_name = "\\exit_status")
        then
          begin
            res:=Cil_datatype.Logic_var.Set.add lv !res
          end;
        SkipChildren
    end
  in
  ignore (visitCilGlobal visit g); !res

let print_missing fmt to_declare =
  let print_one_binding fmt s =
    Cil_datatype.Logic_var.Set.iter
      (fun x -> Format.fprintf fmt "%a;@ " Cil_printer.pp_logic_var x) s
  in
  let print_entry fmt v (_,s) =
    Format.fprintf fmt "@[%a:@[%a@]@]@\n"
      Cil_printer.pp_varinfo v print_one_binding s
  in
  Cil_datatype.Varinfo.Map.iter (print_entry fmt) to_declare


let move_spec globals =
  let all_declared known v (g,missing) (can_declare,to_declare) =
    let missing = Cil_datatype.Logic_var.Set.diff missing known in
    if Cil_datatype.Logic_var.Set.is_empty missing then
      (g::can_declare,to_declare)
    else
      (can_declare, Cil_datatype.Varinfo.Map.add v (g,missing) to_declare)
  in
  let aux (res,c_known,known,to_declare) g =
    let my_c_decls, my_decls = find_decls g in
    let known = Cil_datatype.Logic_var.Set.union my_decls known in
    let can_declare, to_declare =
      Cil_datatype.Varinfo.Map.fold (all_declared known) to_declare
        ([],Cil_datatype.Varinfo.Map.empty)
    in
    let res, to_declare =
      match g with
      | GFunDecl (_,v,l) ->
        let needs = used_vars g in
        let missing = Cil_datatype.Logic_var.Set.diff needs known in
        if Cil_datatype.Logic_var.Set.is_empty missing then
          g::res, to_declare
        else
          (GFunDecl(Cil.empty_funspec (),v,l)::res,
           Cil_datatype.Varinfo.Map.add v (g,missing) to_declare)
      | GFun (f,l) ->
        let needs = used_vars g in
        let missing = Cil_datatype.Logic_var.Set.diff needs known in
        if Cil_datatype.Logic_var.Set.is_empty missing then g::res,to_declare
        else
          let res =
            if Cil_datatype.Varinfo.Set.mem f.svar c_known then
              res
            else
              GFunDecl(Cil.empty_funspec (),f.svar,l)::res
          in
          res, Cil_datatype.Varinfo.Map.add f.svar (g,missing) to_declare
      | _ -> (g::res,to_declare)
    in
    let c_known = Cil_datatype.Varinfo.Set.union my_c_decls c_known in
    (can_declare @ res, c_known, known, to_declare)
  in
  let (res,_,_,to_declare) =
    List.fold_left
      aux
      ([],
       Cil_datatype.Varinfo.Set.empty,
       Cil_datatype.Logic_var.Set.empty,
       Cil_datatype.Varinfo.Map.empty)
      globals
  in
  assert
    (Kernel.verify (Cil_datatype.Varinfo.Map.is_empty to_declare)
       "Some globals contain dangling references after link:@\n%a"
       print_missing to_declare);
  List.rev res

let mark_referenced f =
  let vis =
    object
      inherit Cil.nopCilVisitor
      method! vvrbl vi = vi.vreferenced <- true; Cil.DoChildren
    end
  in
  Cil.visitCilFileSameGlobals vis f

let merge (files: file list) (newname: string) : file =
  init ();
  List.iter mark_referenced files;
  Errorloc.clear_errors ();

  (* Make the first pass over the files *)
  currentFidx := 0;
  List.iter (fun f -> oneFilePass1 f; incr currentFidx) files;

  (* Now maybe try to force synonyms to be equal *)
  if mergeSynonyms then begin
    doMergeSynonyms sSyn matchCompInfo;
    EnumMerging.doMergeSynonyms eSyn matchEnumInfo;
    doMergeSynonyms tSyn matchTypeInfo;

    LogicMerging.doMergeSynonyms lfSyn matchLogicInfo;
    doMergeSynonyms ltSyn matchLogicType;
    doMergeSynonyms lcSyn matchLogicCtor;
    doMergeSynonyms laSyn matchLogicAxiomatic;
    doMergeSynonyms llSyn matchLogicLemma;
    VolatileMerging.doMergeSynonyms lvSyn matchVolatileClause;
    ModelMerging.doMergeSynonyms mfSyn matchModelField;
    if mergeInlinesWithAlphaConvert() then begin
      (* Copy all the nodes from the iEq to vEq as well. This is needed
       * because vEq will be used for variable renaming *)
      PlainMerging.iter_eq_table
        (fun k n -> PlainMerging.add_eq_table vEq k n) iEq;
      doMergeSynonyms iSyn matchInlines;
    end
  end;

  (* Now maybe dump the graph *)
  if false then begin
    dumpGraph "type" tEq;
    dumpGraph "struct and union" sEq;
    EnumMerging.dumpGraph "enum" eEq;
    dumpGraph "variable" vEq;
    if mergeInlinesWithAlphaConvert() then dumpGraph "inline" iEq;
  end;
  (* Make the second pass over the files. This is when we start rewriting the
   * file *)
  currentFidx := 0;
  List.iter (fun f -> oneFilePass2 f; incr currentFidx) files;

  (* Now reverse the result and return the resulting file *)
  let rec revonto acc = function
      [] -> acc
    | x :: t ->
      revonto (x :: acc) t
  in
  let res =
    { fileName = Datatype.Filepath.of_string newname;
      globals  = revonto (revonto [] !theFile) !theFileTypes;
      globinit = None;
      globinitcalled = false } in
  List.iter global_merge_spec res.globals;
  let globals = move_spec res.globals in
  res.globals <- globals;
  Kernel.debug ~dkey:Kernel.dkey_linker
    "AST after merging@\n%a" Cil_printer.pp_file res;
  init ~all:false (); (* Make the GC happy BUT KEEP some tables *)
  (* We have made many renaming changes and sometimes we have just guessed a
   * name wrong. Make sure now that the local names are unique. *)
  uniqueVarNames res;
  Kernel.debug ~dkey:Kernel.dkey_linker
    "AST after alpha renaming@\n%a" Cil_printer.pp_file res;
  if Errorloc.had_errors () then
    Kernel.abort "error encountered during linking@." ;
  res

(*
Local Variables:
compile-command: "make -C ../../.."
End:
*)
