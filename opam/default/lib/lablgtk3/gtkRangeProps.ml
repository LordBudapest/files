open Gobject
open Data
module Object = GtkObject

open Gtk

external ml_gtkrange_init : unit -> unit = "ml_gtkrange_init"
let () = ml_gtkrange_init ()
module PrivateProps = struct let inverted = {name="inverted"; conv=boolean}
end

let may_cons = Property.may_cons
let may_cons_opt = Property.may_cons_opt

module Range = struct
  let cast w : Gtk.range obj = try_cast w "GtkRange"
  module P = struct
    let adjustment : ([>`range],_) property =
      {name="adjustment"; conv=(gobject : Gtk.adjustment obj data_conv)}
    let fill_level : ([>`range],_) property =
      {name="fill-level"; conv=double}
    let inverted : ([>`range],_) property = PrivateProps.inverted
    let restrict_to_fill_level : ([>`range],_) property =
      {name="restrict-to-fill-level"; conv=boolean}
    let round_digits : ([>`range],_) property =
      {name="round-digits"; conv=int}
    let show_fill_level : ([>`range],_) property =
      {name="show-fill-level"; conv=boolean}
    let lower_stepper_sensitivity : ([>`range],_) property =
      {name="lower-stepper-sensitivity"; conv=GtkEnums.Conv.sensitivity_type}
    let upper_stepper_sensitivity : ([>`range],_) property =
      {name="upper-stepper-sensitivity"; conv=GtkEnums.Conv.sensitivity_type}
    let orientation : ([>`range],_) property =
      {name="orientation"; conv=GtkEnums.Conv.orientation}
  end
  module S = struct
    open GtkSignal
    let adjust_bounds =
      {name="adjust_bounds"; classe=`range; marshaller=fun f ->
       marshal1 double "GtkRange::adjust_bounds" f}
    let move_slider =
      {name="move_slider"; classe=`range; marshaller=fun f ->
       marshal1 GtkEnums.Conv.scroll_type "GtkRange::move_slider" f}
    let change_value =
      {name="change_value"; classe=`range; marshaller=fun f ->
       marshal2 GtkEnums.Conv.scroll_type double "GtkRange::change_value" f}
    let value_changed =
      {name="value_changed"; classe=`range; marshaller=marshal_unit}
  end
  let make_params ~cont pl ?adjustment ?fill_level ?inverted
      ?restrict_to_fill_level ?round_digits ?show_fill_level
      ?lower_stepper_sensitivity ?upper_stepper_sensitivity =
    let pl = (
      may_cons P.adjustment adjustment (
      may_cons P.fill_level fill_level (
      may_cons P.inverted inverted (
      may_cons P.restrict_to_fill_level restrict_to_fill_level (
      may_cons P.round_digits round_digits (
      may_cons P.show_fill_level show_fill_level (
      may_cons P.lower_stepper_sensitivity lower_stepper_sensitivity (
      may_cons P.upper_stepper_sensitivity upper_stepper_sensitivity pl)))))))) in
    cont pl
end

module Scale = struct
  let cast w : Gtk.scale obj = try_cast w "GtkScale"
  module P = struct
    let digits : ([>`scale],_) property = {name="digits"; conv=int}
    let draw_value : ([>`scale],_) property =
      {name="draw-value"; conv=boolean}
    let has_origin : ([>`scale],_) property =
      {name="has-origin"; conv=boolean}
    let value_pos : ([>`scale],_) property =
      {name="value-pos"; conv=GtkEnums.Conv.position_type}
  end
  module S = struct
    open GtkSignal
    let format_value =
      {name="format_value"; classe=`scale; marshaller=fun f ->
       marshal1_ret ~ret:string double "GtkScale::format_value" f}
  end
  let create (dir : Gtk.Tags.orientation) pl : Gtk.scale obj =
    Object.make (if dir = `HORIZONTAL then "GtkHScale" else "GtkVScale")  pl
  let make_params ~cont pl ?digits ?draw_value ?has_origin ?value_pos =
    let pl = (
      may_cons P.digits digits (
      may_cons P.draw_value draw_value (
      may_cons P.has_origin has_origin (
      may_cons P.value_pos value_pos pl)))) in
    cont pl
end

module Scrollbar = struct
  let cast w : Gtk.scrollbar obj = try_cast w "GtkScrollbar"
  let create (dir : Gtk.Tags.orientation) pl : Gtk.scrollbar obj =
    Object.make
      (if dir = `HORIZONTAL then "GtkHScrollbar" else "GtkVScrollbar")  pl
end

module ProgressBar = struct
  let cast w : Gtk.progress_bar obj = try_cast w "GtkProgressBar"
  module P = struct
    let fraction : ([>`progressbar],_) property =
      {name="fraction"; conv=double}
    let inverted : ([>`progressbar],_) property = PrivateProps.inverted
    let show_text : ([>`progressbar],_) property =
      {name="show-text"; conv=boolean}
    let pulse_step : ([>`progressbar],_) property =
      {name="pulse-step"; conv=double}
    let text : ([>`progressbar],_) property = {name="text"; conv=string}
    let ellipsize : ([>`progressbar],_) property =
      {name="ellipsize"; conv=PangoEnums.Conv.ellipsize_mode}
  end
  let create pl : Gtk.progress_bar obj = Object.make "GtkProgressBar" pl
  external pulse : [>`progressbar] obj -> unit = "ml_gtk_progress_bar_pulse"
  let make_params ~cont pl ?pulse_step =
    let pl = (may_cons P.pulse_step pulse_step pl) in
    cont pl
end

