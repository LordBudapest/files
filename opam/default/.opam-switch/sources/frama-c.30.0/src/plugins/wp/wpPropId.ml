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

open Cil_types
open Cil_datatype

(*----------------------------------------------------------------------------*)
(* Property identification                                                    *)
(*----------------------------------------------------------------------------*)

(** Beside the property identification, it can be found in different contexts
 * depending on which part of the computation is involved.
 * For instance, properties on loops are split in 2 parts : establishment and
 * preservation.
*)

type prop_kind =
  | PKTactic      (** tactical sub-goal *)
  | PKCheck       (** internal check *)
  | PKProp        (** normal property *)
  | PKEstablished (** computation related to a loop property before the loop. *)
  | PKPreserved   (** computation related to a loop property inside the loop. *)
  | PKPropLoop    (** loop property used as hypothesis inside a loop. *)
  | PKVarDecr     (** computation related to the decreasing of a variant in a loop *)
  | PKVarPos      (** computation related to a loop variant being positive *)
  | PKVarRel      (** computation related to a generalized loop variant *)
  | PKAFctOut     (** computation related to the function assigns on normal termination *)
  | PKAFctExit    (** computation related to the function assigns on exit termination *)
  | PKTerminates  (** computation related to the termination *)
  | PKDecreases   (** computation related to the decreases clause *)
  | PKSmoke       (** expected to fail *)
  | PKPre of kernel_function * stmt * Property.t
  (** precondition for function
      at stmt, property of the require. Many information that should come
      from the p_prop part of the prop_id, but in the PKPre case,
      it seems that it is hidden in a IPBlob property ! *)

type prop_id = {
  p_kind : prop_kind ;
  p_prop : Property.t ;
  p_doomed : Property.t list ; (* false-if-reachable props when fired *)
  p_unreachable : Property.other_loc ; (* false-if-reachable location *)
  p_part : (int * int) option ;
}

let unknown = Property.OLGlob Cil_datatype.Location.unknown

let tactical ~gid =
  let ip = "Wp.Tactical." ^ gid in
  { p_kind = PKTactic ;
    p_prop = Property.(ip_other ip unknown);
    p_doomed = [] ;
    p_unreachable = unknown ;
    p_part = None }

(* -------------------------------------------------------------------------- *)
(* --- Category                                                           --- *)
(* -------------------------------------------------------------------------- *)

let parts_of_id p = p.p_part
let property_of_id p = p.p_prop
let doomed_if_valid p = p.p_doomed
let unreachable_if_valid p = p.p_unreachable

let mk_part pid (k, n) = { pid with p_part = Some (k,n) }
let source_of_id p = fst (Property.location p.p_prop)

exception Found of int
let num_of_bhv_from bhv (out, _) =
  match bhv.b_assigns with
    WritesAny -> Wp_parameters.fatal "no \\from in this behavior ???"
  | Writes l ->
    let add n (o, f) = match f with FromAny -> n
                                  | From _ ->
                                    if Logic_utils.is_same_identified_term out o then
                                      raise (Found n)
                                    else n+1
    in
    try
      let _ = List.fold_left add 1 l in
      Wp_parameters.fatal "didn't found this \\from"
    with Found n -> n

(*----------------------------------------------------------------------------*)
(* Constructors *)
(*----------------------------------------------------------------------------*)

let mk_prop kind prop =
  { p_kind=kind; p_prop=prop; p_unreachable=unknown; p_doomed=[]; p_part=None }
let mk_check prop = mk_prop PKCheck prop
let mk_property prop = mk_prop PKProp prop

let mk_annot_id kf stmt ca = Property.ip_of_code_annot_single kf stmt ca
let mk_annot_ids kf stmt ca = Property.ip_of_code_annot kf stmt ca

let mk_code_annot_ids kf s ca =  List.map (mk_prop PKProp) (mk_annot_ids kf s ca)
let mk_assert_id kf s ca = mk_prop PKProp  (mk_annot_id kf s ca)
let mk_loop_inv_id kf s ~established ca =
  let kind = if established then PKEstablished else PKPreserved in
  mk_prop kind (mk_annot_id kf s ca)

let mk_loop_inv kf s ca =
  mk_loop_inv_id kf s ~established:true ca,
  mk_loop_inv_id kf s ~established:false ca

let mk_inv_hyp_id    kf s ca = mk_prop PKPropLoop  (mk_annot_id kf s ca)
let mk_var_decr_id   kf s ca = mk_prop PKVarDecr (mk_annot_id kf s ca)
let mk_var_pos_id    kf s ca = mk_prop PKVarPos  (mk_annot_id kf s ca)
let mk_var_id kf s ca = mk_prop PKVarRel (mk_annot_id kf s ca)

let mk_loop_from_id kf s ca from =
  let id = Property.ip_of_from kf (Kstmt s) (Property.Id_loop ca) from in
  mk_prop PKPropLoop (Option.get id)

let mk_bhv_from_id kf ki a bhv from =
  let a = Datatype.String.Set.of_list a in
  let id = Property.ip_of_from kf ki (Property.Id_contract (a,bhv)) from in
  mk_prop PKProp (Option.get id)

let get_kind_for_tk tkind has_exit = match tkind with
  | Normal ->
    if has_exit then PKAFctOut else PKProp
  | Exits -> PKAFctExit
  | _ -> assert false

let mk_fct_from_id kf kf_has_exit bhv tkind from =
  let contract_info = Property.Id_contract(Datatype.String.Set.empty,bhv) in
  let id = Property.ip_of_from kf Kglobal contract_info from in
  let kind = get_kind_for_tk tkind kf_has_exit in
  mk_prop kind (Option.get id)

let mk_disj_bhv_id (kf,ki,active,disj)  =
  mk_prop PKProp (Property.ip_of_disjoint kf ki ~active disj)
let mk_compl_bhv_id (kf,ki,active,comp) =
  mk_prop PKProp (Property.ip_of_complete kf ki ~active comp)
let mk_decrease_id kf s x  =
  mk_prop PKDecreases (Property.ip_of_decreases kf s x)

let mk_lemma_id l = mk_prop PKProp (LogicUsage.ip_lemma l)

let mk_stmt_assigns_id kf s active b a =
  let active = Datatype.String.Set.of_list active in
  let b = Property.Id_contract (active,b) in
  let p = Property.ip_of_assigns kf (Kstmt s) b (Writes a) in
  Option.map (mk_prop PKProp) p

let mk_loop_assigns_id kf s ca a =
  let ca = Property.Id_loop ca in
  let p = Property.ip_of_assigns kf (Kstmt s) ca (Writes a) in
  Option.map (mk_prop PKPropLoop) p

let mk_fct_assigns_id kf kf_has_exit b tkind a =
  let b = Property.Id_contract(Datatype.String.Set.empty,b) in
  let kind = get_kind_for_tk tkind kf_has_exit in
  let p = Property.ip_of_assigns kf Kglobal b (Writes a) in
  Option.map (mk_prop kind) p

let mk_pre_id kf ki b p =
  mk_prop PKProp (Property.ip_of_requires kf ki b p)

let mk_post_id kf ki b p =
  mk_prop PKProp (Property.ip_of_ensures kf ki b p)

let mk_terminates_id kf kinstr p =
  mk_prop PKTerminates (Property.ip_of_terminates kf kinstr p)

let mk_stmt_post_id kf s b p =
  mk_prop PKProp (Property.ip_of_ensures kf (Kstmt s) b p)

let mk_fct_post_id kf b p =
  mk_prop PKProp (Property.ip_of_ensures kf Kglobal b p)

let mk_call_pre_id called_kf s_call called_pre called_pre_p =
  let kind = PKPre (called_kf, s_call, called_pre) in
  mk_prop kind called_pre_p

let mk_smoke kf ~id ?(doomed=[]) ?unreachable () =
  let oloc = match unreachable with
    | None -> Property.OLContract kf
    | Some stmt -> Property.OLStmt(kf,stmt)
  in {
    p_kind = PKSmoke;
    p_prop = Property.ip_other ("wp_smoke_" ^id) oloc ;
    p_doomed = doomed ;
    p_unreachable = oloc ;
    p_part = None ;
  }

(*----------------------------------------------------------------------------*)

let kind_order = function
  | PKProp -> 0
  | PKPre _ -> 1
  | PKEstablished -> 2
  | PKPreserved -> 3
  | PKVarPos -> 4
  | PKVarDecr -> 5
  | PKVarRel -> 6
  | PKPropLoop -> 7
  | PKAFctOut -> 8
  | PKAFctExit -> 9
  | PKCheck -> 10
  | PKTactic -> 11
  | PKSmoke -> 12
  | PKTerminates -> 13
  | PKDecreases -> 14

let compare_kind k1 k2 = match k1, k2 with
    PKPre (kf1, ki1, p1), PKPre (kf2, ki2, p2) ->
    let cmp = Kernel_function.compare kf1 kf2 in
    if cmp <> 0 then cmp
    else
      let cmp = Stmt.compare ki1 ki2 in
      if cmp <> 0 then cmp
      else
        Property.compare p1 p2
  | _,_ -> Stdlib.compare (kind_order k1) (kind_order k2)

let compare_prop_id pid1 pid2 =
  (* This order of comparison groups together prop_pids with same properties *)
  let p1 = property_of_id pid1 in
  let p2 = property_of_id pid2 in
  let cmp = Description.full_compare p1 p2 in
  if cmp <> 0 then cmp
  else
    let cmp = compare_kind pid2.p_kind pid1.p_kind in
    if cmp <> 0 then cmp
    else
      Stdlib.compare pid1.p_part pid2.p_part

module PropIdRaw =
  Datatype.Make_with_collections(
  struct
    type t = prop_id
    include Datatype.Undefined
    let name = "WpAnnot.prop_id"
    let reprs = List.map mk_property Property.reprs
    let hash pid = Property.hash pid.p_prop
    let compare = compare_prop_id
    let equal pid1 pid2 = compare_prop_id pid1 pid2 = 0

    let copy = Datatype.undefined
    let rehash = Datatype.identity
    let pretty = Datatype.undefined
    let mem_project = Datatype.never_any_project
  end)

(* -------------------------------------------------------------------------- *)
(* --- Lagacy Naming                                                      --- *)
(* -------------------------------------------------------------------------- *)

module NameUniquify(D:Datatype.S_with_collections)(S:sig
    val name: string
    val basename: D.t -> string
  end) :
sig
  val unique_basename: D.t -> string
end
=
struct

  module NamesTbl = State_builder.Hashtbl(Datatype.String.Hashtbl)(Datatype.Int)
      (struct
        let name = S.name^"Names"
        let dependencies = [ ]
        let size = 97
      end)

  module IndexTbl =
    State_builder.Hashtbl(D.Hashtbl)(Datatype.String)
      (struct
        let name = S.name^"Index"
        let dependencies =
          [ Ast.self;
            NamesTbl.self;
            Globals.Functions.self;
            Annotations.code_annot_state;
            Annotations.funspec_state;
            Annotations.global_state ]
        let size = 97
      end)


  (** returns the name that should be returned by the function [get_prop_name_id]
      if the given property has [name] as basename. That name is reserved so that
      [get_prop_name_id prop] can never return an identical name. *)
  let reserve_name_id pid =
    let basename = S.basename pid in
    try
      let speed_up_start = NamesTbl.find basename in
      (* this basename is already reserved *)
      let n,unique_name = Extlib.make_unique_name NamesTbl.mem ~sep:"_" ~start:speed_up_start basename
      in NamesTbl.replace basename (succ n) ; (* to speed up Extlib.make_unique_name for next time *)
      unique_name
    with Not_found -> (* first time that basename is reserved *)
      NamesTbl.add basename 2 ;
      basename

  (** returns a unique name identifying the property.
      This name is built from the basename of the property. *)
  let unique_basename pid =
    try IndexTbl.find pid
    with Not_found -> (* first time we are asking for a name for that [ip] *)
      let unique_name = reserve_name_id pid in
      IndexTbl.add pid unique_name ;
      unique_name

end

(* -------------------------------------------------------------------------- *)
(* --- Naming Properties                                                  --- *)
(* -------------------------------------------------------------------------- *)

module Names:
sig
  val get_prop_id_name: prop_id -> string
end =
struct

  (** Uniquify the first part of the prop_id *)
  module Uniquify1 = NameUniquify(Property)(struct
      let name = "Wp.WpPropId.Names."
      let basename ip =
        let truncate = max 20 (Wp_parameters.TruncPropIdFileName.get ()) in
        Property.Names.get_prop_basename ~truncate ip
    end)

  let get_ip ip =
    Uniquify1.unique_basename ip

  (** Uniquify call-site for precondition check. So
      that precondition of the same call-site are grouped *)
  module CallSite = Datatype.Triple_with_collections
      (Kernel_function)(Kernel_function)(Stmt)
      (struct let module_name = "Wp.WpPropId.CallSite" end)
  module Uniquify_Stmt = NameUniquify(CallSite)(struct
      let name = "Wp.WpPropId.Names3."
      let basename (caller_kf,callee_kf,_stmt) =
        (Kernel_function.get_name caller_kf)^"_call_"^(Kernel_function.get_name callee_kf)
    end)

  let get_prop_id_base p =
    match p.p_kind , p.p_prop with
    | PKEstablished , p -> get_ip p ^ "_established"
    | PKPreserved , p -> get_ip p ^ "_preserved"
    | PKVarDecr , p -> get_ip p ^ "_decrease"
    | PKVarPos , p -> get_ip p ^ "_positive"
    | PKVarRel , p -> get_ip p ^ "_relation"
    | PKAFctOut , p -> get_ip p ^ "_normal"
    | PKAFctExit , p -> get_ip p ^ "_exit"
    | PKPre(callee_kf,stmt,pre) , _ ->
      let caller_kf = Kernel_function.find_englobing_kf stmt in
      let call_string =
        Uniquify_Stmt.unique_basename (caller_kf,callee_kf,stmt)
      in
      (* remove name of callee kernel function given by get_ip *)
      let ip_string = get_ip pre in
      let ip_string =
        Option.value ~default:ip_string
          (Extlib.string_del_prefix
             ((Kernel_function.get_name callee_kf)^"_")
             ip_string)
      in
      call_string^"_"^ip_string
    | _ , p ->
      get_ip p


  let get_prop_id_basename p =
    let basename = get_prop_id_base p in
    match p.p_part with
    | None -> basename
    | Some(k,n) ->
      if n < 10 then Printf.sprintf "%s_part%d" basename (succ k) else
      if n < 100 then Printf.sprintf "%s_part%02d" basename (succ k) else
      if n < 1000 then Printf.sprintf "%s_part%03d" basename (succ k) else
        Printf.sprintf "%s_part%06d" basename (succ k)

  module Uniquify2 = NameUniquify(PropIdRaw)(struct
      let name = "Wp.WpPropId.Names2."
      let basename = get_prop_id_basename
    end)

  let get_prop_id_name p =
    Uniquify2.unique_basename p

end

(* -------------------------------------------------------------------------- *)
(* --- Naming Accessors                                                   --- *)
(* -------------------------------------------------------------------------- *)

let get_propid = Names.get_prop_id_name
(** Name related to a property PO *)

let pp_propid fmt pid =
  Format.pp_print_string fmt (get_propid pid)

let pp_names fmt l =
  let l = Datatype.String.Set.elements l in
  match l with
  | [] -> ()
  | _ -> Format.fprintf fmt "_%a" (Wp_error.pp_string_list ~empty:"" ~sep:"_") l

let ident_names names =
  List.filter (function "" -> true
                      | _ as n -> '\"' <> (String.get n 0) ) names

let user_pred_names p =
  let p_names = ident_names p.tp_statement.pred_name in
  if p.tp_kind = Check then "@check"::p_names else p_names

let code_annot_names ca = match ca.annot_content with
  | AAssert (_, pred)  -> "@assert" :: user_pred_names pred
  | AInvariant (_,_,pred) -> "@invariant":: user_pred_names pred
  | AVariant (term, _) -> "@variant"::(ident_names term.term_name)
  | AExtended(_,_,{ext_name}) -> [Printf.sprintf "@%s" ext_name]
  | _ -> [] (* TODO : add some more names ? *)

(** This is used to give the name of the property that the user can give
 * to select it from the command line (-wp-prop option) *)
let user_prop_names p =
  let open Property in match p with
  | IPPredicate {ip_kind; ip_pred} ->
    Format.asprintf  "@@%a" Property.pretty_predicate_kind ip_kind ::
    user_pred_names ip_pred.ip_content
  | IPExtended {ie_ext={ext_name}} -> [ Printf.sprintf "@%s" ext_name ]
  | IPCodeAnnot {ica_ca} -> code_annot_names ica_ca
  | IPComplete {ic_bhvs} ->
    let kind_name = "@complete_behaviors" in
    let name = Format.asprintf "complete_behaviors%a" pp_names ic_bhvs
    in kind_name::[name]
  | IPDisjoint {ic_bhvs} ->
    let kind_name = "@disjoint_behaviors" in
    let name = Format.asprintf "disjoint_behaviors%a" pp_names ic_bhvs
    in kind_name::[name]
  | IPAssigns {ias_froms} ->
    List.fold_left
      (fun acc (t,_) -> (ident_names t.it_content.term_name) @ acc)
      ["@assigns"] ias_froms
  | IPDecrease {id_ca=Some ca} -> "@decreases"::code_annot_names ca
  | IPDecrease _ -> [ "@decreases" ]
  | IPLemma {il_name = a; il_pred = l} ->
    let names = "@lemma"::a::user_pred_names l in
    begin
      match LogicUsage.section_of_lemma a with
      | LogicUsage.Toplevel _ -> names
      | LogicUsage.Axiomatic ax -> ax.LogicUsage.ax_name::names
    end
  (* TODO *)
  | IPFrom _
  | IPAllocation _
  | IPAxiomatic _
  | IPModule _
  | IPBehavior _
  | IPReachable _
  | IPPropertyInstance _
  | IPTypeInvariant _
  | IPGlobalInvariant _
  | IPOther _ -> []

let user_bhv_names p =
  let open Property in
  let fors = match p with
    | Property.IPCodeAnnot { ica_ca } ->
      let fors = match ica_ca.annot_content with
        | Cil_types.AAssert (fors, _)
        | Cil_types.AStmtSpec (fors, _)
        | Cil_types.AInvariant (fors, _, _)
        | Cil_types.AAssigns (fors, _)
        | Cil_types.AAllocation (fors, _)
        | Cil_types.AExtended (fors, _, _) -> fors
        | _ -> []
      in fors
    | _ -> []
  in Option.fold ~none:fors ~some:(fun b -> b.b_name :: fors) (get_behavior p)

let string_of_termination_kind = function
    Normal -> "ensures"
  | Exits -> "exits"
  | Breaks -> "breaks"
  | Continues -> "continues"
  | Returns -> "returns"

let label_of_kind = function
  | PKTactic -> "Tactic"
  | PKSmoke -> "Smoke-test"
  | PKCheck -> "Check"
  | PKProp -> "Property"
  | PKPropLoop -> "Invariant" (* should be assert false ??? *)
  | PKEstablished -> "Establishment"
  | PKPreserved -> "Preservation"
  | PKVarDecr -> "Decreasing"
  | PKVarPos -> "Positive"
  | PKVarRel -> "Relation"
  | PKAFctOut -> "Function assigns"
  | PKAFctExit -> "Exit assigns"
  | PKTerminates -> "Terminates"
  | PKDecreases -> "Decreases"
  | PKPre(kf,_,_) ->
    Printf.sprintf "Precondition for '%s'" (Kernel_function.get_name kf)

let label_of_prop_id p =
  match p.p_part with
  | None -> label_of_kind p.p_kind
  | Some(k,n) ->
    Printf.sprintf "%s (%d/%d)" (label_of_kind p.p_kind) (succ k) n

module Pretty =
struct
  open Format
  let pp_part fmt p = match p.p_part with
    | None -> ()
    | Some(k,n) -> fprintf fmt " (%d/%d)" (succ k) n
  let pp_subprop fmt p = match p.p_kind with
    | PKProp | PKTactic | PKCheck | PKPropLoop | PKSmoke
    | PKTerminates | PKDecreases -> ()
    | PKEstablished -> pp_print_string fmt " (established)"
    | PKPreserved -> pp_print_string fmt " (preserved)"
    | PKVarDecr -> pp_print_string fmt " (decrease)"
    | PKVarPos -> pp_print_string fmt " (positive)"
    | PKVarRel -> pp_print_string fmt " (relation)"
    | PKAFctOut -> pp_print_string fmt " (return)"
    | PKAFctExit -> pp_print_string fmt " (exit)"
    | PKPre(kf,_,_) -> fprintf fmt " (call '%s')" (Kernel_function.get_name kf)
  let pp_prop fmt p =
    Description.pp_localized ~kf:`Never ~ki:false ~kloc:false fmt p.p_prop
  let pp_local fmt p =
    begin
      pp_prop fmt p ;
      pp_subprop fmt p ;
      pp_part fmt p ;
    end
end

let pretty_local = Pretty.pp_local

(* -------------------------------------------------------------------------- *)
(* --- Datatype                                                           --- *)
(* -------------------------------------------------------------------------- *)

module PropId =
struct
  include PropIdRaw
  let pretty = pp_propid
end

(* -------------------------------------------------------------------------- *)
(* --- Hints                                                              --- *)
(* -------------------------------------------------------------------------- *)

type hints = {
  mutable required : string list ;
  mutable hints : string list ;
}

let add_hint hs x =
  if not (List.mem x hs.hints) then hs.hints <- x :: hs.hints
let add_required hs x =
  if not (List.mem x hs.required) then hs.required <- x :: hs.required

let stmt_hints hs s =
  List.iter
    (fun label ->
       match label with
       | Label(a,_,src) -> if src then add_hint hs a
       | Default _ -> add_hint hs "default"
       | Case(e,_) -> match Ctypes.get_int64 e with
         | Some k -> add_hint hs ("case-" ^ Int64.to_string k)
         | None -> ()
    ) s.labels

let kinstr_hints hs = function
  | Kstmt s -> stmt_hints hs s
  | Kglobal -> ()

let propid_hints hs p =
  let open Property in
  match p.p_kind , p.p_prop with
  | PKCheck , _ -> ()
  | PKSmoke , _ -> add_required hs "smoke-test"
  | PKProp , IPAssigns {ias_kinstr=Kstmt _} ->
    add_required hs "stmt-assigns"
  | PKProp , IPAssigns {ias_kinstr=Kglobal} ->
    add_required hs "fct-assigns"
  | PKPropLoop , Property.IPAssigns _ -> add_required hs "loop-assigns"
  | PKPropLoop , _ -> add_required hs "invariant"
  | PKProp , _ -> add_required hs "property"
  | PKTactic , _ -> add_required hs "tactic"
  | PKEstablished , _ -> add_required hs "established"
  | PKPreserved , _ -> add_required hs "preserved"
  | PKVarDecr , _ -> add_required hs "decrease"
  | PKVarPos , _ -> add_required hs "positive"
  | PKVarRel , _ -> add_required hs "relation"
  | PKAFctOut , _ -> add_required hs "return"
  | PKAFctExit , _ -> add_required hs "exit"
  | PKTerminates , _ -> add_required hs "terminates"
  | PKDecreases , _ -> add_required hs "decreases"
  | PKPre(kf,st,_) , _ ->
    add_required hs ("precond-" ^ Kernel_function.get_name kf) ;
    stmt_hints hs st

let rec term_hints hs t =
  match t.term_node with
  | TLval(lv,_) -> lval_hints hs lv
  | TAddrOf(lv,_) -> lval_hints hs lv
  | TCast (false, Ctype _,t) -> term_hints hs t
  | TBinOp((PlusPI|MinusPI),a,_) -> term_hints hs a
  | Tlet(_,t) -> term_hints hs t
  | _ -> ()

and lval_hints hs = function
  | TVar { lv_origin=Some { vorig_name=x } }
  | TVar { lv_name=x } -> add_hint hs x
  | TResult _ -> add_hint hs "result"
  | TMem t -> add_hint hs "*" ; term_hints hs t

let assigns_hints hs froms =
  List.iter (fun ({it_content=t},_) -> term_hints hs t) froms

let annot_hints hs = function
  | AAssert(bs,ipred) | AInvariant(bs,_,ipred) ->
    List.iter (add_hint hs) (ident_names ipred.tp_statement.pred_name) ;
    List.iter (add_hint hs) bs
  | AAssigns(bs,Writes froms) ->
    List.iter (add_hint hs) bs ;
    assigns_hints hs froms
  | AAllocation _ | AAssigns(_,WritesAny) | AStmtSpec _
  | AVariant _ | AExtended _ -> ()

let property_hints hs =
  let open Property in function
    | IPLemma  {il_name; il_pred} ->
      List.iter (add_required hs) (il_name::il_pred.tp_statement.pred_name)
    | IPBehavior _ -> ()
    | IPComplete {ic_bhvs} | IPDisjoint {ic_bhvs} ->
      Datatype.String.Set.iter (add_required hs) ic_bhvs
    | IPPredicate {ip_pred} ->
      List.iter (add_hint hs) ip_pred.ip_content.tp_statement.pred_name
    | IPExtended {ie_ext={ext_name}} -> List.iter (add_hint hs) [ext_name]
    | IPCodeAnnot {ica_ca} -> annot_hints hs ica_ca.annot_content
    | IPAssigns {ias_froms} -> assigns_hints hs ias_froms
    | IPAllocation _ (* TODO *)
    | IPFrom _ | IPDecrease _  | IPPropertyInstance _
    | IPReachable _ | IPAxiomatic _ | IPModule _ | IPOther _
    | IPTypeInvariant _ | IPGlobalInvariant _ -> ()

let prop_id_keys p =
  begin
    let hs = { hints=[] ; required=[] } in
    let opt add f = function None -> () | Some x -> add hs (f x) in
    propid_hints hs p ;
    property_hints hs p.p_prop ;
    opt add_required Kernel_function.get_name (Property.get_kf p.p_prop) ;
    opt add_required
      (fun b ->
         if Cil.is_default_behavior b
         then "default"
         else b.b_name)
      (Property.get_behavior p.p_prop) ;
    opt add_hint (fun (k,_) -> Printf.sprintf "part-%d" k) p.p_part ;
    kinstr_hints hs (Property.get_kinstr p.p_prop) ;
    List.sort String.compare hs.required ,
    List.sort String.compare hs.hints
  end

(*----------------------------------------------------------------------------*)
(* Pretty-Print *)
(*----------------------------------------------------------------------------*)

let pp_goal_kind fmt = function
  | PKTactic | PKSmoke | PKCheck
  | PKProp | PKPropLoop | PKAFctOut | PKAFctExit | PKTerminates | PKDecreases
  | PKPre _ -> ()
  | PKEstablished -> Format.pp_print_string fmt "Establishment of "
  | PKPreserved -> Format.pp_print_string fmt "Preservation of "
  | PKVarDecr -> Format.pp_print_string fmt "Decreasing of "
  | PKVarPos -> Format.pp_print_string fmt "Positivity of "
  | PKVarRel -> Format.pp_print_string fmt "Follows relation "

let pp_goal_part fmt = function
  | None -> ()
  | Some(k,n) -> Format.fprintf fmt " (%d/%d)" (succ k) n

let pretty fmt pid =
  begin
    pp_goal_kind fmt pid.p_kind ;
    Description.pp_property fmt pid.p_prop ;
    pp_goal_part fmt pid.p_part ;
  end

let pretty_context kf fmt pid =
  begin
    pp_goal_kind fmt pid.p_kind ;
    Description.pp_localized ~kf ~ki:true ~kloc:true fmt pid.p_prop ;
    pp_goal_part fmt pid.p_part ;
  end

(*----------------------------------------------------------------------------*)
(* Comparison *)
(*----------------------------------------------------------------------------*)

let is_check p = p.p_kind = PKCheck
let is_tactic p = p.p_kind = PKTactic
let is_smoke_test p = p.p_kind = PKSmoke

let is_assigns p =
  match property_of_id p with
  | Property.IPAssigns _ -> true
  | _ -> false

let is_requires =
  let open Property in function
    | IPPredicate {ip_kind = PKRequires _} -> true
    | _ -> false

let is_loop_preservation p =
  match p.p_kind with
  | PKPreserved ->
    begin
      match Property.get_kinstr p.p_prop with
      | Kglobal -> Wp_parameters.fatal "Loop Preservation ? (%a)" Property.pretty p.p_prop
      | Kstmt st -> Some st
    end
  | _ -> None

let user_prop_pid pid =
  let p_prop = match pid.p_kind with
    | PKPre (_,_,p_prop) -> p_prop
    | _ -> property_of_id pid in
  let names = user_prop_names p_prop in
  let names = if is_smoke_test pid then "smoke" :: names else names in
  match Property.get_kf p_prop with
  | None -> names
  | Some kf -> Kernel_function.get_name kf :: names

let select_default pid =
  let names = user_prop_pid pid in
  not (List.mem "no_wp" names)

let are_selected_names asked names =
  if List.mem "no_wp" names then false
  else
    let is_minus s = try s.[0] = '-' with _ -> false in
    let is_plus s = try s.[0] = '+' with _ -> false in
    let remove_first s = String.sub s 1 ((String.length s) -1) in
    let eval acc asked =
      let is_minus,a = match acc with
        | None -> if is_minus asked then true,true else false,false
        | Some a -> (is_minus asked),a
      in let eval () =
           let asked = if is_minus || (is_plus asked)
             then remove_first asked else asked
           in List.mem asked names
      in Some (if is_minus
               then a && (not (eval ()))
               else a || (eval ()))
    in
    match List.fold_left eval None asked with
    | Some false -> false
    | _ -> true

let select_by_name asked_names pid =
  let names = user_prop_pid pid in
  are_selected_names asked_names names

let select_for_behaviors bhvs pid =
  let fors = Property.get_for_behaviors @@ property_of_id pid in
  List.exists (fun b -> List.mem b fors) bhvs

let select_call_pre s_call asked_pre pid =
  match pid.p_kind with
  | PKPre (_, p_stmt, p_prop) ->
    Stmt.equal s_call p_stmt &&
    (match asked_pre with
     | None -> true
     | Some asked_pre -> Property.equal p_prop asked_pre)
  | _ -> false

(*----------------------------------------------------------------------------*)
(* About assigns identification *)
(*----------------------------------------------------------------------------*)

type a_kind = LoopAssigns | StmtAssigns

type assigns_desc = {
  a_label : Clabels.c_label ;
  a_stmt : Cil_types.stmt option ;
  a_kind : a_kind ;
  a_assigns : Cil_types.assigns ;
}

let mk_asm_assigns_desc s = {
  a_label = Clabels.stmt s ;
  a_stmt = Some s ;
  a_kind = StmtAssigns ;
  a_assigns = WritesAny ;
}

let mk_loop_assigns_desc s assigns = {
  a_label = Clabels.stmt s ;
  a_stmt = Some s ;
  a_kind = LoopAssigns ;
  a_assigns = Writes assigns
}

let mk_stmt_assigns_desc s assigns = {
  a_label = Clabels.stmt s ;
  a_stmt = Some s ;
  a_kind = StmtAssigns ;
  a_assigns = Writes assigns ;
}

let mk_stmt_assigns_any_desc s = {
  a_label = Clabels.stmt s ;
  a_stmt = Some s ;
  a_kind = StmtAssigns ;
  a_assigns = WritesAny ;
}

let mk_init_assigns = {
  a_label = Clabels.init ;
  a_stmt = None ;
  a_kind = StmtAssigns ;
  a_assigns = WritesAny ;
}

(*
(** kf assigns for normal path when there is an exit path *)
let mk_fout_assigns_desc assigns = {
  a_label = Logic_const.pre_label ;
  (* a_fun = Assigns_FctOut ;  *)
  a_kind = StmtAssigns ;
  a_assigns = Writes assigns ;
}

(** kf assigns for exit path *)
let mk_exit_assigns_desc assigns = {
  a_label = Logic_const.pre_label ;
  (* a_fun = Assigns_FctExit ; *)
  a_kind = StmtAssigns ;
  a_assigns = Writes assigns ;
}
*)

let mk_kf_assigns_desc assigns = {
  a_label = Clabels.pre ;
  a_stmt = None ;
  a_kind = StmtAssigns ;
  a_assigns = Writes assigns ;
}

let is_call_assigns = function
  | {a_stmt=Some {skind=Instr(Call _ | Local_init (_, ConsInit _, _)) } }
    -> true
  | _ -> false

let pp_assigns_desc fmt a = Wp_error.pp_assigns fmt a.a_assigns
(*----------------------------------------------------------------------------*)
(**
 * 2 kinds of annotations can be found : predicates and assigns.
 * because assigns properties can only be translated into predicates
 * by the memory model.
 * - Assigns properties are composed of the assigns list from Cil,
 * and a label to know where to stop.
 * - Predicates are just the predicate type from Cil.
*)
(*----------------------------------------------------------------------------*)

type pred_info = prop_id * Cil_types.predicate
type variant_info = prop_id * Cil_types.variant

let mk_pred_info id p = (id, p)
let pred_info_id (id, _) = id
let pp_pred_of_pred_info fmt (_id, p) = Printer.pp_predicate fmt p
let pp_pred_info fmt (id, p) =
  Format.fprintf fmt "(@[%a:@ %a@])" pp_propid id Printer.pp_predicate p

type assigns_info = prop_id * assigns_desc

let assigns_info_id (id,_) = id

type assigns_full_info =
    AssignsLocations of assigns_info
  | AssignsAny of assigns_desc
  | NoAssignsInfo

let empty_assigns_info = NoAssignsInfo
let mk_assigns_info id a = AssignsLocations (id, a)

let mk_stmt_any_assigns_info s =
  let a = {
    a_label = Clabels.stmt s ;
    a_stmt = Some s ;
    a_kind = StmtAssigns ;
    a_assigns = WritesAny ;
  } in
  AssignsAny a

let mk_kf_any_assigns_info () =
  let a = {
    a_label = Clabels.pre ;
    a_stmt = None ;
    a_kind = StmtAssigns ;
    a_assigns = WritesAny ;
  } in
  AssignsAny a

let mk_loop_any_assigns_info s =
  let a = {
    a_label = Clabels.stmt s ;
    a_stmt = Some s ;
    a_kind = LoopAssigns ;
    a_assigns = WritesAny ;
  } in
  AssignsAny a

(* let pp_assigns_id (id, _a) = pp_propid id *)

let pp_assign_info k fmt a = match a with
  | NoAssignsInfo -> ()
  | AssignsAny a ->
    let pkind =
      match a.a_kind with
      | StmtAssigns -> ""
      | LoopAssigns -> "loop"
    in
    Format.fprintf fmt "%s(@@%a): %s assigns everything@."
      k Clabels.pretty a.a_label pkind
  | AssignsLocations (_,a) ->
    Format.fprintf fmt "%s(@@%a): %a@." k
      Clabels.pretty a.a_label
      pp_assigns_desc a

let merge_assign_info a1 a2 = match a1,a2 with
  | NoAssignsInfo, a | a, NoAssignsInfo -> a
  | (AssignsLocations _ | AssignsAny _),
    (AssignsLocations _ | AssignsAny _) ->
    Wp_parameters.fatal "Several assigns ?"


(* -------------------------------------------------------------------------- *)
(* --- Axioms                                                             --- *)
(* -------------------------------------------------------------------------- *)

type axiom_info = prop_id * LogicUsage.logic_lemma

let mk_axiom_info lemma =
  let id = mk_lemma_id lemma in (id, lemma)

let pp_axiom_info fmt (id,thm) =
  Format.fprintf fmt "(@[%a:@ %a@])" pp_propid id
    Printer.pp_predicate thm.LogicUsage.lem_predicate.tp_statement

(* -------------------------------------------------------------------------- *)
(* --- Prop Splitter                                                      --- *)
(* -------------------------------------------------------------------------- *)

(* prop-id splitter *)

let split_bag job pid goals =
  let n = Bag.length goals in
  if n <= 1 then Bag.iter (job pid) goals else
    let k = ref 0 in
    Bag.iter
      (fun g ->
         let pid_k = mk_part pid (!k,n) in
         incr k ; job pid_k g)
      goals

let split_map f pid gs =
  let n = List.length gs in
  if n <= 1 then List.map (f pid) gs else
    let k = ref 0 in
    List.map (fun g ->
        let pid_k = mk_part pid (!k,n) in
        incr k ; f pid_k g
      ) gs

(*----------------------------------------------------------------------------*)
(** About proofs *)
(*----------------------------------------------------------------------------*)

let subproofs id = match id.p_kind with
  | PKCheck -> 0
  | PKProp | PKSmoke | PKTactic | PKPre _ | PKPropLoop
  | PKTerminates | PKDecreases | PKVarRel -> 1
  | PKEstablished | PKPreserved
  | PKVarDecr | PKVarPos
  | PKAFctExit | PKAFctOut -> 2

let subproof_idx id = match id.p_kind with
  | PKCheck -> (-1) (* 0/0 *)
  | PKProp | PKTactic | PKPre _ | PKSmoke | PKPropLoop
  | PKTerminates | PKDecreases | PKVarRel -> 0 (* 1/1 *)
  | PKPreserved  -> 0 (* 1/2 *)
  | PKEstablished-> 1 (* 2/2 *)
  | PKVarDecr    -> 0 (* 1/2 *)
  | PKVarPos     -> 1 (* 2/2 *)
  | PKAFctOut    -> 0 (* 1/2 *)
  | PKAFctExit   -> 1 (* 2/2 *)

(** find the outer loop in which the stmt is. *)
let get_loop_stmt kf stmt =
  (* because we don't have the cfg here, we can only use Cil information,
   * and then we can only recognize syntactic loops... TODO: use the cfg ? *)
  let rec is_in_blk b = List.exists is_in_stmt b.bstmts
  and is_in_stmt s = if s.sid = stmt.sid then true
    else match s.skind with
      | If (_, b1, b2,_) -> is_in_blk b1 || is_in_blk b2
      | Switch (_, b, _, _) | Block b -> is_in_blk b
      | UnspecifiedSequence seq ->
        let b = Cil.block_from_unspecified_sequence seq in
        is_in_blk b
      | Loop (_, b, _, _, _) -> is_in_blk b
      | _ -> false
  and find_loop_in_blk blk = find_loop_in_stmts blk.bstmts
  and find_loop_in_stmts l = match l with
    | [] -> None
    | s::tl ->
      (match find_loop_in_stmt s with Some l -> Some l
                                    | None -> find_loop_in_stmts tl)
  and find_loop_in_stmt s = match s.skind with
    | (Loop _) -> if is_in_stmt s then Some s else None
    | If (_, b1, b2,_) ->
      (match find_loop_in_blk b1 with Some l -> Some l
                                    | None -> find_loop_in_blk b2)
    | Switch (_, b, _, _) | Block b -> find_loop_in_blk b
    | UnspecifiedSequence seq ->
      let b = Cil.block_from_unspecified_sequence seq in
      find_loop_in_blk b
    | _ -> None
  in let f = Kernel_function.get_definition kf in
  find_loop_in_blk f.sbody

(** Quite don't understand what is going on here... what is it supposed to do ?
 * [2011-07-07-Anne] *)
let get_induction p =
  let get_stmt = let open Property in function
      | IPDecrease {id_kf;id_kinstr=Kstmt stmt} -> Some (id_kf, stmt)
      | IPCodeAnnot {ica_kf;ica_stmt} -> Some (ica_kf, ica_stmt)
      | IPAssigns {ias_kf; ias_kinstr=Kstmt stmt} -> Some (ias_kf, stmt)
      | _ -> None
  in match p.p_kind with
  | PKCheck | PKSmoke | PKAFctOut | PKAFctExit | PKPre _
  | PKTactic | PKTerminates | PKDecreases ->
    None
  | PKProp ->
    let loop_stmt_opt = match get_stmt (property_of_id p) with
      | None -> None
      | Some (kf, s) -> get_loop_stmt kf s
    in loop_stmt_opt
  | PKPropLoop ->
    let open Property in
    let loop_stmt_opt = match property_of_id p with
      | IPCodeAnnot {ica_kf; ica_stmt;
                     ica_ca = {annot_content = AInvariant(_, loop, _)}} ->
        if loop then (*loop invariant *) Some ica_stmt
        else (* invariant inside loop *) get_loop_stmt ica_kf ica_stmt
      | IPAssigns {ias_kinstr=Kstmt stmt; ias_bhv = Id_loop _} ->
        (* loop assigns *) Some stmt
      | _ -> None (* assert false ??? *)
    in loop_stmt_opt
  | PKEstablished|PKVarDecr|PKVarPos|PKVarRel|PKPreserved ->
    (match get_stmt (property_of_id p) with
     | None -> None | Some (_, s) -> Some s)

(* -------------------------------------------------------------------------- *)
(* --- Filter according to status                                         --- *)
(* -------------------------------------------------------------------------- *)

let filter_status pid =
  Wp_parameters.StatusAll.get () ||
  begin
    let module C = Property_status.Consolidation in
    match C.get (property_of_id pid) with
    | C.Never_tried -> true
    | C.Considered_valid | C.Inconsistent _ -> false
    | C.Valid _ | C.Valid_under_hyp _
    | C.Invalid_but_dead _ | C.Valid_but_dead _ | C.Unknown_but_dead _ ->
      Wp_parameters.StatusTrue.get ()
    | C.Unknown _ -> Wp_parameters.StatusMaybe.get ()
    | C.Invalid _ | C.Invalid_under_hyp _ -> Wp_parameters.StatusFalse.get ()
  end

(*----------------------------------------------------------------------------*)
(* Proofs Management                                                          *)
(*----------------------------------------------------------------------------*)

type proof = {
  target : Property.t ;
  proved : proofpart array ;
  mutable invalid : bool ;
  mutable dependencies : Property.Set.t ;
} and proofpart =
    | Noproof
    | Complete
    | Parts of Bitvector.t

let target p = p.target
let dependencies p =
  Property.Set.elements (Property.Set.remove p.target p.dependencies)

let create_proof ip =
  let n = subproofs ip in
  {
    target = property_of_id ip ;
    proved = Array.make n Noproof ;
    dependencies = Property.Set.empty ;
    invalid = false ;
  }

let add_proof pf ip hs =
  begin
    if not (Property.equal (property_of_id ip) pf.target)
    then Wp_parameters.fatal "Partial proof inconsistency" ;
    List.iter
      (fun iph ->
         if not (is_requires iph) then
           pf.dependencies <- Property.Set.add iph pf.dependencies
      ) hs ;
    let k = subproof_idx ip in
    match parts_of_id ip with
    | None -> pf.proved.(k) <- Complete
    | Some(p,n) ->
      match pf.proved.(k) with
      | Complete -> ()
      | Noproof ->
        let bv = Bitvector.create n in
        Bitvector.set_range bv 0 (p-1) ;
        Bitvector.set_range bv (p+1) (n-1) ;
        pf.proved.(k) <- Parts bv
      | Parts bv ->
        Bitvector.clear bv p ;
        if Bitvector.is_empty bv
        then pf.proved.(k) <- Complete
  end

let add_invalid_proof pf = pf.invalid <- true

let is_composed pf =
  Array.length pf.proved > 1

let is_proved pf =
  Array.for_all (function Complete -> true | _ -> false) pf.proved

let is_invalid pf =
  pf.invalid && not (is_proved pf)

(* -------------------------------------------------------------------------- *)
