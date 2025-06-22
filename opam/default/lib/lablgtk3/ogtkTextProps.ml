open GtkSignal
open Gobject
open Data
let set = set
let get = get
let param = param
open GtkTextProps

class virtual text_view_props = object
  val virtual obj : _ obj
  method set_editable = set TextView.P.editable obj
  method set_cursor_visible = set TextView.P.cursor_visible obj
  method set_indent = set TextView.P.indent obj
  method set_justification = set TextView.P.justification obj
  method set_hadjustment =
    set {TextView.P.hadjustment with conv=GData.conv_adjustment} obj
  method set_left_margin = set TextView.P.left_margin obj
  method set_pixels_above_lines = set TextView.P.pixels_above_lines obj
  method set_pixels_below_lines = set TextView.P.pixels_below_lines obj
  method set_pixels_inside_wrap = set TextView.P.pixels_inside_wrap obj
  method set_right_margin = set TextView.P.right_margin obj
  method set_wrap_mode = set TextView.P.wrap_mode obj
  method set_accepts_tab = set TextView.P.accepts_tab obj
  method set_bottom_margin = set TextView.P.bottom_margin obj
  method set_im_module = set TextView.P.im_module obj
  method set_input_hints = set TextView.P.input_hints obj
  method set_input_purpose = set TextView.P.input_purpose obj
  method set_monospace = set TextView.P.monospace obj
  method set_overwrite = set TextView.P.overwrite obj
  method set_populate_all = set TextView.P.populate_all obj
  method set_top_margin = set TextView.P.top_margin obj
  method set_vadjustment =
    set {TextView.P.vadjustment with conv=GData.conv_adjustment} obj
  method editable = get TextView.P.editable obj
  method cursor_visible = get TextView.P.cursor_visible obj
  method indent = get TextView.P.indent obj
  method justification = get TextView.P.justification obj
  method hadjustment =
    get {TextView.P.hadjustment with conv=GData.conv_adjustment} obj
  method left_margin = get TextView.P.left_margin obj
  method pixels_above_lines = get TextView.P.pixels_above_lines obj
  method pixels_below_lines = get TextView.P.pixels_below_lines obj
  method pixels_inside_wrap = get TextView.P.pixels_inside_wrap obj
  method right_margin = get TextView.P.right_margin obj
  method wrap_mode = get TextView.P.wrap_mode obj
  method accepts_tab = get TextView.P.accepts_tab obj
  method bottom_margin = get TextView.P.bottom_margin obj
  method im_module = get TextView.P.im_module obj
  method input_hints = get TextView.P.input_hints obj
  method input_purpose = get TextView.P.input_purpose obj
  method monospace = get TextView.P.monospace obj
  method overwrite = get TextView.P.overwrite obj
  method populate_all = get TextView.P.populate_all obj
  method top_margin = get TextView.P.top_margin obj
  method vadjustment =
    get {TextView.P.vadjustment with conv=GData.conv_adjustment} obj
end

class virtual text_view_sigs = object (self)
  method private virtual connect :
    'b. ('a,'b) GtkSignal.t -> callback:'b -> GtkSignal.id
  method private virtual notify :
    'b. ('a,'b) property -> callback:('b -> unit) -> GtkSignal.id
  method copy_clipboard = self#connect TextView.S.copy_clipboard
  method cut_clipboard = self#connect TextView.S.cut_clipboard
  method delete_from_cursor = self#connect TextView.S.delete_from_cursor
  method insert_at_cursor = self#connect TextView.S.insert_at_cursor
  method move_cursor = self#connect TextView.S.move_cursor
  method move_focus = self#connect TextView.S.move_focus
  method page_horizontally = self#connect TextView.S.page_horizontally
  method paste_clipboard = self#connect TextView.S.paste_clipboard
  method populate_popup = self#connect TextView.S.populate_popup
  method set_anchor = self#connect TextView.S.set_anchor
  method toggle_overwrite = self#connect TextView.S.toggle_overwrite
  method notify_editable ~callback =
    self#notify TextView.P.editable ~callback
  method notify_cursor_visible ~callback =
    self#notify TextView.P.cursor_visible ~callback
  method notify_indent ~callback = self#notify TextView.P.indent ~callback
  method notify_justification ~callback =
    self#notify TextView.P.justification ~callback
  method notify_hadjustment ~callback =
    self#notify {TextView.P.hadjustment with conv=GData.conv_adjustment} ~callback
  method notify_left_margin ~callback =
    self#notify TextView.P.left_margin ~callback
  method notify_pixels_above_lines ~callback =
    self#notify TextView.P.pixels_above_lines ~callback
  method notify_pixels_below_lines ~callback =
    self#notify TextView.P.pixels_below_lines ~callback
  method notify_pixels_inside_wrap ~callback =
    self#notify TextView.P.pixels_inside_wrap ~callback
  method notify_right_margin ~callback =
    self#notify TextView.P.right_margin ~callback
  method notify_wrap_mode ~callback =
    self#notify TextView.P.wrap_mode ~callback
  method notify_accepts_tab ~callback =
    self#notify TextView.P.accepts_tab ~callback
  method notify_bottom_margin ~callback =
    self#notify TextView.P.bottom_margin ~callback
  method notify_im_module ~callback =
    self#notify TextView.P.im_module ~callback
  method notify_input_hints ~callback =
    self#notify TextView.P.input_hints ~callback
  method notify_input_purpose ~callback =
    self#notify TextView.P.input_purpose ~callback
  method notify_monospace ~callback =
    self#notify TextView.P.monospace ~callback
  method notify_overwrite ~callback =
    self#notify TextView.P.overwrite ~callback
  method notify_populate_all ~callback =
    self#notify TextView.P.populate_all ~callback
  method notify_top_margin ~callback =
    self#notify TextView.P.top_margin ~callback
  method notify_vadjustment ~callback =
    self#notify {TextView.P.vadjustment with conv=GData.conv_adjustment} ~callback
end

class virtual text_buffer_props = object
  val virtual obj : _ obj
  method tag_table = get TextBuffer.P.tag_table obj
  method cursor_position = get TextBuffer.P.cursor_position obj
  method has_selection = get TextBuffer.P.has_selection obj
end

class virtual text_buffer_sigs = object (self)
  method private virtual connect :
    'b. ('a,'b) GtkSignal.t -> callback:'b -> GtkSignal.id
  method private virtual notify :
    'b. ('a,'b) property -> callback:('b -> unit) -> GtkSignal.id
  method begin_user_action = self#connect TextBuffer.S.begin_user_action
  method changed = self#connect TextBuffer.S.changed
  method end_user_action = self#connect TextBuffer.S.end_user_action
  method mark_deleted = self#connect TextBuffer.S.mark_deleted
  method modified_changed = self#connect TextBuffer.S.modified_changed
  method notify_tag_table ~callback =
    self#notify TextBuffer.P.tag_table ~callback
  method notify_cursor_position ~callback =
    self#notify TextBuffer.P.cursor_position ~callback
  method notify_has_selection ~callback =
    self#notify TextBuffer.P.has_selection ~callback
end

let text_tag_param = function
  | `ACCUMULATIVE_MARGIN p -> param TextTag.P.accumulative_margin p
  | `BACKGROUND p -> param TextTag.P.background p
  | `BACKGROUND_FULL_HEIGHT p -> param TextTag.P.background_full_height p
  | `BACKGROUND_FULL_HEIGHT_SET p ->
      param TextTag.P.background_full_height_set p
  | `BACKGROUND_GDK p -> param TextTag.P.background_gdk p
  | `BACKGROUND_RGBA p -> param TextTag.P.background_rgba p
  | `BACKGROUND_SET p -> param TextTag.P.background_set p
  | `DIRECTION p -> param TextTag.P.direction p
  | `EDITABLE p -> param TextTag.P.editable p
  | `EDITABLE_SET p -> param TextTag.P.editable_set p
  | `FALLBACK p -> param TextTag.P.fallback p
  | `FALLBACK_SET p -> param TextTag.P.fallback_set p
  | `FAMILY p -> param TextTag.P.family p
  | `FAMILY_SET p -> param TextTag.P.family_set p
  | `FONT p -> param TextTag.P.font p
  | `FONT_DESC p -> param TextTag.P.font_desc p
  | `FONT_FEATURES p -> param TextTag.P.font_features p
  | `FONT_FEATURES_SET p -> param TextTag.P.font_features_set p
  | `FOREGROUND p -> param TextTag.P.foreground p
  | `FOREGROUND_GDK p -> param TextTag.P.foreground_gdk p
  | `FOREGROUND_RGBA p -> param TextTag.P.foreground_rgba p
  | `FOREGROUND_SET p -> param TextTag.P.foreground_set p
  | `INDENT p -> param TextTag.P.indent p
  | `INDENT_SET p -> param TextTag.P.indent_set p
  | `INVISIBLE p -> param TextTag.P.invisible p
  | `INVISIBLE_SET p -> param TextTag.P.invisible_set p
  | `JUSTIFICATION p -> param TextTag.P.justification p
  | `JUSTIFICATION_SET p -> param TextTag.P.justification_set p
  | `LANGUAGE p -> param TextTag.P.language p
  | `LANGUAGE_SET p -> param TextTag.P.language_set p
  | `LEFT_MARGIN p -> param TextTag.P.left_margin p
  | `LEFT_MARGIN_SET p -> param TextTag.P.left_margin_set p
  | `LETTER_SPACING p -> param TextTag.P.letter_spacing p
  | `LETTER_SPACING_SET p -> param TextTag.P.letter_spacing_set p
  | `PARAGRAPH_BACKGROUND p -> param TextTag.P.paragraph_background p
  | `PARAGRAPH_BACKGROUND_GDK p -> param TextTag.P.paragraph_background_gdk p
  | `PARAGRAPH_BACKGROUND_RGBA p ->
      param TextTag.P.paragraph_background_rgba p
  | `PARAGRAPH_BACKGROUND_SET p -> param TextTag.P.paragraph_background_set p
  | `PIXELS_ABOVE_LINES p -> param TextTag.P.pixels_above_lines p
  | `PIXELS_ABOVE_LINES_SET p -> param TextTag.P.pixels_above_lines_set p
  | `PIXELS_BELOW_LINES p -> param TextTag.P.pixels_below_lines p
  | `PIXELS_BELOW_LINES_SET p -> param TextTag.P.pixels_below_lines_set p
  | `PIXELS_INSIDE_WRAP p -> param TextTag.P.pixels_inside_wrap p
  | `PIXELS_INSIDE_WRAP_SET p -> param TextTag.P.pixels_inside_wrap_set p
  | `RIGHT_MARGIN p -> param TextTag.P.right_margin p
  | `RIGHT_MARGIN_SET p -> param TextTag.P.right_margin_set p
  | `RISE p -> param TextTag.P.rise p
  | `RISE_SET p -> param TextTag.P.rise_set p
  | `SCALE p -> param TextTag.P.scale p
  | `SCALE_SET p -> param TextTag.P.scale_set p
  | `SIZE p -> param TextTag.P.size p
  | `SIZE_POINTS p -> param TextTag.P.size_points p
  | `SIZE_SET p -> param TextTag.P.size_set p
  | `STRETCH p -> param TextTag.P.stretch p
  | `STRETCH_SET p -> param TextTag.P.stretch_set p
  | `STRIKETHROUGH p -> param TextTag.P.strikethrough p
  | `STRIKETHROUGH_RGBA p -> param TextTag.P.strikethrough_rgba p
  | `STRIKETHROUGH_SET p -> param TextTag.P.strikethrough_set p
  | `STYLE p -> param TextTag.P.style p
  | `STYLE_SET p -> param TextTag.P.style_set p
  | `TABS_SET p -> param TextTag.P.tabs_set p
  | `UNDERLINE p -> param TextTag.P.underline p
  | `UNDERLINE_RGBA p -> param TextTag.P.underline_rgba p
  | `UNDERLINE_RGBA_SET p -> param TextTag.P.underline_rgba_set p
  | `UNDERLINE_SET p -> param TextTag.P.underline_set p
  | `VARIANT p -> param TextTag.P.variant p
  | `VARIANT_SET p -> param TextTag.P.variant_set p
  | `WEIGHT p -> param TextTag.P.weight p
  | `WEIGHT_SET p -> param TextTag.P.weight_set p
  | `WRAP_MODE p -> param TextTag.P.wrap_mode p
  | `WRAP_MODE_SET p -> param TextTag.P.wrap_mode_set p

class virtual text_tag_table_sigs = object (self)
  method private virtual connect :
    'b. ('a,'b) GtkSignal.t -> callback:'b -> GtkSignal.id
  method private virtual notify :
    'b. ('a,'b) property -> callback:('b -> unit) -> GtkSignal.id
  method tag_added = self#connect TextTagTable.S.tag_added
  method tag_changed = self#connect TextTagTable.S.tag_changed
  method tag_removed = self#connect TextTagTable.S.tag_removed
end

