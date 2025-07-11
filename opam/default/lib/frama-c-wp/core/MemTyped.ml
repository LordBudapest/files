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
(* --- Empty Memory Model                                                 --- *)
(* -------------------------------------------------------------------------- *)

open Cil_types
open Cil_datatype
open Ctypes
open Lang
open Lang.F
open Sigs
open Definitions
open MemMemory

let dkey_layout = Wp_parameters.register_category "layout"

module L = Qed.Logic

(* -------------------------------------------------------------------------- *)
(* --- Model Configuration                                                --- *)
(* -------------------------------------------------------------------------- *)

let datatype = "MemTyped"
let hypotheses p = p
let configure () =
  begin
    let orig_pointer = Context.push Lang.pointer MemAddr.t_addr in
    let orig_null    = Context.push Cvalues.null (p_equal MemAddr.null) in
    let rollback () =
      Context.pop Lang.pointer orig_pointer ;
      Context.pop Cvalues.null orig_null ;
    in
    rollback
  end

let configure_ia =
  let no_binder = { bind = fun _ f v -> f v } in
  fun _vertex -> no_binder

(* -------------------------------------------------------------------------- *)
(* --- Model Parameters                                                   --- *)
(* -------------------------------------------------------------------------- *)

type pointer = NoCast | Fits | Unsafe
let pointer = Context.create "MemTyped.pointer"

(* -------------------------------------------------------------------------- *)
(* --- Model Semantics                                                    --- *)
(* -------------------------------------------------------------------------- *)

(*

   the semantic is defined using these notions:
    - base, offset: has the usual C semantic

    - memory model consists of:
         - an allocation table A : base -> int
         - for each kind of cell (char,int,float,pointer(ptr)) with type T, a map (M_T) : addr -> T

    - a pointer is record { base ; offset }, offset are in number of cells

    - allocation table: indicate the size (in number of cell not sizeof)
       allocated of each base.
         - = 0 : free
         - > 0 : allocated read-write
         - < 0 : allocated read only

   semantic of all these functions:

    - region(base -> int): the regions represent the natural partition of the memory
       by the time when it have been allocated. So the regions are
       identified by a number. So the addresses in one base are all in
       the same region. Caveat the [region] function doesn't associate
       the base to its region directly but to a congruence class that
       depend of each function but which keeps the order:
        - = 1 : regions corresponds to formals
        - = 2 : regions corresponds to locals
        - > 2 : freshly allocated bases (malloc)
        - = 0 : globals (except string literals)
        - < 0 : string literals (-its id)

    - framed(M_ptr): All pointer values accessible from the memory M (of pointers),
      lives in region <= 0. Hence separated from locals, formals, and
      freshly allocated in the current function.

    - linked(A): The proposition [linked] indicate that an allocation
      table were the globals are allocated.

    - sconst(M_char): Indicate that the memory M (of chars) contains the values of
      string literals at their bases.

*)

(* -------------------------------------------------------------------------- *)
(* --- Chunks                                                             --- *)
(* -------------------------------------------------------------------------- *)

type chunk =
  | M_int of Ctypes.c_int
  | M_f32
  | M_f64
  | M_pointer
  | T_alloc
  | T_init

module Chunk =
struct
  type t = chunk
  let self = "typed"
  let int_rank = function
    | CBool -> 0
    | UInt8 -> 1
    | SInt8 -> 2
    | UInt16 -> 3
    | SInt16 -> 4
    | UInt32 -> 5
    | SInt32 -> 6
    | UInt64 -> 7
    | SInt64 -> 8

  let rank = function
    | M_int i -> int_rank i
    | M_f32 -> 9
    | M_f64 -> 10
    | M_pointer -> 11
    | T_alloc -> 12
    | T_init -> 13
  let hash = rank
  let basename = function
    | M_int i when Ctypes.is_char i -> "Mchar"
    | M_int _ -> "Mint"
    | M_f32 -> "Mf32"
    | M_f64 -> "Mf64"
    | M_pointer -> "Mptr"
    | T_alloc -> "Malloc"
    | T_init -> "Init"
  let compare a b = rank a - rank b
  let equal = (=)
  let pretty fmt = function
    | M_int i -> Format.fprintf fmt "M%a" Ctypes.pp_int i
    | m -> Format.pp_print_string fmt (basename m)
  let val_of_chunk = function
    | M_int _ -> L.Int
    | M_f32 -> Cfloat.tau_of_float Ctypes.Float32
    | M_f64 -> Cfloat.tau_of_float Ctypes.Float64
    | M_pointer -> MemAddr.t_addr
    | T_alloc -> L.Int
    | T_init -> L.Bool
  let tau_of_chunk = function
    | M_int _ -> L.Array(MemAddr.t_addr,L.Int)
    | M_pointer -> L.Array(MemAddr.t_addr,MemAddr.t_addr)
    | M_f32 -> L.Array(MemAddr.t_addr,Cfloat.tau_of_float Ctypes.Float32)
    | M_f64 -> L.Array(MemAddr.t_addr,Cfloat.tau_of_float Ctypes.Float64)
    | T_alloc -> t_malloc
    | T_init -> t_init
  let basename_of_chunk = basename
  let is_framed _ = false
end

module Heap = Qed.Collection.Make(Chunk)
module Sigma = Sigma.Make(Chunk)(Heap)

type loc = term (* of type addr *)

(* -------------------------------------------------------------------------- *)
(* --- Utilities on locations                                             --- *)
(* -------------------------------------------------------------------------- *)

let m_float = function Float32 -> M_f32 | Float64 -> M_f64

let rec footprint = function
  | C_int i -> Heap.Set.singleton (M_int i)
  | C_float f -> Heap.Set.singleton (m_float f)
  | C_pointer _ -> Heap.Set.singleton M_pointer
  | C_array a -> footprint (object_of a.arr_element)
  | C_comp c -> footprint_comp c

and footprint_comp { cfields } =
  match cfields with
  | None -> all_value_chunks ()
  | Some fields ->
    List.fold_left
      (fun ft f ->
         Heap.Set.union ft (footprint (object_of f.ftype))
      ) Heap.Set.empty fields

and all_value_chunks () =
  let ints =
    List.fold_left (fun l i -> M_int i :: l) []
      [ Ctypes.CBool ;
        SInt8 ; UInt8 ; SInt16 ; UInt16 ; SInt32 ; UInt32 ; SInt64 ; UInt64 ]
  in
  Heap.Set.of_list (M_pointer :: M_f32 :: M_f64 :: ints)

let init_footprint _ _ = Heap.Set.singleton T_init
let value_footprint obj _l = footprint obj

(* Note that it is the length in MemTyped and not the occupied bytes *)
module OPAQUE_COMP_LENGTH = WpContext.Generator(Cil_datatype.Compinfo)
    (struct
      let name = "MemTyped.EmptyCompLength"
      type key = compinfo
      type data = lfun
      let compile c =
        if c.cfields <> None then
          Wp_parameters.fatal
            "Asking for opaque struct length on non opaque struct" ;
        let result = Lang.t_int in
        let size =
          Lang.generated_f ~params:[] ~result "Length_of_%s" (Lang.comp_id c)
        in
        (* Registration *)
        Definitions.define_symbol {
          d_cluster = Definitions.compinfo c ;
          d_lfun = size ; d_types = 0 ; d_params = [] ;
          d_definition = Logic result ;
        } ;
        Definitions.define_lemma {
          l_kind = Admit ;
          l_name = "Positive_Length_of_" ^ Lang.comp_id c ;
          l_triggers = [] ; l_forall = [] ;
          l_cluster = Definitions.compinfo c ;
          l_lemma = Lang.F.(p_lt e_zero (e_fun size []))
        } ;
        size
    end)

let rec length_of_object = function
  | C_int _ | C_float _ | C_pointer _ -> e_one
  | C_comp c -> length_of_comp c
  | C_array { arr_flat = Some { arr_size = n } ; arr_element = elt } ->
    e_mul (e_int n) (length_of_typ elt)
  | C_array _ as a ->
    if Wp_parameters.ExternArrays.get () then
      e_int max_int
    else
      Warning.error ~source:"Typed Model"
        "Undefined array-size (%a)" Ctypes.pretty a

and length_of_typ t = length_of_object (object_of t)
and length_of_field f = length_of_typ f.ftype
and length_of_comp c =
  match c.cfields with
  | None ->
    Lang.F.e_fun (OPAQUE_COMP_LENGTH.get c) []
  | Some fields ->
    (* union field are considered as struct field *)
    e_sum (List.map length_of_field fields)

let position_of_field f =
  let rec fnext k f = function
    | [] -> assert false
    | g::gs ->
      if Fieldinfo.equal f g then k
      else fnext (e_add k (length_of_field g)) f gs
      (* Just as we fail if the field does not exists, we fail
         if we try to get a field position in an opaque struct. *)
  in fnext e_zero f (Option.get f.fcomp.cfields)

(* -------------------------------------------------------------------------- *)
(* --- Utilities on loc-as-term                                           --- *)
(* -------------------------------------------------------------------------- *)

type sigma = Sigma.t
type domain = Sigma.domain
type segment = loc rloc

let pretty fmt l = F.pp_term fmt l
let vars l = F.vars l
let occurs x l = F.occurs x l

(* -------------------------------------------------------------------------- *)
(* --- Generated Axiomatization                                           --- *)
(* -------------------------------------------------------------------------- *)

let cluster_globals () =
  Definitions.cluster ~id:"Globals" ~title:"Global Variables" ()

type shift =
  | RS_Field of fieldinfo * term (* offset of the field *)
  | RS_Index of term  (* size of the shift *)

let phi_base = function
  | p::_ -> MemAddr.base p
  | _ -> raise Not_found

let phi_field offset = function
  | [p] -> e_add (MemAddr.offset p) offset
  | _ -> raise Not_found

let phi_index size = function
  | [p;k] -> e_add (MemAddr.offset p) (F.e_mul size k)
  | _ -> raise Not_found

module RegisterShift = WpContext.Static
    (struct
      type key = lfun
      type data = shift
      let name = "MemTyped.RegisterShift"
      include Lang.Fun
    end)

module ShiftFieldDef = WpContext.StaticGenerator(Cil_datatype.Fieldinfo)
    (struct
      let name = "MemTyped.ShiftFieldDef"
      type key = fieldinfo
      type data = dfun

      let generate f =
        let result = MemAddr.t_addr in
        let lfun = Lang.generated_f ~result "shiftfield_%s" (Lang.field_id f) in
        let position = position_of_field f in
        (* Since its a generated it is the unique name given *)
        let xloc = Lang.freshvar ~basename:"p" MemAddr.t_addr in
        let loc = e_var xloc in
        let def = MemAddr.shift loc position in
        let dfun = Definitions.Function( result , Def , def) in
        RegisterShift.define lfun (RS_Field(f,position)) ;
        MemAddr.register ~base:phi_base ~offset:(phi_field position) lfun ;
        {
          d_lfun = lfun ; d_types = 0 ;
          d_params = [xloc] ;
          d_definition = dfun ;
          d_cluster = Definitions.dummy () ;
        }

      let compile = Lang.local generate
    end)

module ShiftField = WpContext.Generator(Cil_datatype.Fieldinfo)
    (struct
      let name = "MemTyped.ShiftField"
      type key = fieldinfo
      type data = lfun
      let compile fd =
        let dfun = ShiftFieldDef.get fd in
        let d_cluster = MemLoader.cluster () in
        Definitions.define_symbol { dfun with d_cluster } ;
        dfun.d_lfun
    end)

module Cobj =
struct
  type t = c_object
  let pretty = C_object.pretty
  let compare = compare_ptr_conflated
end

(* This is a model-independent generator,
   which will be inherited from the model-dependent clusters *)
module ShiftGen = WpContext.StaticGenerator(Cobj)
    (struct
      let name = "MemTyped.ShiftDef"
      type key = c_object
      type data = dfun

      let rec c_object_id fmt = function
        | C_int i -> pp_int fmt i
        | C_float f -> pp_float fmt f
        | C_pointer _ -> Format.fprintf fmt "PTR"
        | C_comp c -> Format.pp_print_string fmt (Lang.comp_id c)
        | C_array a ->
          let te = object_of a.arr_element in
          match a.arr_flat with
          | None -> Format.fprintf fmt "A_%a" c_object_id te
          | Some f -> Format.fprintf fmt "A%d_%a" f.arr_size c_object_id te

      let c_object_id c = Format.asprintf "%a@?" c_object_id c

      let generate obj =
        let result = MemAddr.t_addr in
        let shift = Lang.generated_f ~result "shift_%s" (c_object_id obj) in
        let size = length_of_object obj in
        (* Since its a generated it is the unique name given *)
        let xloc = Lang.freshvar ~basename:"p" MemAddr.t_addr in
        let loc = e_var xloc in
        let xk = Lang.freshvar ~basename:"k" Qed.Logic.Int in
        let k = e_var xk in
        let def = MemAddr.shift loc (F.e_mul size k) in
        let dfun = Definitions.Function( result , Def , def) in
        RegisterShift.define shift (RS_Index size) ;
        MemAddr.register ~base:phi_base ~offset:(phi_index size)
          ~linear:true shift ;
        {
          d_lfun = shift ; d_types = 0 ;
          d_params = [xloc;xk] ;
          d_definition = dfun ;
          d_cluster = Definitions.dummy () ;
        }

      let compile = Lang.local generate
    end)

(* The model-dependent derivation of model-independent ShiftDef *)
module Shift = WpContext.Generator(Cobj)
    (struct
      let name = "MemTyped.Shift"
      type key = c_object
      type data = lfun
      let compile obj =
        let dfun = ShiftGen.get obj in
        let d_cluster = MemLoader.cluster () in
        Definitions.define_symbol { dfun with d_cluster } ;
        dfun.d_lfun
    end)

let field l f =
  MemMemory.unsupported_union f ;
  e_fun (ShiftField.get f) [l]

let shift l obj k = e_fun (Shift.get obj) [l;k]

module LITERAL =
struct
  type t = int * Cstring.cst
  let compare (a:t) (b:t) = Stdlib.compare (fst a) (fst b)
  let pretty fmt (eid,cst) = Format.fprintf fmt "%a@%d" Cstring.pretty cst eid
end

module EID = State_builder.Ref(Datatype.Int)
    (struct
      let name = "Wp.MemTyped.EID"
      let dependencies = [Ast.self]
      let default () = 0
    end)

module STRING = WpContext.Generator(LITERAL)
    (struct
      let name = "MemTyped.STRING"
      type key = LITERAL.t
      type data = term

      let linked prefix base cst =
        let name = prefix ^ "_linked" in
        let a = Lang.freshvar ~basename:"alloc" (Chunk.tau_of_chunk T_alloc) in
        let m = e_var a in
        let m_linked = MemAddr.linked m in
        let alloc = F.e_get m base in (* The size is alloc-1 *)
        let sized = Cstring.str_len cst (F.e_add alloc F.e_minus_one) in
        Definitions.define_lemma {
          l_kind = Admit ;
          l_name = name ;
          l_triggers = [] ; l_forall = [] ;
          l_lemma = p_forall [a] (p_imply m_linked sized) ;
          l_cluster = Cstring.cluster () ;
        }

      let region prefix base cst =
        let name = prefix ^ "_region" in
        let re = - Cstring.str_id cst in
        Definitions.define_lemma {
          l_kind = Admit ;
          l_name = name ; l_triggers = [] ; l_forall = [] ;
          l_lemma = p_equal (MemAddr.region base) (e_int re) ;
          l_cluster = Cstring.cluster () ;
        }

      let sconst prefix base cst =
        (* describe the content of literal strings *)
        let name = prefix ^ "_literal" in
        let i = Lang.freshvar ~basename:"i" L.Int in
        let c = Cstring.char_at cst (e_var i) in
        let ikind = Ctypes.c_char () in
        let addr = shift (MemAddr.global base) (C_int ikind) (e_var i) in
        let m =
          Lang.freshvar ~basename:"mchar" (Chunk.tau_of_chunk (M_int ikind)) in
        let m_sconst = MemMemory.sconst (e_var m) in
        let v = F.e_get (e_var m) addr in
        let read = F.p_equal c v in
        Definitions.define_lemma {
          l_kind = Admit ;
          l_name = name ; l_triggers = [] ;
          l_forall = [m;i] ;
          l_cluster = Cstring.cluster () ;
          l_lemma = F.p_imply m_sconst read ;
        }

      let fresh () =
        let eid = succ (EID.get ()) in
        EID.set eid ; eid

      let compile (_,cst) =
        let eid = fresh () in
        let lfun = Lang.generated_f ~result:L.Int "Str_%d" eid in
        (* Since its a generated it is the unique name given *)
        let prefix = Lang.Fun.debug lfun in
        let base = F.e_fun lfun [] in
        Definitions.define_symbol {
          d_lfun = lfun ; d_types = 0 ; d_params = [] ;
          d_definition = Logic L.Int ;
          d_cluster = Cstring.cluster () ;
        } ;
        Definitions.define_lemma {
          l_name = prefix ^ "_base" ;
          l_kind = Admit ;
          l_triggers = [] ; l_forall = [] ;
          l_lemma = F.p_lt base F.e_zero ;
          l_cluster = Cstring.cluster () ;
        } ;
        region prefix base cst ;
        linked prefix base cst ;
        sconst prefix base cst ;
        base

    end)

(* -------------------------------------------------------------------------- *)
(* --- Base Registration                                                  --- *)
(* -------------------------------------------------------------------------- *)

module RegisterBASE = WpContext.Index
    (struct
      type key = lfun
      type data = varinfo
      let name = "MemTyped.RegisterBASE"
      include Lang.Fun
    end)

module BASE = WpContext.Generator(Varinfo)
    (struct
      let name = "MemTyped.BASE"
      type key = varinfo
      type data = term

      let region prefix x base =
        let name = prefix ^ "_region" in
        let re = if x.vglob then 0 else if x.vformal then 1 else 2 in
        Definitions.define_lemma {
          l_kind = Admit ;
          l_name = name ; l_triggers = [] ; l_forall = [] ;
          l_lemma = p_equal (MemAddr.region base) (e_int re) ;
          l_cluster = cluster_globals () ;
        }

      let sizeof x =
        Warning.handle
          ~handler:(fun _ -> None)
          ~fallback:(Printf.sprintf "No allocation size for variable '%s'" x.vname)
          (fun t -> Some (length_of_object @@ Ctypes.object_of t))
          x.vtype

      let linked prefix x base =
        let name = prefix ^ "_linked" in
        let size = if x.vglob then sizeof x else Some e_zero in
        match size with
        | None -> ()
        | Some size ->
          let a = Lang.freshvar ~basename:"alloc" t_malloc in
          let m = e_var a in
          let m_linked = MemAddr.linked m in
          let base_size = p_equal (F.e_get m base) size in
          Definitions.define_lemma {
            l_kind = Admit ;
            l_name = name ;
            l_triggers = [] ; l_forall = [] ;
            l_lemma = p_forall [a] (p_imply m_linked base_size) ;
            l_cluster = cluster_globals () ;
          }

      let initialization prefix x base =
        match sizeof x with
        | Some size when Cvalues.always_initialized x ->
          let a = Lang.freshvar ~basename:"init" t_init in
          let m = e_var a in
          let init_access =
            if size = e_one then
              p_bool (F.e_get m (MemAddr.mk_addr base e_zero))
            else
              F.p_call p_is_init_r [ m ; MemAddr.mk_addr base e_zero ; size ]
          in
          let m_init = MemMemory.cinits m in
          let init_prop = p_forall [a] (p_imply m_init init_access) in
          Definitions.define_lemma {
            l_kind = Admit ;
            l_name = prefix ^ "_init" ;
            l_triggers = [] ; l_forall = [] ;
            l_lemma = init_prop ;
            l_cluster = cluster_globals () ;
          }
        | _ -> ()

      let generate x =
        let acs_rd = Cil.typeHasQualifier "const" x.vtype in
        let prefix =
          if x.vglob
          then if acs_rd then "K" else "G"
          else if x.vformal then "P" else "L" in
        let lfun = Lang.generated_f
            ~category:L.Constructor ~result:L.Int "%s_%s_%d"
            prefix x.vorig_name x.vid in
        (* Since its a generated it is the unique name given *)
        let prefix = Lang.Fun.debug lfun in
        let vid = if acs_rd then (-x.vid-1) else succ x.vid in
        let dfun = Definitions.Function( L.Int , Def , e_int vid ) in
        Definitions.define_symbol {
          d_lfun = lfun ; d_types = 0 ; d_params = [] ; d_definition = dfun ;
          d_cluster = cluster_globals () ;
        } ;
        let base = e_fun lfun [] in
        RegisterBASE.define lfun x ;
        region prefix x base ;
        linked prefix x base ;
        initialization prefix x base ;
        base

      let compile = Lang.local generate
    end)

(* -------------------------------------------------------------------------- *)
(* --- Locations                                                          --- *)
(* -------------------------------------------------------------------------- *)

let null = MemAddr.null (* as a loc *)

let literal ~eid cst =
  shift (MemAddr.global (STRING.get (eid,cst))) (C_int (Ctypes.c_char ())) e_zero

let cvar x = MemAddr.global (BASE.get x)

let pointer_loc t = t
let pointer_val t = t

let allocated sigma l = F.e_get (Sigma.value sigma T_alloc) (MemAddr.base l)

let base_addr l = MemAddr.mk_addr (MemAddr.base l) e_zero
let base_offset l = MemAddr.base_offset (MemAddr.base l) (MemAddr.offset l)
let block_length sigma obj l =
  let n_cells = e_div (allocated sigma l) (length_of_object obj) in
  match obj with
  | C_comp ({ cfields = None } as c) ->
    e_mul (Cvalues.bytes_length_of_opaque_comp c) n_cells
  | _ ->
    e_fact (Ctypes.sizeof_object obj) n_cells

(* -------------------------------------------------------------------------- *)
(* --- Cast                                                               --- *)
(* -------------------------------------------------------------------------- *)

module Layout : sig
  val pretty : Format.formatter -> c_object -> unit

  val fits: dst:c_object -> src:c_object -> bool
  (* returns [true] in these cases:
     - [dst] fits into [src] (exists cobj; [src] = [dst] concat cobj)
     - [dst] equals    [src] ([dst] = [src]) *)
end =
struct

  type atom = P of typ | I of c_int | F of c_float

  let pp_atom fmt = function
    | P ty -> Printer.pp_typ fmt (TPtr(ty,[]))
    | I i -> Ctypes.pp_int fmt i
    | F f -> Ctypes.pp_float fmt f

  let eq_atom a1 a2 =
    match a1 , a2 with
    | P _ , P _ -> true
    | I i1 , I i2 -> i1 = i2
    | F f1 , F f2 -> f1 = f2
    | _ -> false

  type slot = A of atom
            | S of Cil_types.compinfo (* delayed layout of a C struct *)
            | U of Cil_types.compinfo (* delayed layout of a C union *)

  let pp_slot fmt = function
    | A a -> pp_atom fmt a
    | S s -> Format.fprintf fmt "{struct %a}" Printer.pp_compinfo s
    | U u -> Format.fprintf fmt "{union %a}" Printer.pp_compinfo u

  let eq_slot a1 a2 = (* syntactic equality *)
    match a1 , a2 with
    | A a1 , A a2 -> eq_atom a1 a2
    | S c1 , S c2 | U c1, U c2 -> Compinfo.equal c1 c2
    | _ -> false

  let rec get_slot = function
    | C_int i -> A (I i)
    | C_float f -> A (F f)
    | C_pointer t -> A (P t)
    | C_comp ( { cfields = Some [f] } as c ) ->
      begin (* union having only one field is equivalent to a struct *)
        match Ctypes.object_of f.ftype with
        | C_array _ -> (if c.cstruct then S c else U c)
        | cobj -> get_slot cobj
      end
    | C_comp c -> if c.cstruct then S c else U c
    | C_array _ -> assert false

  type block =
    | Str of slot * int64
    | Arr of c_object * int64 (* delayed layout of a C type *)
    | Garbled

  let pp_block fmt = function
    | Str(a,n) when n=1L -> pp_slot fmt a
    | Str(a,n) -> Format.fprintf fmt "%a[%Ld]" pp_slot a n
    | Arr(o,n) -> Format.fprintf fmt "{ctype %a}[%Ld]" Ctypes.pretty o n
    | Garbled -> Format.fprintf fmt "..."

  let add_slot a n w =
    assert (n >= 1L) ;
    match w with
    | Str(b,m) :: w when eq_slot a b -> Str(b,Int64.add m n)::w
    | _ -> Str(a,n) :: w

  let add_block p w =
    match p , w with
    | Str(a,n) , Str(b,m)::w when eq_slot a b -> Str(b,Int64.add n m)::w
    | Garbled , Garbled::_ -> w
    | _ -> p :: w

  type layout = block list

  let pp_layout fmt = function
    | [b] -> pp_block fmt b
    | bs ->
      begin
        Format.fprintf fmt "@[<hov 2>{" ;
        List.iter (fun b -> Format.fprintf fmt "@ %a" pp_block b) bs ;
        Format.fprintf fmt " }@]" ;
      end

  (* requires n > 1 *)
  let rec add_many cobj n w = (* returns [layout obj]*n @ [w] *)
    assert (n > 1L) ;
    match cobj, w with
    | C_array { arr_flat = Some a }, _ when a.arr_cell_nbr = 1L ->
      add_many (Ctypes.object_of a.arr_cell) n w
    | C_array _, Arr(o, m)::w when 0 = compare_ptr_conflated o cobj ->
      Arr(o, Int64.add m n)::w
    | C_array _, _ -> Arr(cobj, n)::w
    | _  -> add_slot (get_slot cobj) n w

  let rec rlayout w = function (* returns [layout obj] @ [w] *)
    | C_array { arr_flat = Some a } ->
      let cobj = Ctypes.object_of a.arr_cell in
      if a.arr_cell_nbr = 1L
      then rlayout w cobj
      else add_many cobj a.arr_cell_nbr w
    | C_array { arr_element = e } ->
      if Wp_parameters.ExternArrays.get () then
        add_many (Ctypes.object_of e) Int64.max_int w
      else
        add_block Garbled w
    | cobj -> add_slot (get_slot cobj) 1L w

  let layout (obj : c_object) : layout = rlayout [] obj

  let clayout (c: Cil_types.compinfo) : layout =
    match c.cfields with
    | None ->
      [Garbled]
    | Some fields ->
      let flayout w f = rlayout w (Ctypes.object_of f.ftype) in
      List.fold_left flayout [] (List.rev fields)

  type comparison = Srem of layout | Drem of layout | Equal | Mismatch

  let add_array o n w =
    assert (n > 0L) ;
    if n=1L then rlayout w o else Arr(o, n)::w

  let decr_slot a n w =
    assert (n >= 1L);
    if n=1L then w else Str(a, Int64.pred n)::w

  let rec equal u v =
    match compare ~dst:u ~src:v with
    | Equal -> true
    | _ -> false
  and compare_slot ~dst ~src =
    match dst, src with
    | A a1, A a2 -> if eq_atom a1 a2 then Equal else Mismatch
    | S c1, S c2 | U c1, U c2 when Compinfo.equal c1 c2 -> Equal
    | S c1, _    -> compare ~dst:(clayout c1) ~src:[Str(src,1L)]
    |    _, S c2 -> compare ~dst:[Str(dst,1L)] ~src:(clayout c2)
    | U c1, U c2 ->  (* for union, the layouts must be equal *)
      if equal (clayout c1) (clayout c2) then Equal else Mismatch
    | U _, A _ -> Mismatch
    | A _, U _ -> Mismatch
  and compare ~dst ~src =
    match dst , src with
    | [] , [] -> Equal     (* src = dst *)
    | [] , obj -> Srem obj (* src = dst @ obj *)
    | obj , [] -> Drem obj (* dst = src @ obj *)
    | p::w1 , q::w2 ->
      match p , q with
      | Garbled , _ | _ , Garbled -> Mismatch
      | Str(a,n) , Str(b,m) ->
        begin
          match compare_slot ~dst:a ~src:b with
          | Mismatch -> Mismatch
          | Drem a'->
            let w1 = a' @ decr_slot a n w1 in
            let w2 =      decr_slot b m w2 in
            compare ~dst:w1 ~src:w2
          | Srem b' ->
            let w1 =      decr_slot a n w1 in
            let w2 = b' @ decr_slot b m w2 in
            compare ~dst:w1 ~src:w2
          | Equal ->
            if n < m then
              let w2 = Str(a,Int64.sub m n)::w2 in
              compare ~dst:w1 ~src:w2
            else if n > m then
              let w1 = Str(a,Int64.sub n m)::w1 in
              compare ~dst:w1 ~src:w2
            else
              (* n = m *)
              compare ~dst:w1 ~src:w2
        end
      | Arr(u,n) , Arr(v,m) ->
        begin
          match compare ~dst:(layout u) ~src:(layout v) with
          | Mismatch -> Mismatch
          | Drem u' ->
            let w1 = u' @ add_array u (Int64.pred n) w1 in
            let w2 =      add_array v (Int64.pred m) w2 in
            compare ~dst:w1 ~src:w2
          | Srem v' ->
            let w1 =      add_array u (Int64.pred n) w1 in
            let w2 = v' @ add_array v (Int64.pred m) w2 in
            compare ~dst:w1 ~src:w2
          | Equal ->
            if n < m then
              let w2 = add_array v (Int64.sub m n) w2 in
              compare ~dst:w1 ~src:w2
            else if n > m then
              let w1 = add_array u (Int64.sub n m) w1 in
              compare ~dst:w1 ~src:w2
            else
              (* n = m *)
              compare ~dst:w1 ~src:w2
        end
      | Arr(u,n) , Str _ ->
        compare ~dst:((layout u) @ add_array u (Int64.pred n) w1) ~src
      | Str _ , Arr(v,n) ->
        compare ~dst ~src:((layout v) @ add_array v (Int64.pred n) w2)

  let rec repeated ~dst ~src =
    match dst , src with
    | [] , [] -> true (* src = dst *)
    | _ , [] -> false  (* empty source layout *)
    | [] , _ -> false  (* empty destination layout *)
    | [p] , [q] -> begin
        match p , q with
        | Garbled , _ | _ , Garbled -> false
        | Str(a,n) , Str(b,m) -> (* dst =?= repeated(src,n/m) *)
          begin
            match compare_slot ~dst:a ~src:b with
            | Mismatch -> false
            | Drem a' ->
              let w1 = a' @ decr_slot a n [] in
              let w2 =      decr_slot b m [] in
              let cmp = compare ~dst:w1 ~src:w2 in
              repeated_result ~src cmp
            | Srem _ ->
              false
            | Equal -> (* dst =?= repeated(src,n/m) *)
              n >= m && (Int64.rem n m = 0L)
          end
        | Arr(u,n) , Arr(v,m) ->
          begin
            match compare ~dst:(layout u) ~src:(layout v) with
            | Mismatch -> false
            | Drem u' ->
              let w1 = u' @ add_array u (Int64.pred  n) [] in
              let w2 = add_array v (Int64.pred m) [] in
              let cmp = compare ~dst:w1 ~src:w2 in
              repeated_result ~src cmp
            | Srem _ ->
              false
            | Equal -> (* dst =?= repeated(src,n/m) *)
              n >= m && (Int64.rem n m = 0L)
          end
        | _ , _ -> repeated_compare ~dst ~src
      end
    | _ , _ -> repeated_compare ~dst ~src
  and repeated_compare ~dst ~src = repeated_result ~src (compare ~dst ~src)
  and repeated_result ~src = function
    | Equal -> true
    | Mismatch | Srem _ -> false
    | Drem dst -> repeated ~dst ~src

  let fits ~dst ~src =
    match dst , src with
    | C_int i1 , C_int i2 -> i1 = i2
    | C_float f1 , C_float f2 -> f1 = f2
    | C_comp c , C_comp d when Compinfo.equal c d -> true
    | C_pointer _ , C_pointer _ -> true
    | _ ->
      let src = layout src in
      match compare ~dst:(layout dst) ~src with
      | Equal | Srem _ -> true
      | Mismatch -> false
      | Drem dst -> repeated ~dst ~src

  let rec pretty fmt = function
    | C_pointer ty -> Format.fprintf fmt "%a*" pretty (Ctypes.object_of ty)
    | obj -> pp_layout fmt (layout obj)

end


let pp_mismatch fmt s =
  if Context.get pointer <> NoCast && Wp_parameters.has_dkey dkey_layout then
    Format.fprintf fmt
      "Cast with incompatible pointers types@\n\
       @[@[Source: %a*@]@ @[(layout: %a)@]@]@\n\
       @[@[Target: %a*@]@ @[(layout: %a)@]@]"
      Ctypes.pretty s.pre Layout.pretty s.pre
      Ctypes.pretty s.post Layout.pretty s.post
  else
    Format.fprintf fmt
      "@[<hov 3>Cast with incompatible pointers types\
       @ (source: %a*)@ (target: %a*)@]"
      Ctypes.pretty s.pre Ctypes.pretty s.post

let cast s l =
  if l==null then null else
    begin
      match Context.get pointer with
      | NoCast -> Warning.error ~source:"Typed Model" "%a" pp_mismatch s
      | Fits ->
        if Layout.fits ~dst:s.post ~src:s.pre then l else
          Warning.error ~source:"Typed Model" "%a" pp_mismatch s
      | Unsafe ->
        if not (Layout.fits ~dst:s.post ~src:s.pre) then
          Warning.emit ~severe:false ~source:"Typed Model"
            ~fallback:"Keep pointer value"
            "%a" pp_mismatch s ; l
    end

let loc_of_int _ v = MemAddr.addr_of_int v
let int_of_loc _ l = MemAddr.int_of_addr l

(* -------------------------------------------------------------------------- *)
(* --- Frames                                                             --- *)
(* -------------------------------------------------------------------------- *)

let frames obj addr = function
  | T_alloc -> []
  | m ->
    let offset = length_of_object obj in
    let sizeof = F.e_one in
    let tau = Chunk.val_of_chunk m in
    let basename = Chunk.basename_of_chunk m in
    MemMemory.frames ~addr ~offset ~sizeof ~basename tau

(* -------------------------------------------------------------------------- *)
(* --- Chunk element type                                                 --- *)
(* -------------------------------------------------------------------------- *)

module ChunkContent = WpContext.Generator(Chunk)
    (struct
      let name = "MemTyped.ChunkContent"
      type key = Chunk.t
      type data = lfun

      let int_kind = function
        | M_int k -> k
        | _ -> failwith "MemTyped asked constraint for non int type"

      let generate c =
        let k = int_kind c in
        let p = Lang.freshvar ~basename:"m" (Chunk.tau_of_chunk c) in
        let m = e_var p in
        let name = Format.asprintf "is_%a_chunk" Ctypes.pp_int k in
        let lfun = Lang.generated_p ~coloring:true name in
        let l = Lang.freshvar ~basename:"l" (Lang.t_addr()) in
        let is_int = Cint.range k in
        let def = p_forall [l] (is_int (F.e_get m (e_var l))) in
        Definitions.define_symbol {
          d_lfun = lfun ; d_types = 0 ;
          d_params = [p] ;
          d_definition = Predicate(Def, def) ;
          d_cluster = cluster ~id:"Chunk" ~title:"Chunk type constraint" () ;
        } ;
        lfun

      let compile = Lang.local generate
    end)

let is_chunk sigma = function
  | M_int _ as m ->
    F.p_call (ChunkContent.get m) [ Sigma.value sigma m ]
  | _ ->
    p_true

let is_well_formed sigma =
  let open Sigma in
  p_conj (Chunk.Set.fold (fun c l -> is_chunk sigma c :: l) (domain sigma) [])

(* -------------------------------------------------------------------------- *)
(* --- Loader                                                             --- *)
(* -------------------------------------------------------------------------- *)

module MODEL =
struct
  module Chunk = Chunk
  module Sigma = Sigma
  let name = "MemTyped.LOADER"
  type nonrec loc = loc
  let field = field
  let shift = shift
  let sizeof = length_of_object
  let init_footprint = init_footprint
  let value_footprint = value_footprint
  let frames = frames
  let to_addr l = l
  let to_region_pointer l = 0,l
  let of_region_pointer _ _ l = l

  let load_int sigma i l = F.e_get (Sigma.value sigma (M_int i)) l
  let load_float sigma f l = F.e_get (Sigma.value sigma (m_float f)) l
  let load_pointer sigma _t l = F.e_get (Sigma.value sigma M_pointer) l

  let last sigma obj l =
    let n = length_of_object obj in
    e_sub (F.e_div (allocated sigma l) n) e_one

  let havoc obj loc ~length chunk ~fresh ~current =
    if chunk <> T_alloc then
      let n = F.e_mul (length_of_object obj) length in
      F.e_fun f_havoc [fresh;current;loc;n]
    else fresh

  let eqmem_forall obj loc _chunk m1 m2 =
    let xp = Lang.freshvar ~basename:"p" MemAddr.t_addr in
    let p = F.e_var xp in
    let n = length_of_object obj in
    let separated = F.p_call MemAddr.p_separated [p;e_one;loc;n] in
    let equal = p_equal (e_get m1 p) (e_get m2 p) in
    [xp],separated,equal

  let updated sigma c l v = c , F.e_set (Sigma.value sigma c) l v

  let store_int sigma i l v = updated sigma (M_int i) l v
  let store_float sigma f l v = updated sigma (m_float f) l v
  let store_pointer sigma _ty l v = updated sigma M_pointer l v

  let set_init_atom sigma _obj l v = updated sigma T_init l v
  let is_init_atom sigma _ l = F.e_get (Sigma.value sigma T_init) l

  let is_init_range sigma obj loc length =
    let n = F.e_mul (length_of_object obj) length in
    F.p_call p_is_init_r [ Sigma.value sigma T_init ; loc ; n ]

  let set_init obj loc ~length _chunk ~current =
    let n = F.e_mul (length_of_object obj) length in
    F.e_fun f_set_init [current;loc;n]
(*
  let monotonic_init s1 s2 =
    let m1 = Sigma.value s1 T_init in
    let m2 = Sigma.value s2 T_init in
    F.p_call p_monotonic [m1; m2]
*)
end

module LOADER = MemLoader.Make(MODEL)

let load = LOADER.load
let load_init = LOADER.load_init
let stored = LOADER.stored
let stored_init = LOADER.stored_init
let copied = LOADER.copied
let copied_init = LOADER.copied_init
let initialized = LOADER.initialized
let domain = LOADER.domain

let assigned seq obj loc =
  (* Maintain always initialized values initialized *)
  Assert (MemMemory.cinits (Sigma.value seq.post T_init)) ::
  LOADER.assigned seq obj loc

(* -------------------------------------------------------------------------- *)
(* --- Loc Comparison                                                     --- *)
(* -------------------------------------------------------------------------- *)

let loc_compare f_cmp i_cmp p q =
  match F.is_equal (MemAddr.base p) (MemAddr.base q) with
  | L.Yes -> i_cmp (MemAddr.offset p) (MemAddr.offset q)
  | L.Maybe | L.No -> f_cmp p q

let is_null l = p_equal l null
let loc_eq = p_equal
let loc_neq = p_neq
let loc_lt = loc_compare MemAddr.addr_lt p_lt
let loc_leq = loc_compare MemAddr.addr_le p_leq
let loc_diff obj p q =
  let delta = e_sub (MemAddr.offset p) (MemAddr.offset q) in
  let size = length_of_object obj in
  e_div delta size

(* -------------------------------------------------------------------------- *)
(* --- Validity                                                           --- *)
(* -------------------------------------------------------------------------- *)

let s_valid sigma acs p n =
  let valid = match acs with
    | RW -> MemAddr.valid_rw
    | RD -> MemAddr.valid_rd
    | OBJ -> (fun m p _ -> MemAddr.valid_obj m p)
  in
  valid (Sigma.value sigma T_alloc) p n

let s_invalid sigma p n =
  MemAddr.invalid (Sigma.value sigma T_alloc) p n

let segment phi = function
  | Rloc(obj,l) ->
    phi l (length_of_object obj)
  | Rrange(l,obj,Some a,Some b) ->
    let l = shift l obj a in
    let n = e_mul (length_of_object obj) (e_range a b) in
    phi l n
  | Rrange(l,_,a,b) ->
    Wp_parameters.abort ~current:true
      "Invalid infinite range @[<hov 2>%a+@,(%a@,..%a)@]"
      F.pp_term l Vset.pp_bound a Vset.pp_bound b

let valid sigma acs = segment (s_valid sigma acs)
let invalid sigma = segment (s_invalid sigma)

let frame sigma =
  let wellformed_frame phi chunk =
    if Sigma.mem sigma chunk
    then [ phi (Sigma.value sigma chunk) ]
    else []
  in
  wellformed_frame MemAddr.linked T_alloc @
  wellformed_frame MemMemory.cinits T_init @
  wellformed_frame MemMemory.sconst (M_int (Ctypes.c_char ())) @
  wellformed_frame MemMemory.framed M_pointer

let alloc sigma xs =
  if xs = [] then sigma else Sigma.havoc_chunk sigma T_alloc

let scope seq scope xs =
  if xs = [] then [] else
    let alloc =
      List.fold_left
        (fun m x ->
           let size = match scope with
             | Sigs.Leave -> e_zero
             | Sigs.Enter -> length_of_typ x.vtype
           in F.e_set m (BASE.get x) size)
        (Sigma.value seq.pre T_alloc) xs in
    [ p_equal (Sigma.value seq.post T_alloc) alloc ]

let global _sigma p = p_leq MemAddr.(region @@ base p) e_zero

(* -------------------------------------------------------------------------- *)
(* --- Segments                                                           --- *)
(* -------------------------------------------------------------------------- *)

let included =
  let addrof l = l in
  let sizeof = length_of_object in
  MemAddr.included ~shift ~addrof ~sizeof

let separated =
  let addrof l = l in
  let sizeof = length_of_object in
  MemAddr.separated ~shift ~addrof ~sizeof

(* -------------------------------------------------------------------------- *)
(* --- State Model                                                        --- *)
(* -------------------------------------------------------------------------- *)

type state = chunk Tmap.t

let rec lookup_a e =
  match F.repr e with
  | L.Fun( f , [e] ) when MemAddr.is_f_global f -> lookup_a e
  | L.Fun( f , es ) -> lookup_f f es
  | _ -> raise Not_found

and lookup_f f es =
  try match RegisterShift.find f , es with
    | RS_Field(fd,_) , [e] -> Mstate.field (lookup_lv e) fd
    | RS_Index _ , [e;k] -> Mstate.index (lookup_lv e) k
    | _ -> raise Not_found
  with Not_found when es = [] ->
    Sigs.(Mvar (RegisterBASE.find f),[])

and lookup_lv e = try lookup_a e with Not_found -> Sigs.(Mmem e,[])

let mchunk c =
  match c with
  | T_init -> Sigs.Mchunk (Pretty_utils.to_string Chunk.pretty c, KInit)
  | _ -> Sigs.Mchunk (Pretty_utils.to_string Chunk.pretty c, KValue)

let lookup s e =
  try mchunk (Tmap.find e s)
  with Not_found ->
  try match F.repr e with
    | L.Fun( f , es ) -> Sigs.Maddr (lookup_f f es)
    | L.Aget( m , k ) when Tmap.find m s = T_init ->
      Sigs.Mlval (lookup_lv k, KInit)
    | L.Aget( m , k ) when Tmap.find m s <> T_alloc ->
      Sigs.Mlval (lookup_lv k, KValue)
    | _ -> Sigs.Mterm
  with Not_found -> Sigs.Mterm

let apply f s =
  Tmap.fold (fun m c w -> Tmap.add (f m) c w) s Tmap.empty

let iter f s = Tmap.iter (fun m c -> f (mchunk c) m) s

let state (sigma : sigma) =
  let s = ref Tmap.empty in
  Sigma.iter (fun c x -> s := Tmap.add (e_var x) c !s) sigma ; !s

let heap domain state =
  Tmap.fold (fun m c w ->
      if Vars.intersect (F.vars m) domain
      then Heap.Map.add c m w else w
    ) state Heap.Map.empty

let rec diff v1 v2 =
  if v1 == v2 then Bag.empty else
    match F.repr v2 with
    | L.Aset( m , k , v ) ->
      let lv = lookup_lv k in
      let upd = Mstore( lv , v ) in
      Bag.append (diff v1 m) upd
    | _ ->
      Bag.empty

let updates seq domain =
  let pool = ref Bag.empty in
  let pre = heap domain seq.pre in
  let post = heap domain seq.post in
  Heap.Map.iter2
    (fun chunk v1 v2 ->
       if chunk <> T_alloc then
         match v1 , v2 with
         | Some v1 , Some v2 -> pool := Bag.concat (diff v1 v2) !pool
         | _ -> ())
    pre post ;
  !pool

(* -------------------------------------------------------------------------- *)
