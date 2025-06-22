(** sourceView3 enums *)

type source_smart_home_end_type = [ `DISABLED | `BEFORE | `AFTER | `ALWAYS ]
type source_draw_spaces_flags =
  [ `SPACE | `TAB | `NEWLINE | `NBSP | `LEADING | `TEXT | `TRAILING ]
type source_completion_activation_flags = [ `INTERACTIVE | `USER_REQUESTED ] 

(**/**)

module Conv = struct
  open Gpointer

  external _get_tables : unit ->
      source_smart_home_end_type variant_table
    * source_draw_spaces_flags variant_table
    * source_completion_activation_flags variant_table
    = "ml_source_view3_get_tables"

  let source_smart_home_end_type_tbl, source_draw_spaces_flags_tbl,
      source_completion_activation_flags_tbl = _get_tables ()

  let source_smart_home_end_type = Gobject.Data.enum source_smart_home_end_type_tbl
  let source_draw_spaces_flags = Gobject.Data.enum source_draw_spaces_flags_tbl
  let source_completion_activation_flags = Gobject.Data.enum source_completion_activation_flags_tbl
end
