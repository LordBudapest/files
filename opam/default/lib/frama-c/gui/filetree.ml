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

open Cil_types
open Cil_datatype
open Gtk_helper

(* To debug performance related to height of lines *)
let fixed_height = false

type filetree_node =
  | File of Datatype.Filepath.t * Cil_types.global list
  | Global of Cil_types.global

let same_node n1 n2 = match n1, n2 with
  | File (f1, _), File (f2, _) -> f1 = f2
  | Global g1, Global g2 -> Cil_datatype.Global.equal g1 g2
  | _ -> false

let _pretty_node fmt = function
  | File (s, _) -> Datatype.Filepath.pretty fmt s
  | Global (GFun ({svar = vi},_) | GVar(vi,_,_) |
            GFunDecl (_,vi,_) | GVarDecl(vi,_)) ->
    Format.fprintf fmt "%s" vi.vname
  | _ -> ()

(* Fetches the internal (hidden) GtkButton of the column header.
   Experimentally, to first force gtk to create a header button for the column,
   you should:
   - add first the column to the table;
   - explicitely set the widget of the header (and this widget should not be a
     button itself).
     Otherwise, this function will return None. *)
let get_column_header_button (col: GTree.view_column) =
  let rec get_button = function
    | None -> None
    | Some w ->
      if w#misc#get_type = "GtkButton"
      then
        let but_props = GtkButtonProps.Button.cast w#as_widget in
        Some (new GButton.button but_props)
      else get_button w#misc#parent
  in
  get_button col#widget

class type t =  object
  method model : GTree.model
  method flat_mode: bool
  method set_file_attribute:
    ?strikethrough:bool -> ?text:string -> Datatype.Filepath.t -> unit
  method set_global_attribute:
    ?strikethrough:bool -> ?text:string -> varinfo -> unit
  method add_global_filter:
    text:string -> key:string -> (Cil_types.global -> bool) ->
    (unit -> bool) * GMenu.check_menu_item
  method get_file_globals:
    Datatype.Filepath.t -> (string * bool) list
  method find_visible_global:
    string -> Cil_types.global option
  method add_select_function :
    (was_activated:bool -> activating:bool -> filetree_node -> unit) -> unit
  method append_text_column:
    title:string -> tooltip:string ->
    visible:(unit -> bool) -> text:(global -> string) ->
    ?sort:(global -> global -> int) ->
    ([`Visibility | `Contents] -> unit)
  method append_pixbuf_column:
    title:string -> (global list -> GTree.cell_properties_pixbuf list) ->
    (unit -> bool) -> ([`Visibility | `Contents] -> unit)
  method select_global : Cil_types.global -> bool
  method selected_globals : Cil_types.global list
  method view : GTree.view
  method reset : unit -> unit
  method register_reset_extension : (t -> unit) -> unit
  method refresh_columns : unit -> unit
end

(* crude way to to debug inefficiencies with the gtk interface *)
(*let c = ref 0
  let gtk s = incr c; Format.printf "[%d %s]@." !c s
*)

module MAKE(TREE:sig type t val sons: t -> t array end) =
struct
  type custom_tree =
    {finfo: TREE.t;
     mutable sons: custom_tree array;
     parent: custom_tree option;
     fidx: int (* invariant: parent.(fidx)==myself *) }

  let inbound i a = i>=0 && i<Array.length a

  (** The custom model itself *)
  class custom_tree_class column_list =
    object(self)
      inherit
        [custom_tree,custom_tree,unit,unit] GTree.custom_tree_model column_list as parent

      method custom_encode_iter cr = cr, (), ()
      method custom_decode_iter cr () () = cr
      method! custom_flags = [`ITERS_PERSIST]
      val mutable num_roots : int = 0
      val mutable roots :  custom_tree array = [||]
      method get_roots = roots

      method custom_get_iter (path:Gtk.tree_path) : custom_tree option =
        let indices: int array  = GTree.Path.get_indices path in
        match indices with
        | [||] ->
          None
        | _ ->
          if inbound indices.(0) roots then
            let result = ref (roots.(indices.(0))) in
            try
              for depth=1 to Array.length indices - 1 do
                let index = indices.(depth) in
                if inbound index !result.sons then
                  result:=!result.sons.(index)
                else raise Not_found
              done;
              Some !result
            with Not_found ->
              None
          else None

      method custom_get_path (row:custom_tree) : Gtk.tree_path =
        let current_row = ref row in
        let path = ref [] in
        while !current_row.parent <> None do
          path := !current_row.fidx::!path;
          current_row := match !current_row.parent with Some p -> p
                                                      | None -> assert false
        done;
        GTree.Path.create ((!current_row.fidx)::!path)

      method custom_value (_t:Gobject.g_type) (_row:custom_tree) ~column:_ =
        assert false

      method custom_iter_next (row:custom_tree) : custom_tree option =
        let nidx = succ row.fidx in
        match row.parent with
        | None -> if inbound nidx roots then Some roots.(nidx)
          else None
        | Some parent ->
          if inbound nidx parent.sons then
            Some parent.sons.(nidx)
          else None

      method custom_iter_children (rowopt:custom_tree option) :custom_tree option =
        match rowopt with
        | None -> if inbound 0 roots then Some roots.(0) else None
        | Some row -> if inbound 0 row.sons then Some row.sons.(0) else None

      method custom_iter_has_child (row:custom_tree) : bool =
        Array.length row.sons  > 0

      method custom_iter_n_children (rowopt:custom_tree option) : int =
        match rowopt with
        | None -> Array.length roots
        | Some row -> Array.length row.sons

      method custom_iter_nth_child (rowopt:custom_tree option) (n:int)
        : custom_tree option =
        match rowopt with
        | None when inbound n roots -> Some roots.(n)
        | Some row when inbound n row.sons -> Some (row.sons.(n))
        | _ -> None

      method custom_iter_parent (row:custom_tree) : custom_tree option =
        row.parent

      method custom_foreach f =
        let f p _ = f p (match self#custom_get_iter p with
            | Some v -> v
            | None -> assert false)
        in
        parent#foreach f

      method set_tree (fill_cache:int list->custom_tree->unit) (t:TREE.t list) =
        num_roots <- 0;
        let rec make_forest pos root sons =
          Array.mapi
            (fun i t -> let result = {finfo=t; fidx=i; parent = Some root;
                                      sons = [||] }
              in
              fill_cache (i::pos) result;
              let sons = make_forest (i::pos) result (TREE.sons t) in
              result.sons<-sons;
              result)
            sons
        in
        let new_roots = List.map
            (fun t ->
               let pos = num_roots in
               num_roots <- num_roots+1;
               let root = { finfo = t; sons = [||];
                            parent = None;
                            fidx = pos }
               in
               fill_cache [pos] root;
               let sons = make_forest [pos] root (TREE.sons t)
               in
               root.sons <- sons;
               root)
            t
        in
        roots <- Array.of_list new_roots

      method clear () =
        self#custom_foreach (fun p _ ->
            self#custom_row_deleted p;
            false)
    end

  let custom_tree () = new custom_tree_class (new GTree.column_list)
end

module MYTREE = struct
  type storage = { mutable name : string;
                   globals: global array;
                   mutable strikethrough: bool}


  type t = MFile of storage*t list | MGlobal of storage

  (* Sort order of the rows. *)
  type sort_order =
    | Ascending   (* Ascending alphabetical order on names. *)
    | Descending  (* Descending alphabetical order on names. *)
    | Custom of (global -> global -> int)  (* Custom order on globals. *)

  let inverse_sort = function
    | Ascending -> Descending
    | Descending -> Ascending
    | Custom sort -> Custom (fun g h -> sort h g)

  let storage_type = function
    | MFile (s, _) -> File (Datatype.Filepath.of_string s.name,
                            Array.to_list s.globals)
    | MGlobal { globals = [| g |] } -> Global g
    | MGlobal _ -> assert false

  let sons t = match t with
    | MFile (_,s) -> Array.of_list s
    | MGlobal _ -> [| |]


  let sons_info = function
    | MFile (_, l) ->
      List.map (function
          | MGlobal { name = n; strikethrough = st } -> (n, st)
          | MFile _ -> assert false (* should not happen, a file is
                                       never under a file in the tree *)
        ) l
    | MGlobal _ -> []

  let get_storage t = match t with
    | MFile (s,_) -> s
    | MGlobal s -> s

  let is_function_global = function
    | GFun _ | GFunDecl _ -> true
    | _ -> false

  let is_defined_global = function
    | GFun _ | GVar _ | GEnumTag _ | GCompTag _ -> true
    | _ -> false

  let is_undefined_global = function
    | GFunDecl _ | GVarDecl _ | GEnumTagDecl _ | GCompTagDecl _ -> true
    | _ -> false

  let is_builtin_global g =
    Cil.hasAttribute "FC_BUILTIN" (Cil_datatype.Global.attr g)

  let comes_from_share filename =
    let path = Filepath.Normalized.of_string filename in
    Filepath.is_relative ~base_name:System_config.Share.main path

  let is_function t = match t with
    | MFile _ -> false
    | MGlobal {globals = [| g |]} -> is_function_global g
    | MGlobal _ -> false

  let default_storage s globals =
    {
      name = s;
      globals = globals;
      strikethrough = false;
    }

  let global_name s = Pretty_utils.to_string Printer.pp_varname s
  let extension_name e = Pretty_utils.to_string Printer.pp_short_extended e

  let ga_name = function
    | Dfun_or_pred (li, _) ->
      Some (global_name li.l_var_info.lv_name)
    | Dvolatile _ -> Some "volatile clause"
    | Daxiomatic (s, _, _,_) -> Some (global_name s)
    | Dmodule (s, _, _, _, _) -> Some (global_name s)
    | Dtype (lti, _) -> Some (global_name lti.lt_name)
    | Dlemma (s, _, _, _, _,_) -> Some (global_name s)
    | Dinvariant (li, _) -> Some (global_name li.l_var_info.lv_name)
    | Dtype_annot (li, _) -> Some (global_name li.l_var_info.lv_name)
    | Dmodel_annot (mf, _) -> Some (global_name mf.mi_name)
    | Dextended (e,_,_) -> Some ("ACSL extension " ^ (extension_name e))

  let make_list_globals hide sort_order globs =
    (* Association list binding names to globals. *)
    let l = List.fold_left
        (* Correct the function sons_info above if a [File] constructor can
           appear in [sons] *)
        (fun acc glob ->
           match glob with
           | GFun ({svar=vi},_) | GVar(vi,_,_)
           | GVarDecl(vi,_) | GFunDecl (_, vi, _)->
             (* Only display the last declaration/definition *)
             if hide glob || (not (Ast.is_def_or_last_decl glob))
             then acc
             else ((global_name vi.vname), glob) :: acc

           | GAnnot (ga, _) ->
             if hide glob
             then acc
             else (match ga_name ga with
                 | None -> acc
                 | Some s -> (s, glob) :: acc)
           | _ -> acc)
        []
        globs
    in
    let sort =
      match sort_order with
      | Ascending ->  fun (s1, _) (s2, _) -> Extlib.compare_ignore_case s1 s2
      | Descending -> fun (s1, _) (s2, _) -> Extlib.compare_ignore_case s2 s1
      | Custom sort ->
        fun (name1, g1) (name2, g2) ->
          let c = sort g1 g2 in
          if c = 0 then Extlib.compare_ignore_case name1 name2 else c
    in
    let sorted = List.sort sort l in
    List.map (fun (name, g) -> MGlobal (default_storage name [|g|])) sorted

  let make_file hide sort_order (path, globs) =
    let storage =
      default_storage (path : Filepath.Normalized.t :> string) (Array.of_list globs)
    in
    let sons = make_list_globals hide sort_order globs in
    storage, sons

end

module MODEL=MAKE(MYTREE)

(* Primitives to handle the filetree menu (which allows to hide some
   entries) *)
module MenusHide = struct
  let hide key () = Configuration.find_bool ~default:false key

  let menu_item (menu: GMenu.menu) ~label ~key =
    let mi = GMenu.check_menu_item ~label () in
    mi#set_active (hide key ());
    menu#add (mi :> GMenu.menu_item);
    mi

  let mi_set_callback (mi: GMenu.check_menu_item) ~key reset =
    mi#connect#toggled ~callback:
      (fun () ->
         let v = mi#active in
         Configuration.set key (Configuration.ConfBool v);
         reset ())

end

let key_flat_mode = "filetree_flat_mode"
let flat_mode = MenusHide.hide key_flat_mode

let key_hide_stdlib = "filetree_hide_stdlib"
let hide_stdlib = MenusHide.hide key_hide_stdlib

module State = struct

  (* Caching between what is selected in the filetree and the gtk to the
     gtk node *)
  type cache = {
    cache_files:
      (int list * MODEL.custom_tree) Datatype.Filepath.Hashtbl.t;
    cache_vars:
      (int list * MODEL.custom_tree) Varinfo.Hashtbl.t;
    cache_global_annot:
      (int list * MODEL.custom_tree) Global_annotation.Hashtbl.t;
  }

  let default_cache () = {
    cache_files = Datatype.Filepath.Hashtbl.create 17;
    cache_vars = Varinfo.Hashtbl.create 17;
    cache_global_annot = Global_annotation.Hashtbl.create 17;
  }

  let path_from_node cache = function
    | File (s, _) ->
      (try Some (Datatype.Filepath.Hashtbl.find cache.cache_files s)
       with Not_found -> None)
    | Global (GFun ({svar = vi},_) | GVar(vi,_,_) |
              GVarDecl(vi,_) | GFunDecl (_,vi,_)) ->
      (try Some (Varinfo.Hashtbl.find cache.cache_vars vi)
       with Not_found -> None)
    | Global (GAnnot (ga,_)) ->
      (try Some (Global_annotation.Hashtbl.find cache.cache_global_annot ga)
       with Not_found -> None)
    | _ -> None

  let fill_cache cache (path:int list) row =
    match row.MODEL.finfo with
    | MYTREE.MFile (storage,_) ->
      Datatype.Filepath.Hashtbl.add
        cache.cache_files (Datatype.Filepath.of_string storage.MYTREE.name) (path,row)
    | MYTREE.MGlobal storage ->
      match storage.MYTREE.globals with
      (* Only one element in this array by invariant: this is a leaf*)
      | [| GFun ({svar=vi},_) | GVar(vi,_,_)
         | GVarDecl(vi,_) | GFunDecl (_,vi,_)|] ->
        Varinfo.Hashtbl.add cache.cache_vars vi (path,row)
      | [| GAnnot (ga,_) |] ->
        Global_annotation.Hashtbl.add cache.cache_global_annot ga (path,row)
      | _ -> (* no cache for other globals yet *) ()

  (* Extract Cil globals. We remove builtins that are not used in this project,
     as well as files that do not contain anything afterwards *)
  let cil_files () =
    let files = Globals.FileIndex.get_files () in
    let globals_of_file f =
      let all = List.rev (Globals.FileIndex.get_symbols f) in
      let is_unused = function
        | GFun ({svar = vi},_) | GFunDecl (_, vi, _)
        | GVar (vi, _, _) | GVarDecl (vi, _) ->
          Cil_builtins.is_unused_builtin vi
        | _ -> false
      in
      let gls = List.filter (fun g -> not @@ is_unused g) all in
      if gls = [] then None else Some (f, gls)
    in
    List.filter_map globals_of_file files


  (** Make and fill the custom model with default values. *)
  let compute hide_filters sort_order =
    let hide g = List.exists (fun filter -> filter g) hide_filters in
    let model = MODEL.custom_tree () in
    let cache = default_cache () in
    (* Let's fill up the model with all files and functions. *)
    let files = cil_files () in
    begin
      if flat_mode () then
        let list = List.concat (List.map snd files) in
        let files = MYTREE.make_list_globals hide sort_order list in
        model#set_tree (fill_cache cache) files
      else
        let sorted_files = (List.sort (fun (p1, _) (p2, _) ->
            (* invert comparison order due to inversion by fold_left below *)
            Filepath.Normalized.compare_pretty p2 p1
          ) files)
        in
        let files = List.fold_left
            (fun acc v ->
               let name, globals = MYTREE.make_file hide sort_order v in
               if not ((hide_stdlib ())
                       && (MYTREE.comes_from_share name.MYTREE.name))
               then
                 (MYTREE.MFile (name, globals))::acc
               else acc)
            [] sorted_files
        in
        model#set_tree (fill_cache cache) files;
    end;
    model, cache

end

(* Definitions related to 'Find text' using [visible_nodes] *)
exception Found_global of Cil_types.global
exception Global_not_found

let make (tree_view:GTree.view) =

  (* Menu for configuring the filetree *)
  let menu = GMenu.menu () in

  (* Buttons to show/hide variables and/or functions *)
  let key_hide_variables = "filetree_hide_variables" in
  let key_hide_functions = "filetree_hide_functions" in
  let key_hide_defined = "filetree_hide_defined" in
  let key_hide_undefined = "filetree_hide_undefined" in
  let key_hide_builtins = "filetree_hide_builtins" in
  let key_hide_annotations = "filetree_hide_annotattions" in
  let hide_variables = MenusHide.hide key_hide_variables in
  let hide_functions = MenusHide.hide key_hide_functions in
  let hide_defined = MenusHide.hide key_hide_defined in
  let hide_undefined = MenusHide.hide key_hide_undefined in
  let hide_builtins = MenusHide.hide key_hide_builtins in
  let hide_annotations = MenusHide.hide key_hide_annotations in
  let initial_filter g =
    let hide_kind = function
      | GFun _ | GFunDecl _ -> hide_functions ()
      | GVar _ | GVarDecl _ -> hide_variables ()
      | GAnnot _ -> hide_annotations ()
      | _ -> false
    in
    hide_kind g
    || (MYTREE.is_builtin_global g && hide_builtins ())
    || (Cil.global_is_in_libc g && hide_stdlib ())
    || (MYTREE.is_defined_global g && hide_defined ())
    || (MYTREE.is_undefined_global g && hide_undefined ())
  in
  let initial_sort_order = MYTREE.Ascending in
  let mhide_variables = MenusHide.menu_item menu
      ~label:"Hide variables" ~key:key_hide_variables in
  let mhide_functions = MenusHide.menu_item menu
      ~label:"Hide functions" ~key:key_hide_functions in
  let mhide_stdlib = MenusHide.menu_item menu
      ~label:"Hide stdlib" ~key:key_hide_stdlib in
  let mhide_defined = MenusHide.menu_item menu
      ~label:"Hide defined symbols" ~key:key_hide_defined in
  let mhide_undefined = MenusHide.menu_item menu
      ~label:"Hide undefined symbols" ~key:key_hide_undefined in
  let mhide_builtins = MenusHide.menu_item menu
      ~label:"Hide built-ins" ~key:key_hide_builtins in
  let mhide_annotations = MenusHide.menu_item menu
      ~label:"Hide global annotations" ~key:key_hide_annotations in
  let () = menu#add (GMenu.separator_item () :> GMenu.menu_item) in
  let mflat_mode =
    MenusHide.menu_item menu ~label:"Flat mode" ~key:key_flat_mode in

  (* Initial filetree nodes to display *)
  let init_model, init_path_cache =
    State.compute [initial_filter] initial_sort_order
  in

  let set_row model ?strikethrough ?text (path,raw_row) =
    let row = raw_row.MODEL.finfo in
    Option.iter
      (fun b -> (MYTREE.get_storage row).MYTREE.strikethrough <- b)
      strikethrough;
    Option.iter (fun b -> (MYTREE.get_storage row).MYTREE.name <- b) text;
    if false then model#custom_row_changed (GTree.Path.create (List.rev path)) raw_row
  in

  let myself = object(self)

    (* Invariant: the filetree is always completely rebuilt when the project
       changes, because Design calls [reset] below. *)

    (* GTK model of the filetree *)
    val mutable model_custom = init_model
    (* caching from nodes to paths *)
    val mutable path_cache = init_path_cache
    (* node currently selected *)
    val mutable current_node = None

    (* Extendable. See method register_reset_extension. *)
    val mutable reset_extensions = []
    (* Extendable. See method add_select_function. *)
    val mutable select_functions = []
    (* Extendable. See method add_global_filter *)
    val mutable hide_globals_filters = [initial_filter]
    (* Extendable. See method append_pixbuf_column. *)
    val mutable columns_visibility = []

    (* Should be we call the actions registered to be applied on a node,
       even if the node is already selected. Used after 'reset' has been
       called. *)
    val mutable force_selection = false

    (* Forward reference to the first column. Always set *)
    val mutable name_column = None

    (* Sort order for the rows in the filetree. Alphabetical order on names by
       default, can be changed for custom order by text columns. *)
    val mutable sort_order = initial_sort_order

    (* The direction of the current sorting, and the column id according to
       which the tree is sorted. Used to maintain consistent sort indicators. *)
    val mutable sort_kind = `ASCENDING, -1

    (* Properly sets the sort indicator of [column], according to the current
       [sort_kind]. *)
    method private set_sort_indicator column =
      let order, id = sort_kind in
      if id = column#get_oid
      then (column#set_sort_indicator true; column#set_sort_order order)
      else column#set_sort_indicator false

    (* Changes the sort order to [sort] when left-clicking on the header of
       [column]. *)
    method private change_sort column sort =
      match sort_kind with
      | `ASCENDING, id when id = column#get_oid ->
        sort_kind <- `DESCENDING, column#get_oid;
        sort_order <- MYTREE.inverse_sort sort
      | _ ->
        sort_kind <- `ASCENDING, column#get_oid;
        sort_order <- sort

    method refresh_columns () =
      List.iter (fun f -> f `Visibility) columns_visibility

    method append_text_column ~title ~tooltip ~visible ~text ?sort =
      let renderer = GTree.cell_renderer_text [`XALIGN 0.5] in
      let column = GTree.view_column ~renderer:(renderer,[]) () in
      ignore (tree_view#append_column column);
      let label = GMisc.label ~text:title () in
      Gtk_helper.do_tooltip ~tooltip label;
      column#set_widget (Some label#coerce);
      column#set_alignment 0.5;
      column#set_reorderable true;
      column#set_min_width 50;
      if fixed_height then (column#set_sizing `FIXED;
                            column#set_resizable false;
                            column#set_fixed_width 100)
      else column#set_resizable true;
      let texts globals =
        List.fold_left (fun acc global -> `TEXT (text global) :: acc) [] globals
      in
      let f model row =
        if visible () then
          let path = model#get_path row in
          self#set_sort_indicator column;
          match model_custom#custom_get_iter path with
          | Some {MODEL.finfo=v} ->
            let globals = Array.to_list MYTREE.((get_storage v).globals) in
            renderer#set_properties (texts globals)
          | None -> ()
      in
      column#set_cell_data_func renderer f;
      let sort = match sort with
        | None -> fun g h -> String.compare (text g) (text h)
        | Some sort -> sort
      in
      let callback () =
        self#change_sort column (MYTREE.Custom sort);
        self#reset ()
      in
      column#set_clickable true;
      ignore (column#connect#clicked ~callback);
      let refresh = function
        | `Contents -> self#reset ()
        | `Visibility -> column#set_visible (visible ())
      in
      refresh `Visibility;
      columns_visibility <- refresh :: columns_visibility;
      refresh

    method append_pixbuf_column
        ~title (f:(global list -> GTree.cell_properties_pixbuf list)) visible =
      let column = GTree.view_column ~title () in
      column#set_reorderable true;
      if fixed_height then (column#set_sizing `FIXED;
                            column#set_resizable false;
                            column#set_fixed_width 100)
      else column#set_resizable true;
      let renderer = GTree.cell_renderer_pixbuf [] in
      column#pack renderer;
      column#set_cell_data_func renderer
        (fun model row ->
           if visible () then
             let (path:Gtk.tree_path) = model#get_path row  in
             match model_custom#custom_get_iter path with
             | Some {MODEL.finfo=v} ->
               renderer#set_properties
                 (f (Array.to_list((MYTREE.get_storage v).MYTREE.globals)))
             | None -> ());
      ignore (tree_view#append_column column);
      let filter_active, mi = self#filter_from_column visible title f in
      (* We return a function showing or masking the column*)
      let refresh =
        let prev = ref true in
        fun r ->
          let visible = visible () in
          if !prev != visible then (
            (* Column freshly appeared or disappeared. Update it *)
            prev := visible;
            column#set_visible visible;
            mi#misc#set_sensitive visible;
            (* A filter is active for the column. The visible nodes have
               probably changed, destroy the filetree and rebuild it *)
            if filter_active () then self#reset ();
          )
          (* Column state has not changed. If it is visible and its
             contents have changed, the nodes to display may change *)
          else if visible && r = `Contents && filter_active () then
            self#reset ()
      in
      refresh `Visibility;
      columns_visibility <- refresh :: columns_visibility;
      refresh

    method private filter_from_column col_visible title f =
      let opt_active = ref (fun () -> false) in
      let hide_global g =
        col_visible () && (! opt_active)() &&
        f [g] = [(`STOCK_ID "" : GTree.cell_properties_pixbuf)] in
      let text = Printf.sprintf "Selected by %s only" title in
      let key = "filter_" ^ title in
      let visible, mi = self#add_global_filter ~text ~key hide_global in
      opt_active := visible;
      (visible, mi)

    method view = tree_view
    method model = model_custom

    method reset () =
      self#reset_internal ();
      self#refresh_columns ();

    method register_reset_extension f =
      reset_extensions <- f :: reset_extensions

    method set_file_attribute ?strikethrough ?text filename =
      try
        set_row model_custom ?strikethrough ?text
          (Datatype.Filepath.Hashtbl.find path_cache.State.cache_files filename)
      with Not_found -> () (* Some files might not be in the list because
                              of our filters. Ignore *)

    method set_global_attribute ?strikethrough ?text v =
      try
        set_row model_custom ?strikethrough ?text
          (Varinfo.Hashtbl.find path_cache.State.cache_vars v)
      with Not_found -> () (* Some globals might not be in the list because of
                              our filters. Ignore *)

    method flat_mode = flat_mode ()

    method get_file_globals file =
      try
        let _, raw_row =
          Datatype.Filepath.Hashtbl.find path_cache.State.cache_files file in
        MYTREE.sons_info raw_row.MODEL.finfo
      with Not_found -> [] (* Some files may be hidden if they contain nothing
                              interesting *)

    method find_visible_global text =
      (* We perform up to two iterations in the list of globals, as follows:
         1. First, we advance until the selected element (if any);
         2. Then, we start searching for [text] until the end of the list;
         3. If nothing was found, we start again, this time from the beginning
            of the list until the selected global. *)
      let regex = Str.regexp_case_fold text in
      let name_matches name =
        try
          ignore (Str.search_forward regex name 0); true
        with Not_found -> false
      in
      let found_selection = ref (current_node = None) in
      let model = model_custom in
      let get_global = function Global g -> g | _ -> assert false in
      let is_current_node node =
        match current_node with
        | None -> false
        | Some node' -> same_node node node'
      in
      (* Called when the currently selected node has been found. Either
         the real search can start, or we abort because we have finished
         wrapping around. *)
      let node_found () =
        if not !found_selection
        then found_selection := true
        else raise Global_not_found (* finished  *);
      in
      let rec aux text t =
        match t.MODEL.finfo with
        | MYTREE.MFile ({MYTREE.name},_) ->
          (* search children *)
          (* note: we avoid calling [storage_type] here because
                   we do not need the child nodes *)
          let fake_node = File (Datatype.Filepath.of_string name,[]) in
          if is_current_node fake_node then node_found ();
          Array.iter (aux text) t.MODEL.sons
        | MYTREE.MGlobal {MYTREE.name} as st ->
          let node = MYTREE.storage_type st in
          if is_current_node node then
            node_found ()
          else (* We never consider the current node as matching. This way, if
                  'foo' is selected, we can search for 'fo' and find it farther.*)
          if !found_selection && name_matches name then
            raise (Found_global (get_global node))
      in
      try
        Array.iter (aux text) model#get_roots;
        (* First search did not succeed, will try second search if
           user wants to wrap around. *)
        if current_node <> None &&
           GToolbox.question_box ~title:"Not found"
             (Printf.sprintf "No more occurrences for: %s\n\
                              Search from beginning?" text)
             ~buttons:["Yes"; "No"] = 1(*yes*) then
          begin
            assert (!found_selection);
            (* try searching again *)
            Array.iter (aux text) model#get_roots;
          end;
        None
      with
      | Found_global g -> Some g
      | Global_not_found -> None

    method private enable_select_functions () =
      let select path path_currently_selected =
        let fail e =
          Gui_parameters.error
            "selector handler got an internal error, please report: %s@.%s@."
            (Printexc.to_string e) (Printexc.get_backtrace ())
        in
        try
          let {MODEL.finfo=t} =
            Option.get (model_custom#custom_get_iter path) in
          let selected_node = MYTREE.storage_type t in
          let was_activated = match current_node with
            | None -> false
            | Some old_node -> same_node selected_node old_node
          in
          if (force_selection || not was_activated) &&
             not path_currently_selected
          then begin
            (*Format.printf "##Select %a: %b %b %b, %s@."
              pretty_node selected_node force_selection was_activated
              path_currently_selected (GTree.Path.to_string path) *)
            current_node <- Some selected_node;
            let old_force_selection = force_selection in
            List.iter
              (fun f ->
                 try
                   f ~was_activated:(not old_force_selection && was_activated)
                     ~activating:true
                     selected_node
                 with e -> fail e)
              select_functions;
          end;
          force_selection <- false;
          true
        with e ->
          Gui_parameters.error
            "gui could not select row in filetree, please report: %s"
            (Printexc.to_string e);
          true
      in
      tree_view#selection#set_select_function select

    method add_select_function f =
      select_functions <- select_functions@[f];

    method private varinfo_of_global g =
      match g with
      | GVar (vi, _, _) | GVarDecl (vi, _)
      | GFun ({svar = vi}, _) | GFunDecl (_, vi, _) -> Some vi
      | _ -> None

    method unselect =
      tree_view#selection#unselect_all ();
      current_node <- None

    (* Display a path of the gtk filetree, by expanding and centering the
       needed nodes *)
    method private show_path_in_tree path =
      expand_to_path tree_view path;
      tree_view#selection#select_path path;
      (* set_cursor updates the keyboard cursor and scrolls to the element *)
      tree_view#set_cursor path (Option.get name_column);
      tree_view#misc#grab_focus ()

    (* TODO: keep the structure of the tree, ie. reexpand all the nodes that
       are currently expanded (not only the currently selected) *)
    method private reset_internal () =
      (* We force a full recomputation using our filters for globals *)
      let mc, cache = State.compute hide_globals_filters sort_order in
      tree_view#set_model (Some (mc:>GTree.model));
      model_custom <- mc;
      path_cache <- cache;
      List.iter (fun f -> f (self :> t)) reset_extensions;
      force_selection <- true;
      (* Here, current_node may come from another project. This is not
         a problem, as we only use it to do a basic search. Otherwise,
         the solution would be to projectify it outside of the class. *)
      (match current_node with
       | None -> ()
       | Some node ->
         match State.path_from_node path_cache node with
         | None -> ()
         | Some (path, _) ->
           self#show_path_in_tree (GTree.Path.create (List.rev path)))

    method select_global g =
      match State.path_from_node path_cache (Global g) with
      | None -> (* selection failed *) self#unselect; false
      | Some (path, _) ->
        self#show_path_in_tree (GTree.Path.create (List.rev path));
        true

    method selected_globals =
      match current_node with
      | None -> []
      | Some (File (_, g)) -> g
      | Some (Global g) -> [g]

    method add_global_filter ~text ~key f =
      hide_globals_filters <- f :: hide_globals_filters;
      let mi = MenusHide.menu_item menu ~label:text ~key in
      ignore (MenusHide.mi_set_callback mi ~key self#reset_internal);
      (MenusHide.hide key, mi)

    initializer
      (* Name column *)
      let name_renderer = GTree.cell_renderer_text [`YALIGN 0.0] in
      let column = GTree.view_column
          ~title:"Name"
          ~renderer:((name_renderer:>GTree.cell_renderer),[]) ()
      in
      let _ = tree_view#append_column column in
      name_column <- Some column;
      let m_name_renderer renderer (lmodel:GTree.model) iter =
        self#set_sort_indicator column;
        let (path:Gtk.tree_path) = lmodel#get_path iter in
        match self#model#custom_get_iter path with
        | Some p ->
          let special, text, strike, underline = match p.MODEL.finfo with
            | MYTREE.MFile ({MYTREE.name=m; strikethrough=strike},_) ->
              if m = "" (* Unknown location *) then
                true, "Unknown file", strike, false
              else
                let path = Datatype.Filepath.of_string m in
                false, Filepath.Normalized.to_pretty_string path, strike, false
            | MYTREE.MGlobal ({MYTREE.name=m; strikethrough=strike}) as s ->
              false, m, strike, MYTREE.is_function s
          in
          renderer#set_properties [
            `TEXT text;
            `STRIKETHROUGH strike;
            `WEIGHT (if special then `LIGHT else `NORMAL);
            `UNDERLINE (if underline then `LOW else `NONE)
          ]

        | None -> ()
      in
      column#set_cell_data_func
        name_renderer (m_name_renderer name_renderer);
      if fixed_height then column#set_sizing `FIXED;
      if fixed_height then ( column#set_resizable false;
                             column#set_fixed_width 100)
      else column#set_resizable true;
      column#set_clickable true;
      let title = GMisc.label ~text:"Name"  () in
      column#set_widget (Some title#coerce);

      (* Filter menu when right-clicking on the column header. *)
      let pop_menu () =
        menu#popup ~button:3 ~time:(GtkMain.Main.get_current_event_time ());
      in
      let () = match get_column_header_button column with
        | None ->
          (* Should not happen, but who knowns? *)
          ignore (column#connect#clicked ~callback:pop_menu)
        | Some button ->
          (* Connect the menu to a right click. *)
          let callback evt =
            if GdkEvent.Button.button evt = 3
            then (pop_menu (); true)
            else false
          in
          ignore (button#event#connect#button_release ~callback)
      in

      (* Changes the sort order when left-clicking on the column header. *)
      let callback () = self#change_sort column MYTREE.Ascending; self#reset () in
      ignore (column#connect#clicked ~callback:callback);
      (* Sets the sort_kind to the initial sort. *)
      sort_kind <- `ASCENDING, column#get_oid;

      ignore (MenusHide.mi_set_callback
                mhide_functions ~key:key_hide_functions self#reset_internal);
      ignore (MenusHide.mi_set_callback
                mhide_variables ~key:key_hide_variables self#reset_internal);
      ignore (MenusHide.mi_set_callback
                mhide_stdlib ~key:key_hide_stdlib self#reset_internal);
      ignore (MenusHide.mi_set_callback
                mhide_defined ~key:key_hide_defined self#reset_internal);
      ignore (MenusHide.mi_set_callback
                mhide_undefined ~key:key_hide_undefined self#reset_internal);
      ignore (MenusHide.mi_set_callback
                mhide_builtins ~key:key_hide_builtins self#reset_internal);
      ignore (MenusHide.mi_set_callback
                mhide_annotations ~key:key_hide_annotations self#reset_internal);
      ignore (MenusHide.mi_set_callback
                mflat_mode ~key:key_flat_mode self#reset_internal);
      menu#add (GMenu.separator_item () :> GMenu.menu_item);

      tree_view#set_model (Some (init_model:>GTree.model));
      self#enable_select_functions ();
      if fixed_height then tree_view#set_fixed_height_mode true;

  end
  in
  (myself:>t)

(*
  Local Variables:
  compile-command: "make -C ../../.."
  End:
*)
