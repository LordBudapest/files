open Gobject
open Data
module Object = GtkObject

open Gtk

external ml_gtkmisc_init : unit -> unit = "ml_gtkmisc_init"
let () = ml_gtkmisc_init ()
module PrivateProps = struct
  let shadow_type = {name="shadow-type"; conv=GtkEnums.Conv.shadow_type}
end

let may_cons = Property.may_cons
let may_cons_opt = Property.may_cons_opt

module GtkStatusIcon = struct
  let cast w : gtk_status_icon = try_cast w "GtkStatusIcon"
  module P = struct
    let screen : ([>`gtkstatusicon],_) property =
      {name="screen"; conv=(gobject : Gdk.screen data_conv)}
    let visible : ([>`gtkstatusicon],_) property =
      {name="visible"; conv=boolean}
    let tooltip_markup : ([>`gtkstatusicon],_) property =
      {name="tooltip_markup"; conv=string}
    let tooltip_text : ([>`gtkstatusicon],_) property =
      {name="tooltip_text"; conv=string}
  end
  module S = struct
    open GtkSignal
    let activate =
      {name="activate"; classe=`gtkstatusicon; marshaller=marshal_unit}
    let popup_menu =
      {name="popup_menu"; classe=`gtkstatusicon; marshaller=fun f ->
       marshal2 uint uint "GtkStatusIcon::popup_menu" f}
    let size_changed =
      {name="size_changed"; classe=`gtkstatusicon; marshaller=fun f ->
       marshal1 int "GtkStatusIcon::size_changed" f}
  end
  let create pl : gtk_status_icon = Gobject.unsafe_create "GtkStatusIcon" pl
  external set_from_pixbuf :
    [>`gtkstatusicon] obj -> GdkPixbuf.pixbuf -> unit
    = "ml_gtk_status_icon_set_from_pixbuf"
  external set_from_file : [>`gtkstatusicon] obj -> string -> unit
    = "ml_gtk_status_icon_set_from_file"
  external set_from_stock : [>`gtkstatusicon] obj -> string -> unit
    = "ml_gtk_status_icon_set_from_stock"
  external set_from_icon_name : [>`gtkstatusicon] obj -> string -> unit
    = "ml_gtk_status_icon_set_from_icon_name"
  external get_pixbuf : [>`gtkstatusicon] obj -> GdkPixbuf.pixbuf
    = "ml_gtk_status_icon_get_pixbuf"
  external get_stock : [>`gtkstatusicon] obj -> string
    = "ml_gtk_status_icon_get_stock"
  external get_icon_name : [>`gtkstatusicon] obj -> string
    = "ml_gtk_status_icon_get_icon_name"
  external get_size : [>`gtkstatusicon] obj -> int
    = "ml_gtk_status_icon_get_size"
  external set_screen : [>`gtkstatusicon] obj -> Gdk.screen -> unit
    = "ml_gtk_status_icon_set_screen"
  external get_screen : [>`gtkstatusicon] obj -> Gdk.screen
    = "ml_gtk_status_icon_get_screen"
  external is_embedded : [>`gtkstatusicon] obj -> bool
    = "ml_gtk_status_icon_is_embedded"
  let make_params ~cont pl ?screen ?visible ?tooltip_markup ?tooltip_text =
    let pl = (
      may_cons P.screen screen (
      may_cons P.visible visible (
      may_cons P.tooltip_markup tooltip_markup (
      may_cons P.tooltip_text tooltip_text pl)))) in
    cont pl
end

module Misc = struct
  let cast w : Gtk.misc obj = try_cast w "GtkMisc"
  module P = struct
    let xalign : ([>`misc],_) property = {name="xalign"; conv=float}
    let yalign : ([>`misc],_) property = {name="yalign"; conv=float}
    let xpad : ([>`misc],_) property = {name="xpad"; conv=int}
    let ypad : ([>`misc],_) property = {name="ypad"; conv=int}
  end
  let make_params ~cont pl ?xalign ?yalign ?xpad ?ypad =
    let pl = (
      may_cons P.xalign xalign (
      may_cons P.yalign yalign (
      may_cons P.xpad xpad (
      may_cons P.ypad ypad pl)))) in
    cont pl
end

module Label = struct
  let cast w : Gtk.label obj = try_cast w "GtkLabel"
  module P = struct
    let label : ([>`label],_) property = {name="label"; conv=string}
    let use_markup : ([>`label],_) property =
      {name="use-markup"; conv=boolean}
    let use_underline : ([>`label],_) property =
      {name="use-underline"; conv=boolean}
    let mnemonic_keyval : ([>`label],_) property =
      {name="mnemonic-keyval"; conv=uint}
    let mnemonic_widget : ([>`label],_) property =
      {name="mnemonic-widget";
       conv=(gobject_option : Gtk.widget obj option data_conv)}
    let justify : ([>`label],_) property =
      {name="justify"; conv=GtkEnums.Conv.justification}
    let wrap : ([>`label],_) property = {name="wrap"; conv=boolean}
    let pattern : ([>`label],_) property = {name="pattern"; conv=string}
    let selectable : ([>`label],_) property =
      {name="selectable"; conv=boolean}
    let cursor_position : ([>`label],_) property =
      {name="cursor-position"; conv=int}
    let selection_bound : ([>`label],_) property =
      {name="selection-bound"; conv=int}
    let angle : ([>`label],_) property = {name="angle"; conv=double}
    let ellipsize : ([>`label],_) property =
      {name="ellipsize"; conv=PangoEnums.Conv.ellipsize_mode}
    let max_width_chars : ([>`label],_) property =
      {name="max-width-chars"; conv=int}
    let single_line_mode : ([>`label],_) property =
      {name="single-line-mode"; conv=boolean}
    let width_chars : ([>`label],_) property = {name="width-chars"; conv=int}
  end
  module S = struct
    open GtkSignal
    let copy_clipboard =
      {name="copy_clipboard"; classe=`label; marshaller=marshal_unit}
    let move_cursor =
      {name="move_cursor"; classe=`label; marshaller=fun f ->
       marshal3 GtkEnums.Conv.movement_step int boolean
         "GtkLabel::move_cursor" f}
    let populate_popup =
      {name="populate_popup"; classe=`label; marshaller=fun f ->
       marshal1 (gobject : Gtk.menu obj data_conv)
         "GtkLabel::populate_popup" f}
  end
  let create pl : Gtk.label obj = Object.make "GtkLabel" pl
  external get_text : [>`label] obj -> string = "ml_gtk_label_get_text"
  external set_text : [>`label] obj -> string -> unit
    = "ml_gtk_label_set_text"
  external select_region : [>`label] obj -> int -> int -> unit
    = "ml_gtk_label_select_region"
  external get_selection_bounds : [>`label] obj -> (int * int) option
    = "ml_gtk_label_get_selection_bounds"
  external get_layout : [>`label] obj -> Pango.layout
    = "ml_gtk_label_get_layout"
  let make_params ~cont pl ?label ?use_markup ?use_underline ?mnemonic_widget
      ?justify ?line_wrap ?pattern ?selectable ?ellipsize =
    let pl = (
      may_cons P.label label (
      may_cons P.use_markup use_markup (
      may_cons P.use_underline use_underline (
      may_cons_opt P.mnemonic_widget mnemonic_widget (
      may_cons P.justify justify (
      may_cons P.wrap line_wrap (
      may_cons P.pattern pattern (
      may_cons P.selectable selectable (
      may_cons P.ellipsize ellipsize pl))))))))) in
    cont pl
end

module Arrow = struct
  let cast w : Gtk.arrow obj = try_cast w "GtkArrow"
  module P = struct
    let arrow_type : ([>`arrow],_) property =
      {name="arrow-type"; conv=GtkEnums.Conv.arrow_type}
    let shadow_type : ([>`arrow],_) property = PrivateProps.shadow_type
  end
  let create pl : Gtk.arrow obj = Object.make "GtkArrow" pl
  let make_params ~cont pl ?kind ?shadow =
    let pl = (
      may_cons P.arrow_type kind (
      may_cons P.shadow_type shadow pl)) in
    cont pl
end

module Image = struct
  let cast w : Gtk.image obj = try_cast w "GtkImage"
  module P = struct
    let file : ([>`image],_) property = {name="file"; conv=string}
    let icon_name : ([>`image],_) property = {name="icon-name"; conv=string}
    let icon_set : ([>`image],_) property =
      {name="icon-set"; conv=(unsafe_pointer : Gtk.icon_set data_conv)}
    let icon_size : ([>`image],_) property =
      {name="icon-size"; conv=GtkEnums.Conv.icon_size}
    let pixbuf : ([>`image],_) property =
      {name="pixbuf"; conv=(gobject : GdkPixbuf.pixbuf data_conv)}
    let pixel_size : ([>`image],_) property = {name="pixel-size"; conv=int}
    let resource : ([>`image],_) property = {name="resource"; conv=string}
    let stock : ([>`image],_) property = {name="stock"; conv=GtkStock.conv}
    let storage_type : ([>`image],_) property =
      {name="storage-type"; conv=GtkEnums.Conv.image_type}
    let use_fallback : ([>`image],_) property =
      {name="use-fallback"; conv=boolean}
  end
  let create pl : Gtk.image obj = Object.make "GtkImage" pl
  external clear : [>`image] obj -> unit = "ml_gtk_image_clear"
  let make_params ~cont pl ?file ?icon_name ?icon_set ?icon_size ?pixbuf
      ?pixel_size ?resource ?stock ?use_fallback =
    let pl = (
      may_cons P.file file (
      may_cons P.icon_name icon_name (
      may_cons P.icon_set icon_set (
      may_cons P.icon_size icon_size (
      may_cons P.pixbuf pixbuf (
      may_cons P.pixel_size pixel_size (
      may_cons P.resource resource (
      may_cons P.stock stock (
      may_cons P.use_fallback use_fallback pl))))))))) in
    cont pl
end

module ColorSelection = struct
  let cast w : Gtk.color_selection obj = try_cast w "GtkColorSelection"
  module P = struct
    let current_alpha : ([>`colorselection],_) property =
      {name="current-alpha"; conv=uint}
    let current_color : ([>`colorselection],_) property =
      {name="current-color"; conv=(unsafe_pointer : Gdk.color data_conv)}
    let has_opacity_control : ([>`colorselection],_) property =
      {name="has-opacity-control"; conv=boolean}
    let has_palette : ([>`colorselection],_) property =
      {name="has-palette"; conv=boolean}
  end
  module S = struct
    open GtkSignal
    let color_changed =
      {name="color_changed"; classe=`colorselection; marshaller=marshal_unit}
  end
  let create pl : Gtk.color_selection obj =
    Object.make "GtkColorSelection" pl
  let make_params ~cont pl ?alpha ?color ?has_opacity_control ?has_palette =
    let pl = (
      may_cons P.current_alpha alpha (
      may_cons P.current_color color (
      may_cons P.has_opacity_control has_opacity_control (
      may_cons P.has_palette has_palette pl)))) in
    cont pl
end

module FontSelection = struct
  let cast w : Gtk.font_selection obj = try_cast w "GtkFontSelection"
  module P = struct
    let font_name : ([>`fontselection],_) property =
      {name="font-name"; conv=string}
    let preview_text : ([>`fontselection],_) property =
      {name="preview-text"; conv=string}
  end
  let create pl : Gtk.font_selection obj = Object.make "GtkFontSelection" pl
  let make_params ~cont pl ?font_name ?preview_text =
    let pl = (
      may_cons P.font_name font_name (
      may_cons P.preview_text preview_text pl)) in
    cont pl
end

module Statusbar = struct
  let cast w : Gtk.statusbar obj = try_cast w "GtkStatusbar"
  module P = struct
    let shadow_type : ([>`statusbar],_) property = PrivateProps.shadow_type
  end
  module S = struct
    open GtkSignal
    let text_popped =
      {name="text_popped"; classe=`statusbar; marshaller=fun f ->
       marshal2 uint string "GtkStatusbar::text_popped" f}
    let text_pushed =
      {name="text_pushed"; classe=`statusbar; marshaller=fun f ->
       marshal2 uint string "GtkStatusbar::text_pushed" f}
  end
  let create pl : Gtk.statusbar obj = Object.make "GtkStatusbar" pl
  external get_context_id : [>`statusbar] obj -> string -> statusbar_context
    = "ml_gtk_statusbar_get_context_id"
  external push :
    [>`statusbar] obj ->
    statusbar_context -> text:string -> statusbar_message
    = "ml_gtk_statusbar_push"
  external pop : [>`statusbar] obj -> statusbar_context ->  unit
    = "ml_gtk_statusbar_pop"
  external remove :
    [>`statusbar] obj -> statusbar_context -> statusbar_message -> unit
    = "ml_gtk_statusbar_remove"
  external remove_all : [>`statusbar] obj -> statusbar_context -> unit
    = "ml_gtk_statusbar_remove_all"
end

module Calendar = struct
  let cast w : Gtk.calendar obj = try_cast w "GtkCalendar"
  module P = struct
    let day : ([>`calendar],_) property = {name="day"; conv=int}
    let month : ([>`calendar],_) property = {name="month"; conv=int}
    let year : ([>`calendar],_) property = {name="year"; conv=int}
  end
  module S = struct
    open GtkSignal
    let day_selected =
      {name="day_selected"; classe=`calendar; marshaller=marshal_unit}
    let day_selected_double_click =
      {name="day_selected_double_click"; classe=`calendar;
       marshaller=marshal_unit}
    let month_changed =
      {name="month_changed"; classe=`calendar; marshaller=marshal_unit}
    let next_month =
      {name="next_month"; classe=`calendar; marshaller=marshal_unit}
    let next_year =
      {name="next_year"; classe=`calendar; marshaller=marshal_unit}
    let prev_month =
      {name="prev_month"; classe=`calendar; marshaller=marshal_unit}
    let prev_year =
      {name="prev_year"; classe=`calendar; marshaller=marshal_unit}
  end
  let create pl : Gtk.calendar obj = Object.make "GtkCalendar" pl
  external select_month : [>`calendar] obj -> month:int -> year:int -> unit
    = "ml_gtk_calendar_select_month"
  external select_day : [>`calendar] obj -> int -> unit
    = "ml_gtk_calendar_select_day"
  external mark_day : [>`calendar] obj -> int -> unit
    = "ml_gtk_calendar_mark_day"
  external unmark_day : [>`calendar] obj -> int -> unit
    = "ml_gtk_calendar_unmark_day"
  external clear_marks : [>`calendar] obj -> unit
    = "ml_gtk_calendar_clear_marks"
  external set_display_options :
    [>`calendar] obj -> Gtk.Tags.calendar_display_options list -> unit
    = "ml_gtk_calendar_set_display_options"
  external get_date : [>`calendar] obj -> int * int * int
    = "ml_gtk_calendar_get_date"
end

module DrawingArea = struct
  let cast w : Gtk.drawing_area obj = try_cast w "GtkDrawingArea"
  let create pl : Gtk.drawing_area obj = Object.make "GtkDrawingArea" pl
end

module Separator = struct
  let cast w : Gtk.separator obj = try_cast w "GtkSeparator"
  module P = struct
    let orientation : ([>`separator],_) property =
      {name="orientation"; conv=GtkEnums.Conv.orientation}
  end
  let create (dir : Gtk.Tags.orientation) pl : Gtk.separator obj =
    Object.make
      (if dir = `HORIZONTAL then "GtkHSeparator" else "GtkVSeparator")  pl
end

