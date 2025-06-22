open GtkSignal
open Gobject
open Data
let set = set
let get = get
let param = param
open GtkSourceView3Props

class virtual source_style_scheme_manager_props = object
  val virtual obj : _ obj
  method append_search_path = SourceStyleSchemeManager.append_search_path obj
  method prepend_search_path =
    SourceStyleSchemeManager.prepend_search_path obj
  method force_rescan = SourceStyleSchemeManager.force_rescan obj
end

class virtual source_completion_info_props = object
  val virtual obj : _ obj
  method set_max_height = set SourceCompletionInfo.P.max_height obj
  method set_max_width = set SourceCompletionInfo.P.max_width obj
  method set_shrink_height = set SourceCompletionInfo.P.shrink_height obj
  method set_shrink_width = set SourceCompletionInfo.P.shrink_width obj
  method max_height = get SourceCompletionInfo.P.max_height obj
  method max_width = get SourceCompletionInfo.P.max_width obj
  method shrink_height = get SourceCompletionInfo.P.shrink_height obj
  method shrink_width = get SourceCompletionInfo.P.shrink_width obj
end

class virtual source_completion_info_sigs = object (self)
  method private virtual connect :
    'b. ('a,'b) GtkSignal.t -> callback:'b -> GtkSignal.id
  method private virtual notify :
    'b. ('a,'b) property -> callback:('b -> unit) -> GtkSignal.id
  method before_show = self#connect SourceCompletionInfo.S.before_show
  method notify_max_height ~callback =
    self#notify SourceCompletionInfo.P.max_height ~callback
  method notify_max_width ~callback =
    self#notify SourceCompletionInfo.P.max_width ~callback
  method notify_shrink_height ~callback =
    self#notify SourceCompletionInfo.P.shrink_height ~callback
  method notify_shrink_width ~callback =
    self#notify SourceCompletionInfo.P.shrink_width ~callback
end

class virtual source_completion_proposal_props = object
  val virtual obj : _ obj
  method icon = get SourceCompletionProposal.P.icon obj
  method info = get SourceCompletionProposal.P.info obj
  method label = get SourceCompletionProposal.P.label obj
  method markup = get SourceCompletionProposal.P.markup obj
  method text = get SourceCompletionProposal.P.text obj
end

class virtual source_completion_proposal_sigs = object (self)
  method private virtual connect :
    'b. ('a,'b) GtkSignal.t -> callback:'b -> GtkSignal.id
  method private virtual notify :
    'b. ('a,'b) property -> callback:('b -> unit) -> GtkSignal.id
  method changed = self#connect SourceCompletionProposal.S.changed
  method notify_icon ~callback =
    self#notify SourceCompletionProposal.P.icon ~callback
  method notify_info ~callback =
    self#notify SourceCompletionProposal.P.info ~callback
  method notify_label ~callback =
    self#notify SourceCompletionProposal.P.label ~callback
  method notify_markup ~callback =
    self#notify SourceCompletionProposal.P.markup ~callback
  method notify_text ~callback =
    self#notify SourceCompletionProposal.P.text ~callback
end

class virtual source_completion_item_props = object
  val virtual obj : _ obj
  method set_icon = set SourceCompletionItem.P.icon obj
  method set_info = set SourceCompletionItem.P.info obj
  method set_label = set SourceCompletionItem.P.label obj
  method set_markup = set SourceCompletionItem.P.markup obj
  method set_text = set SourceCompletionItem.P.text obj
  method icon = get SourceCompletionItem.P.icon obj
  method info = get SourceCompletionItem.P.info obj
  method label = get SourceCompletionItem.P.label obj
  method markup = get SourceCompletionItem.P.markup obj
  method text = get SourceCompletionItem.P.text obj
end

class virtual source_completion_item_sigs = object (self)
  method private virtual connect :
    'b. ('a,'b) GtkSignal.t -> callback:'b -> GtkSignal.id
  method private virtual notify :
    'b. ('a,'b) property -> callback:('b -> unit) -> GtkSignal.id
  method changed = self#connect SourceCompletionItem.S.changed
  method notify_icon ~callback =
    self#notify SourceCompletionItem.P.icon ~callback
  method notify_info ~callback =
    self#notify SourceCompletionItem.P.info ~callback
  method notify_label ~callback =
    self#notify SourceCompletionItem.P.label ~callback
  method notify_markup ~callback =
    self#notify SourceCompletionItem.P.markup ~callback
  method notify_text ~callback =
    self#notify SourceCompletionItem.P.text ~callback
end

class virtual source_completion_context_props = object
  val virtual obj : _ obj
  method set_activation = SourceCompletionContext.set_activation obj
end

class virtual source_completion_context_sigs = object (self)
  method private virtual connect :
    'b. ('a,'b) GtkSignal.t -> callback:'b -> GtkSignal.id
  method private virtual notify :
    'b. ('a,'b) property -> callback:('b -> unit) -> GtkSignal.id
  method cancelled = self#connect SourceCompletionContext.S.cancelled
end

class virtual source_completion_props = object
  val virtual obj : _ obj
  method set_accelerators = set SourceCompletion.P.accelerators obj
  method set_auto_complete_delay =
    set SourceCompletion.P.auto_complete_delay obj
  method set_proposal_page_size =
    set SourceCompletion.P.proposal_page_size obj
  method set_provider_page_size =
    set SourceCompletion.P.provider_page_size obj
  method set_remember_info_visibility =
    set SourceCompletion.P.remember_info_visibility obj
  method set_select_on_show = set SourceCompletion.P.select_on_show obj
  method set_show_headers = set SourceCompletion.P.show_headers obj
  method set_show_icons = set SourceCompletion.P.show_icons obj
  method accelerators = get SourceCompletion.P.accelerators obj
  method auto_complete_delay = get SourceCompletion.P.auto_complete_delay obj
  method proposal_page_size = get SourceCompletion.P.proposal_page_size obj
  method provider_page_size = get SourceCompletion.P.provider_page_size obj
  method remember_info_visibility =
    get SourceCompletion.P.remember_info_visibility obj
  method select_on_show = get SourceCompletion.P.select_on_show obj
  method show_headers = get SourceCompletion.P.show_headers obj
  method show_icons = get SourceCompletion.P.show_icons obj
  method block_interactive () = SourceCompletion.block_interactive obj
  method hide () = SourceCompletion.hide obj
  method unblock_interactive () = SourceCompletion.unblock_interactive obj
end

class virtual source_completion_sigs = object (self)
  method private virtual connect :
    'b. ('a,'b) GtkSignal.t -> callback:'b -> GtkSignal.id
  method private virtual notify :
    'b. ('a,'b) property -> callback:('b -> unit) -> GtkSignal.id
  method activate_proposal =
    self#connect SourceCompletion.S.activate_proposal
  method hide = self#connect SourceCompletion.S.hide
  method move_cursor = self#connect SourceCompletion.S.move_cursor
  method move_page = self#connect SourceCompletion.S.move_page
  method show = self#connect SourceCompletion.S.show
  method notify_accelerators ~callback =
    self#notify SourceCompletion.P.accelerators ~callback
  method notify_auto_complete_delay ~callback =
    self#notify SourceCompletion.P.auto_complete_delay ~callback
  method notify_proposal_page_size ~callback =
    self#notify SourceCompletion.P.proposal_page_size ~callback
  method notify_provider_page_size ~callback =
    self#notify SourceCompletion.P.provider_page_size ~callback
  method notify_remember_info_visibility ~callback =
    self#notify SourceCompletion.P.remember_info_visibility ~callback
  method notify_select_on_show ~callback =
    self#notify SourceCompletion.P.select_on_show ~callback
  method notify_show_headers ~callback =
    self#notify SourceCompletion.P.show_headers ~callback
  method notify_show_icons ~callback =
    self#notify SourceCompletion.P.show_icons ~callback
end

class virtual source_mark_props = object
  val virtual obj : _ obj
  method category = get SourceMark.P.category obj
end

class virtual source_mark_attributes_props = object
  val virtual obj : _ obj
  method set_background = set SourceMarkAttributes.P.background obj
  method set_icon_name = set SourceMarkAttributes.P.icon_name obj
  method set_pixbuf = set SourceMarkAttributes.P.pixbuf obj
  method background = get SourceMarkAttributes.P.background obj
  method icon_name = get SourceMarkAttributes.P.icon_name obj
  method pixbuf = get SourceMarkAttributes.P.pixbuf obj
end

class virtual source_undo_manager_props = object
  val virtual obj : _ obj
  method can_undo = SourceUndoManager.can_undo obj
  method can_redo = SourceUndoManager.can_redo obj
  method undo () = SourceUndoManager.undo obj
  method redo () = SourceUndoManager.redo obj
  method begin_not_undoable_action () =
    SourceUndoManager.begin_not_undoable_action obj
  method end_not_undoable_action () =
    SourceUndoManager.end_not_undoable_action obj
  method can_undo_changed () = SourceUndoManager.can_undo_changed obj
  method can_redo_changed () = SourceUndoManager.can_redo_changed obj
end

class virtual source_undo_manager_sigs = object (self)
  method private virtual connect :
    'b. ('a,'b) GtkSignal.t -> callback:'b -> GtkSignal.id
  method private virtual notify :
    'b. ('a,'b) property -> callback:('b -> unit) -> GtkSignal.id
  method can_redo_changed = self#connect SourceUndoManager.S.can_redo_changed
  method can_undo_changed = self#connect SourceUndoManager.S.can_undo_changed
end

class virtual source_buffer_props = object
  val virtual obj : _ obj
  method set_highlight_matching_brackets =
    set SourceBuffer.P.highlight_matching_brackets obj
  method set_highlight_syntax = set SourceBuffer.P.highlight_syntax obj
  method set_max_undo_levels = set SourceBuffer.P.max_undo_levels obj
  method can_redo = get SourceBuffer.P.can_redo obj
  method can_undo = get SourceBuffer.P.can_undo obj
  method highlight_matching_brackets =
    get SourceBuffer.P.highlight_matching_brackets obj
  method highlight_syntax = get SourceBuffer.P.highlight_syntax obj
  method max_undo_levels = get SourceBuffer.P.max_undo_levels obj
end

class virtual source_buffer_sigs = object (self)
  method private virtual connect :
    'b. ('a,'b) GtkSignal.t -> callback:'b -> GtkSignal.id
  method private virtual notify :
    'b. ('a,'b) property -> callback:('b -> unit) -> GtkSignal.id
  method highlight_updated = self#connect SourceBuffer.S.highlight_updated
  method source_mark_updated =
    self#connect SourceBuffer.S.source_mark_updated
  method notify_can_redo ~callback =
    self#notify SourceBuffer.P.can_redo ~callback
  method notify_can_undo ~callback =
    self#notify SourceBuffer.P.can_undo ~callback
  method notify_highlight_matching_brackets ~callback =
    self#notify SourceBuffer.P.highlight_matching_brackets ~callback
  method notify_highlight_syntax ~callback =
    self#notify SourceBuffer.P.highlight_syntax ~callback
  method notify_max_undo_levels ~callback =
    self#notify SourceBuffer.P.max_undo_levels ~callback
end

class virtual source_view_props = object
  val virtual obj : _ obj
  method set_auto_indent = set SourceView.P.auto_indent obj
  method set_highlight_current_line =
    set SourceView.P.highlight_current_line obj
  method set_indent_on_tab = set SourceView.P.indent_on_tab obj
  method set_indent_width = set SourceView.P.indent_width obj
  method set_insert_spaces_instead_of_tabs =
    set SourceView.P.insert_spaces_instead_of_tabs obj
  method set_right_margin_position =
    set SourceView.P.right_margin_position obj
  method set_show_line_marks = set SourceView.P.show_line_marks obj
  method set_show_line_numbers = set SourceView.P.show_line_numbers obj
  method set_show_right_margin = set SourceView.P.show_right_margin obj
  method set_smart_home_end = set SourceView.P.smart_home_end obj
  method set_tab_width = set SourceView.P.tab_width obj
  method auto_indent = get SourceView.P.auto_indent obj
  method highlight_current_line = get SourceView.P.highlight_current_line obj
  method indent_on_tab = get SourceView.P.indent_on_tab obj
  method indent_width = get SourceView.P.indent_width obj
  method insert_spaces_instead_of_tabs =
    get SourceView.P.insert_spaces_instead_of_tabs obj
  method right_margin_position = get SourceView.P.right_margin_position obj
  method show_line_marks = get SourceView.P.show_line_marks obj
  method show_line_numbers = get SourceView.P.show_line_numbers obj
  method show_right_margin = get SourceView.P.show_right_margin obj
  method smart_home_end = get SourceView.P.smart_home_end obj
  method tab_width = get SourceView.P.tab_width obj
end

class virtual source_view_sigs = object (self)
  method private virtual connect :
    'b. ('a,'b) GtkSignal.t -> callback:'b -> GtkSignal.id
  method private virtual notify :
    'b. ('a,'b) property -> callback:('b -> unit) -> GtkSignal.id
  method line_mark_activated = self#connect SourceView.S.line_mark_activated
  method move_lines = self#connect SourceView.S.move_lines
  method move_words = self#connect SourceView.S.move_words
  method redo = self#connect SourceView.S.redo
  method show_completion = self#connect SourceView.S.show_completion
  method smart_home_end = self#connect SourceView.S.smart_home_end
  method undo = self#connect SourceView.S.undo
  method notify_auto_indent ~callback =
    self#notify SourceView.P.auto_indent ~callback
  method notify_highlight_current_line ~callback =
    self#notify SourceView.P.highlight_current_line ~callback
  method notify_indent_on_tab ~callback =
    self#notify SourceView.P.indent_on_tab ~callback
  method notify_indent_width ~callback =
    self#notify SourceView.P.indent_width ~callback
  method notify_insert_spaces_instead_of_tabs ~callback =
    self#notify SourceView.P.insert_spaces_instead_of_tabs ~callback
  method notify_right_margin_position ~callback =
    self#notify SourceView.P.right_margin_position ~callback
  method notify_show_line_marks ~callback =
    self#notify SourceView.P.show_line_marks ~callback
  method notify_show_line_numbers ~callback =
    self#notify SourceView.P.show_line_numbers ~callback
  method notify_show_right_margin ~callback =
    self#notify SourceView.P.show_right_margin ~callback
  method notify_smart_home_end ~callback =
    self#notify SourceView.P.smart_home_end ~callback
  method notify_tab_width ~callback =
    self#notify SourceView.P.tab_width ~callback
end

