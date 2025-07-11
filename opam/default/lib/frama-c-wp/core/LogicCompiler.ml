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

(* -------------------------------------------------------------------------- *)
(* --- Compilation of ACSL Logic-Info                                     --- *)
(* -------------------------------------------------------------------------- *)

open LogicUsage
open LogicBuiltins
open Cil_types
open Cil_datatype
open Clabels
open Ctypes
open Lang
open Lang.F
open Sigs
open Definitions

let dkey_lemma = Wp_parameters.register_category "lemma"

type polarity = [ `Positive | `Negative | `NoPolarity ]

module Make( M : Sigs.Model ) =
struct

  (* -------------------------------------------------------------------------- *)
  (* --- Definitions                                                        --- *)
  (* -------------------------------------------------------------------------- *)

  open M

  type value = M.loc Sigs.value
  type logic = M.loc Sigs.logic
  type result = loc Sigs.result
  type sigma = M.Sigma.t
  type chunk = M.Chunk.t

  type signature =
    | CST of Integer.t
    | SIG of sig_param list
  and sig_param =
    | Sig_value of logic_var (* to be replaced by the value *)
    | Sig_chunk of chunk * c_label (* to be replaced by the chunk variable *)

  (* -------------------------------------------------------------------------- *)
  (* --- Registering User-Defined Signatures                                --- *)
  (* -------------------------------------------------------------------------- *)

  module Typedefs = WpContext.Index
      (struct
        type key = logic_type_info
        type data = lfun option
        let name = "LogicCompiler." ^ M.datatype ^ ".Typedefs"
        let compare = Logic_type_info.compare
        let pretty = Logic_type_info.pretty
      end)
  let compile_logic_type = ref (fun _ -> assert false)

  module Signature = WpContext.Index
      (struct
        type key = logic_info
        type data = signature
        let name = "LogicCompiler." ^ M.datatype ^ ".Signature"
        let compare = Logic_info.compare
        let pretty fmt l = Logic_var.pretty fmt l.l_var_info
      end)

  (* -------------------------------------------------------------------------- *)
  (* --- Utilities                                                          --- *)
  (* -------------------------------------------------------------------------- *)

  let rec wrap_lvar xs vs =
    match xs , vs with
    | x::xs , v::vs -> Logic_var.Map.add x v (wrap_lvar xs vs)
    | _ -> Logic_var.Map.empty

  let rec wrap_var xs vs =
    match xs , vs with
    | x::xs , v::vs -> Varinfo.Map.add x v (wrap_var xs vs)
    | _ -> Varinfo.Map.empty

  let rec wrap_mem = function
    | (label,mem) :: m -> LabelMap.add label mem (wrap_mem m)
    | [] -> LabelMap.empty

  let has_ltype ltype t =
    match Logic_utils.unroll_type ~unroll_typedef:false ltype with
    | Ltype (lt, _) ->
      if not (Typedefs.mem lt) then !compile_logic_type ltype ;
      begin match Typedefs.find lt with
        | Some lfun -> F.p_call lfun [t]
        | None -> p_true
      end
    | Ctype typ -> Cvalues.has_ctype typ t
    | _ -> p_true

  let fresh_lvar ?basename ltyp =
    let tau = Lang.tau_of_ltype ltyp in
    let x = Lang.freshvar ?basename tau in
    let p = has_ltype ltyp (e_var x) in
    Lang.assume p ; x

  let fresh_cvar ?basename typ =
    fresh_lvar ?basename (Ctype typ)

  (* -------------------------------------------------------------------------- *)
  (* --- Logic Frame                                                        --- *)
  (* -------------------------------------------------------------------------- *)

  type call = {
    kf : kernel_function ;
    formals : value Varinfo.Map.t ;
    mutable result : M.loc Sigs.result option ;
    mutable status : var option ;
  }

  type frame = {
    descr : string ;
    pool : pool ;
    gamma : gamma ;
    call : call option ;
    types : string list ;
    mutable triggers : trigger list ;
    mutable labels : sigma LabelMap.t ;
  }

  let pp_frame fmt f =
    begin
      Format.fprintf fmt "Frame '%s':@\n" f.descr ;
      LabelMap.iter
        (fun l m ->
           Format.fprintf fmt "@[<hov 4>Label '%a': %a@]@\n"
             Clabels.pretty l Sigma.pretty m
        ) f.labels ;
    end

  (* -------------------------------------------------------------------------- *)
  (* --- Frames Builders                                                    --- *)
  (* -------------------------------------------------------------------------- *)

  let logic_frame a types =
    {
      descr = a ;
      pool = Lang.new_pool () ;
      gamma = Lang.new_gamma () ;
      types = types ;
      triggers = [] ;
      call = None ;
      labels = LabelMap.empty ;
    }

  let call0 ?result ?status ?(formals=Varinfo.Map.empty) kf =
    { kf ; formals  ; result ; status }

  let call ?result kf vs =
    let formals = wrap_var (Kernel_function.get_formals kf) vs in
    let result = match result with None -> None | Some l -> Some (R_loc l) in
    { kf ; formals ; result ; status = None }

  let local ~descr = {
    descr ;
    types = [] ;
    pool = Lang.get_pool () ;
    gamma = Lang.get_gamma () ;
    triggers = [] ;
    call = None ;
    labels = LabelMap.empty ;
  }

  let frame kf =
    {
      descr = Kernel_function.get_name kf ;
      types = [] ;
      pool = Lang.new_pool () ;
      gamma = Lang.new_gamma () ;
      triggers = [] ;
      call = Some (call0 kf) ;
      labels = LabelMap.empty ;
    }

  let call_pre init call mem =
    {
      descr = "Pre " ^ Kernel_function.get_name call.kf ;
      types = [] ;
      pool = Lang.get_pool () ;
      gamma = Lang.get_gamma () ;
      triggers = [] ;
      call = Some call ;
      labels = wrap_mem [ Clabels.init , init ; Clabels.pre , mem ] ;
    }

  let call_post init call seq =
    {
      descr = "Post " ^ Kernel_function.get_name call.kf ;
      types = [] ;
      pool = Lang.get_pool () ;
      gamma = Lang.get_gamma () ;
      triggers = [] ;
      call = Some call ;
      labels = wrap_mem [
          Clabels.init , init ;
          Clabels.pre , seq.pre ;
          Clabels.post , seq.post ;
          Clabels.exit , seq.post ;
        ] ;
    }

  (* -------------------------------------------------------------------------- *)
  (* --- Current Frame                                                      --- *)
  (* -------------------------------------------------------------------------- *)

  let cframe : frame Context.value = Context.create "LogicSemantics.frame"

  let get_frame () = Context.get cframe

  let in_frame f cc =
    Context.bind Lang.poly f.types
      (Context.bind cframe f
         (Lang.local ~pool:f.pool ~gamma:f.gamma cc))

  let mk_frame
      ?kf ?result ?status ?formals
      ?(labels=LabelMap.empty) ?descr () =
    let call =
      match kf with
      | None -> None
      | Some kf -> Some (call0 ?result ?status ?formals kf)
    in
    let descr = match descr , kf with
      | Some descr , _ -> descr
      | None , None -> "<frame>"
      | None , Some kf -> Kernel_function.get_name kf
    in
    {
      descr ; labels ;
      call = call;
      pool = Lang.get_pool () ;
      gamma = Lang.get_gamma () ;
      triggers = [];
      types = [];
    }

  let has_at_frame frame label =
    assert (not (Clabels.is_here label));
    LabelMap.mem label frame.labels

  let mem_at_frame frame label =
    assert (not (Clabels.is_here label));
    try LabelMap.find label frame.labels
    with Not_found ->
      let s = M.Sigma.create () in
      frame.labels <- LabelMap.add label s frame.labels ; s

  let set_at_frame frame label sigma =
    assert (not (Clabels.is_here label));
    assert (not (LabelMap.mem label frame.labels));
    frame.labels <- LabelMap.add label sigma frame.labels

  let mem_frame label = mem_at_frame (Context.get cframe) label

  let get_call = function
    | { call = Some call } -> call
    | { descr } ->
      Wp_parameters.fatal
        "Frame '%s' has is outside a function definition" descr

  let formal x =
    try
      let f = get_call (Context.get cframe) in
      Some (Varinfo.Map.find x f.formals)
    with Not_found -> None

  let return_type kf =
    if Kernel_function.returns_void kf then
      Wp_parameters.fatal
        "Function '%s' has no result" (Kernel_function.get_name kf) ;
    Kernel_function.get_return_type kf

  let return () =
    return_type (get_call (Context.get cframe)).kf

  let result () =
    let f = get_call (Context.get cframe) in
    match f.result with
    | Some r -> r
    | None ->
      let tr = return_type f.kf in
      let basename = Kernel_function.get_name f.kf in
      let x = fresh_cvar ~basename tr in
      let r = R_var x in
      f.result <- Some r ; r

  let status () =
    let f = get_call (Context.get cframe) in
    match f.status with
    | Some x -> x
    | None ->
      let x = fresh_cvar ~basename:"status" Cil_const.intType in
      f.status <- Some x ; x

  let trigger tg =
    if tg <> Qed.Engine.TgAny then
      let f = Context.get cframe in
      f.triggers <- tg :: f.triggers

  let make_chunk_constraints f =
    if not (Wp_parameters.RTE.get()) then []
    else LabelMap.fold (fun _ s l -> M.is_well_formed s :: l) f.labels []

  let guards f =
    let constraints = in_frame f (fun () -> make_chunk_constraints f) () in
    Lang.hypotheses f.gamma @ constraints

  (* -------------------------------------------------------------------------- *)
  (* --- Environments                                                       --- *)
  (* -------------------------------------------------------------------------- *)

  type env = {
    vars : logic Logic_var.Map.t ; (* pure : not cvar *)
    lhere : sigma option ;
    current : sigma option ;
  }

  let mk_env ?here ?(lvars=[]) () =
    let lvars = List.fold_left
        (fun lvars lv ->
           let x = fresh_lvar ~basename:lv.lv_name lv.lv_type in
           let v = Vexp(e_var x) in
           Logic_var.Map.add lv v lvars)
        Logic_var.Map.empty lvars in
    { lhere = here ; current = here ; vars = lvars }

  let getsigma = function Some s -> s | None ->
    Warning.error "No current memory (missing \\at)"

  let current e = getsigma e.current

  let move_at env s = { env with lhere = Some s ; current = Some s }

  let env_at env label =
    let s = if Clabels.is_here label then env.lhere else Some(mem_frame label)
    in { env with current = s }

  let mem_at env label =
    if Clabels.is_here label
    then getsigma env.lhere
    else mem_frame label

  let env_let env x v = { env with vars = Logic_var.Map.add x v env.vars }
  let env_letp env x p = env_let env x (Vexp (F.e_prop p))
  let env_letval env x = function
    | Loc l -> env_let env x (Vloc l)
    | Val e -> env_let env x (Cvalues.plain x.lv_type e)

  (* -------------------------------------------------------------------------- *)
  (* --- Signature Generators                                               --- *)
  (* -------------------------------------------------------------------------- *)

  let param_of_lv lv =
    let t = Lang.tau_of_ltype lv.lv_type in
    freshvar ~basename:lv.lv_name t

  let profile_sig lvs =
    List.map param_of_lv lvs ,
    List.map (fun lv -> Sig_value lv) lvs

  let profile_mem l vars =
    let signature = profile_sig l.l_profile in
    if vars = [] then signature
    else
      let heap = List.fold_left
          (fun m x ->
             let obj = object_of x.vtype in
             M.Sigma.Chunk.Set.union m (M.domain obj (M.cvar x))
          ) M.Sigma.Chunk.Set.empty vars
      in List.fold_left
        (fun acc l ->
           let label = Clabels.of_logic l in
           let sigma = Sigma.create () in
           M.Sigma.Chunk.Set.fold_sorted
             (fun chunk (parm,sigm) ->
                let x = Sigma.get sigma chunk in
                let s = Sig_chunk (chunk,label) in
                ( x::parm , s :: sigm )
             ) heap acc
        ) signature l.l_labels

  let rec profile_env vars domain sigv = function
    | [] -> { vars=vars ; lhere=None ; current=None } , domain , List.rev sigv
    | lv :: profile ->
      let x = param_of_lv lv in
      let h = has_ltype lv.lv_type (e_var x) in
      let v = Cvalues.plain lv.lv_type (e_var x) in
      profile_env
        (Logic_var.Map.add lv v vars)
        (h::domain)
        ((lv,x)::sigv)
        profile

  let default_label env = function
    | [l] -> move_at env (mem_frame (Clabels.of_logic l))
    | _ -> env

  (* -------------------------------------------------------------------------- *)
  (* --- Generic Compiler                                                   --- *)
  (* -------------------------------------------------------------------------- *)

  let occurs_pvars f p = Vars.exists f (F.varsp p)
  let occurs_ps x ps = List.exists (F.occursp x) ps

  let compile_step
      (tres: logic_type option)
      (name:string)
      (types:string list)
      (profile:logic_var list)
      (labels:logic_label list)
      (cc : env -> 'a -> 'b)
      (filter : 'b -> var -> bool)
      (data : 'a)
    : tau * var list * trigger list * pred list * 'b * sig_param list =
    let frame = logic_frame name types in
    in_frame frame
      begin fun () ->
        let tres = Lang.tau_of_return tres in
        let env,domain,sigv = profile_env Logic_var.Map.empty [] [] profile in
        let env = default_label env labels in
        let result = cc env data in
        let types = Lang.get_hypotheses () in
        let used_domain p = occurs_pvars (filter result) p in
        let domain = List.filter used_domain (domain @ types) in
        let used_var (_,x) = filter result x || occurs_ps x domain in
        let used = List.filter used_var sigv in
        let parp = List.map snd used in
        let sigp = List.map (fun (lv,_) -> Sig_value lv) used in
        let domain = make_chunk_constraints frame @ domain in
        let (parm,sigm) =
          LabelMap.fold
            (fun label sigma acc ->
               M.Sigma.Chunk.Set.fold_sorted
                 (fun chunk acc ->
                    if filter result (Sigma.get sigma chunk) then
                      let (parm,sigm) = acc in
                      let x = Sigma.get sigma chunk in
                      let s = Sig_chunk(chunk,label) in
                      ( x::parm , s::sigm )
                    else acc)
                 (Sigma.domain sigma) acc)
            frame.labels (parp,sigp)
        in
        tres, parm , frame.triggers , domain , result , sigm
      end ()

  let cc_term : (env -> Cil_types.term -> term) ref
    = ref (fun _ _ -> assert false)
  let cc_pred : (polarity -> env -> predicate -> pred) ref
    = ref (fun _ _ -> assert false)
  let cc_logic : (env -> Cil_types.term -> logic) ref
    = ref (fun _ _ -> assert false)
  let cc_region
    : (env -> Cil_types.term -> loc Sigs.region) ref
    = ref (fun _ -> assert false)

  let term env t = !cc_term env t
  let pred polarity env t = !cc_pred polarity env t
  let logic env t = !cc_logic env t
  let region env t = !cc_region env t
  let reads env ts = List.iter (fun t -> ignore (logic env t.it_content)) ts

  let bootstrap_term cc = cc_term := cc
  let bootstrap_pred cc = cc_pred := cc
  let bootstrap_logic cc = cc_logic := cc
  let bootstrap_region cc = cc_region := cc

  let in_term t x = F.occurs x t
  let in_pred p x = F.occursp x p
  let in_reads _ _ = true

  let is_recursive l =
    if LogicUsage.is_recursive l then Rec else Def

  (* -------------------------------------------------------------------------- *)
  (* --- Compiling Lemmas                                                   --- *)
  (* -------------------------------------------------------------------------- *)

  let rec strip_forall xs p = match p.pred_content with
    | Pforall(qs,q) -> strip_forall (xs @ qs) q
    | _ -> xs , p

  let compile_lemma cluster name ~kind types labels lemma =
    let qs,prop = strip_forall [] lemma in
    let _,xs,tgs,domain,prop,_ =
      let cc_pred = pred `Positive in
      compile_step None name types qs labels cc_pred in_pred prop in
    let weak = Wp_parameters.WeakIntModel.get () in
    let lemma = if weak then prop else F.p_hyps domain prop in
    {
      l_name = name ;
      l_kind = kind ;
      l_triggers = [tgs] ;
      l_forall = xs ;
      l_cluster = cluster ;
      l_lemma = lemma ;
    }

  (* -------------------------------------------------------------------------- *)
  (* --- Type Signature of Logic Function                                   --- *)
  (* -------------------------------------------------------------------------- *)

  let type_for_signature l ldef sigp =
    match l.l_type with
    | None -> ()
    | Some tr ->
      match Cvalues.ldomain tr with
      | None -> ()
      | Some p ->
        let name = "T" ^ Lang.logic_id l in
        let vs = List.map e_var ldef.d_params in
        let rec conditions vs sigp =
          match vs , sigp with
          | v::vs , Sig_value lv :: sigp ->
            let cond = has_ltype lv.lv_type v in
            cond :: conditions vs sigp
          | _ -> [] in
        let result = F.e_fun ldef.d_lfun vs in
        let lemma = p_hyps (conditions vs sigp) (p result) in
        let trigger = Trigger.of_term result in
        Definitions.define_lemma {
          l_name = name ;
          l_kind = Admit ;
          l_forall = ldef.d_params ;
          l_triggers = [[trigger]] ;
          l_cluster = ldef.d_cluster ;
          l_lemma = lemma ;
        }

  (* -------------------------------------------------------------------------- *)
  (* --- Compiling Pure Logic Function                                      --- *)
  (* -------------------------------------------------------------------------- *)

  let compile_lbpure cluster l =
    let frame = logic_frame l.l_var_info.lv_name l.l_tparams in
    in_frame frame
      begin fun () ->
        let lfun = Lang.acsl l in
        let tau = Lang.tau_of_return l.l_type in
        let parp,sigp = Lang.local profile_sig l.l_profile in
        let ldef = {
          d_lfun = lfun ;
          d_types = List.length l.l_tparams ;
          d_params = parp ;
          d_cluster = cluster ;
          d_definition = Logic tau ;
        } in
        Definitions.update_symbol ldef ;
        Signature.update l (SIG sigp) ;
        parp,sigp
      end ()

  (* -------------------------------------------------------------------------- *)
  (* --- Compiling Abstract Logic Function (in axiomatic with no reads)     --- *)
  (* -------------------------------------------------------------------------- *)

  let compile_lbnone cluster l vars =
    let frame = logic_frame l.l_var_info.lv_name l.l_tparams in
    in_frame frame
      begin fun () ->
        let lfun = Lang.acsl l in
        let tau = Lang.tau_of_return l.l_type in
        let parm,sigm = Lang.local (profile_mem l) vars in
        let ldef = {
          d_lfun = lfun ;
          d_types = List.length l.l_tparams ;
          d_params = parm ;
          d_cluster = cluster ;
          d_definition = Logic tau ;
        } in
        Definitions.define_symbol ldef ;
        type_for_signature l ldef sigm ; SIG sigm
      end ()

  (* -------------------------------------------------------------------------- *)
  (* --- Compiling Logic Function with Reads                                --- *)
  (* -------------------------------------------------------------------------- *)

  let compile_lbreads cluster l ts =
    let lfun = Lang.acsl l in
    let name = l.l_var_info.lv_name in
    let tau,xs,_,_,(),s =
      compile_step l.l_type name l.l_tparams l.l_profile l.l_labels
        reads in_reads ts
    in
    let ldef = {
      d_lfun = lfun ;
      d_types = List.length l.l_tparams ;
      d_params = xs ;
      d_cluster = cluster ;
      d_definition = Logic tau ;
    } in
    Definitions.define_symbol ldef ;
    type_for_signature l ldef s ; SIG s

  (* -------------------------------------------------------------------------- *)
  (* --- Compiling Recursive Logic Body                                     --- *)
  (* -------------------------------------------------------------------------- *)

  let compile_rec name l cc filter data =
    let tau = l.l_type in
    let types = l.l_tparams in
    let profile = l.l_profile in
    let labels = l.l_labels in
    let result = compile_step tau name types profile labels cc filter data in
    if LogicUsage.is_recursive l then
      begin
        let (_,_,_,_,_,s) = result in
        Signature.update l (SIG s) ;
        compile_step tau name types profile labels cc filter data
      end
    else result

  (* -------------------------------------------------------------------------- *)
  (* --- Compiling Logic Function with Definition                           --- *)
  (* -------------------------------------------------------------------------- *)

  let compile_lbterm cluster l t =
    let name = l.l_var_info.lv_name in
    let tau,xs,_,_,r,s = compile_rec name l term in_term t in
    match F.repr r with
    | Qed.Logic.Kint c -> CST c
    | _ ->
      let ldef = {
        d_lfun = Lang.acsl l ;
        d_types = List.length l.l_tparams ;
        d_params = xs ;
        d_cluster = cluster ;
        d_definition = Function(tau,is_recursive l,r) ;
      } in
      Definitions.define_symbol ldef ; SIG s

  (* -------------------------------------------------------------------------- *)
  (* --- Compiling Logic Predicate with Definition                          --- *)
  (* -------------------------------------------------------------------------- *)

  let compile_lbpred cluster l p =
    let lfun = Lang.acsl l in
    let name = l.l_var_info.lv_name in
    let cc_pred = pred `Positive in
    let _,xs,_,_,r,s = compile_rec name l cc_pred in_pred p in
    let ldef = {
      d_lfun = lfun ;
      d_types = List.length l.l_tparams ;
      d_params = xs ;
      d_cluster = cluster ;
      d_definition = Predicate(is_recursive l,r) ;
    } in
    Definitions.define_symbol ldef ; SIG s

  let heap_case labels_used support = function
    | Sig_value _ -> support
    | Sig_chunk(chk,l_case) ->
      let l_ind =
        try LabelMap.find l_case labels_used
        with Not_found -> LabelSet.empty
      in
      let l_chk =
        try Heap.Map.find chk support
        with Not_found -> LabelSet.empty
      in
      Heap.Map.add chk (LabelSet.union l_chk l_ind) support

  (* -------------------------------------------------------------------------- *)
  (* --- Compiling Inductive Logic                                          --- *)
  (* -------------------------------------------------------------------------- *)

  let compile_lbinduction cluster l cases = (* unused *)
    (* Temporarily defines l to reads only its formals *)
    let parp,sigp = compile_lbpure cluster l in
    (* Compile cases with default definition and collect used chunks *)
    let support = List.fold_left
        (fun support (case,labels,types,lemma) ->
           let _,_,_,_,_,s =
             let cc_pred = pred `Positive in
             compile_step l.l_type case types [] labels cc_pred in_pred lemma in
           let labels_used = LogicUsage.get_induction_labels l case in
           List.fold_left (heap_case labels_used) support s)
        Heap.Map.empty cases in
    (* Make signature with collected chunks *)
    let (parm,sigm) =
      let frame = logic_frame l.l_var_info.lv_name l.l_tparams in
      in_frame frame
        (fun () ->
           Heap.Map.fold_sorted
             (fun chunk labels acc ->
                let basename = Chunk.basename_of_chunk chunk in
                let tau = Chunk.tau_of_chunk chunk in
                LabelSet.fold
                  (fun label (parm,sigm) ->
                     let x = Lang.freshvar ~basename tau in
                     x :: parm , Sig_chunk(chunk,label) :: sigm
                  ) labels acc)
             support (parp,sigp)
        ) () in
    (* Set global Signature *)
    let lfun = Lang.acsl l in
    let ldef = {
      d_lfun = lfun ;
      d_types = List.length l.l_tparams ;
      d_params = parm ;
      d_cluster = cluster ;
      d_definition = Logic Qed.Logic.Prop ;
    } in
    Definitions.update_symbol ldef ;
    Signature.update l (SIG sigm) ;
    (* Re-compile final cases *)
    let cases = List.map
        (fun (case,labels,types,lemma) ->
           compile_lemma cluster ~kind:Admit case types labels lemma)
        cases in
    Definitions.update_symbol { ldef with d_definition = Inductive cases } ;
    type_for_signature l ldef sigp (* sufficient *) ; SIG sigm

  let compile_logic cluster section l =
    let s_rec = List.map (fun x -> Sig_value x) l.l_profile in
    Signature.update l (SIG s_rec) ;
    match l.l_body with
    | LBnone ->
      let vars = match section with
        | Toplevel _ -> []
        | Axiomatic a -> Varinfo.Set.elements a.ax_reads
      in if l.l_labels <> [] && vars = [] then
        Wp_parameters.warning ~once:true ~current:false
          "No definition for '%s' interpreted as reads nothing"
          l.l_var_info.lv_name ;
      compile_lbnone cluster l vars
    | LBterm t -> compile_lbterm cluster l t
    | LBpred p -> compile_lbpred cluster l p
    | LBreads ts -> compile_lbreads cluster l ts
    | LBinductive cases -> compile_lbinduction cluster l cases

  (* -------------------------------------------------------------------------- *)
  (* --- Retrieving Signature                                               --- *)
  (* -------------------------------------------------------------------------- *)

  let define_type cluster lt =
    let constrainer = match lt with
      | { lt_def = Some(LTsum(ctors)) ; lt_name ; lt_params=[] } ->
        let frame = logic_frame lt_name [] in
        in_frame frame
          begin fun () ->
            let lfun = Lang.generated_p ~coloring:true ("is_" ^ lt_name) in
            let tau_lt = Lang.tau_of_ltype (Ltype(lt, [])) in
            Typedefs.update lt (Some lfun) ;
            let term_constraint ltyp =
              let v = Lang.freshvar ~basename:"p" (Lang.tau_of_ltype ltyp) in
              v, (has_ltype ltyp (Lang.F.e_var v))
            in
            let ctor_to_prop = function
              | { ctor_name = l_name ; ctor_params = ts } as const ->
                let vs, cs = List.split (List.map term_constraint ts) in
                let ts = List.map Lang.F.e_var vs in
                let const = F.e_fun ~result:tau_lt (Lang.ctor const) ts in
                let is_lt = F.p_call lfun [const] in
                {
                  l_name ;
                  l_kind = Admit ;
                  l_triggers = [frame.triggers] ;
                  l_forall = vs ;
                  l_cluster = cluster ;
                  l_lemma = p_hyps cs is_lt ;
                }
            in
            let cases = List.map ctor_to_prop ctors in
            Definitions.define_symbol {
              d_lfun = lfun ;
              d_types = 0 ;
              d_params = [ Lang.freshvar ~basename:"v" tau_lt ] ;
              d_cluster = cluster ;
              d_definition = Inductive cases
            } ;
            Some lfun
          end ()
      | { lt_def = Some(LTsum(_)) ; lt_params=_ } ->
        Wp_parameters.not_yet_implemented "Type parameters for sum types"
      | _ -> None
    in
    Typedefs.update lt constrainer ;
    Definitions.define_type cluster lt

  let define_logic c a = Signature.compile (compile_logic c a)

  let define_lemma c l =
    if l.lem_labels <> [] && Wp_parameters.has_dkey dkey_lemma then
      Wp_parameters.warning ~source:(fst l.lem_loc)
        "Lemma '%s' has labels, consider using global invariant instead."
        l.lem_name ;
    let { tp_kind = kind ; tp_statement = p } = l.lem_predicate in
    Definitions.define_lemma
      (compile_lemma c ~kind l.lem_name l.lem_types l.lem_labels p)

  let define_axiomatic cluster ax =
    begin
      List.iter (define_type cluster) ax.ax_types ;
      List.iter (define_logic cluster (Axiomatic ax)) ax.ax_logics ;
      List.iter (define_lemma cluster) ax.ax_lemmas ;
    end

  let lemma l =
    try Definitions.find_lemma l
    with Not_found ->
      let section = LogicUsage.section_of_lemma l.lem_name in
      let cluster = Definitions.section section in
      begin
        match section with
        | Toplevel _ -> define_lemma cluster l
        | Axiomatic ax -> define_axiomatic cluster ax
      end ;
      Definitions.find_lemma l

  let signature phi =
    try Signature.find phi
    with Not_found ->
      let section = LogicUsage.section_of_logic phi in
      let cluster = Definitions.section section in
      match section with
      | Toplevel _ ->
        Signature.memoize (compile_logic cluster section) phi
      | Axiomatic ax ->
        (* force compilation of entire axiomatics *)
        define_axiomatic cluster ax ;
        try Signature.find phi
        with Not_found ->
          Wp_parameters.fatal ~current:true
            "Axiomatic '%s' compiled, but '%a' not"
            ax.ax_name Printer.pp_logic_var phi.l_var_info

  let rec logic_type t =
    match Logic_utils.unroll_type ~unroll_typedef:false t with
    | Ctype _ -> ()
    | Lboolean | Linteger | Lreal | Lvar _ | Larrow _ -> ()
    | Ltype(lt,ps) ->
      List.iter logic_type ps ;
      if not (Typedefs.mem lt) then
        begin
          Typedefs.update lt None ;
          if not (Lang.is_builtin lt) then
            let section = LogicUsage.section_of_type lt in
            let cluster = Definitions.section section in
            match section with
            | Toplevel _ ->
              define_type cluster lt
            | Axiomatic ax ->
              (* force compilation of entire axiomatics *)
              define_axiomatic cluster ax
        end
  let () = compile_logic_type := logic_type

  let logic_profile phi =
    begin
      List.iter (fun x -> logic_type x.lv_type) phi.l_profile ;
      Option.iter logic_type phi.l_type ;
    end

  (* -------------------------------------------------------------------------- *)
  (* --- Binding Formal with Actual w.r.t Signature                         --- *)
  (* -------------------------------------------------------------------------- *)

  let rec bind_labels env phi_labels labels : M.Sigma.t LabelMap.t =
    match phi_labels, labels with
    | [], [] -> LabelMap.empty
    | l1 :: phi_labels, l2 :: labels ->
      let l1 = Clabels.of_logic l1 in
      let l2 = Clabels.of_logic l2 in
      LabelMap.add l1 (mem_at env l2) (bind_labels env phi_labels labels)
    | _ -> Wp_parameters.fatal "Incorrect by AST typing"

  let call_params env
      (phi:logic_info)
      (labels:logic_label list)
      (sparam : sig_param list)
      (parameters:F.term list)
    : F.term list =
    logic_profile phi ;
    let mparams = wrap_lvar phi.l_profile parameters in
    let mlabels = bind_labels env phi.l_labels labels in
    List.map
      (function
        | Sig_value lv -> Logic_var.Map.find lv mparams
        | Sig_chunk(c,l) ->
          let sigma =
            try LabelMap.find l mlabels
            with Not_found ->
              Wp_parameters.fatal "*** Label %a not-found@." Clabels.pretty l
          in
          M.Sigma.value sigma c
      ) sparam

  let call_fun env
      (result:F.tau)
      (phi:logic_info)
      (labels:logic_label list)
      (parameters:F.term list) : F.term =
    match signature phi with
    | CST c -> e_zint c
    | SIG sparam ->
      let es = call_params env phi labels sparam parameters in
      F.e_fun ~result (Lang.acsl phi) es

  let call_pred env
      (phi:logic_info)
      (labels:logic_label list)
      (parameters:F.term list) : F.pred =
    match signature phi with
    | CST _ -> assert false
    | SIG sparam ->
      let es = call_params env phi labels sparam parameters in
      F.p_call (Lang.acsl phi) es

  (* -------------------------------------------------------------------------- *)
  (* --- Variable Bindings                                                  --- *)
  (* -------------------------------------------------------------------------- *)

  let logic_var env x =
    try Logic_var.Map.find x env.vars
    with Not_found ->
    try
      (* It is here because currently the application of a function
         of arity 0 are represented in the AST as a variable not
         as an application of the function with no arguments *)
      let cst = Logic_env.find_logic_cons x in
      let result = Lang.tau_of_ltype x.lv_type in
      let v =
        match LogicBuiltins.logic cst with
        | ACSLDEF -> call_fun env result cst [] []
        | HACK phi -> phi []
        | LFUN phi -> e_fun ~result phi []
      in Cvalues.plain x.lv_type v
    with Not_found ->
      if Logic_env.is_logic_function x.lv_name then
        Warning.error "Lambda-functions not yet implemented (at '%s')"
          x.lv_name
      else
        Wp_parameters.fatal "Name '%a' has no definition in term"
          Printer.pp_logic_var x

  let logic_info env f =
    try
      match Logic_var.Map.find f.l_var_info env.vars with
      | Vexp p -> Some (F.p_bool p)
      | _ -> Wp_parameters.fatal "Variable '%a' is not a predicate"
               Logic_info.pretty f
    with Not_found -> None

end
