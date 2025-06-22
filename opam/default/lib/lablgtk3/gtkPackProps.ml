open Gobject
open Data
module Object = GtkObject

open Gtk

external ml_gtkpack_init : unit -> unit = "ml_gtkpack_init"
let () = ml_gtkpack_init ()
module PrivateProps = struct
  let column_spacing = {name="column-spacing"; conv=uint}
  let homogeneous = {name="homogeneous"; conv=boolean}
  let orientation = {name="orientation"; conv=GtkEnums.Conv.orientation}
  let row_spacing = {name="row-spacing"; conv=uint}
end

let may_cons = Property.may_cons
let may_cons_opt = Property.may_cons_opt

module Box = struct
  let cast w : Gtk.box obj = try_cast w "GtkBox"
  module P = struct
    let homogeneous : ([>`box],_) property = PrivateProps.homogeneous
    let spacing : ([>`box],_) property = {name="spacing"; conv=int}
    let orientation : ([>`box],_) property = PrivateProps.orientation
  end
  let create (dir : Gtk.Tags.orientation) pl : Gtk.box obj =
    Object.make (if dir = `HORIZONTAL then "GtkHBox" else "GtkVBox")  pl
  external pack_start :
    [>`box] obj ->
    [>`widget] obj -> expand:bool -> fill:bool -> padding:int -> unit
    = "ml_gtk_box_pack_start"
  external pack_end :
    [>`box] obj ->
    [>`widget] obj -> expand:bool -> fill:bool -> padding:int -> unit
    = "ml_gtk_box_pack_end"
  external reorder_child : [>`box] obj -> [>`widget] obj -> pos:int -> unit
    = "ml_gtk_box_reorder_child"
  external query_child_packing : [>`box] obj -> [>`widget] obj -> box_packing
    = "ml_gtk_box_query_child_packing"
  external set_child_packing :
    [>`box] obj ->
    [>`widget] obj -> ?expand:bool -> ?fill:bool ->
       ?padding:int -> ?from:Tags.pack_type -> unit
    = "ml_gtk_box_set_child_packing_bc" "ml_gtk_box_set_child_packing"
  let make_params ~cont pl ?homogeneous ?spacing =
    let pl = (
      may_cons P.homogeneous homogeneous (
      may_cons P.spacing spacing pl)) in
    cont pl
end

module ButtonBox = struct
  let cast w : Gtk.button_box obj = try_cast w "GtkButtonBox"
  module P = struct
    let layout_style : ([>`buttonbox],_) property =
      {name="layout-style"; conv=GtkEnums.Conv.button_box_style}
  end
  let create (dir : Gtk.Tags.orientation) pl : Gtk.button_box obj =
    Object.make
      (if dir = `HORIZONTAL then "GtkHButtonBox" else "GtkVButtonBox")  pl
  external get_child_secondary : [>`buttonbox] obj -> [> `widget] obj -> bool
    = "ml_gtk_button_box_get_child_secondary"
  external set_child_secondary :
    [>`buttonbox] obj -> [> `widget] obj -> bool -> unit
    = "ml_gtk_button_box_set_child_secondary"
  external get_child_non_homogeneous :
    [>`buttonbox] obj -> [> `widget] obj -> bool
    = "ml_gtk_button_box_get_child_non_homogeneous"
  external set_child_non_homogeneous :
    [>`buttonbox] obj -> [> `widget] obj -> bool -> unit
    = "ml_gtk_button_box_set_child_non_homogeneous"
end

module Fixed = struct
  let cast w : Gtk.fixed obj = try_cast w "GtkFixed"
  let create pl : Gtk.fixed obj = Object.make "GtkFixed" pl
  external put : [>`fixed] obj -> [>`widget] obj -> x:int -> y:int -> unit
    = "ml_gtk_fixed_put"
  external move : [>`fixed] obj -> [>`widget] obj -> x:int -> y:int -> unit
    = "ml_gtk_fixed_move"
end

module Paned = struct
  let cast w : Gtk.paned obj = try_cast w "GtkPaned"
  module P = struct
    let position : ([>`paned],_) property = {name="position"; conv=int}
    let position_set : ([>`paned],_) property =
      {name="position-set"; conv=boolean}
    let max_position : ([>`paned],_) property =
      {name="max-position"; conv=int}
    let min_position : ([>`paned],_) property =
      {name="min-position"; conv=int}
    let orientation : ([>`paned],_) property = PrivateProps.orientation
  end
  let create (dir : Gtk.Tags.orientation) pl : Gtk.paned obj =
    Object.make (if dir = `HORIZONTAL then "GtkHPaned" else "GtkVPaned")  pl
  external add1 : [>`paned] obj -> [>`widget] obj -> unit
    = "ml_gtk_paned_add1"
  external add2 : [>`paned] obj -> [>`widget] obj -> unit
    = "ml_gtk_paned_add2"
  external pack1 :
    [>`paned] obj -> [>`widget] obj -> resize:bool -> shrink:bool -> unit
    = "ml_gtk_paned_pack1"
  external pack2 :
    [>`paned] obj -> [>`widget] obj -> resize:bool -> shrink:bool -> unit
    = "ml_gtk_paned_pack2"
  external get_child1 : [>`paned] obj -> widget obj
    = "ml_gtk_paned_get_child1"
  external get_child2 : [>`paned] obj -> widget obj
    = "ml_gtk_paned_get_child2"
end

module Layout = struct
  let cast w : Gtk.layout obj = try_cast w "GtkLayout"
  module P = struct
    let hadjustment : ([>`layout],_) property =
      {name="hadjustment"; conv=(gobject : Gtk.adjustment obj data_conv)}
    let height : ([>`layout],_) property = {name="height"; conv=uint}
    let vadjustment : ([>`layout],_) property =
      {name="vadjustment"; conv=(gobject : Gtk.adjustment obj data_conv)}
    let width : ([>`layout],_) property = {name="width"; conv=uint}
  end
  let create pl : Gtk.layout obj = Object.make "GtkLayout" pl
  external put : [>`layout] obj -> [>`widget] obj -> x:int -> y:int -> unit
    = "ml_gtk_layout_put"
  external move : [>`layout] obj -> [>`widget] obj -> x:int -> y:int -> unit
    = "ml_gtk_layout_move"
  external get_bin_window : [>`layout] obj -> Gdk.window
    = "ml_gtk_layout_get_bin_window"
  let make_params ~cont pl ?hadjustment ?height ?vadjustment ?width =
    let pl = (
      may_cons P.hadjustment hadjustment (
      may_cons P.height height (
      may_cons P.vadjustment vadjustment (
      may_cons P.width width pl)))) in
    cont pl
end

module Notebook = struct
  let cast w : Gtk.notebook obj = try_cast w "GtkNotebook"
  module P = struct
    let enable_popup : ([>`notebook],_) property =
      {name="enable-popup"; conv=boolean}
    let group_name : ([>`notebook],_) property =
      {name="group-name"; conv=string}
    let page : ([>`notebook],_) property = {name="page"; conv=int}
    let scrollable : ([>`notebook],_) property =
      {name="scrollable"; conv=boolean}
    let show_border : ([>`notebook],_) property =
      {name="show-border"; conv=boolean}
    let show_tabs : ([>`notebook],_) property =
      {name="show-tabs"; conv=boolean}
    let tab_pos : ([>`notebook],_) property =
      {name="tab-pos"; conv=GtkEnums.Conv.position_type}
  end
  module S = struct
    open GtkSignal
    let switch_page =
      {name="switch_page"; classe=`notebook; marshaller=fun f ->
       marshal2 (gobject : Gtk.widget obj data_conv) int
         "GtkNotebook::switch_page" f}
    let select_page =
      {name="select_page"; classe=`notebook; marshaller=fun f ->
       marshal1 boolean "GtkNotebook::select_page" f}
    let reorder_tab =
      {name="reorder_tab"; classe=`notebook; marshaller=fun f ->
       marshal2 GtkEnums.Conv.direction_type boolean
         "GtkNotebook::reorder_tab" f}
    let change_current_page =
      {name="change_current_page"; classe=`notebook; marshaller=fun f ->
       marshal1 int "GtkNotebook::change_current_page" f}
    let move_focus_out =
      {name="move_focus_out"; classe=`notebook; marshaller=fun f ->
       marshal1 GtkEnums.Conv.direction_type "GtkNotebook::move_focus_out" f}
    let page_added =
      {name="page_added"; classe=`notebook; marshaller=fun f ->
       marshal2 (gobject : Gtk.widget obj data_conv) uint
         "GtkNotebook::page_added" f}
    let page_removed =
      {name="page_removed"; classe=`notebook; marshaller=fun f ->
       marshal2 (gobject : Gtk.widget obj data_conv) uint
         "GtkNotebook::page_removed" f}
    let page_reordered =
      {name="page_reordered"; classe=`notebook; marshaller=fun f ->
       marshal2 (gobject : Gtk.widget obj data_conv) uint
         "GtkNotebook::page_reordered" f}
    let create_window =
      {name="create_window"; classe=`notebook; marshaller=fun f ->
       marshal3 (gobject : Gtk.widget obj data_conv) int int
         "GtkNotebook::create_window"
         (fun x1 x2 x3 -> f ~page:x1 ~x:x2 ~y:x3)}
  end
  let create pl : Gtk.notebook obj = Object.make "GtkNotebook" pl
  external insert_page_menu :
    [>`notebook] obj ->
    [>`widget] obj -> tab_label:[>`widget] optobj ->
      menu_label:[>`widget] optobj -> ?pos:int -> int
    = "ml_gtk_notebook_insert_page_menu"
  external remove_page : [>`notebook] obj -> int -> unit
    = "ml_gtk_notebook_remove_page"
  external get_current_page : [>`notebook] obj -> int
    = "ml_gtk_notebook_get_current_page"
  external get_nth_page : [>`notebook] obj -> int -> widget obj
    = "ml_gtk_notebook_get_nth_page"
  external page_num : [>`notebook] obj -> [>`widget] obj -> int
    = "ml_gtk_notebook_page_num"
  external next_page : [>`notebook] obj -> unit = "ml_gtk_notebook_next_page"
  external prev_page : [>`notebook] obj -> unit = "ml_gtk_notebook_prev_page"
  external get_tab_label : [>`notebook] obj -> [>`widget] obj -> widget obj
    = "ml_gtk_notebook_get_tab_label"
  external set_tab_label :
    [>`notebook] obj -> [>`widget] obj -> [>`widget] obj -> unit
    = "ml_gtk_notebook_set_tab_label"
  external get_menu_label : [>`notebook] obj -> [>`widget] obj -> widget obj
    = "ml_gtk_notebook_get_menu_label"
  external set_menu_label :
    [>`notebook] obj -> [>`widget] obj -> [>`widget] obj -> unit
    = "ml_gtk_notebook_set_menu_label"
  external reorder_child : [>`notebook] obj -> [>`widget] obj -> int -> unit
    = "ml_gtk_notebook_reorder_child"
  external set_tab_reorderable :
    [>`notebook] obj -> [>`widget] obj -> bool -> unit
    = "ml_gtk_notebook_set_tab_reorderable"
  external get_tab_reorderable : [>`notebook] obj -> [>`widget] obj -> bool
    = "ml_gtk_notebook_get_tab_reorderable"
  let make_params ~cont pl ?enable_popup ?group_name ?scrollable ?show_border
      ?show_tabs ?tab_pos =
    let pl = (
      may_cons P.enable_popup enable_popup (
      may_cons P.group_name group_name (
      may_cons P.scrollable scrollable (
      may_cons P.show_border show_border (
      may_cons P.show_tabs show_tabs (
      may_cons P.tab_pos tab_pos pl)))))) in
    cont pl
end

module Table = struct
  let cast w : Gtk.table obj = try_cast w "GtkTable"
  module P = struct
    let n_columns : ([>`table],_) property = {name="n-columns"; conv=uint}
    let n_rows : ([>`table],_) property = {name="n-rows"; conv=uint}
    let homogeneous : ([>`table],_) property = PrivateProps.homogeneous
    let row_spacing : ([>`table],_) property = PrivateProps.row_spacing
    let column_spacing : ([>`table],_) property = PrivateProps.column_spacing
  end
  let create pl : Gtk.table obj = Object.make "GtkTable" pl
  external attach :
    [>`table] obj ->
    [>`widget] obj -> left:int -> right:int -> top:int -> bottom:int ->
     xoptions:Tags.attach_options list -> yoptions:Tags.attach_options list ->
     xpadding:int -> ypadding:int -> unit
    = "ml_gtk_table_attach_bc" "ml_gtk_table_attach"
  external set_row_spacing : [>`table] obj -> int -> int -> unit
    = "ml_gtk_table_set_row_spacing"
  external set_col_spacing : [>`table] obj -> int -> int -> unit
    = "ml_gtk_table_set_col_spacing"
  let make_params ~cont pl ?columns ?rows ?homogeneous ?row_spacings
      ?col_spacings =
    let pl = (
      may_cons P.n_columns columns (
      may_cons P.n_rows rows (
      may_cons P.homogeneous homogeneous (
      may_cons P.row_spacing row_spacings (
      may_cons P.column_spacing col_spacings pl))))) in
    cont pl
end

module Grid = struct
  let cast w : Gtk.grid obj = try_cast w "GtkGrid"
  module P = struct
    let baseline_row : ([>`grid],_) property =
      {name="baseline-row"; conv=uint}
    let row_homogeneous : ([>`grid],_) property =
      {name="row-homogeneous"; conv=boolean}
    let column_homogeneous : ([>`grid],_) property =
      {name="column-homogeneous"; conv=boolean}
    let row_spacing : ([>`grid],_) property = PrivateProps.row_spacing
    let column_spacing : ([>`grid],_) property = PrivateProps.column_spacing
  end
  let create pl : Gtk.grid obj = Object.make "GtkGrid" pl
  external attach :
    [>`grid] obj ->
    [>`widget] obj -> left:int -> top:int -> width:int -> height:int -> unit
    = "ml_gtk_grid_attach_bc" "ml_gtk_grid_attach"
  let make_params ~cont pl ?baseline_row ?row_homogeneous ?col_homogeneous
      ?row_spacings ?col_spacings =
    let pl = (
      may_cons P.baseline_row baseline_row (
      may_cons P.row_homogeneous row_homogeneous (
      may_cons P.column_homogeneous col_homogeneous (
      may_cons P.row_spacing row_spacings (
      may_cons P.column_spacing col_spacings pl))))) in
    cont pl
end

module SizeGroup = struct
  let cast w : size_group = try_cast w "GtkSizeGroup"
  module P = struct
    let mode : ([>`sizegroup],_) property =
      {name="mode"; conv=GtkEnums.Conv.size_group_mode}
  end
  let create pl : size_group = Gobject.unsafe_create "GtkSizeGroup" pl
  external add_widget : [>`sizegroup] obj -> [>`widget] obj -> unit
    = "ml_gtk_size_group_add_widget"
  external remove_widget : [>`sizegroup] obj -> [>`widget] obj -> unit
    = "ml_gtk_size_group_remove_widget"
  let make_params ~cont pl ?mode =
    let pl = (may_cons P.mode mode pl) in
    cont pl
end

module Stack = struct
  let cast w : Gtk.stack obj = try_cast w "GtkStack"
  module P = struct
    let hhomogeneous : ([>`stack],_) property =
      {name="hhomogeneous"; conv=boolean}
    let homogeneous : ([>`stack],_) property = PrivateProps.homogeneous
    let interpolate_size : ([>`stack],_) property =
      {name="interpolate-size"; conv=boolean}
    let transition_duration : ([>`stack],_) property =
      {name="transition-duration"; conv=uint}
    let transition_running : ([>`stack],_) property =
      {name="transition-running"; conv=boolean}
    let transition_type : ([>`stack],_) property =
      {name="transition-type"; conv=GtkEnums.Conv.stack_transition_type}
    let vhomogeneous : ([>`stack],_) property =
      {name="vhomogeneous"; conv=boolean}
    let visible_child : ([>`stack],_) property =
      {name="visible-child"; conv=(gobject : Gtk.widget obj data_conv)}
    let visible_child_name : ([>`stack],_) property =
      {name="visible-child-name"; conv=string}
  end
  let create pl : Gtk.stack obj = Object.make "GtkStack" pl
  external add_named : [>`stack] obj -> [>`widget] obj -> string -> unit
    = "ml_gtk_stack_add_named"
  external add_titled :
    [>`stack] obj -> [>`widget] obj -> string -> string -> unit
    = "ml_gtk_stack_add_titled"
  external get_child_by_name : [>`stack] obj -> string -> [>`widget] obj
    = "ml_gtk_stack_get_child_by_name"
  external set_visible_child_full :
    [>`stack] obj -> string -> Tags.stack_transition_type -> unit
    = "ml_gtk_stack_set_visible_child_full"
  let make_params ~cont pl ?hhomogeneous ?homogeneous ?interpolate_size
      ?transition_duration ?transition_type ?vhomogeneous ?visible_child
      ?visible_child_name =
    let pl = (
      may_cons P.hhomogeneous hhomogeneous (
      may_cons P.homogeneous homogeneous (
      may_cons P.interpolate_size interpolate_size (
      may_cons P.transition_duration transition_duration (
      may_cons P.transition_type transition_type (
      may_cons P.vhomogeneous vhomogeneous (
      may_cons P.visible_child visible_child (
      may_cons P.visible_child_name visible_child_name pl)))))))) in
    cont pl
end

module StackSwitcher = struct
  let cast w : Gtk.stack_switcher obj = try_cast w "GtkStackSwitcher"
  module P = struct
    let icon_size : ([>`stackswitcher],_) property =
      {name="icon-size"; conv=int}
    let stack : ([>`stackswitcher],_) property =
      {name="stack"; conv=(gobject : Gtk.stack obj data_conv)}
  end
  let create pl : Gtk.stack_switcher obj = Object.make "GtkStackSwitcher" pl
  let make_params ~cont pl ?icon_size ?stack =
    let pl = (may_cons P.icon_size icon_size (may_cons P.stack stack pl)) in
    cont pl
end

