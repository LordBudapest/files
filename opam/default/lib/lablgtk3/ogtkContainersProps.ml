open GtkSignal
open Gobject
open Data
let set = set
let get = get
let param = param

open GtkContainersProps

open GtkContainersProps

class virtual container_props = object
  val virtual obj : _ obj
  method set_border_width = set Container.P.border_width obj
  method set_resize_mode = set Container.P.resize_mode obj
  method border_width = get Container.P.border_width obj
  method resize_mode = get Container.P.resize_mode obj
end

class virtual container_sigs = object (self)
  method private virtual connect :
    'b. ('a,'b) GtkSignal.t -> callback:'b -> GtkSignal.id
  method private virtual notify :
    'b. ('a,'b) property -> callback:('b -> unit) -> GtkSignal.id
  method add = self#connect
    {Container.S.add with marshaller = fun f ->
     marshal1 GObj.conv_widget "GtkContainer::add" f}
  method remove = self#connect
    {Container.S.remove with marshaller = fun f ->
     marshal1 GObj.conv_widget "GtkContainer::remove" f}
  method notify_border_width ~callback =
    self#notify Container.P.border_width ~callback
  method notify_resize_mode ~callback =
    self#notify Container.P.resize_mode ~callback
end

