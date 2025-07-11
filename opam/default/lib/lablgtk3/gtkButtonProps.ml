open Gobject
open Data
module Object = GtkObject

open Gtk

external ml_gtkbutton_init : unit -> unit = "ml_gtkbutton_init"
let () = ml_gtkbutton_init ()
module PrivateProps = struct
  let label = {name="label"; conv=string}
  let title = {name="title"; conv=string}
  let use_underline = {name="use-underline"; conv=boolean}
end

let may_cons = Property.may_cons
let may_cons_opt = Property.may_cons_opt

module Button = struct
  let cast w : Gtk.button obj = try_cast w "GtkButton"
  module P = struct
    let focus_on_click : ([>`button],_) property =
      {name="focus-on-click"; conv=boolean}
    let image : ([>`button],_) property =
      {name="image"; conv=(gobject : Gtk.widget obj data_conv)}
    let image_position : ([>`button],_) property =
      {name="image-position"; conv=GtkEnums.Conv.position_type}
    let label : ([>`button],_) property = PrivateProps.label
    let use_stock : ([>`button],_) property =
      {name="use-stock"; conv=boolean}
    let use_underline : ([>`button],_) property = PrivateProps.use_underline
    let relief : ([>`button],_) property =
      {name="relief"; conv=GtkEnums.Conv.relief_style}
    let xalign : ([>`button],_) property = {name="xalign"; conv=float}
    let yalign : ([>`button],_) property = {name="yalign"; conv=float}
  end
  module S = struct
    open GtkSignal
    let activate = {name="activate"; classe=`button; marshaller=marshal_unit}
    let clicked = {name="clicked"; classe=`button; marshaller=marshal_unit}
    let enter = {name="enter"; classe=`button; marshaller=marshal_unit}
    let leave = {name="leave"; classe=`button; marshaller=marshal_unit}
    let pressed = {name="pressed"; classe=`button; marshaller=marshal_unit}
    let released = {name="released"; classe=`button; marshaller=marshal_unit}
  end
  let create pl : Gtk.button obj = Object.make "GtkButton" pl
  let make_params ~cont pl ?label ?use_stock ?use_underline ?relief =
    let pl = (
      may_cons P.label label (
      may_cons P.use_stock use_stock (
      may_cons P.use_underline use_underline (
      may_cons P.relief relief pl)))) in
    cont pl
end

module ToggleButton = struct
  let cast w : Gtk.toggle_button obj = try_cast w "GtkToggleButton"
  module P = struct
    let active : ([>`togglebutton],_) property =
      {name="active"; conv=boolean}
    let draw_indicator : ([>`togglebutton],_) property =
      {name="draw-indicator"; conv=boolean}
    let inconsistent : ([>`togglebutton],_) property =
      {name="inconsistent"; conv=boolean}
  end
  module S = struct
    open GtkSignal
    let toggled =
      {name="toggled"; classe=`togglebutton; marshaller=marshal_unit}
  end
  let create pl : Gtk.toggle_button obj = Object.make "GtkToggleButton" pl
  let make_params ~cont pl ?active ?draw_indicator =
    let pl = (
      may_cons P.active active (
      may_cons P.draw_indicator draw_indicator pl)) in
    cont pl
end

module RadioButton = struct
  let cast w : Gtk.radio_button obj = try_cast w "GtkRadioButton"
  module P = struct
    let group : ([>`radiobutton],_) property =
      {name="group";
       conv=(gobject_option : Gtk.radio_button obj option data_conv)}
  end
  let create pl : Gtk.radio_button obj = Object.make "GtkRadioButton" pl
end

module ColorButton = struct
  let cast w : Gtk.color_button obj = try_cast w "GtkColorButton"
  module P = struct
    let alpha : ([>`colorbutton],_) property = {name="alpha"; conv=uint}
    let color : ([>`colorbutton],_) property =
      {name="color"; conv=(unsafe_pointer : Gdk.color data_conv)}
    let rgba : ([>`colorbutton],_) property =
      {name="rgba"; conv=(unsafe_pointer : Gdk.rgba data_conv)}
    let show_editor : ([>`colorbutton],_) property =
      {name="show-editor"; conv=boolean}
    let title : ([>`colorbutton],_) property = PrivateProps.title
    let use_alpha : ([>`colorbutton],_) property =
      {name="use-alpha"; conv=boolean}
  end
  module S = struct
    open GtkSignal
    let color_set =
      {name="color_set"; classe=`colorbutton; marshaller=marshal_unit}
  end
  let create pl : Gtk.color_button obj = Object.make "GtkColorButton" pl
  let make_params ~cont pl ?color ?rgba ?title =
    let pl = (
      may_cons P.color color (
      may_cons P.rgba rgba (
      may_cons P.title title pl))) in
    cont pl
end

module FontButton = struct
  let cast w : Gtk.font_button obj = try_cast w "GtkFontButton"
  module P = struct
    let font_name : ([>`fontbutton],_) property =
      {name="font-name"; conv=string}
    let show_size : ([>`fontbutton],_) property =
      {name="show-size"; conv=boolean}
    let show_style : ([>`fontbutton],_) property =
      {name="show-style"; conv=boolean}
    let title : ([>`fontbutton],_) property = PrivateProps.title
    let use_font : ([>`fontbutton],_) property =
      {name="use-font"; conv=boolean}
    let use_size : ([>`fontbutton],_) property =
      {name="use-size"; conv=boolean}
  end
  module S = struct
    open GtkSignal
    let font_set =
      {name="font_set"; classe=`fontbutton; marshaller=marshal_unit}
  end
  let create pl : Gtk.font_button obj = Object.make "GtkFontButton" pl
  let make_params ~cont pl ?font_name ?title =
    let pl = (may_cons P.font_name font_name (may_cons P.title title pl)) in
    cont pl
end

module ToolItem = struct
  let cast w : Gtk.tool_item obj = try_cast w "GtkToolItem"
  module P = struct
    let is_important : ([>`toolitem],_) property =
      {name="is-important"; conv=boolean}
    let visible_horizontal : ([>`toolitem],_) property =
      {name="visible-horizontal"; conv=boolean}
    let visible_vertical : ([>`toolitem],_) property =
      {name="visible-vertical"; conv=boolean}
  end
  let create pl : Gtk.tool_item obj = Object.make "GtkToolItem" pl
  external set_homogeneous : [>`toolitem] obj -> bool -> unit
    = "ml_gtk_tool_item_set_homogeneous"
  external get_homogeneous : [>`toolitem] obj -> bool
    = "ml_gtk_tool_item_get_homogeneous"
  external set_expand : [>`toolitem] obj -> bool -> unit
    = "ml_gtk_tool_item_set_expand"
  external get_expand : [>`toolitem] obj -> bool
    = "ml_gtk_tool_item_get_expand"
  external set_use_drag_window : [>`toolitem] obj -> bool -> unit
    = "ml_gtk_tool_item_set_use_drag_window"
  external get_use_drag_window : [>`toolitem] obj -> bool
    = "ml_gtk_tool_item_get_use_drag_window"
end

module SeparatorToolItem = struct
  let cast w : Gtk.separator_tool_item obj =
    try_cast w "GtkSeparatorToolItem"
  module P = struct
    let draw : ([>`separatortoolitem],_) property =
      {name="draw"; conv=boolean}
  end
  let create pl : Gtk.separator_tool_item obj =
    Object.make "GtkSeparatorToolItem" pl
end

module ToolButton = struct
  let cast w : Gtk.tool_button obj = try_cast w "GtkToolButton"
  module P = struct
    let icon_widget : ([>`toolbutton],_) property =
      {name="icon-widget"; conv=(gobject : Gtk.widget obj data_conv)}
    let label : ([>`toolbutton],_) property = PrivateProps.label
    let label_widget : ([>`toolbutton],_) property =
      {name="label-widget"; conv=(gobject : Gtk.widget obj data_conv)}
    let stock_id : ([>`toolbutton],_) property =
      {name="stock-id"; conv=GtkStock.conv}
    let use_underline : ([>`toolbutton],_) property = PrivateProps.use_underline
  end
  module S = struct
    open GtkSignal
    let clicked =
      {name="clicked"; classe=`toolbutton; marshaller=marshal_unit}
  end
  let create pl : Gtk.tool_button obj = Object.make "GtkToolButton" pl
end

module ToggleToolButton = struct
  let cast w : Gtk.toggle_tool_button obj = try_cast w "GtkToggleToolButton"
  module S = struct
    open GtkSignal
    let toggled =
      {name="toggled"; classe=`toggletoolbutton; marshaller=marshal_unit}
  end
  let create pl : Gtk.toggle_tool_button obj =
    Object.make "GtkToggleToolButton" pl
  external set_active : [>`toggletoolbutton] obj -> bool -> unit
    = "ml_gtk_toggle_tool_button_set_active"
  external get_active : [>`toggletoolbutton] obj -> bool
    = "ml_gtk_toggle_tool_button_get_active"
end

module RadioToolButton = struct
  let cast w : Gtk.radio_tool_button obj = try_cast w "GtkRadioToolButton"
  module P = struct
    let group : ([>`radiotoolbutton],_) property =
      {name="group";
       conv=(gobject_option : Gtk.radio_tool_button obj option data_conv)}
  end
  let create pl : Gtk.radio_tool_button obj =
    Object.make "GtkRadioToolButton" pl
end

module MenuToolButton = struct
  let cast w : Gtk.menu_tool_button obj = try_cast w "GtkMenuToolButton"
  module P = struct
    let menu : ([>`menutoolbutton],_) property =
      {name="menu"; conv=(gobject : menu obj data_conv)}
  end
  let create pl : Gtk.menu_tool_button obj =
    Object.make "GtkMenuToolButton" pl
  external set_arrow_tooltip_text : [>`menutoolbutton] obj -> string -> unit
    = "ml_gtk_menu_tool_button_set_arrow_tooltip_text"
  external set_arrow_tooltip_markup :
    [>`menutoolbutton] obj -> string -> unit
    = "ml_gtk_menu_tool_button_set_arrow_tooltip_markup"
end

module Toolbar = struct
  let cast w : Gtk.toolbar obj = try_cast w "GtkToolbar"
  module P = struct
    let icon_size : ([>`toolbar],_) property =
      {name="icon-size"; conv=GtkEnums.Conv.icon_size}
    let icon_size_set : ([>`toolbar],_) property =
      {name="icon-size-set"; conv=boolean}
    let show_arrow : ([>`toolbar],_) property =
      {name="show-arrow"; conv=boolean}
    let toolbar_style : ([>`toolbar],_) property =
      {name="toolbar-style"; conv=GtkEnums.Conv.toolbar_style}
  end
  module S = struct
    open GtkSignal
    let style_changed =
      {name="style_changed"; classe=`toolbar; marshaller=fun f ->
       marshal1 GtkEnums.Conv.toolbar_style "GtkToolbar::style_changed" f}
    let focus_home_or_end =
      {name="focus_home_or_end"; classe=`toolbar; marshaller=fun f ->
       marshal1_ret ~ret:boolean boolean "GtkToolbar::focus_home_or_end" f}
    let move_focus =
      {name="move_focus"; classe=`toolbar; marshaller=fun f ->
       marshal1_ret ~ret:boolean GtkEnums.Conv.direction_type
         "GtkToolbar::move_focus" f}
    let popup_context_menu =
      {name="popup_context_menu"; classe=`toolbar; marshaller=fun f ->
       marshal3_ret ~ret:boolean int int int
         "GtkToolbar::popup_context_menu" f}
  end
  let create pl : Gtk.toolbar obj = Object.make "GtkToolbar" pl
  external insert : [>`toolbar] obj -> [> `toolitem] obj -> int -> unit
    = "ml_gtk_toolbar_insert"
  external get_item_index : [>`toolbar] obj -> [> `toolitem] obj -> int
    = "ml_gtk_toolbar_get_item_index"
  external get_n_items : [>`toolbar] obj -> int
    = "ml_gtk_toolbar_get_n_items"
  external get_nth_item : [>`toolbar] obj -> int -> tool_item obj
    = "ml_gtk_toolbar_get_nth_item"
  external unset_style : [>`toolbar] obj -> unit
    = "ml_gtk_toolbar_unset_style"
  external get_drop_index : [>`toolbar] obj -> int -> int -> int
    = "ml_gtk_toolbar_get_drop_index"
  external set_drop_highlight_item :
    [>`toolbar] obj -> [>`toolitem] obj option -> int -> unit
    = "ml_gtk_toolbar_set_drop_highlight_item"
  external get_relief_style : [>`toolbar] obj -> GtkEnums.relief_style
    = "ml_gtk_toolbar_get_relief_style"
  let make_params ~cont pl ?icon_size ?icon_size_set ?show_arrow
      ?toolbar_style =
    let pl = (
      may_cons P.icon_size icon_size (
      may_cons P.icon_size_set icon_size_set (
      may_cons P.show_arrow show_arrow (
      may_cons P.toolbar_style toolbar_style pl)))) in
    cont pl
end

module LinkButton = struct
  let cast w : Gtk.link_button obj = try_cast w "GtkLinkButton"
  module P = struct
    let uri : ([>`linkbutton],_) property = {name="uri"; conv=string}
  end
  module S = struct
    open GtkSignal
    let activate_link =
      {name="activate_link"; classe=`linkbutton; marshaller=marshal_unit}
  end
  let create pl : Gtk.link_button obj = Object.make "GtkLinkButton" pl
end

