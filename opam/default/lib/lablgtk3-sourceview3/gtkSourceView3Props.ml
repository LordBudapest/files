open Gobject
open Data
module Object = GtkObject

  open GtkSourceView3_types
  open SourceView3Enums

external ml_gtk_source_view_init : unit -> unit = "ml_gtk_source_view_init"
let () = ml_gtk_source_view_init ()
module PrivateProps = struct
  let icon = {name="icon"; conv=(gobject : GdkPixbuf.pixbuf data_conv)}
  let info = {name="info"; conv=string}
  let label = {name="label"; conv=string}
  let markup = {name="markup"; conv=string}
  let text = {name="text"; conv=string}
end

let may_cons = Property.may_cons
let may_cons_opt = Property.may_cons_opt

module SourceStyleScheme = struct
  let cast w : source_style_scheme obj = try_cast w "GtkSourceStyleScheme"
  let create pl : source_style_scheme obj =
    Gobject.unsafe_create "GtkSourceStyleScheme" pl
end

module SourceStyleSchemeManager = struct
  let cast w : source_style_scheme_manager obj =
    try_cast w "GtkSourceStyleSchemeManager"
  let create pl : source_style_scheme_manager obj =
    Gobject.unsafe_create "GtkSourceStyleSchemeManager" pl
  external get_search_path : [>`sourcestyleschememanager] obj -> string list
    = "ml_gtk_source_style_scheme_manager_get_search_path"
  external set_search_path :
    [>`sourcestyleschememanager] obj -> string list -> unit
    = "ml_gtk_source_style_scheme_manager_set_search_path"
  external get_scheme_ids : [>`sourcestyleschememanager] obj -> string list
    = "ml_gtk_source_style_scheme_manager_get_scheme_ids"
  external append_search_path :
    [>`sourcestyleschememanager] obj -> string -> unit
    = "ml_gtk_source_style_scheme_manager_append_search_path"
  external prepend_search_path :
    [>`sourcestyleschememanager] obj -> string -> unit
    = "ml_gtk_source_style_scheme_manager_prepend_search_path"
  external get_scheme :
    [>`sourcestyleschememanager] obj ->
    string -> source_style_scheme obj option
    = "ml_gtk_source_style_scheme_manager_get_scheme"
  external force_rescan : [>`sourcestyleschememanager] obj -> unit -> unit
    = "ml_gtk_source_style_scheme_manager_force_rescan"
end

module SourceCompletionInfo = struct
  let cast w : source_completion_info obj =
    try_cast w "GtkSourceCompletionInfo"
  module P = struct
    let max_height : ([>`sourcecompletioninfo],_) property =
      {name="max-height"; conv=int}
    let max_width : ([>`sourcecompletioninfo],_) property =
      {name="max-width"; conv=int}
    let shrink_height : ([>`sourcecompletioninfo],_) property =
      {name="shrink-height"; conv=boolean}
    let shrink_width : ([>`sourcecompletioninfo],_) property =
      {name="shrink-width"; conv=boolean}
  end
  module S = struct
    open GtkSignal
    let before_show =
      {name="before_show"; classe=`sourcecompletioninfo;
       marshaller=marshal_unit}
  end
  let create pl : source_completion_info obj =
    Object.make "GtkSourceCompletionInfo" pl
  external move_to_iter :
    [>`sourcecompletioninfo] obj ->
    Gtk.text_view obj -> Gtk.text_iter -> unit
    = "ml_gtk_source_completion_info_move_to_iter"
  external set_widget :
    [>`sourcecompletioninfo] obj -> Gtk.widget obj -> unit
    = "ml_gtk_source_completion_info_set_widget"
  external get_widget : [>`sourcecompletioninfo] obj -> Gtk.widget obj
    = "ml_gtk_source_completion_info_get_widget"
end

module SourceCompletionProposal = struct
  let cast w : source_completion_proposal obj =
    try_cast w "GtkSourceCompletionProposal"
  module P = struct
    let icon : ([>`sourcecompletionproposal],_) property = PrivateProps.icon
    let info : ([>`sourcecompletionproposal],_) property = PrivateProps.info
    let label : ([>`sourcecompletionproposal],_) property = PrivateProps.label
    let markup : ([>`sourcecompletionproposal],_) property = PrivateProps.markup
    let text : ([>`sourcecompletionproposal],_) property = PrivateProps.text
  end
  module S = struct
    open GtkSignal
    let changed =
      {name="changed"; classe=`sourcecompletionproposal;
       marshaller=marshal_unit}
  end
  let create pl : source_completion_proposal obj =
    Gobject.unsafe_create "GtkSourceCompletionProposal" pl
end

module SourceCompletionItem = struct
  let cast w : source_completion_proposal obj =
    try_cast w "GtkSourceCompletionItem"
  module P = struct
    let icon : ([>`sourcecompletionproposal],_) property = PrivateProps.icon
    let info : ([>`sourcecompletionproposal],_) property = PrivateProps.info
    let label : ([>`sourcecompletionproposal],_) property = PrivateProps.label
    let markup : ([>`sourcecompletionproposal],_) property = PrivateProps.markup
    let text : ([>`sourcecompletionproposal],_) property = PrivateProps.text
  end
  module S = struct
    open GtkSignal
    let changed =
      {name="changed"; classe=`sourcecompletionproposal;
       marshaller=marshal_unit}
  end
  let create pl : source_completion_proposal obj =
    Gobject.unsafe_create "GtkSourceCompletionItem" pl
end

module SourceCompletionProvider = struct
  let cast w : source_completion_provider obj =
    try_cast w "GtkSourceCompletionProvider"
  external get_name : [>`sourcecompletionprovider] obj -> string
    = "ml_gtk_source_completion_provider_get_name"
  external get_icon :
    [>`sourcecompletionprovider] obj -> GdkPixbuf.pixbuf option
    = "ml_gtk_source_completion_provider_get_icon"
  external populate :
    [>`sourcecompletionprovider] obj -> source_completion_context obj -> unit
    = "ml_gtk_source_completion_provider_populate"
  external get_activation :
    [>`sourcecompletionprovider] obj ->
    source_completion_activation_flags list
    = "ml_gtk_source_completion_provider_get_activation"
  external get_info_widget :
    [>`sourcecompletionprovider] obj ->
    source_completion_proposal obj -> Gtk.widget obj option
    = "ml_gtk_source_completion_provider_get_info_widget"
  external update_info :
    [>`sourcecompletionprovider] obj ->
    source_completion_proposal obj -> source_completion_info obj -> unit
    = "ml_gtk_source_completion_provider_update_info"
  external get_start_iter :
    [>`sourcecompletionprovider] obj ->
    source_completion_context obj -> source_completion_proposal obj -> Gtk.text_iter
    = "ml_gtk_source_completion_provider_get_start_iter"
  external activate_proposal :
    [>`sourcecompletionprovider] obj ->
    source_completion_proposal obj -> Gtk.text_iter -> bool
    = "ml_gtk_source_completion_provider_activate_proposal"
  external get_interactive_delay : [>`sourcecompletionprovider] obj -> int
    = "ml_gtk_source_completion_provider_get_interactive_delay"
  external get_priority : [>`sourcecompletionprovider] obj -> int
    = "ml_gtk_source_completion_provider_get_priority"
end

module SourceCompletionContext = struct
  let cast w : source_completion_context obj =
    try_cast w "GtkSourceCompletionContext"
  module P = struct
    let completion : ([>`sourcecompletioncontext],_) property =
      {name="completion"; conv=(gobject : source_completion obj data_conv)}
    let iter : ([>`sourcecompletioncontext],_) property =
      {name="iter"; conv=(unsafe_pointer : Gtk.text_iter data_conv)}
  end
  module S = struct
    open GtkSignal
    let cancelled =
      {name="cancelled"; classe=`sourcecompletioncontext;
       marshaller=marshal_unit}
  end
  let create ?completion pl : source_completion_context obj =
    let pl = (may_cons P.completion completion pl) in
    Gobject.unsafe_create "GtkSourceCompletionContext" pl
  external get_activation :
    [>`sourcecompletioncontext] obj ->
    source_completion_activation_flags list
    = "ml_gtk_source_completion_context_get_activation"
  external set_activation :
    [>`sourcecompletioncontext] obj ->
    source_completion_activation_flags list -> unit
    = "ml_gtk_source_completion_context_set_activation"
  external add_proposals :
    [>`sourcecompletioncontext] obj ->
    source_completion_provider obj -> source_completion_proposal obj list -> bool -> unit
    = "ml_gtk_source_completion_context_add_proposals"
end

module SourceCompletion = struct
  let cast w : source_completion obj = try_cast w "GtkSourceCompletion"
  module P = struct
    let accelerators : ([>`sourcecompletion],_) property =
      {name="accelerators"; conv=uint}
    let auto_complete_delay : ([>`sourcecompletion],_) property =
      {name="auto-complete-delay"; conv=uint}
    let proposal_page_size : ([>`sourcecompletion],_) property =
      {name="proposal-page-size"; conv=uint}
    let provider_page_size : ([>`sourcecompletion],_) property =
      {name="provider-page-size"; conv=uint}
    let remember_info_visibility : ([>`sourcecompletion],_) property =
      {name="remember-info-visibility"; conv=boolean}
    let select_on_show : ([>`sourcecompletion],_) property =
      {name="select-on-show"; conv=boolean}
    let show_headers : ([>`sourcecompletion],_) property =
      {name="show-headers"; conv=boolean}
    let show_icons : ([>`sourcecompletion],_) property =
      {name="show-icons"; conv=boolean}
    let view : ([>`sourcecompletion],_) property =
      {name="view"; conv=(gobject : source_view obj data_conv)}
  end
  module S = struct
    open GtkSignal
    let activate_proposal =
      {name="activate_proposal"; classe=`sourcecompletion;
       marshaller=marshal_unit}
    let hide =
      {name="hide"; classe=`sourcecompletion; marshaller=marshal_unit}
    let move_cursor =
      {name="move_cursor"; classe=`sourcecompletion; marshaller=fun f ->
       marshal2 GtkEnums.Conv.scroll_step int
         "GtkSourceCompletion::move_cursor" f}
    let move_page =
      {name="move_page"; classe=`sourcecompletion; marshaller=fun f ->
       marshal2 GtkEnums.Conv.scroll_step int
         "GtkSourceCompletion::move_page" f}
    let populate_context =
      {name="populate_context"; classe=`sourcecompletion; marshaller=fun f ->
       marshal1 (gobject : source_completion_context obj data_conv)
         "GtkSourceCompletion::populate_context" f}
    let show =
      {name="show"; classe=`sourcecompletion; marshaller=marshal_unit}
  end
  let create ?view pl : source_completion obj =
    let pl = (may_cons P.view view pl) in
    Gobject.unsafe_create "GtkSourceCompletion" pl
  external add_provider :
    [>`sourcecompletion] obj -> source_completion_provider obj -> bool
    = "ml_gtk_source_completion_add_provider"
  external remove_provider :
    [>`sourcecompletion] obj -> source_completion_provider obj -> bool
    = "ml_gtk_source_completion_remove_provider"
  external block_interactive : [>`sourcecompletion] obj -> unit
    = "ml_gtk_source_completion_block_interactive"
  external get_providers :
    [>`sourcecompletion] obj -> source_completion_provider obj list
    = "ml_gtk_source_completion_get_providers"
  external create_context :
    [>`sourcecompletion] obj ->
    Gtk.text_iter -> source_completion_context obj
    = "ml_gtk_source_completion_create_context"
  external hide : [>`sourcecompletion] obj -> unit
    = "ml_gtk_source_completion_hide"
  external move_window : [>`sourcecompletion] obj -> Gtk.text_iter -> unit
    = "ml_gtk_source_completion_move_window"
  external show :
    [>`sourcecompletion] obj ->
    source_completion_provider obj list -> source_completion_context obj -> bool
    = "ml_gtk_source_completion_show"
  external unblock_interactive : [>`sourcecompletion] obj -> unit
    = "ml_gtk_source_completion_unblock_interactive"
end

module SourceLanguage = struct
  let cast w : source_language obj = try_cast w "GtkSourceLanguage"
  let create pl : source_language obj =
    Gobject.unsafe_create "GtkSourceLanguage" pl
end

module SourceLanguageManager = struct
  let cast w : source_language_manager obj =
    try_cast w "GtkSourceLanguageManager"
  let create pl : source_language_manager obj =
    Gobject.unsafe_create "GtkSourceLanguageManager" pl
end

module SourceMark = struct
  let cast w : source_mark obj = try_cast w "GtkSourceMark"
  module P = struct
    let category : ([>`sourcemark],_) property =
      {name="category"; conv=string_option}
  end
  let create ?category pl : source_mark obj =
    let pl = (may_cons_opt P.category category pl) in
    Gobject.unsafe_create "GtkSourceMark" pl
end

module SourceMarkAttributes = struct
  let cast w : source_mark_attributes obj =
    try_cast w "GtkSourceMarkAttributes"
  module P = struct
    let background : ([>`sourcemarkattributes],_) property =
      {name="background"; conv=(unsafe_pointer : Gdk.rgba data_conv)}
    let icon_name : ([>`sourcemarkattributes],_) property =
      {name="icon-name"; conv=string}
    let pixbuf : ([>`sourcemarkattributes],_) property =
      {name="pixbuf"; conv=(gobject : GdkPixbuf.pixbuf data_conv)}
  end
  let create pl : source_mark_attributes obj =
    Gobject.unsafe_create "GtkSourceMarkAttributes" pl
  let make_params ~cont pl ?background ?icon_name ?pixbuf =
    let pl = (
      may_cons P.background background (
      may_cons P.icon_name icon_name (
      may_cons P.pixbuf pixbuf pl))) in
    cont pl
end

module SourceUndoManager = struct
  let cast w : source_undo_manager obj = try_cast w "GtkSourceUndoManager"
  module S = struct
    open GtkSignal
    let can_redo_changed =
      {name="can_redo_changed"; classe=`sourceundomanager;
       marshaller=marshal_unit}
    let can_undo_changed =
      {name="can_undo_changed"; classe=`sourceundomanager;
       marshaller=marshal_unit}
  end
  let create pl : source_undo_manager obj =
    Gobject.unsafe_create "GtkSourceUndoManager" pl
  external can_undo : [>`sourceundomanager] obj -> bool
    = "ml_gtk_source_undo_manager_can_undo"
  external can_redo : [>`sourceundomanager] obj -> bool
    = "ml_gtk_source_undo_manager_can_redo"
  external undo : [>`sourceundomanager] obj -> unit
    = "ml_gtk_source_undo_manager_undo"
  external redo : [>`sourceundomanager] obj -> unit
    = "ml_gtk_source_undo_manager_redo"
  external begin_not_undoable_action : [>`sourceundomanager] obj -> unit
    = "ml_gtk_source_undo_manager_begin_not_undoable_action"
  external end_not_undoable_action : [>`sourceundomanager] obj -> unit
    = "ml_gtk_source_undo_manager_end_not_undoable_action"
  external can_undo_changed : [>`sourceundomanager] obj -> unit
    = "ml_gtk_source_undo_manager_can_undo_changed"
  external can_redo_changed : [>`sourceundomanager] obj -> unit
    = "ml_gtk_source_undo_manager_can_redo_changed"
end

module SourceBuffer = struct
  let cast w : source_buffer obj = try_cast w "GtkSourceBuffer"
  module P = struct
    let can_redo : ([>`sourcebuffer],_) property =
      {name="can-redo"; conv=boolean}
    let can_undo : ([>`sourcebuffer],_) property =
      {name="can-undo"; conv=boolean}
    let highlight_matching_brackets : ([>`sourcebuffer],_) property =
      {name="highlight-matching-brackets"; conv=boolean}
    let highlight_syntax : ([>`sourcebuffer],_) property =
      {name="highlight-syntax"; conv=boolean}
    let language : ([>`sourcebuffer],_) property =
      {name="language";
       conv=(gobject_option : source_language obj option data_conv)}
    let max_undo_levels : ([>`sourcebuffer],_) property =
      {name="max-undo-levels"; conv=int}
    let style_scheme : ([>`sourcebuffer],_) property =
      {name="style-scheme";
       conv=(gobject_option : source_style_scheme obj option data_conv)}
    let undo_manager : ([>`sourcebuffer],_) property =
      {name="undo-manager";
       conv=(gobject : source_undo_manager obj data_conv)}
  end
  module S = struct
    open GtkSignal
    let highlight_updated =
      {name="highlight_updated"; classe=`sourcebuffer; marshaller=fun f ->
       marshal2 (unsafe_pointer : Gtk.text_iter data_conv)
         (unsafe_pointer : Gtk.text_iter data_conv)
         "GtkSourceBuffer::highlight_updated" f}
    let source_mark_updated =
      {name="source_mark_updated"; classe=`sourcebuffer; marshaller=fun f ->
       marshal1 (gobject : source_mark obj data_conv)
         "GtkSourceBuffer::source_mark_updated" f}
  end
  let create pl : source_buffer obj =
    Gobject.unsafe_create "GtkSourceBuffer" pl
  let make_params ~cont pl ?highlight_matching_brackets ?highlight_syntax
      ?language ?max_undo_levels ?style_scheme ?undo_manager =
    let pl = (
      may_cons P.highlight_matching_brackets highlight_matching_brackets (
      may_cons P.highlight_syntax highlight_syntax (
      may_cons_opt P.language language (
      may_cons P.max_undo_levels max_undo_levels (
      may_cons_opt P.style_scheme style_scheme (
      may_cons P.undo_manager undo_manager pl)))))) in
    cont pl
end

module SourceView = struct
  let cast w : source_view obj = try_cast w "GtkSourceView"
  module P = struct
    let auto_indent : ([>`sourceview],_) property =
      {name="auto-indent"; conv=boolean}
    let highlight_current_line : ([>`sourceview],_) property =
      {name="highlight-current-line"; conv=boolean}
    let indent_on_tab : ([>`sourceview],_) property =
      {name="indent-on-tab"; conv=boolean}
    let indent_width : ([>`sourceview],_) property =
      {name="indent-width"; conv=int}
    let insert_spaces_instead_of_tabs : ([>`sourceview],_) property =
      {name="insert-spaces-instead-of-tabs"; conv=boolean}
    let right_margin_position : ([>`sourceview],_) property =
      {name="right-margin-position"; conv=uint}
    let show_line_marks : ([>`sourceview],_) property =
      {name="show-line-marks"; conv=boolean}
    let show_line_numbers : ([>`sourceview],_) property =
      {name="show-line-numbers"; conv=boolean}
    let show_right_margin : ([>`sourceview],_) property =
      {name="show-right-margin"; conv=boolean}
    let smart_home_end : ([>`sourceview],_) property =
      {name="smart-home-end";
       conv=SourceView3Enums.Conv.source_smart_home_end_type}
    let tab_width : ([>`sourceview],_) property =
      {name="tab-width"; conv=uint}
  end
  module S = struct
    open GtkSignal
    let line_mark_activated =
      {name="line_mark_activated"; classe=`sourceview; marshaller=fun f ->
       marshal2 (unsafe_pointer : Gtk.text_iter data_conv)
         (unsafe_pointer : GdkEvent.any data_conv)
         "GtkSourceView::line_mark_activated" f}
    let move_lines =
      {name="move_lines"; classe=`sourceview; marshaller=fun f ->
       marshal2 boolean int "GtkSourceView::move_lines" f}
    let move_words =
      {name="move_words"; classe=`sourceview; marshaller=fun f ->
       marshal1 int "GtkSourceView::move_words" f}
    let redo = {name="redo"; classe=`sourceview; marshaller=marshal_unit}
    let show_completion =
      {name="show_completion"; classe=`sourceview; marshaller=marshal_unit}
    let smart_home_end =
      {name="smart_home_end"; classe=`sourceview; marshaller=fun f ->
       marshal2 (unsafe_pointer : Gtk.text_iter data_conv) int
         "GtkSourceView::smart_home_end" f}
    let undo = {name="undo"; classe=`sourceview; marshaller=marshal_unit}
  end
  let create pl : source_view obj = Object.make "GtkSourceView" pl
  external get_completion : [>`sourceview] obj -> source_completion obj
    = "ml_gtk_source_view_get_completion"
  external get_draw_spaces :
    [>`sourceview] obj -> source_draw_spaces_flags list
    = "ml_gtk_source_view_get_draw_spaces"
  external set_draw_spaces :
    [>`sourceview] obj -> source_draw_spaces_flags list -> unit
    = "ml_gtk_source_view_set_draw_spaces"
  external set_mark_attributes :
    [>`sourceview] obj ->
    category:string -> source_mark_attributes obj -> int -> unit
    = "ml_gtk_source_view_set_mark_attributes"
  let make_params ~cont pl ?auto_indent ?highlight_current_line
      ?indent_on_tab ?indent_width ?insert_spaces_instead_of_tabs
      ?right_margin_position ?show_line_marks ?show_line_numbers
      ?show_right_margin ?smart_home_end ?tab_width =
    let pl = (
      may_cons P.auto_indent auto_indent (
      may_cons P.highlight_current_line highlight_current_line (
      may_cons P.indent_on_tab indent_on_tab (
      may_cons P.indent_width indent_width (
      may_cons P.insert_spaces_instead_of_tabs insert_spaces_instead_of_tabs (
      may_cons P.right_margin_position right_margin_position (
      may_cons P.show_line_marks show_line_marks (
      may_cons P.show_line_numbers show_line_numbers (
      may_cons P.show_right_margin show_right_margin (
      may_cons P.smart_home_end smart_home_end (
      may_cons P.tab_width tab_width pl))))))))))) in
    cont pl
end

