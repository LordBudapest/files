open GtkSignal
open Gobject
open Data
let set = set
let get = get
let param = param

open GtkPackProps

open GtkPackProps

class virtual box_props = object
  val virtual obj : _ obj
  method set_homogeneous = set Box.P.homogeneous obj
  method set_spacing = set Box.P.spacing obj
  method set_orientation = set Box.P.orientation obj
  method homogeneous = get Box.P.homogeneous obj
  method spacing = get Box.P.spacing obj
  method orientation = get Box.P.orientation obj
end

class virtual paned_props = object
  val virtual obj : _ obj
  method set_position = set Paned.P.position obj
  method set_orientation = set Paned.P.orientation obj
  method position = get Paned.P.position obj
  method max_position = get Paned.P.max_position obj
  method min_position = get Paned.P.min_position obj
  method orientation = get Paned.P.orientation obj
end

class virtual notebook_props = object
  val virtual obj : _ obj
  method set_enable_popup = set Notebook.P.enable_popup obj
  method set_group_name = set Notebook.P.group_name obj
  method set_scrollable = set Notebook.P.scrollable obj
  method set_show_border = set Notebook.P.show_border obj
  method set_show_tabs = set Notebook.P.show_tabs obj
  method set_tab_pos = set Notebook.P.tab_pos obj
  method enable_popup = get Notebook.P.enable_popup obj
  method group_name = get Notebook.P.group_name obj
  method scrollable = get Notebook.P.scrollable obj
  method show_border = get Notebook.P.show_border obj
  method show_tabs = get Notebook.P.show_tabs obj
  method tab_pos = get Notebook.P.tab_pos obj
end

class virtual notebook_sigs = object (self)
  method private virtual connect :
    'b. ('a,'b) GtkSignal.t -> callback:'b -> GtkSignal.id
  method private virtual notify :
    'b. ('a,'b) property -> callback:('b -> unit) -> GtkSignal.id
  method select_page = self#connect Notebook.S.select_page
  method reorder_tab = self#connect Notebook.S.reorder_tab
  method change_current_page = self#connect Notebook.S.change_current_page
  method move_focus_out = self#connect Notebook.S.move_focus_out
  method page_added = self#connect
    {Notebook.S.page_added with marshaller = fun f ->
     marshal2 GObj.conv_widget uint "GtkNotebook::page_added" f}
  method page_removed = self#connect
    {Notebook.S.page_removed with marshaller = fun f ->
     marshal2 GObj.conv_widget uint "GtkNotebook::page_removed" f}
  method page_reordered = self#connect
    {Notebook.S.page_reordered with marshaller = fun f ->
     marshal2 GObj.conv_widget uint "GtkNotebook::page_reordered" f}
  method create_window = self#connect
    {Notebook.S.create_window with marshaller = fun f ->
     marshal3 GObj.conv_widget int int "GtkNotebook::create_window"
       (fun x1 x2 x3 -> f ~page:x1 ~x:x2 ~y:x3)}
  method notify_enable_popup ~callback =
    self#notify Notebook.P.enable_popup ~callback
  method notify_group_name ~callback =
    self#notify Notebook.P.group_name ~callback
  method notify_scrollable ~callback =
    self#notify Notebook.P.scrollable ~callback
  method notify_show_border ~callback =
    self#notify Notebook.P.show_border ~callback
  method notify_show_tabs ~callback =
    self#notify Notebook.P.show_tabs ~callback
  method notify_tab_pos ~callback = self#notify Notebook.P.tab_pos ~callback
end

class virtual table_props = object
  val virtual obj : _ obj
  method set_columns = set Table.P.n_columns obj
  method set_rows = set Table.P.n_rows obj
  method set_homogeneous = set Table.P.homogeneous obj
  method set_row_spacings = set Table.P.row_spacing obj
  method set_col_spacings = set Table.P.column_spacing obj
  method columns = get Table.P.n_columns obj
  method rows = get Table.P.n_rows obj
  method homogeneous = get Table.P.homogeneous obj
  method row_spacings = get Table.P.row_spacing obj
  method col_spacings = get Table.P.column_spacing obj
end

class virtual grid_props = object
  val virtual obj : _ obj
  method set_baseline_row = set Grid.P.baseline_row obj
  method set_row_homogeneous = set Grid.P.row_homogeneous obj
  method set_col_homogeneous = set Grid.P.column_homogeneous obj
  method set_row_spacings = set Grid.P.row_spacing obj
  method set_col_spacings = set Grid.P.column_spacing obj
  method baseline_row = get Grid.P.baseline_row obj
  method row_homogeneous = get Grid.P.row_homogeneous obj
  method col_homogeneous = get Grid.P.column_homogeneous obj
  method row_spacings = get Grid.P.row_spacing obj
  method col_spacings = get Grid.P.column_spacing obj
end

class virtual size_group_props = object
  val virtual obj : _ obj
  method set_mode = set SizeGroup.P.mode obj
  method mode = get SizeGroup.P.mode obj
end

class virtual stack_props = object
  val virtual obj : _ obj
  method set_hhomogeneous = set Stack.P.hhomogeneous obj
  method set_homogeneous = set Stack.P.homogeneous obj
  method set_interpolate_size = set Stack.P.interpolate_size obj
  method set_transition_duration = set Stack.P.transition_duration obj
  method set_transition_type = set Stack.P.transition_type obj
  method set_vhomogeneous = set Stack.P.vhomogeneous obj
  method set_visible_child =
    set {Stack.P.visible_child with conv=GObj.conv_widget} obj
  method set_visible_child_name = set Stack.P.visible_child_name obj
  method hhomogeneous = get Stack.P.hhomogeneous obj
  method homogeneous = get Stack.P.homogeneous obj
  method interpolate_size = get Stack.P.interpolate_size obj
  method transition_duration = get Stack.P.transition_duration obj
  method transition_running = get Stack.P.transition_running obj
  method transition_type = get Stack.P.transition_type obj
  method vhomogeneous = get Stack.P.vhomogeneous obj
  method visible_child =
    get {Stack.P.visible_child with conv=GObj.conv_widget} obj
  method visible_child_name = get Stack.P.visible_child_name obj
end

class virtual stack_switcher_props = object
  val virtual obj : _ obj
  method set_icon_size = set StackSwitcher.P.icon_size obj
  method set_stack = set StackSwitcher.P.stack obj
  method icon_size = get StackSwitcher.P.icon_size obj
  method stack = get StackSwitcher.P.stack obj
end

