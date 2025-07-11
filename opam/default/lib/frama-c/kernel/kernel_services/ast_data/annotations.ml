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

open Property
open Cil_types
open Cil_datatype

(**************************************************************************)
(** {2 Utilities} *)
(**************************************************************************)

let exists_in_funspec f tbl =
  try
    Emitter.Usable_emitter.Hashtbl.iter (fun _ s -> if f s then raise Exit) tbl;
    false
  with Exit ->
    true

let pretty_spec_location fmt (kf,stmt) =
  match stmt with
  | Some _ ->
    Format.fprintf fmt "statement contract in %a" Kernel_function.pretty kf
  | None ->
    Format.fprintf fmt "contract of %a" Kernel_function.pretty kf

(* use unicity: more efficient than using [List.filter ((!=) x)] *)
let filterq ?(eq = ( == )) x l =
  let rec aux acc = function
    | [] -> List.rev acc
    | y :: l ->
      if eq x y then
        (* equivalent but more efficient than List.rev acc @ l *)
        List.fold_left (fun l x -> x :: l) l acc
      else aux (y :: acc) l
  in
  aux [] l

let find_englobing_kf ?kf stmt =
  match kf with
  | Some kf -> kf
  | None ->
    try Kernel_function.find_englobing_kf stmt
    with Not_found ->
      Kernel.fatal "[Annotations] no function for stmt %a (%d)"
        Cil_printer.pp_stmt stmt stmt.sid

(**************************************************************************)
(** {2 Internal State} *)
(**************************************************************************)

module Changed = Hook.Make()
let add_hook_on_change = Changed.extend

module Usable_emitter = struct
  include Emitter.Usable_emitter
  let local_clear _ h = Hashtbl.clear h
  let usable_get e = e
end

module Real_globals = Globals

module Globals =
  Emitter.Make_table
    (Global_annotation.Hashtbl)
    (Usable_emitter)
    (Datatype.Unit)
    (struct
      let dependencies = [ Ast.self ]
      let name = "Annotations.Globals"
      let kinds = [ Emitter.Global_annot ]
      let size = 17
    end)
let global_state = Globals.self
let () =
  Logic_env.init_dependencies global_state;
  Ast.add_linked_state global_state;
  Globals.add_hook_on_remove
    (fun _ a () ->
       List.iter Property_status.remove (Property.ip_of_global_annotation a))

module Model_fields =
  Emitter.Make_table
    (Cil_datatype.TypNoUnroll.Hashtbl)
    (Usable_emitter)
    (Datatype.List(Cil_datatype.Model_info))
    (struct
      let dependencies = [ Globals.self ]
      let name = "Annotations.Model_fields"
      let kinds = [ Emitter.Global_annot ]
      let size = 7
    end)
let () = Ast.add_linked_state Model_fields.self

module Funspecs =
  Emitter.Make_table
    (Kf.Hashtbl)
    (Usable_emitter)
    (Funspec)
    (struct
      let dependencies = [ Ast.self; Real_globals.Functions.self ]
      let name = "Annotations.Funspec"
      let kinds = [ Emitter.Funspec ]
      let size = 97
    end)
let funspec_state = Funspecs.self
let () =
  Ast.add_linked_state funspec_state;
  Funspecs.add_hook_on_remove
    (fun _ kf spec ->
       let ppts = Property.ip_of_spec kf Kglobal ~active:[] spec in
       List.iter Property_status.remove ppts)

module Code_annots =
  Emitter.Make_table
    (Stmt.Hashtbl)
    (Usable_emitter)
    (Datatype.Ref(Datatype.List(Code_annotation)))
    (struct
      let dependencies = [ Ast.self ]
      let name = "Annotations.Code_annots"
      let kinds = [ Emitter.Code_annot; Emitter.Alarm ]
      let size = 97
    end)
let code_annot_state = Code_annots.self

let remove_alarm_ref = Extlib.mk_fun "Annotations.remove_alarm_ref"

(* Clear all information linked to [a]: an eventual corresponding alarm,
   plus all property statuses on [a], or that depend on [a]. *)
let clear_linked_to_annot kf stmt e ca =
  !remove_alarm_ref e stmt ca;
  let ppts = Property.ip_of_code_annot kf stmt ca in
  List.iter Property_status.remove ppts

let () =
  Ast.add_linked_state code_annot_state;
  Code_annots.add_hook_on_remove
    (fun e stmt l ->
       let kf = find_englobing_kf stmt in
       List.iter (fun a -> clear_linked_to_annot kf stmt e a) !l)

(**************************************************************************)
(** {2 Getting annotations} *)
(**************************************************************************)

let populate_spec_ref = Extlib.mk_fun "Annotations.populate_spec"

let merge_from from1 from2 =
  match from1, from2 with
  | FromAny, FromAny -> FromAny
  | From _, FromAny -> from1
  | FromAny, From _ -> from2
  | From l1, From l2 ->
    let l2_only =
      List.filter
        (fun f2 ->
           not (List.exists (Logic_utils.is_same_identified_term f2) l1))
        l2
    in
    From (l1 @ l2_only)

let merge_froms l1 l2 =
  let same_from (a1, _) (a2, _) = Logic_utils.is_same_identified_term a1 a2 in
  let common1, l1_only =
    List.partition (fun a1 -> List.exists (same_from a1) l2) l1
  in
  let common2, l2_only =
    List.partition (fun a2 -> List.exists (same_from a2) l1) l2
  in
  let common =
    List.map
      (fun (l1, f1 as a1) ->
         let (_, f2) = List.find (same_from a1) common2 in
         (l1, merge_from f1 f2))
      common1
  in
  l1_only @ common @ l2_only

let merge_assigns ~keep_empty a1 a2 = match a1, a2, keep_empty with
  | WritesAny, a, false | a, WritesAny, false
  | (WritesAny as a), _, true | _, (WritesAny as a), true -> a
  | Writes a1, Writes a2, _ -> Writes (merge_froms a1 a2)

let merge_allocation ~keep_empty a1 a2 = match a1, a2, keep_empty with
  | FreeAllocAny, a, false | a, FreeAllocAny, false
  | (FreeAllocAny as a),_,true | _, (FreeAllocAny as a), true -> a
  | FreeAlloc (f1,a1), FreeAlloc (f2,a2), _ -> FreeAlloc (f1 @ f2, a1 @ a2)

let merge_behavior fresh_bhv bhv =
  assert (fresh_bhv.b_name = bhv.b_name);
  fresh_bhv.b_assumes <- bhv.b_assumes @ fresh_bhv.b_assumes;
  fresh_bhv.b_requires <- bhv.b_requires @ fresh_bhv.b_requires;
  fresh_bhv.b_post_cond <- bhv.b_post_cond @ fresh_bhv.b_post_cond;
  fresh_bhv.b_assigns <-
    merge_assigns ~keep_empty:false fresh_bhv.b_assigns bhv.b_assigns;
  fresh_bhv.b_allocation <-
    merge_allocation ~keep_empty:false fresh_bhv.b_allocation bhv.b_allocation;
  fresh_bhv.b_extended <- fresh_bhv.b_extended @ bhv.b_extended

let merge_behaviors fresh old =
  let init_fresh_bhvs = fresh.spec_behavior in
  let init_old_bhvs = old.spec_behavior in
  (*  let pp_behav fmt b = Format.pp_print_string fmt b.b_name in
      let pp_behavs fmt = Pretty_utils.pp_list ~sep:" " pp_behav fmt in
      Format.printf "##[[ %a + %a ]]@."
      pp_behavs init_fresh_bhvs pp_behavs init_old_bhvs; *)
  let rec merge acc = function
    | [] -> acc
    | b :: tl ->
      (try
         let bhv = List.find (fun x -> x.b_name = b.b_name) init_old_bhvs in
         merge_behavior b bhv;
       with Not_found ->
         ());
      merge (b :: acc) tl
  in
  let rec keep acc = function
    | [] -> List.rev acc
    | b :: tl ->
      let acc =
        if List.for_all (fun x -> x.b_name <> b.b_name) init_fresh_bhvs then
          begin
            (* do not share behaviors *)
            ({ b with b_assumes = b.b_assumes } :: acc)
          end else
          acc
      in
      keep acc tl
  in
  fresh.spec_behavior <-
    merge (keep [] init_old_bhvs) (List.rev init_fresh_bhvs)

let merge_variant fresh old = match fresh.spec_variant, old.spec_variant with
  | _, None -> ()
  | Some f, Some o when not @@ Logic_utils.is_same_variant f o -> assert false
  | _, (Some _ as v) -> fresh.spec_variant <- v

let merge_terminates fresh old =
  match fresh.spec_terminates, old.spec_terminates with
  | _, None -> ()
  | Some f, Some o when not @@ Logic_utils.is_same_identified_predicate f o ->
    assert false
  | _, (Some _ as v) -> fresh.spec_terminates <- v

let merge_complete fresh old =
  fresh.spec_complete_behaviors <-
    old.spec_complete_behaviors @ fresh.spec_complete_behaviors

let merge_disjoint fresh old =
  fresh.spec_disjoint_behaviors <-
    old.spec_disjoint_behaviors @ fresh.spec_disjoint_behaviors

(* modifies [s1], let [s2] be unchanged. *)
let merge_funspec s1 s2 =
  merge_behaviors s1 s2;
  merge_variant s1 s2;
  merge_terminates s1 s2;
  merge_complete s1 s2;
  merge_disjoint s1 s2

(**************************************************************************)
(** {2 Getting annotations} *)
(**************************************************************************)

module Behavior_set_map = Stdlib.Map.Make(Datatype.String.Set)

let is_same_behavior_set l1 l2 =
  Datatype.String.Set.(equal (of_list l1) (of_list l2))

let is_same_behavior b1 b2 = b1.b_name = b2.b_name

let merge_annots_emitters extract merge make annots =
  let merge_same_bhvs bhvs (ca,a,e) acc =
    let elt =
      match Behavior_set_map.find_opt bhvs acc with
      | Some (ca', a',e') ->
        let a' = merge a a' in
        let e' = if Emitter.equal e e' then e else Emitter.kernel in
        let ca' =
          if Cil_datatype.Code_annotation.compare ca' ca < 0 then ca' else ca
        in
        let annot_content = make (Datatype.String.Set.elements bhvs) a' in
        let ca' = { ca' with annot_content } in
        ca', a', e'
      | None -> ca,a,e
    in
    Behavior_set_map.add bhvs elt acc
  in
  let treat_code_annot acc (ca,e) =
    match extract ca with
    | Some(bhvs,a) ->
      merge_same_bhvs (Datatype.String.Set.of_list bhvs) (ca,a,e) acc
    | None -> acc
  in
  let bhvs = List.fold_left treat_code_annot Behavior_set_map.empty annots in
  Behavior_set_map.fold (fun _ (ca,_,e) acc -> (ca,e) :: acc) bhvs []

let merge_stmt_contracts_emitters =
  let extract ca =
    match ca.annot_content with
    | AStmtSpec(bhvs, spec) -> Some (bhvs,spec)
    | _ -> None
  in
  let merge s s' =
    let e = Cil.empty_funspec() in
    merge_funspec e s;
    merge_funspec e s';
    e
  in
  let make bhvs s = AStmtSpec(bhvs,s) in
  merge_annots_emitters extract merge make

let merge_loop_assigns_emitter =
  let extract ca =
    match ca.annot_content with
    | AAssigns(bhvs,a) -> Some(bhvs,a)
    | _ -> None
  in
  let merge a a' = merge_assigns ~keep_empty:false a a' in
  let make bhvs a = AAssigns(bhvs,a) in
  merge_annots_emitters extract merge make

let merge_loop_allocation_emitter =
  let extract ca =
    match ca.annot_content with AAllocation(bhvs,a) -> Some (bhvs,a) | _ -> None
  in
  let merge a a' = merge_allocation ~keep_empty:false a a' in
  let make bhvs a = AAllocation(bhvs,a) in
  merge_annots_emitters extract merge make

let partition_code_annot_emitter l =
  let add_one_ca (contracts, assigns, alloc, others) (ca,_ as v) =
    if Logic_utils.is_contract ca then v::contracts,assigns,alloc,others
    else if Logic_utils.is_assigns ca then contracts,v::assigns,alloc,others
    else if Logic_utils.is_allocation ca then contracts,assigns,v::alloc,others
    else (contracts,assigns,alloc,v::others)
  in
  let (contracts,assigns,alloc,others) =
    List.fold_left add_one_ca ([],[],[],[]) l
  in
  List.(rev contracts, rev assigns, rev alloc, rev others)

let code_annot_emitter ?filter stmt =
  try
    let tbl = Code_annots.find stmt in
    let filter e l acc =
      let e = Emitter.Usable_emitter.get e in
      match filter with
      | None -> List.map (fun a -> a, e) l @ acc
      | Some f ->
        let rec aux acc = function
          | [] -> acc
          | x :: l -> aux (if f e x then (x, e) :: acc else acc) l
        in
        aux acc l
    in
    let l =
      Emitter.Usable_emitter.Hashtbl.fold_sorted
        ~cmp:Emitter.Usable_emitter.compare
        (fun e l acc -> filter e !l acc) tbl []
    in
    let contracts,assigns,allocation,others = partition_code_annot_emitter l in
    merge_stmt_contracts_emitters contracts @
    merge_loop_assigns_emitter assigns @
    merge_loop_allocation_emitter allocation @
    others
  with Not_found ->
    []

let code_annot ?emitter ?filter stmt =
  match emitter with
  | Some e ->
    (try
       (* No need to merge stmt contracts or loop assigns:
          each emitter maintains one of each per set of behavior. *)
       let tbl = Code_annots.find stmt in
       let l = !(Emitter.Usable_emitter.Hashtbl.find tbl (Emitter.get e)) in
       (match filter with
        | None -> l
        | Some f -> List.filter f l)
     with Not_found -> [])
  | None ->
    let filter = Option.map (fun filter _ e -> filter e) filter in
    fst (List.split (code_annot_emitter ?filter stmt))

let pre_register_funspec ?tbl ?(emitter=Emitter.end_user) ?(force=false) kf =
  (* Avoid sharing with kf.spec *)
  let spec = { kf.spec with spec_behavior = kf.spec.spec_behavior } in
  let do_it = match tbl with
    | None ->
      if force then begin
        Funspecs.remove kf;
        true
      end else
        not (Funspecs.mem kf)
    | Some _ ->
      true
  in
  if do_it then begin
    let tbl = match tbl with
      | None -> Emitter.Usable_emitter.Hashtbl.create 7
      | Some tbl -> tbl
    in
    Emitter.Usable_emitter.Hashtbl.add
      tbl (Emitter.get emitter) spec;
    (*    Kernel.feedback "Registering contract of function %a (%a)" Kf.pretty kf
          Cil_printer.pp_funspec kf.spec;*)
    Funspecs.add kf tbl;
    (*    Emitter.Usable_emitter.Hashtbl.iter
          (fun e spec -> Format.printf "Register for function %a, Emitter %a, spec %a@." Kf.pretty kf Emitter.Usable_emitter.pretty e Cil_printer.pp_funspec spec)
          tbl;
    *)
    List.iter Property_status.register
      (Property.ip_of_spec kf Kglobal ~active:[] spec);
    Changed.apply();
  end

let register_funspec ?emitter ?force kf =
  pre_register_funspec ?emitter ?force kf

exception No_funspec of Emitter.t
let generic_funspec merge get ?emitter kf =
  let merge tbl =
    (* Kernel.feedback "Getting spec of function %a" Kf.pretty kf; *)
    match emitter with
    | None ->
      let merged_spec () =
        let spec = Cil.empty_funspec () in
        Emitter.Usable_emitter.Hashtbl.iter
          (fun _e s ->
             (*Format.printf "emitter %a(%d):@\n%a@."
               Emitter.Usable_emitter.pretty _e (Obj.magic s) Cil_printer.pp_funspec s; *)
             merge spec s) tbl;
        spec
      in
      get (merged_spec ())
    | Some e ->
      try
        let s = Emitter.Usable_emitter.Hashtbl.find tbl (Emitter.get e) in
        get s
      with Not_found ->
        raise (No_funspec e)
  in
  try
    let tbl = Funspecs.find kf in
    merge tbl
  with Not_found ->
    let tbl = Emitter.Usable_emitter.Hashtbl.create 7 in
    pre_register_funspec ~tbl kf;
    merge tbl

let funspec ?emitter kf =
  generic_funspec merge_funspec ?emitter (fun x -> x) kf

let has_funspec kf =
  try
    not (Cil.is_empty_funspec (funspec kf))
  with No_funspec _ -> false

(* Do not share behaviors with outside world if there's a single emitter. *)
let behaviors =
  generic_funspec merge_behaviors
    (fun x -> List.map (fun b -> { b with b_name = b.b_name }) x.spec_behavior)

let decreases = generic_funspec merge_variant (fun x -> x.spec_variant)

let terminates = generic_funspec merge_terminates (fun x -> x.spec_terminates)

let complete =
  generic_funspec merge_complete (fun x -> x.spec_complete_behaviors)

let disjoint =
  generic_funspec merge_disjoint (fun x -> x.spec_disjoint_behaviors)

let model_fields ?emitter t =
  let rec aux acc t =
    let self_fields =
      try
        let h = Model_fields.find t in
        match emitter with
        | None ->
          Emitter.Usable_emitter.Hashtbl.fold (fun _ m acc-> m @ acc) h acc
        | Some e ->
          let e = Emitter.get e in
          try Emitter.Usable_emitter.Hashtbl.find h e @ acc
          with Not_found -> acc
      with Not_found -> acc
    in
    match t with
    | TNamed (ty,_) -> aux self_fields ty.ttype
    | _ -> self_fields
  in
  aux [] t

(**************************************************************************)
(** {2 Iterating over annotations} *)
(**************************************************************************)

let iter_code_annot f stmt =
  let l = code_annot_emitter stmt in
  List.iter (fun (a,e) -> f e a) l

let fold_code_annot f stmt acc =
  let l = code_annot_emitter stmt in
  List.fold_left (fun acc (a,e) -> f e a acc) acc l

let iter_all_code_annot ?(sorted=true) f =
  let cmp s1 s2 =
    let res =
      Cil_datatype.Location.compare
        (Cil_datatype.Stmt.loc s1) (Cil_datatype.Stmt.loc s2)
    in
    if res <> 0 then res else Cil_datatype.Stmt.compare s1 s2
  in
  let f_inner stmt tbl =
    let cmp = Emitter.Usable_emitter.compare in
    let iter =
      if sorted then
        Emitter.Usable_emitter.Hashtbl.iter_sorted ~cmp
      else
        Emitter.Usable_emitter.Hashtbl.iter
    in
    iter
      (fun e l -> List.iter (f stmt (Emitter.Usable_emitter.get e)) !l)
      tbl
  in
  let iter = if sorted then Code_annots.iter_sorted ~cmp else Code_annots.iter
  in
  iter f_inner

let fold_all_code_annot ?(sorted=true) f =
  let cmp s1 s2 =
    let res =
      Cil_datatype.Location.compare
        (Cil_datatype.Stmt.loc s1) (Cil_datatype.Stmt.loc s2)
    in
    if res <> 0 then res else Cil_datatype.Stmt.compare s1 s2
  in
  let f_inner stmt tbl acc =
    let cmp = Emitter.Usable_emitter.compare in
    let iter =
      if sorted then
        Emitter.Usable_emitter.Hashtbl.fold_sorted ~cmp
      else
        Emitter.Usable_emitter.Hashtbl.fold
    in
    iter
      (fun e l acc ->
         let e = Emitter.Usable_emitter.get e in
         List.fold_left (fun acc x -> f stmt e x acc) acc !l)
      tbl
      acc
  in
  let fold = if sorted then Code_annots.fold_sorted ~cmp else Code_annots.fold
  in
  fold f_inner

let iter_global f =
  Globals.iter
    (fun g h ->
       Usable_emitter.Hashtbl.iter
         (fun e () -> f (Emitter.Usable_emitter.get e) g)
         h)

let fold_global f =
  Globals.fold
    (fun g h acc ->
       Usable_emitter.Hashtbl.fold
         (fun e () -> f (Emitter.Usable_emitter.get e) g)
         h
         acc)

let iter_behaviors f kf =
  List.iter f (behaviors kf)

let iter_spec_gen get iter f kf =
  try
    let tbl = Funspecs.find kf in
    let treat_one_emitter e spec =
      try
        let e = Emitter.Usable_emitter.get e in
        let orig = get spec in
        iter (f e) orig
      with Not_found ->
        ()
    in
    Usable_emitter.Hashtbl.iter treat_one_emitter tbl
  with Not_found ->
    ()

let iter_behaviors_by_emitter f =
  iter_spec_gen
    (fun s -> s.spec_behavior)
    (fun f l -> List.iter (fun b -> f { b with b_name = b.b_name}) l)
    f

let iter_complete f =
  iter_spec_gen (fun s -> s.spec_complete_behaviors) List.iter f

let iter_disjoint f =
  iter_spec_gen (fun s -> s.spec_disjoint_behaviors) List.iter f

let iter_terminates f = iter_spec_gen (fun s -> s.spec_terminates) Option.iter f
let iter_decreases f = iter_spec_gen (fun s -> s.spec_variant) Option.iter f

let iter_bhv_gen get iter f kf b =
  let get spec =
    let bhv = List.find (fun x -> x.b_name = b) spec.spec_behavior in
    get bhv
  in
  iter_spec_gen get iter f kf

(* Filter out generic specification. If nothing is
 * found, call f on generic spec once *)
let iter_filter_generic to_filter iterator f kf b =
  let something = ref false in
  let filter_generic e a =
    if a <> to_filter then begin something := true; f e a end
  in iterator filter_generic kf b;
  if not !something then f Emitter.dummy to_filter

(* Fold version *)
let fold_filter_generic to_filter iterator f kf b init =
  let something = ref false in
  let filter_generic e a acc =
    if a <> to_filter then (something := true; f e a acc) else acc
  in let res = iterator filter_generic kf b init in
  if not !something then f Emitter.dummy to_filter res else res

let iter_requires f = iter_bhv_gen (fun b -> b.b_requires) List.iter f
let iter_assumes f = iter_bhv_gen (fun b -> b.b_assumes) List.iter f
let iter_ensures f = iter_bhv_gen (fun b -> b.b_post_cond) List.iter f

let iter_assigns f =
  iter_filter_generic WritesAny
    (iter_bhv_gen (fun b -> b.b_assigns) (fun f a -> f a)) f

let iter_allocates f =
  iter_filter_generic FreeAllocAny
    (iter_bhv_gen (fun b -> b.b_allocation) (fun f a -> f a)) f

let iter_extended f = iter_bhv_gen (fun b -> b.b_extended) List.iter f

let fold_behaviors f kf acc =
  List.fold_left (Fun.flip f) acc (behaviors kf)

let fold_spec_gen get fold f kf acc =
  try
    let tbl = Funspecs.find kf in
    let treat_one_emitter e spec acc =
      try
        let e = Emitter.Usable_emitter.get e in
        let orig = get spec in
        fold (f e) orig acc
      with Not_found ->
        acc
    in
    Usable_emitter.Hashtbl.fold treat_one_emitter tbl acc
  with Not_found ->
    acc

let fold_behaviors_by_emitter f =
  fold_spec_gen
    (fun s -> s.spec_behavior)
    (fun f l acc ->
       List.fold_left (fun acc b -> f { b with b_name = b.b_name} acc) acc l)
    f

let fold_complete f =
  fold_spec_gen
    (fun s -> s.spec_complete_behaviors)
    (fun f l acc -> List.fold_left (Fun.flip f) acc l)
    f

let fold_disjoint f =
  fold_spec_gen
    (fun s -> s.spec_disjoint_behaviors)
    (fun f l acc -> List.fold_left (Fun.flip f) acc l)
    f

let fold_opt_spec f opt default =
  Option.fold ~some:(fun v -> f v default) ~none:default opt

let fold_terminates f =
  fold_spec_gen (fun s -> s.spec_terminates) fold_opt_spec f

let fold_decreases f =
  fold_spec_gen (fun s -> s.spec_variant) fold_opt_spec f

let fold_bhv_gen get fold f kf b acc =
  let get spec =
    let bhv = List.find (fun x -> x.b_name = b) spec.spec_behavior in
    get bhv
  in
  fold_spec_gen get fold f kf acc

let fold_requires f =
  fold_bhv_gen (fun b -> b.b_requires)
    (fun f l acc -> List.fold_left (Fun.flip f) acc l) f

let fold_assumes f =
  fold_bhv_gen (fun b -> b.b_assumes)
    (fun f l acc -> List.fold_left (Fun.flip f) acc l) f

let fold_ensures f =
  fold_bhv_gen (fun b -> b.b_post_cond)
    (fun f l acc -> List.fold_left (Fun.flip f) acc l) f

let fold_assigns f =
  fold_filter_generic WritesAny
    (fold_bhv_gen (fun b -> b.b_assigns) (fun f a -> f a)) f

let fold_allocates f =
  fold_filter_generic FreeAllocAny
    (fold_bhv_gen (fun b -> b.b_allocation) (fun f a -> f a)) f

let fold_extended f =
  fold_bhv_gen (fun b -> b.b_extended)
    (fun f l acc -> List.fold_left (Fun.flip f) acc l) f

(* remove_code_annot is called when adding a code annotation that must
   stay unique for a given combination of statement, active behaviors and
   emitters. *)
let remove_code_annot_internal e ?(remove_statuses=true) ?kf stmt ca =
  (*  Kernel.feedback "%a: removing code annot %a of stmt %a (%d)"
      Project.pretty (Project.current ())
      Code_annotation.pretty ca
      Stmt.pretty stmt
      stmt.sid;*)
  try
    let tbl = Code_annots.find stmt in
    let e = Emitter.get e in
    try
      let l = Emitter.Usable_emitter.Hashtbl.find tbl e in
      let kf = find_englobing_kf ?kf stmt in
      if remove_statuses then clear_linked_to_annot kf stmt e ca;
      l := filterq ~eq:Code_annotation.equal ca !l;
    with Not_found ->
      (* the emitter is not the one which emits the annotation *)
      ()
  with Not_found ->
    (* annotation not registered *)
    ()


(**************************************************************************)
(** {2 Removing annotations} *)
(**************************************************************************)

(* If this function gets exported, please turn e into an Emitter.t *)
let do_remove_model_field (e:Usable_emitter.t) m =
  try
    let ty = m.mi_base_type in
    let h = Model_fields.find ty in
    let l = Usable_emitter.Hashtbl.find h e in
    let l' =
      List.filter (fun x -> not (Cil_datatype.Model_info.equal x m)) l
    in
    Usable_emitter.Hashtbl.replace h e l';
    Model_fields.apply_hooks_on_remove e ty l'
  with Not_found ->
    ()

let remove_global e a =
  try
    let e = Emitter.get e in
    let h = Globals.find a in
    Usable_emitter.Hashtbl.iter
      (fun e' () ->
         if Emitter.Usable_emitter.equal e e' then begin
           Globals.remove a;
           (match a with
            | Dmodel_annot (m,_) -> do_remove_model_field e m
            | _ -> ());
           let file = Ast.get () in
           file.globals <-
             List.filter
               (fun a' ->
                  not (Global.equal (GAnnot(a, Global_annotation.loc a)) a'))
               file.globals;
           Globals.apply_hooks_on_remove e a ();
           Changed.apply();
         end)
      h;
  with Not_found ->
    ()

(* internal use only *)
let remove_in_funspec e kf set_spec =
  try
    let tbl = Funspecs.find kf in
    let e = Emitter.get e in
    try
      let spec = Emitter.Usable_emitter.Hashtbl.find tbl e in
      (* Format.printf "Known specs for %a@." Kf.pretty kf;*)
      (* Emitter.Usable_emitter.Hashtbl.iter
         (fun e spec ->
          Format.printf "For emitter %a: %a@."
            Emitter.Usable_emitter.pretty e
            Cil_printer.pp_funspec spec) tbl; *)
      set_spec spec tbl;
      Changed.apply()
    with Not_found -> ()
  with Not_found ->
    assert false

let remove_behavior ?(force=false) e kf bhv =
  let set_spec spec tbl =
    (* Kernel.feedback "Current spec is %a@." Cil_printer.pp_funspec spec; *)
    (* do not use physical equality since the behaviors are almost always copied
       at some points *)
    spec.spec_behavior <- filterq ~eq:is_same_behavior bhv spec.spec_behavior;
    let name = bhv.b_name in
    let check get =
      if not force &&
         exists_in_funspec
           (fun s -> List.exists (List.exists ((=) name)) (get s))
           tbl
      then
        Kernel.fatal
          "trying to remove a behavior used in a complete or disjoint clause"
    in
    check (fun s -> s.spec_complete_behaviors);
    check (fun s -> s.spec_disjoint_behaviors);
    (* Kernel.feedback "Removing behavior %s@." bhv.b_name; *)
    (* Kernel.feedback "New spec is %a@." Cil_printer.pp_funspec spec; *)
    List.iter Property_status.remove
      (Property.ip_all_of_behavior kf Kglobal ~active:[] bhv)
  in
  remove_in_funspec e kf set_spec

(* internal use only *)
let do_remove_decreases e kf =
  let set_spec spec _tbl =
    match spec.spec_variant with
    | None -> ()
    | Some d ->
      Property_status.remove (Property.ip_of_decreases kf Kglobal d);
      spec.spec_variant <- None
  in
  remove_in_funspec e kf set_spec

let remove_decreases e kf =
  do_remove_decreases e kf;
  Changed.apply()

(* internal use only *)
let do_remove_terminates e kf =
  let set_spec spec _tbl =
    match spec.spec_terminates with
    | None -> ()
    | Some t ->
      Property_status.remove (Property.ip_of_terminates kf Kglobal t);
      spec.spec_terminates <- None
  in
  remove_in_funspec e kf set_spec

let remove_terminates e kf =
  do_remove_terminates e kf;
  Changed.apply()

(* internal use only *)
let do_remove_complete e kf l =
  let set_spec spec _tbl =
    spec.spec_complete_behaviors <- filterq l spec.spec_complete_behaviors
  in
  remove_in_funspec e kf set_spec;
  Property_status.remove (Property.ip_of_complete kf Kglobal ~active:[] l)

let remove_complete e kf l =
  do_remove_complete e kf l;
  Changed.apply()

(* internal use only *)
let do_remove_disjoint e kf l =
  let set_spec spec _tbl =
    spec.spec_disjoint_behaviors <- filterq l spec.spec_disjoint_behaviors
  in
  remove_in_funspec e kf set_spec;
  Property_status.remove (Property.ip_of_disjoint kf Kglobal ~active:[] l)

let remove_disjoint e kf l =
  do_remove_disjoint e kf l;
  Changed.apply()

(* internal use only *)
let do_remove_requires e kf p =
  let set_spec spec _tbl =
    List.iter
      (fun b ->
         if List.memq p b.b_requires then begin
           b.b_requires <- filterq p b.b_requires;
           Property_status.remove (Property.ip_of_requires kf Kglobal b p)
         end)
      spec.spec_behavior
  in
  remove_in_funspec e kf set_spec

let remove_requires e kf p =
  do_remove_requires e kf p;
  Changed.apply()

(* internal use only *)
let do_remove_assumes e kf p =
  let set_spec spec _tbl =
    List.iter
      (fun b ->
         if List.memq p b.b_assumes then begin
           b.b_assumes <- filterq p b.b_assumes;
           Property_status.remove (Property.ip_of_assumes kf Kglobal b p)
         end)
      spec.spec_behavior
  in
  remove_in_funspec e kf set_spec

let remove_assumes e kf p =
  do_remove_assumes e kf p;
  Changed.apply()

(* internal use only *)
let do_remove_ensures e kf p =
  let set_spec spec _tbl =
    List.iter
      (fun b ->
         if List.memq p b.b_post_cond then begin
           b.b_post_cond <- filterq p b.b_post_cond;
           Property_status.remove (Property.ip_of_ensures kf Kglobal b p)
         end)
      spec.spec_behavior
  in
  remove_in_funspec e kf set_spec

let remove_ensures e kf p =
  do_remove_ensures e kf p;
  Changed.apply()

(* internal use only *)
let do_remove_allocates e kf p =
  let set_spec spec _tbl =
    List.iter
      (fun b ->
         if b.b_allocation == p then begin
           b.b_allocation <- FreeAllocAny;
           let info = Id_contract (Datatype.String.Set.empty,b) in
           Option.iter Property_status.remove
             (Property.ip_of_allocation kf Kglobal info p)
         end)
      spec.spec_behavior
  in
  remove_in_funspec e kf set_spec

let remove_allocates e kf p =
  do_remove_allocates e kf p;
  Changed.apply()

(* internal use only *)
let do_remove_extended e kf ext =
  let set_spec spec _tbl =
    List.iter
      (fun b ->
         b.b_extended <- List.filter ((!=) ext) b.b_extended;
         Property_status.remove
           (Property.(ip_of_extended (ELContract kf) ext)))
      spec.spec_behavior
  in
  remove_in_funspec e kf set_spec

let remove_extended e kf ext =
  do_remove_extended e kf ext;
  Changed.apply()

(* internal use only *)
let do_remove_assigns e kf p =
  let set_spec spec _tbl =
    List.iter
      (fun b ->
         if b.b_assigns == p then begin
           b.b_assigns <- WritesAny;
           let info = Id_contract(Datatype.String.Set.empty, b) in
           Option.iter Property_status.remove
             (Property.ip_of_assigns kf Kglobal info p);
           (match p with
            | WritesAny -> ()
            | Writes l ->
              List.iter
                (fun f ->
                   Option.iter
                     Property_status.remove
                     (Property.ip_of_from kf Kglobal info f)) l)
         end)
      spec.spec_behavior
  in
  remove_in_funspec e kf set_spec

let remove_assigns e kf p =
  do_remove_assigns e kf p;
  Changed.apply()

let remove_behavior_components e kf b =
  List.iter (do_remove_requires e kf) b.b_requires;
  List.iter (do_remove_assumes e kf) b.b_assumes;
  List.iter (do_remove_ensures e kf) b.b_post_cond;
  do_remove_assigns e kf b.b_assigns;
  do_remove_allocates e kf b.b_allocation;
  Changed.apply()

(**************************************************************************)
(** {2 Adding annotations} *)
(**************************************************************************)

let extend_name e pred =
  if Emitter.equal e Emitter.end_user || Emitter.equal e Emitter.kernel
  then pred
  else
    let names = pred.tp_statement.pred_name in
    let s = Emitter.get_name e in
    if (List.mem s names) ||
       let acsl_identifier_regexp =
         Str.regexp "^\\([\\][_a-zA-Z]\\|[_a-zA-Z]\\)[0-9_a-zA-Z]*$"
       in not (Str.string_match acsl_identifier_regexp s 0)
    then pred
    else
      { pred with
        tp_statement = { pred.tp_statement with pred_name = s :: names }}

(** {3 Adding subparts of a function contract} *)

type 'a contract_component_addition =
  Emitter.t ->
  kernel_function -> ?stmt:stmt -> ?active:string list -> 'a -> unit

type 'a behavior_component_addition =
  Emitter.t ->
  kernel_function -> ?stmt:stmt -> ?active:string list ->
  ?behavior:string -> 'a -> unit

let filter_stmt_spec active ca =
  match ca.annot_content with
  | AStmtSpec(bhvs,_) -> is_same_behavior_set active bhvs
  | _ -> false

let get_spec_e e kf ?stmt ?(active=[]) () =
  let e = Emitter.get e in
  match stmt with
  | None ->
    (try
       let tbl = Funspecs.find kf in
       (try
          Emitter.Usable_emitter.Hashtbl.find tbl e
        with Not_found ->
          let spec = Cil.empty_funspec () in
          Emitter.Usable_emitter.Hashtbl.add tbl e spec;
          spec)
     with Not_found ->
       let tbl = Emitter.Usable_emitter.Hashtbl.create 7 in
       let spec = Cil.empty_funspec () in
       Funspecs.add kf tbl;
       Emitter.Usable_emitter.Hashtbl.add tbl e spec;
       spec)
  | Some stmt ->
    let create_new () =
      let spec = Cil.empty_funspec() in
      let annot = Logic_const.new_code_annotation(AStmtSpec(active,spec)) in
      (annot,spec)
    in
    let new_emitter_annot tbl =
      let annot, spec = create_new () in
      Emitter.Usable_emitter.Hashtbl.add tbl e (ref [annot]);
      spec
    in
    (try
       let tbl = Code_annots.find stmt in
       (try
          let annots = Emitter.Usable_emitter.Hashtbl.find tbl e in
          (try
             let filter = filter_stmt_spec active in
             match (List.find filter !annots).annot_content with
             | AStmtSpec(_,s) -> s
             | _ -> assert false (* filter prevents anything else *)
           with Not_found -> (* no existing contract with the same set
                                of active behavior as requirement. *)
             let annot, spec = create_new () in
             annots := annot :: !annots;
             spec)
        with Not_found -> (*no annotation with this emitter for the stmt *)
          new_emitter_annot tbl)
     with Not_found -> (* no annotation for this statement. *)
       let tbl = Emitter.Usable_emitter.Hashtbl.create 7 in
       Code_annots.add stmt tbl;
       new_emitter_annot tbl)

let get_spec_all kf ?stmt ?(active=[]) () =
  match stmt with
  | None -> funspec kf
  | Some stmt ->
    let filter = filter_stmt_spec active in
    let spec = Cil.empty_funspec () in
    (match code_annot ~filter stmt with
     | [ { annot_content = AStmtSpec(_,spec') } ] ->
       merge_funspec spec spec'
     | _ -> ());
    spec

let kinstr stmt =
  match stmt with
  | None -> Kglobal
  | Some s -> Kstmt s


let mk_spec bhv variant terminates complete disjoint =
  { spec_behavior = bhv;
    spec_variant = variant;
    spec_terminates = terminates;
    spec_complete_behaviors = complete;
    spec_disjoint_behaviors = disjoint; }

(* internal use only *)
let do_add_behaviors ?(register_children=true) e kf ?stmt ?active bhvs =
  let full_spec = get_spec_all kf ?stmt ?active () in
  let emit_spec = get_spec_e e kf ?stmt ?active () in
  let existing_behaviors = emit_spec.spec_behavior in
  if register_children then
    merge_behaviors emit_spec (mk_spec bhvs None None [] [])
  else
    List.iter
      (fun b ->
         if not (List.exists (is_same_behavior b) existing_behaviors)
         then
           merge_behaviors emit_spec (mk_spec [b] None None [] []))
      bhvs;
  (* update ip in property_status: the kernel relies on the behavior stored
     in the ip to determine the validity. If we change something in our
     own tables, this must be reflected there. *)
  let ki = kinstr stmt in
  let active = match active with | None -> [] | Some l -> l in
  List.iter
    (fun bhv ->
       if List.exists (is_same_behavior bhv) bhvs then begin
         let b' = Cil.mk_behavior ~name:bhv.b_name () in
         merge_behavior b' bhv;
         merge_behavior b' (List.find (is_same_behavior bhv) bhvs);
         let ip = Property.ip_of_behavior kf ki ~active bhv in
         Property_status.remove ip;
         (* mergeable clauses, i.e. assigns, from, and allocates may have changed.
            Thus, if register_children is true, we need to update
            the property status table.
             For the other clauses (requires, assumes, ensures) we just need to
             add the additional ip, nothing will be removed.
         *)
         if register_children then begin
           let ip = Property.ip_from_of_behavior kf ki ~active bhv in
           List.iter Property_status.remove ip;
           let ip = Property.ip_assigns_of_behavior kf ki ~active bhv in
           Option.iter Property_status.remove ip;
           let ip = Property.ip_allocation_of_behavior kf ki ~active bhv in
           Option.iter Property_status.remove ip;
           let ip = Property.ip_from_of_behavior kf ki ~active b' in
           List.iter Property_status.register ip;
           let ip = Property.ip_assigns_of_behavior kf ki ~active b' in
           Option.iter Property_status.register ip;
           let ip = Property.ip_allocation_of_behavior kf ki ~active b' in
           Option.iter Property_status.register ip;
         end;
         let ip = Property.ip_of_behavior kf ki ~active b' in
         Property_status.register ip;
       end)
    full_spec.spec_behavior;
  if register_children then begin
    List.iter
      (fun bhv ->
         List.iter
           (* For existing behaviors, behavior, assigns, allocation and from
              have been dealt with. For brand new behaviors, just
              register everything. *)
           (fun ip ->
              match ip with
              | IPBehavior _ | IPAssigns _ | IPAllocation _ | IPFrom _
                when List.exists (is_same_behavior bhv) full_spec.spec_behavior
                -> ()
              | _ -> Property_status.register ip)
           (Property.ip_all_of_behavior kf ki ~active bhv))
      bhvs
  end

let add_behaviors ?register_children e kf ?stmt ?active bhvs =
  do_add_behaviors ?register_children e kf ?stmt ?active bhvs;
  Changed.apply()

exception AlreadySpecified of string list

(* internal use only *)
let do_add_decreases ?(force=false) e kf v =
  if force then do_remove_decreases e kf ;
  let full_spec = get_spec_all kf () in
  let emit_spec = get_spec_e e kf () in
  (match full_spec.spec_variant with
   | Some old when not @@ Logic_utils.is_same_variant old v ->
     raise (AlreadySpecified ["decreases"])
   | _ -> emit_spec.spec_variant <- Some v);
  Property_status.register (Property.ip_of_decreases kf Kglobal v)

(* internal use only *)
let add_decreases ?force e kf v =
  do_add_decreases ?force e kf v;
  Changed.apply()

(* internal use only *)
let do_add_terminates ?(force=false) e kf ?stmt ?active t =
  if force then do_remove_terminates e kf ;
  let full_spec = get_spec_all kf ?stmt ?active () in
  let emit_spec = get_spec_e e kf ?stmt ?active () in
  (match full_spec.spec_terminates with
   | Some old when not @@ Logic_utils.is_same_identified_predicate old t ->
     raise (AlreadySpecified ["terminates"])
   | _ -> emit_spec.spec_terminates <- Some t);
  Property_status.register (Property.ip_of_terminates kf (kinstr stmt) t)

let add_terminates ?force e kf ?stmt ?active t =
  do_add_terminates ?force e kf ?stmt ?active t;
  Changed.apply()

let check_bhv_name spec name =
  if name = Cil.default_behavior_name then begin
    Kernel.fatal
      "Trying to add default behavior in a complete or disjoint clause"
  end
  else if List.for_all (fun x -> x.b_name <> name) spec.spec_behavior
  then begin
    Kernel.fatal
      "Trying to add a non-existing behavior %s \
       in a complete or disjoint clause"
      name
  end

(* internal use only *)
let do_add_complete e kf ?stmt ?active l =
  let full_spec = get_spec_all kf ?stmt ?active () in
  let emit_spec = get_spec_e e kf ?stmt ?active () in
  if List.mem l full_spec.spec_complete_behaviors then
    Kernel.warning
      "complete clause %a is already registered for %a. Ignoring the new one"
      (Pretty_utils.pp_list ~sep:",@ " Format.pp_print_string) l
      pretty_spec_location (kf,stmt)
  else begin
    List.iter (check_bhv_name full_spec) l;
    emit_spec.spec_complete_behaviors <- l :: emit_spec.spec_complete_behaviors;
    let active = match active with None -> [] | Some l -> l in
    Property_status.register
      (Property.ip_of_complete kf (kinstr stmt) ~active l)
  end

let add_complete e kf ?stmt ?active l =
  do_add_complete e kf ?stmt ?active l;
  Changed.apply()

(* internal use only *)
let do_add_disjoint e kf ?stmt ?active l =
  let full_spec = get_spec_all kf ?stmt ?active () in
  let emit_spec = get_spec_e e kf ?stmt ?active () in
  if List.mem l full_spec.spec_disjoint_behaviors then
    Kernel.warning
      "disjoint clause %a is already registered for %a. Ignoring the new one"
      (Pretty_utils.pp_list ~sep:",@ " Format.pp_print_string) l
      pretty_spec_location (kf,stmt)
  else begin
    List.iter (check_bhv_name full_spec) l;
    emit_spec.spec_disjoint_behaviors <- l :: emit_spec.spec_disjoint_behaviors;
    let active = match active with None -> [] | Some l -> l in
    Property_status.register (Property.ip_of_disjoint kf (kinstr stmt) ~active l)
  end

let add_disjoint e kf ?stmt ?active l =
  do_add_disjoint e kf ?stmt ?active l;
  Changed.apply()

let add_spec ?register_children ?(force=false) e kf ?stmt ?active spec =
  let full_spec = get_spec_all kf ?stmt ?active () in
  let conflicts =
    (match full_spec.spec_terminates, spec.spec_terminates with
     | Some old_t, Some new_t
       when not @@ Logic_utils.is_same_identified_predicate old_t new_t ->
       ["terminates"]
     | _ -> []) @
    (match full_spec.spec_variant, spec.spec_variant with
     | Some old_t, Some new_t
       when not @@ Logic_utils.is_same_variant old_t new_t ->
       ["decreases"]
     | _ -> [])
  in
  if not force && conflicts <> [] then raise (AlreadySpecified conflicts) ;
  do_add_behaviors ?register_children e kf ?stmt ?active spec.spec_behavior;
  Option.iter
    (fun variant -> do_add_decreases ~force e kf variant)
    spec.spec_variant;
  Option.iter
    (fun terminates -> do_add_terminates ~force e kf ?stmt ?active terminates)
    spec.spec_terminates;
  List.iter
    (fun complete -> do_add_complete e kf ?stmt ?active complete)
    spec.spec_complete_behaviors;
  List.iter
    (fun disjoint -> do_add_disjoint e kf ?stmt ?active disjoint)
    spec.spec_disjoint_behaviors;
  Changed.apply()

(* internal use only *)
let extend_behavior
    e kf ?stmt ?active ?(behavior=Cil.default_behavior_name) set_bhv =
  (* Kernel.feedback "Function %a, behavior %s" Kf.pretty kf bhv_name;*)
  let has_same_name b = b.b_name = behavior in
  let full_spec = get_spec_all kf ?stmt ?active () in
  let emit_spec = get_spec_e e kf ?stmt ?active () in
  if not (List.exists has_same_name full_spec.spec_behavior) then begin
    let bhv = Cil.mk_behavior ~name:behavior () in
    full_spec.spec_behavior <- bhv :: full_spec.spec_behavior
  end;
  if not (List.exists has_same_name emit_spec.spec_behavior) then begin
    let bhv = Cil.mk_behavior ~name:behavior () in
    emit_spec.spec_behavior <- bhv :: emit_spec.spec_behavior
  end;
  let b = List.find has_same_name full_spec.spec_behavior in
  let b' = List.find has_same_name emit_spec.spec_behavior in
  let active = match active with None -> [] | Some l -> l in
  let ip = Property.ip_of_behavior kf (kinstr stmt) ~active b in
  Property_status.remove ip;
  set_bhv b b';
  let ip = Property.ip_of_behavior kf (kinstr stmt) ~active b in
  Property_status.register ip;
  Changed.apply()

let add_requires e kf ?stmt ?active ?behavior l =
  let set_bhv _ bhv =
    bhv.b_requires <- l @ bhv.b_requires;
    List.iter
      (fun p ->
         Property_status.register
           (Property.ip_of_requires kf (kinstr stmt) bhv p))
      l
  in
  extend_behavior e kf ?stmt ?active ?behavior set_bhv

let add_assumes e kf ?stmt ?active ?behavior l =
  let is_default =
    match behavior with
    | None -> true
    | Some s -> s = Cil.default_behavior_name
  in
  if is_default then begin
    match l with
    | [] -> () (* adding an empty list is a no-op. *)
    | [_] ->
      Kernel.warning "Trying to add an assumes clause to default behavior"
    | _ ->
      Kernel.warning "Trying to add assumes clauses to default behavior"
  end else begin
    let set_bhv _ bhv =
      bhv.b_assumes <- l @ bhv.b_assumes;
      List.iter
        (fun p ->
           Property_status.register
             (Property.ip_of_assumes kf (kinstr stmt) bhv p))
        l
    in
    extend_behavior e kf ?stmt ?active ?behavior set_bhv
  end

let add_ensures e kf ?stmt ?active ?behavior l =
  let set_bhv _ bhv =
    bhv.b_post_cond <- l @ bhv.b_post_cond;
    List.iter
      (fun a ->
         Property_status.register
           (Property.ip_of_ensures kf (kinstr stmt) bhv a))
      l
  in
  extend_behavior e kf ?stmt ?active ?behavior set_bhv

let get_full_spec kf ?stmt ?(behavior=[]) () =
  match stmt with
  | None ->
    (try funspec kf with Not_found -> Cil.empty_funspec())
  | Some stmt ->
    let filter a =
      match a.annot_content with
      | AStmtSpec(bhvs,_) when is_same_behavior_set bhvs behavior -> true
      | _ -> false
    in
    (match code_annot ~filter stmt with
     | [] -> Cil.empty_funspec ()
     | [ { annot_content = AStmtSpec(_,s)} ] -> s
     | _ -> Kernel.fatal "More than one contract associated to a statement")

let get_spec_behavior s = function
  | None -> Cil.find_default_behavior s
  | Some name -> List.find_opt (fun { b_name } -> b_name = name) s.spec_behavior

let add_assigns ~keep_empty e kf ?stmt ?active ?behavior a =
  let set_bhv full_bhv e_bhv =
    let keep_empty = keep_empty && full_bhv.b_assigns = WritesAny in
    let ki = kinstr stmt in
    e_bhv.b_assigns <- merge_assigns ~keep_empty e_bhv.b_assigns a;
    (match a with
     | WritesAny -> ()
     | Writes _ ->
       let active = match active with None -> [] | Some l -> l in
       (* All assigns of a same behavior share the property.
          Thus must remove the previous property before adding the new one *)
       List.iter Property_status.remove
         (Property.ip_from_of_behavior kf ki ~active full_bhv);
       Option.iter Property_status.remove
         (Property.ip_assigns_of_behavior kf ki ~active full_bhv);
       full_bhv.b_assigns <- merge_assigns ~keep_empty full_bhv.b_assigns a;
       Option.iter Property_status.register
         (Property.ip_assigns_of_behavior kf ki ~active full_bhv);
       List.iter Property_status.register
         (Property.ip_from_of_behavior kf ki ~active full_bhv);
    )
  in
  let old_spec = get_full_spec kf ?stmt ?behavior:active () in
  let bhv = get_spec_behavior old_spec behavior in
  let is_empty =
    match bhv with
    | None -> true
    | Some b -> b.b_assigns = WritesAny
  in
  if not (keep_empty && is_empty) then
    extend_behavior e kf ?stmt ?active ?behavior set_bhv

let add_allocates ~keep_empty e kf ?stmt ?active ?behavior a =
  let ki = kinstr stmt in
  let set_bhv full_bhv e_bhv =
    let keep_empty = keep_empty && full_bhv.b_allocation = FreeAllocAny in
    e_bhv.b_allocation <-
      merge_allocation ~keep_empty e_bhv.b_allocation a;
    let active = match active with None -> [] | Some l -> l in
    Option.iter Property_status.remove
      (Property.ip_allocation_of_behavior kf ki ~active full_bhv);
    full_bhv.b_allocation <-
      merge_allocation ~keep_empty full_bhv.b_allocation a;
    Option.iter Property_status.register
      (Property.ip_allocation_of_behavior kf ki ~active full_bhv);
  in
  let old_spec = get_full_spec kf ?stmt ?behavior:active () in
  let bhv = get_spec_behavior old_spec behavior in
  let is_empty =
    match bhv with
    | None -> true
    | Some b -> b.b_allocation = FreeAllocAny
  in
  if not (keep_empty && is_empty) then
    extend_behavior e kf ?stmt ?active ?behavior set_bhv

let add_extended e kf ?stmt ?active ?behavior ext =
  let set_bhv _ e_bhv =
    e_bhv.b_extended <- ext :: e_bhv.b_extended;
    Property_status.register
      (Property.(ip_of_extended (e_loc_of_stmt kf (kinstr stmt)) ext))
  in
  extend_behavior e kf ?stmt ?active ?behavior set_bhv

(** {3 Adding code annotations} *)

(* internal use only *)
let do_add_code_annot ~keep_empty emitter ?kf stmt ca =
  (*  Kernel.feedback "%a: adding code annot %a with stmt %a (%d)"
      Project.pretty (Project.current ())
      Code_annotation.pretty ca
      Stmt.pretty stmt
      stmt.sid;*)
  let kf = find_englobing_kf ?kf stmt in
  let fill_tables ca ppts =
    let e = Emitter.get emitter in
    List.iter Property_status.register ppts;
    let add_emitter tbl =
      Emitter.Usable_emitter.Hashtbl.add tbl e (ref [ ca ]) in
    try
      let tbl = Code_annots.find stmt in
      try
        let l = Emitter.Usable_emitter.Hashtbl.find tbl e in
        l := ca :: !l;
      with Not_found ->
        add_emitter tbl
    with Not_found ->
      let tbl = Emitter.Usable_emitter.Hashtbl.create 7 in
      add_emitter tbl;
      Code_annots.add stmt tbl
  in
  match ca.annot_content with
  | AAssert(l, p) ->
    let a = { ca with annot_content=AAssert(l,extend_name emitter p) } in
    fill_tables a (Property.ip_of_code_annot kf stmt a)
  | AInvariant(l, b, p) ->
    let a={ca with annot_content=AInvariant(l,b,extend_name emitter p)} in
    fill_tables a (Property.ip_of_code_annot kf stmt a)
  | AStmtSpec (bhvs, spec) ->
    let filter ca =
      match ca.annot_content with
      | AStmtSpec(bhvs',_) -> is_same_behavior_set bhvs bhvs'
      | _ -> false
    in
    let contract = code_annot ~filter stmt in
    (match contract with
     | [] ->
       if not (keep_empty && Logic_utils.funspec_has_only_assigns spec) then
         fill_tables ca (Property.ip_of_code_annot kf stmt ca)
     | [ { annot_content = AStmtSpec _ } ] ->
       let register_children = true in
       let active = bhvs in
       do_add_behaviors
         ~register_children emitter kf ~stmt ~active spec.spec_behavior;
       if spec.spec_variant <> None then
         Kernel.fatal
           "statement contract cannot have a decrease clause";
       Option.iter
         (do_add_terminates emitter kf ~stmt ~active) spec.spec_terminates;
       List.iter
         (do_add_complete emitter kf ~stmt ~active)
         spec.spec_complete_behaviors;
       List.iter
         (do_add_disjoint emitter kf ~stmt ~active)
         spec.spec_disjoint_behaviors;
       (* By construction, we have exactly one contract
          corresponding to our criterion and emitter. *)
       let ca' = List.hd (code_annot ~emitter ~filter stmt) in
       (* remove the previous binding in order to replace it
          with the updated one. Statuses being attached to sub-elements
          of the contract, they do not need any update here.
       *)
       remove_code_annot_internal emitter ~remove_statuses:false ~kf stmt ca';
       fill_tables ca' []
     | _ ->
       Kernel.fatal
         "more than one contract attached to a given statement for \
          emitter %a. Invariant of annotations management broken."
         Emitter.pretty emitter)
  | AVariant _ ->
    let v = code_annot ~filter:Logic_utils.is_variant stmt in
    (match v with
     | [] -> fill_tables ca (Property.ip_of_code_annot kf stmt ca)
     | _ ->
       let source = fst (Cil_datatype.Stmt.loc stmt) in
       Kernel.fatal ~source
         "trying to register a second variant for statement %a"
         Stmt.pretty stmt)
  | AAssigns (bhvs, assigns) ->
    let filter_ca ca =
      match ca.annot_content with
      | AAssigns (bhvs', _) -> is_same_behavior_set bhvs bhvs'
      | _ -> false
    in
    let filter e ca = Emitter.equal e emitter && filter_ca ca in
    let ca_e = code_annot_emitter ~filter stmt in
    let ca_total = code_annot ~filter:filter_ca stmt in
    (match ca_total with
     | [] when keep_empty -> ()
     | [] -> fill_tables ca (Property.ip_of_code_annot kf stmt ca)
     | [{ annot_content = AAssigns(_,assigns_total)}] ->
       let assigns_e =
         match ca_e with
         | [] -> WritesAny
         | [ { annot_content = AAssigns(_, assigns') } as ca,_ ] ->
           remove_code_annot_internal emitter ~kf stmt ca;
           assigns'
         | _ ->
           Kernel.fatal
             "More than one loop assigns clause for a statement. \
              Annotations internal state broken."
       in
       (* we have assigns at statement level, just not from this
          emitter yet, hence merge at emitter level regardless of keep_empty *)
       let merged_e = merge_assigns ~keep_empty:false assigns_e assigns in
       let new_a = { ca with annot_content = AAssigns(bhvs,merged_e) } in
       let merged_total = merge_assigns ~keep_empty assigns_total assigns in
       let ips =
         Property.ip_of_code_annot kf stmt
           { ca with annot_content = AAssigns(bhvs,merged_total) }
       in
       fill_tables new_a ips
     | _ ->
       Kernel.fatal
         "More than one loop assigns clause for a statement. \
          Annotations internal state broken.")
  | AAllocation (bhvs, alloc) ->
    let filter_ca ca =
      match ca.annot_content with
      | AAllocation(bhvs',_) -> is_same_behavior_set bhvs bhvs'
      | _ -> false
    in
    let filter e ca = Emitter.equal e emitter && filter_ca ca in
    let ca_e = code_annot_emitter ~filter stmt in
    let ca_total = code_annot ~filter:filter_ca stmt in
    (match ca_total with
     | [] when keep_empty -> ()
     | [] -> fill_tables ca (Property.ip_of_code_annot kf stmt ca)
     | [{ annot_content = AAllocation(_,alloc_total)}] ->
       let alloc_e =
         match ca_e with
         | [] -> FreeAllocAny
         | [ { annot_content = AAllocation(_, alloc') } as ca,_ ] ->
           remove_code_annot_internal emitter ~kf stmt ca;
           alloc'
         | _ ->
           Kernel.fatal
             "More than one loop assigns clause for a statement. \
              Annotations internal state broken."
       in
       (* we have assigns at statement level, just not from this
          emitter yet, hence merge at emitter level regardless of keep_empty *)
       let merged_e = merge_allocation ~keep_empty:false alloc_e alloc in
       let new_a = { ca with annot_content = AAllocation(bhvs,merged_e) } in
       let merged_total = merge_allocation ~keep_empty alloc_total alloc in
       let ips =
         Property.ip_of_code_annot kf stmt
           { ca with annot_content = AAllocation(bhvs,merged_total) }
       in
       fill_tables new_a ips
     | _ ->
       Kernel.fatal
         "More than one loop assigns clause for a statement. \
          Annotations internal state broken.")
  | AExtended _ ->
    fill_tables ca (Property.ip_of_code_annot kf stmt ca)

let add_code_annot ?(keep_empty=true) emitter ?kf stmt ca =
  do_add_code_annot ~keep_empty emitter ?kf stmt ca;
  Changed.apply()

let add_assert e ?kf stmt a =
  let a = Logic_const.toplevel_predicate ~kind:Assert a in
  let a = Logic_const.new_code_annotation (AAssert ([],a)) in
  add_code_annot e ?kf stmt a

let add_check e ?kf stmt a =
  let a = Logic_const.toplevel_predicate ~kind:Check a in
  let a = Logic_const.new_code_annotation (AAssert ([],a)) in
  add_code_annot e ?kf stmt a

let add_admit e ?kf stmt a =
  let a = Logic_const.toplevel_predicate ~kind:Admit a in
  let a = Logic_const.new_code_annotation (AAssert ([],a)) in
  add_code_annot e ?kf stmt a

(** {3 Adding globals} *)

let dependencies_of_global annot =
  let c_vars = ref Cil_datatype.Varinfo.Set.empty in
  let logic_vars  = ref Cil_datatype.Logic_info.Set.empty in
  let local_logics = ref Cil_datatype.Logic_info.Set.empty in
  let vis = object
    (* do not use Visitor here, we're above it in link order.
       Anyway, there's nothing Frama-C-specific in the visitor. *)
    inherit Cil.nopCilVisitor
    method! vvrbl vi =
      if vi.vglob then c_vars := Cil_datatype.Varinfo.Set.add vi !c_vars;
      Cil.DoChildren
    method! vlogic_info_use li =
      if not (Cil_datatype.Logic_info.Set.mem li !local_logics) then
        logic_vars := Cil_datatype.Logic_info.Set.add li !logic_vars;
      Cil.DoChildren
    method! vlogic_info_decl li =
      local_logics := Cil_datatype.Logic_info.Set.add li !local_logics;
      Cil.DoChildren
  end
  in
  ignore (Cil.visitCilAnnotation vis annot);
  (!c_vars, !logic_vars)

let rec remove_declared_global_annot logic_vars = function
  | Dfun_or_pred(li,_) | Dinvariant(li,_) | Dtype_annot(li,_) ->
    Cil_datatype.Logic_info.Set.remove li logic_vars
  | Dvolatile _ | Dtype _ | Dlemma _ | Dmodel_annot _
  | Dextended _ ->
    logic_vars
  | Daxiomatic (_,l,_,_) | Dmodule (_,l,_,_,_) ->
    List.fold_left remove_declared_global_annot logic_vars l

let remove_declared_global c_vars logic_vars = function
  | GType _ | GCompTag _ | GCompTagDecl _ | GEnumTag _ | GEnumTagDecl _
  | GAsm _ | GPragma _ | GText _ ->
    c_vars, logic_vars
  | GVarDecl (vi,_) | GVar(vi,_,_)
  | GFun ({ svar = vi; },_) | GFunDecl(_, vi, _) ->
    Cil_datatype.Varinfo.Set.remove vi c_vars, logic_vars
  | GAnnot (g,_) -> c_vars, remove_declared_global_annot logic_vars g

let insert_global_in_ast annot =
  let glob = GAnnot(annot, Cil_datatype.Global_annotation.loc annot) in
  let file = Ast.get () in
  (* We always put global annotations after types, so there's no need to
     trace their dependencies. *)
  let deps = dependencies_of_global annot in
  let rec insert_after (c_vars, logic_vars as deps) acc l =
    match l with
    | [] ->
      (* Some dependencies might be missing, but we suppose that
         caller knows what s/he's doing. *)
      List.rev (glob :: acc)
    | (GType _ | GCompTag _ | GCompTagDecl _
      | GEnumTag _ | GEnumTagDecl _ as g) :: l ->
      insert_after deps (g :: acc) l
    | g :: l ->
      if Cil_datatype.Varinfo.Set.is_empty c_vars &&
         Cil_datatype.Logic_info.Set.is_empty logic_vars
      then List.rev acc @ glob :: g :: l
      else begin
        let deps = remove_declared_global c_vars logic_vars g in
        insert_after deps (g :: acc) l
      end
  in
  let globs = insert_after deps [] file.globals in
  file.globals <- globs

let add_model_field e m =
  let e = Emitter.get e in
  let h =
    try Model_fields.find m.mi_base_type
    with Not_found ->
      let res = Emitter.Usable_emitter.Hashtbl.create 13 in
      Model_fields.add m.mi_base_type res; res
  in
  let l =
    try Emitter.Usable_emitter.Hashtbl.find h e
    with Not_found -> []
  in
  Emitter.Usable_emitter.Hashtbl.replace h e (m::l);
  Changed.apply()

let unsafe_add_global e a =
  (*  Kernel.feedback "adding global %a in project %a"
      Cil_printer.pp_annotation a Project.pretty (Project.current ());*)
  let h = Usable_emitter.Hashtbl.create 17 in
  Usable_emitter.Hashtbl.add h (Emitter.get e) ();
  Globals.add a h;
  (match a with
   | Dmodel_annot (m,_) -> add_model_field e m
   | _ -> ());
  List.iter Property_status.register (Property.ip_of_global_annotation a)

let add_global e a =
  unsafe_add_global e a;
  if Ast.is_computed() then insert_global_in_ast a;
  Changed.apply()

(**************************************************************************)
(** {2 Other useful functions} *)
(**************************************************************************)

let has_code_annot ?emitter stmt =
  match emitter with
  | None -> Code_annots.mem stmt
  | Some e ->
    try
      let tbl = Code_annots.find stmt in
      Emitter.Usable_emitter.Hashtbl.mem tbl (Emitter.get e)
    with Not_found ->
      false

exception Found of Emitter.t

let emitter_of_code_annot ca stmt =
  let tbl = Code_annots.find stmt in
  try
    Emitter.Usable_emitter.Hashtbl.iter
      (fun e lca ->
         let aux ca' =
           if Cil_datatype.Code_annotation.equal ca ca' then
             raise (Found (Emitter.Usable_emitter.get e))
         in
         List.iter aux !lca;
      ) tbl;
    raise Not_found
  with Found e -> e

let emitter_of_global a =
  let h = Globals.find a in
  try
    Emitter.Usable_emitter.Hashtbl.iter
      (fun e () -> raise (Found (Emitter.Usable_emitter.get e)))
      h;
    assert false
  with Found e -> e

let logic_info_of_global s =
  let check_logic_info li acc =
    if li.l_var_info.lv_name = s then li::acc else acc
  in
  let rec check_one acc = function
    | Dfun_or_pred(li,_) | Dinvariant(li,_) | Dtype_annot(li,_) ->
      check_logic_info li acc
    | Daxiomatic (_,l, _, _) | Dmodule (_,l, _, _, _) ->
      List.fold_left check_one acc l
    | Dtype _ | Dvolatile _ | Dlemma _ | Dmodel_annot _
    | Dextended _
      -> acc
  in
  fold_global (fun _ g acc -> check_one acc g) []

let behavior_names_of_stmt_in_kf kf = match kf.fundec with
  | Definition(def, _) ->
    List.fold_left
      (fun known_names stmt ->
         List.fold_left
           (fun known_names (_bhv,spec) ->
              (List.map (fun x -> x.b_name) spec.spec_behavior) @ known_names)
           known_names
           (Logic_utils.extract_contract (code_annot stmt)))
      []
      def.sallstmts
  | Declaration _ ->
    []

let spec_function_behaviors kf =
  List.map (fun x -> x.b_name) (behaviors kf)

let all_function_behaviors kf =
  behavior_names_of_stmt_in_kf kf @ spec_function_behaviors kf

(* [JS 2012/06/01] TODO: better way to generate fresh name *)
let fresh_behavior_name kf name =
  let existing_behaviors = all_function_behaviors kf in
  let rec aux i =
    let name = name ^ "_" ^ (string_of_int i) in
    if List.mem name existing_behaviors then aux (i+1)
    else name
  in
  if List.mem name existing_behaviors then aux 0 else name

let code_annot_of_kf kf = match kf.fundec with
  | Definition(f, _) ->
    List.fold_left
      (fun acc stmt ->
         fold_code_annot (fun _ a acc -> (stmt, a) :: acc) stmt acc)
      []
      f.sallstmts
  | Declaration _ ->
    []

(* don't export the possibility to removing an annotation without associated
   statuses. This is purely internal. *)
let remove_code_annot e ?kf stmt ca =
  remove_code_annot_internal e ?kf stmt ca;
  Changed.apply()

(*
  Local Variables:
  compile-command: "make -C ../../.."
  End:
*)
