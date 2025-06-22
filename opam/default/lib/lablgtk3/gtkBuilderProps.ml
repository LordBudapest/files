open Gobject
open Data
module Object = GtkObject
external ml_gtkbuilder_init : unit -> unit = "ml_gtkbuilder_init"
let () = ml_gtkbuilder_init ()
let may_cons = Property.may_cons
let may_cons_opt = Property.may_cons_opt

module Builder = struct
  let cast w : Gtk.builder obj = try_cast w "GtkBuilder"
  module P = struct
    let translation_domain : ([>`builder],_) property =
      {name="translation-domain"; conv=string}
  end
  let create pl : Gtk.builder obj = Object.make "GtkBuilder" pl
  external add_from_file : [>`builder] obj -> string -> unit
    = "ml_gtk_builder_add_from_file"
  external add_from_string : [>`builder] obj -> string -> unit
    = "ml_gtk_builder_add_from_string"
  external add_objects_from_file :
    [>`builder] obj -> string -> string list -> unit
    = "ml_gtk_builder_add_objects_from_file"
  external add_objects_from_string :
    [>`builder] obj -> string -> string list -> unit
    = "ml_gtk_builder_add_objects_from_string"
  external get_object : [>`builder] obj -> string -> unit obj
    = "ml_gtk_builder_get_object"
  let make_params ~cont pl ?translation_domain =
    let pl = (may_cons P.translation_domain translation_domain pl) in
    cont pl
end

