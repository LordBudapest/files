open GtkSignal
open Gobject
open Data
let set = set
let get = get
let param = param
open GtkRangeProps

class virtual range_props = object
  val virtual obj : _ obj
  method set_adjustment =
    set {Range.P.adjustment with conv=GData.conv_adjustment} obj
  method set_fill_level = set Range.P.fill_level obj
  method set_inverted = set Range.P.inverted obj
  method set_restrict_to_fill_level = set Range.P.restrict_to_fill_level obj
  method set_round_digits = set Range.P.round_digits obj
  method set_show_fill_level = set Range.P.show_fill_level obj
  method set_lower_stepper_sensitivity =
    set Range.P.lower_stepper_sensitivity obj
  method set_upper_stepper_sensitivity =
    set Range.P.upper_stepper_sensitivity obj
  method set_orientation = set Range.P.orientation obj
  method adjustment =
    get {Range.P.adjustment with conv=GData.conv_adjustment} obj
  method fill_level = get Range.P.fill_level obj
  method inverted = get Range.P.inverted obj
  method restrict_to_fill_level = get Range.P.restrict_to_fill_level obj
  method round_digits = get Range.P.round_digits obj
  method show_fill_level = get Range.P.show_fill_level obj
  method lower_stepper_sensitivity =
    get Range.P.lower_stepper_sensitivity obj
  method upper_stepper_sensitivity =
    get Range.P.upper_stepper_sensitivity obj
  method orientation = get Range.P.orientation obj
end

class virtual range_sigs = object (self)
  method private virtual connect :
    'b. ('a,'b) GtkSignal.t -> callback:'b -> GtkSignal.id
  method private virtual notify :
    'b. ('a,'b) property -> callback:('b -> unit) -> GtkSignal.id
  method adjust_bounds = self#connect Range.S.adjust_bounds
  method move_slider = self#connect Range.S.move_slider
  method change_value = self#connect Range.S.change_value
  method value_changed = self#connect Range.S.value_changed
  method notify_adjustment ~callback =
    self#notify {Range.P.adjustment with conv=GData.conv_adjustment} ~callback
  method notify_fill_level ~callback =
    self#notify Range.P.fill_level ~callback
  method notify_inverted ~callback = self#notify Range.P.inverted ~callback
  method notify_restrict_to_fill_level ~callback =
    self#notify Range.P.restrict_to_fill_level ~callback
  method notify_round_digits ~callback =
    self#notify Range.P.round_digits ~callback
  method notify_show_fill_level ~callback =
    self#notify Range.P.show_fill_level ~callback
  method notify_lower_stepper_sensitivity ~callback =
    self#notify Range.P.lower_stepper_sensitivity ~callback
  method notify_upper_stepper_sensitivity ~callback =
    self#notify Range.P.upper_stepper_sensitivity ~callback
  method notify_orientation ~callback =
    self#notify Range.P.orientation ~callback
end

class virtual scale_props = object
  val virtual obj : _ obj
  method set_digits = set Scale.P.digits obj
  method set_draw_value = set Scale.P.draw_value obj
  method set_has_origin = set Scale.P.has_origin obj
  method set_value_pos = set Scale.P.value_pos obj
  method digits = get Scale.P.digits obj
  method draw_value = get Scale.P.draw_value obj
  method has_origin = get Scale.P.has_origin obj
  method value_pos = get Scale.P.value_pos obj
end

class virtual progress_bar_props = object
  val virtual obj : _ obj
  method set_fraction = set ProgressBar.P.fraction obj
  method set_inverted = set ProgressBar.P.inverted obj
  method set_show_text = set ProgressBar.P.show_text obj
  method set_pulse_step = set ProgressBar.P.pulse_step obj
  method set_text = set ProgressBar.P.text obj
  method set_ellipsize = set ProgressBar.P.ellipsize obj
  method fraction = get ProgressBar.P.fraction obj
  method inverted = get ProgressBar.P.inverted obj
  method show_text = get ProgressBar.P.show_text obj
  method pulse_step = get ProgressBar.P.pulse_step obj
  method text = get ProgressBar.P.text obj
  method ellipsize = get ProgressBar.P.ellipsize obj
end

