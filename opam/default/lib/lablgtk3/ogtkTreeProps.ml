open GtkSignal
open Gobject
open Data
let set = set
let get = get
let param = param
open GtkTreeProps

class virtual tree_view_props = object
  val virtual obj : _ obj
  method set_enable_search = set TreeView.P.enable_search obj
  method set_fixed_height_mode = set TreeView.P.fixed_height_mode obj
  method set_hadjustment =
    set {TreeView.P.hadjustment with conv=GData.conv_adjustment} obj
  method set_headers_clickable = set TreeView.P.headers_clickable obj
  method set_headers_visible = set TreeView.P.headers_visible obj
  method set_reorderable = set TreeView.P.reorderable obj
  method set_rules_hint = set TreeView.P.rules_hint obj
  method set_search_column = set TreeView.P.search_column obj
  method set_vadjustment =
    set {TreeView.P.vadjustment with conv=GData.conv_adjustment} obj
  method set_hover_expand = set TreeView.P.hover_expand obj
  method set_hover_selection = set TreeView.P.hover_selection obj
  method set_enable_grid_lines = set TreeView.P.enable_grid_lines obj
  method set_enable_tree_lines = set TreeView.P.enable_tree_lines obj
  method set_tooltip_column = set TreeView.P.tooltip_column obj
  method enable_search = get TreeView.P.enable_search obj
  method fixed_height_mode = get TreeView.P.fixed_height_mode obj
  method hadjustment =
    get {TreeView.P.hadjustment with conv=GData.conv_adjustment} obj
  method headers_visible = get TreeView.P.headers_visible obj
  method reorderable = get TreeView.P.reorderable obj
  method rules_hint = get TreeView.P.rules_hint obj
  method search_column = get TreeView.P.search_column obj
  method vadjustment =
    get {TreeView.P.vadjustment with conv=GData.conv_adjustment} obj
  method hover_expand = get TreeView.P.hover_expand obj
  method hover_selection = get TreeView.P.hover_selection obj
  method enable_grid_lines = get TreeView.P.enable_grid_lines obj
  method enable_tree_lines = get TreeView.P.enable_tree_lines obj
  method tooltip_column = get TreeView.P.tooltip_column obj
end

class virtual tree_view_sigs = object (self)
  method private virtual connect :
    'b. ('a,'b) GtkSignal.t -> callback:'b -> GtkSignal.id
  method private virtual notify :
    'b. ('a,'b) property -> callback:('b -> unit) -> GtkSignal.id
  method columns_changed = self#connect TreeView.S.columns_changed
  method cursor_changed = self#connect TreeView.S.cursor_changed
  method expand_collapse_cursor_row =
    self#connect TreeView.S.expand_collapse_cursor_row
  method move_cursor = self#connect TreeView.S.move_cursor
  method row_collapsed = self#connect TreeView.S.row_collapsed
  method row_expanded = self#connect TreeView.S.row_expanded
  method select_all = self#connect TreeView.S.select_all
  method select_cursor_parent = self#connect TreeView.S.select_cursor_parent
  method select_cursor_row = self#connect TreeView.S.select_cursor_row
  method start_interactive_search =
    self#connect TreeView.S.start_interactive_search
  method test_collapse_row = self#connect TreeView.S.test_collapse_row
  method test_expand_row = self#connect TreeView.S.test_expand_row
  method toggle_cursor_row = self#connect TreeView.S.toggle_cursor_row
  method unselect_all = self#connect TreeView.S.unselect_all
  method notify_enable_search ~callback =
    self#notify TreeView.P.enable_search ~callback
  method notify_fixed_height_mode ~callback =
    self#notify TreeView.P.fixed_height_mode ~callback
  method notify_hadjustment ~callback =
    self#notify {TreeView.P.hadjustment with conv=GData.conv_adjustment} ~callback
  method notify_headers_visible ~callback =
    self#notify TreeView.P.headers_visible ~callback
  method notify_reorderable ~callback =
    self#notify TreeView.P.reorderable ~callback
  method notify_rules_hint ~callback =
    self#notify TreeView.P.rules_hint ~callback
  method notify_search_column ~callback =
    self#notify TreeView.P.search_column ~callback
  method notify_vadjustment ~callback =
    self#notify {TreeView.P.vadjustment with conv=GData.conv_adjustment} ~callback
  method notify_hover_expand ~callback =
    self#notify TreeView.P.hover_expand ~callback
  method notify_hover_selection ~callback =
    self#notify TreeView.P.hover_selection ~callback
  method notify_enable_grid_lines ~callback =
    self#notify TreeView.P.enable_grid_lines ~callback
  method notify_enable_tree_lines ~callback =
    self#notify TreeView.P.enable_tree_lines ~callback
  method notify_tooltip_column ~callback =
    self#notify TreeView.P.tooltip_column ~callback
end

let cell_renderer_param = function
  | `CELL_BACKGROUND p -> param CellRenderer.P.cell_background p
  | `CELL_BACKGROUND_GDK p -> param CellRenderer.P.cell_background_gdk p
  | `CELL_BACKGROUND_SET p -> param CellRenderer.P.cell_background_set p
  | `HEIGHT p -> param CellRenderer.P.height p
  | `IS_EXPANDED p -> param CellRenderer.P.is_expanded p
  | `IS_EXPANDER p -> param CellRenderer.P.is_expander p
  | `MODE p -> param CellRenderer.P.mode p
  | `VISIBLE p -> param CellRenderer.P.visible p
  | `WIDTH p -> param CellRenderer.P.width p
  | `XALIGN p -> param CellRenderer.P.xalign p
  | `XPAD p -> param CellRenderer.P.xpad p
  | `YALIGN p -> param CellRenderer.P.yalign p
  | `YPAD p -> param CellRenderer.P.ypad p

let cell_renderer_pixbuf_param = function
  | `PIXBUF p -> param CellRendererPixbuf.P.pixbuf p
  | `PIXBUF_EXPANDER_CLOSED p ->
      param CellRendererPixbuf.P.pixbuf_expander_closed p
  | `PIXBUF_EXPANDER_OPEN p ->
      param CellRendererPixbuf.P.pixbuf_expander_open p
  | `STOCK_DETAIL p -> param CellRendererPixbuf.P.stock_detail p
  | `STOCK_ID p -> param CellRendererPixbuf.P.stock_id p
  | `STOCK_SIZE p -> param CellRendererPixbuf.P.stock_size p

let cell_renderer_text_param = function
  | `BACKGROUND p -> param CellRendererText.P.background p
  | `BACKGROUND_GDK p -> param CellRendererText.P.background_gdk p
  | `BACKGROUND_SET p -> param CellRendererText.P.background_set p
  | `EDITABLE p -> param CellRendererText.P.editable p
  | `FAMILY p -> param CellRendererText.P.family p
  | `FONT p -> param CellRendererText.P.font p
  | `FONT_DESC p -> param CellRendererText.P.font_desc p
  | `FOREGROUND p -> param CellRendererText.P.foreground p
  | `FOREGROUND_GDK p -> param CellRendererText.P.foreground_gdk p
  | `FOREGROUND_SET p -> param CellRendererText.P.foreground_set p
  | `MARKUP p -> param CellRendererText.P.markup p
  | `RISE p -> param CellRendererText.P.rise p
  | `SCALE p -> param CellRendererText.P.scale p
  | `SINGLE_PARAGRAPH_MODE p ->
      param CellRendererText.P.single_paragraph_mode p
  | `SIZE p -> param CellRendererText.P.size p
  | `SIZE_POINTS p -> param CellRendererText.P.size_points p
  | `STRETCH p -> param CellRendererText.P.stretch p
  | `STRIKETHROUGH p -> param CellRendererText.P.strikethrough p
  | `STYLE p -> param CellRendererText.P.style p
  | `TEXT p -> param CellRendererText.P.text p
  | `UNDERLINE p -> param CellRendererText.P.underline p
  | `VARIANT p -> param CellRendererText.P.variant p
  | `WEIGHT p -> param CellRendererText.P.weight p
  | `WRAP_MODE p -> param CellRendererText.P.wrap_mode p
  | `WRAP_WIDTH p -> param CellRendererText.P.wrap_width p

let cell_renderer_toggle_param = function
  | `ACTIVATABLE p -> param CellRendererToggle.P.activatable p
  | `ACTIVE p -> param CellRendererToggle.P.active p
  | `INCONSISTENT p -> param CellRendererToggle.P.inconsistent p
  | `RADIO p -> param CellRendererToggle.P.radio p

let cell_renderer_progress_param = function
  | `VALUE p -> param CellRendererProgress.P.value p
  | `TEXT p -> param CellRendererProgress.P.text p

class virtual tree_view_column_props = object
  val virtual obj : _ obj
  method set_alignment = set TreeViewColumn.P.alignment obj
  method set_clickable = set TreeViewColumn.P.clickable obj
  method set_expand = set TreeViewColumn.P.expand obj
  method set_fixed_width = set TreeViewColumn.P.fixed_width obj
  method set_max_width = set TreeViewColumn.P.max_width obj
  method set_min_width = set TreeViewColumn.P.min_width obj
  method set_reorderable = set TreeViewColumn.P.reorderable obj
  method set_resizable = set TreeViewColumn.P.resizable obj
  method set_sizing = set TreeViewColumn.P.sizing obj
  method set_sort_indicator = set TreeViewColumn.P.sort_indicator obj
  method set_sort_order = set TreeViewColumn.P.sort_order obj
  method set_title = set TreeViewColumn.P.title obj
  method set_visible = set TreeViewColumn.P.visible obj
  method set_widget =
    set {TreeViewColumn.P.widget with conv=GObj.conv_widget_option} obj
  method alignment = get TreeViewColumn.P.alignment obj
  method clickable = get TreeViewColumn.P.clickable obj
  method expand = get TreeViewColumn.P.expand obj
  method fixed_width = get TreeViewColumn.P.fixed_width obj
  method max_width = get TreeViewColumn.P.max_width obj
  method min_width = get TreeViewColumn.P.min_width obj
  method reorderable = get TreeViewColumn.P.reorderable obj
  method resizable = get TreeViewColumn.P.resizable obj
  method sizing = get TreeViewColumn.P.sizing obj
  method sort_indicator = get TreeViewColumn.P.sort_indicator obj
  method sort_order = get TreeViewColumn.P.sort_order obj
  method title = get TreeViewColumn.P.title obj
  method visible = get TreeViewColumn.P.visible obj
  method widget =
    get {TreeViewColumn.P.widget with conv=GObj.conv_widget_option} obj
  method width = get TreeViewColumn.P.width obj
end

class virtual tree_model_sigs = object (self)
  method private virtual connect :
    'b. ('a,'b) GtkSignal.t -> callback:'b -> GtkSignal.id
  method private virtual notify :
    'b. ('a,'b) property -> callback:('b -> unit) -> GtkSignal.id
  method row_changed = self#connect TreeModel.S.row_changed
  method row_deleted = self#connect TreeModel.S.row_deleted
  method row_has_child_toggled =
    self#connect TreeModel.S.row_has_child_toggled
  method row_inserted = self#connect TreeModel.S.row_inserted
  method rows_reordered = self#connect TreeModel.S.rows_reordered
end

class virtual tree_sortable_sigs = object (self)
  method private virtual connect :
    'b. ('a,'b) GtkSignal.t -> callback:'b -> GtkSignal.id
  method private virtual notify :
    'b. ('a,'b) property -> callback:('b -> unit) -> GtkSignal.id
  method sort_column_changed =
    self#connect TreeSortable.S.sort_column_changed
end

class virtual icon_view_props = object
  val virtual obj : _ obj
  method set_column_spacing = set IconView.P.column_spacing obj
  method set_columns = set IconView.P.columns obj
  method set_item_width = set IconView.P.item_width obj
  method set_margin = set IconView.P.margin obj
  method set_orientation = set IconView.P.orientation obj
  method set_row_spacing = set IconView.P.row_spacing obj
  method set_selection_mode = set IconView.P.selection_mode obj
  method set_spacing = set IconView.P.spacing obj
  method column_spacing = get IconView.P.column_spacing obj
  method columns = get IconView.P.columns obj
  method item_width = get IconView.P.item_width obj
  method margin = get IconView.P.margin obj
  method orientation = get IconView.P.orientation obj
  method row_spacing = get IconView.P.row_spacing obj
  method selection_mode = get IconView.P.selection_mode obj
  method spacing = get IconView.P.spacing obj
end

class virtual icon_view_sigs = object (self)
  method private virtual connect :
    'b. ('a,'b) GtkSignal.t -> callback:'b -> GtkSignal.id
  method private virtual notify :
    'b. ('a,'b) property -> callback:('b -> unit) -> GtkSignal.id
  method item_activated = self#connect IconView.S.item_activated
  method selection_changed = self#connect IconView.S.selection_changed
  method notify_column_spacing ~callback =
    self#notify IconView.P.column_spacing ~callback
  method notify_columns ~callback = self#notify IconView.P.columns ~callback
  method notify_item_width ~callback =
    self#notify IconView.P.item_width ~callback
  method notify_margin ~callback = self#notify IconView.P.margin ~callback
  method notify_orientation ~callback =
    self#notify IconView.P.orientation ~callback
  method notify_row_spacing ~callback =
    self#notify IconView.P.row_spacing ~callback
  method notify_selection_mode ~callback =
    self#notify IconView.P.selection_mode ~callback
  method notify_spacing ~callback = self#notify IconView.P.spacing ~callback
end

