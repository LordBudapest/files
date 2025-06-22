open GtkSignal
open Gobject
open Data
let set = set
let get = get
let param = param
open GtkBuilderProps

class virtual builder_props = object
  val virtual obj : _ obj
  method set_translation_domain = set Builder.P.translation_domain obj
  method translation_domain = get Builder.P.translation_domain obj
end

