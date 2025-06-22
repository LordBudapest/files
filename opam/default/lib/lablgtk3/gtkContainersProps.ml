open Gobject
open Data
module Object = GtkObject

open Gtk

let may_cons = Property.may_cons
let may_cons_opt = Property.may_cons_opt

module Container = struct
  let cast w : Gtk.container obj = try_cast w "GtkContainer"
  module P = struct
    let border_width : ([>`container],_) property =
      {name="border-width"; conv=uint}
    let child : ([>`container],_) property =
      {name="child"; conv=(gobject : Gtk.widget obj data_conv)}
    let resize_mode : ([>`container],_) property =
      {name="resize-mode"; conv=GtkEnums.Conv.resize_mode}
  end
  module S = struct
    open GtkSignal
    let add =
      {name="add"; classe=`container; marshaller=fun f ->
       marshal1 (gobject : Gtk.widget obj data_conv) "GtkContainer::add" f}
    let remove =
      {name="remove"; classe=`container; marshaller=fun f ->
       marshal1 (gobject : Gtk.widget obj data_conv) "GtkContainer::remove" f}
    let check_resize =
      {name="check_resize"; classe=`container; marshaller=marshal_unit}
    let set_focus =
      {name="set_focus"; classe=`container; marshaller=fun f ->
       marshal1 (gobject_option : Gtk.widget obj option data_conv)
         "GtkContainer::set_focus" f}
  end
  external check_resize : [>`container] obj -> unit
    = "ml_gtk_container_check_resize"
  external add : [>`container] obj -> [>`widget] obj -> unit
    = "ml_gtk_container_add"
  external remove : [>`container] obj -> [>`widget] obj -> unit
    = "ml_gtk_container_remove"
  external forall : [>`container] obj -> f:(widget obj -> unit) -> unit
    = "ml_gtk_container_forall"
  external foreach : [>`container] obj -> f:(widget obj -> unit) -> unit
    = "ml_gtk_container_foreach"
  external set_focus_child : [>`container] obj -> [>`widget] optobj -> unit
    = "ml_gtk_container_set_focus_child"
  external set_focus_vadjustment :
    [>`container] obj -> [>`adjustment] optobj -> unit
    = "ml_gtk_container_set_focus_vadjustment"
  external set_focus_hadjustment :
    [>`container] obj -> [>`adjustment] optobj -> unit
    = "ml_gtk_container_set_focus_hadjustment"
  external child_set_property :
    [>`container] obj -> [>`widget] obj -> string -> g_value -> unit
    = "ml_gtk_container_child_set_property"
  external child_get_property :
    [>`container] obj -> [>`widget] obj -> string -> g_value -> unit
    = "ml_gtk_container_child_get_property"
end

