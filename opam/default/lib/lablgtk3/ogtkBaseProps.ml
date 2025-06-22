open GtkSignal
open Gobject
open Data
let set = set
let get = get
let param = param

open GtkBaseProps

open GtkBaseProps

class virtual widget_props = object
  val virtual obj : _ obj
  method set_app_paintable = set Widget.P.app_paintable obj
  method set_can_default = set Widget.P.can_default obj
  method set_can_focus = set Widget.P.can_focus obj
  method set_events = set Widget.P.events obj
  method set_expand = set Widget.P.expand obj
  method set_focus_on_click = set Widget.P.focus_on_click obj
  method set_halign = set Widget.P.halign obj
  method set_has_default = set Widget.P.has_default obj
  method set_has_focus = set Widget.P.has_focus obj
  method set_has_tooltip = set Widget.P.has_tooltip obj
  method set_height_request = set Widget.P.height_request obj
  method set_hexpand = set Widget.P.hexpand obj
  method set_hexpand_set = set Widget.P.hexpand_set obj
  method set_is_focus = set Widget.P.is_focus obj
  method set_margin = set Widget.P.margin obj
  method set_margin_bottom = set Widget.P.margin_bottom obj
  method set_margin_end = set Widget.P.margin_end obj
  method set_margin_left = set Widget.P.margin_left obj
  method set_margin_right = set Widget.P.margin_right obj
  method set_margin_start = set Widget.P.margin_start obj
  method set_margin_top = set Widget.P.margin_top obj
  method set_name = set Widget.P.name obj
  method set_no_show_all = set Widget.P.no_show_all obj
  method set_opacity = set Widget.P.opacity obj
  method set_parent = set Widget.P.parent obj
  method set_receives_default = set Widget.P.receives_default obj
  method set_sensitive = set Widget.P.sensitive obj
  method set_style = set Widget.P.style obj
  method set_tooltip_markup = set Widget.P.tooltip_markup obj
  method set_tooltip_text = set Widget.P.tooltip_text obj
  method set_valign = set Widget.P.valign obj
  method set_vexpand = set Widget.P.vexpand obj
  method set_vexpand_set = set Widget.P.vexpand_set obj
  method set_visible = set Widget.P.visible obj
  method set_width_request = set Widget.P.width_request obj
  method app_paintable = get Widget.P.app_paintable obj
  method can_default = get Widget.P.can_default obj
  method can_focus = get Widget.P.can_focus obj
  method composite_child = get Widget.P.composite_child obj
  method events = get Widget.P.events obj
  method expand = get Widget.P.expand obj
  method focus_on_click = get Widget.P.focus_on_click obj
  method halign = get Widget.P.halign obj
  method has_default = get Widget.P.has_default obj
  method has_focus = get Widget.P.has_focus obj
  method has_tooltip = get Widget.P.has_tooltip obj
  method height_request = get Widget.P.height_request obj
  method hexpand = get Widget.P.hexpand obj
  method hexpand_set = get Widget.P.hexpand_set obj
  method is_focus = get Widget.P.is_focus obj
  method margin = get Widget.P.margin obj
  method margin_bottom = get Widget.P.margin_bottom obj
  method margin_end = get Widget.P.margin_end obj
  method margin_left = get Widget.P.margin_left obj
  method margin_right = get Widget.P.margin_right obj
  method margin_start = get Widget.P.margin_start obj
  method margin_top = get Widget.P.margin_top obj
  method name = get Widget.P.name obj
  method no_show_all = get Widget.P.no_show_all obj
  method opacity = get Widget.P.opacity obj
  method parent = get Widget.P.parent obj
  method receives_default = get Widget.P.receives_default obj
  method scale_factor = get Widget.P.scale_factor obj
  method sensitive = get Widget.P.sensitive obj
  method style = get Widget.P.style obj
  method tooltip_markup = get Widget.P.tooltip_markup obj
  method tooltip_text = get Widget.P.tooltip_text obj
  method valign = get Widget.P.valign obj
  method vexpand = get Widget.P.vexpand obj
  method vexpand_set = get Widget.P.vexpand_set obj
  method visible = get Widget.P.visible obj
  method width_request = get Widget.P.width_request obj
end

class virtual adjustment_props = object
  val virtual obj : _ obj
  method set_lower = set Adjustment.P.lower obj
  method set_page_increment = set Adjustment.P.page_increment obj
  method set_page_size = set Adjustment.P.page_size obj
  method set_step_increment = set Adjustment.P.step_increment obj
  method set_upper = set Adjustment.P.upper obj
  method set_value = set Adjustment.P.value obj
  method lower = get Adjustment.P.lower obj
  method page_increment = get Adjustment.P.page_increment obj
  method page_size = get Adjustment.P.page_size obj
  method step_increment = get Adjustment.P.step_increment obj
  method upper = get Adjustment.P.upper obj
  method value = get Adjustment.P.value obj
end

class virtual adjustment_sigs = object (self)
  method private virtual connect :
    'b. ('a,'b) GtkSignal.t -> callback:'b -> GtkSignal.id
  method private virtual notify :
    'b. ('a,'b) property -> callback:('b -> unit) -> GtkSignal.id
  method changed = self#connect Adjustment.S.changed
  method value_changed = self#connect Adjustment.S.value_changed
  method notify_lower ~callback = self#notify Adjustment.P.lower ~callback
  method notify_page_increment ~callback =
    self#notify Adjustment.P.page_increment ~callback
  method notify_page_size ~callback =
    self#notify Adjustment.P.page_size ~callback
  method notify_step_increment ~callback =
    self#notify Adjustment.P.step_increment ~callback
  method notify_upper ~callback = self#notify Adjustment.P.upper ~callback
  method notify_value ~callback = self#notify Adjustment.P.value ~callback
end

class virtual orientable_props = object
  val virtual obj : _ obj
  method set_orientation = set Orientable.P.orientation obj
  method orientation = get Orientable.P.orientation obj
end

class virtual window_props = object
  val virtual obj : _ obj
  method set_title = set Window.P.title obj
  method set_accept_focus = set Window.P.accept_focus obj
  method set_decorated = set Window.P.decorated obj
  method set_default_height = set Window.P.default_height obj
  method set_default_width = set Window.P.default_width obj
  method set_deletable = set Window.P.deletable obj
  method set_destroy_with_parent = set Window.P.destroy_with_parent obj
  method set_focus_on_map = set Window.P.focus_on_map obj
  method set_gravity = set Window.P.gravity obj
  method set_icon = set Window.P.icon obj
  method set_icon_name = set Window.P.icon_name obj
  method set_modal = set Window.P.modal obj
  method set_position = set Window.P.window_position obj
  method set_opacity = set Window.P.opacity obj
  method set_resizable = set Window.P.resizable obj
  method set_role = set Window.P.role obj
  method set_screen = set Window.P.screen obj
  method set_skip_pager_hint = set Window.P.skip_pager_hint obj
  method set_skip_taskbar_hint = set Window.P.skip_taskbar_hint obj
  method set_type_hint = set Window.P.type_hint obj
  method set_urgency_hint = set Window.P.urgency_hint obj
  method title = get Window.P.title obj
  method accept_focus = get Window.P.accept_focus obj
  method decorated = get Window.P.decorated obj
  method default_height = get Window.P.default_height obj
  method default_width = get Window.P.default_width obj
  method deletable = get Window.P.deletable obj
  method destroy_with_parent = get Window.P.destroy_with_parent obj
  method focus_on_map = get Window.P.focus_on_map obj
  method gravity = get Window.P.gravity obj
  method has_toplevel_focus = get Window.P.has_toplevel_focus obj
  method icon = get Window.P.icon obj
  method icon_name = get Window.P.icon_name obj
  method is_active = get Window.P.is_active obj
  method modal = get Window.P.modal obj
  method position = get Window.P.window_position obj
  method opacity = get Window.P.opacity obj
  method resizable = get Window.P.resizable obj
  method role = get Window.P.role obj
  method screen = get Window.P.screen obj
  method skip_pager_hint = get Window.P.skip_pager_hint obj
  method skip_taskbar_hint = get Window.P.skip_taskbar_hint obj
  method kind = get Window.P.kind obj
  method type_hint = get Window.P.type_hint obj
  method urgency_hint = get Window.P.urgency_hint obj
end

class virtual message_dialog_props = object
  val virtual obj : _ obj
  method set_message_type = set MessageDialog.P.message_type obj
  method set_secondary_text = set MessageDialog.P.secondary_text obj
  method set_secondary_use_markup =
    set MessageDialog.P.secondary_use_markup obj
  method set_text = set MessageDialog.P.text obj
  method set_use_markup = set MessageDialog.P.use_markup obj
  method message_type = get MessageDialog.P.message_type obj
  method secondary_text = get MessageDialog.P.secondary_text obj
  method secondary_use_markup = get MessageDialog.P.secondary_use_markup obj
  method text = get MessageDialog.P.text obj
  method use_markup = get MessageDialog.P.use_markup obj
end

class virtual about_dialog_props = object
  val virtual obj : _ obj
  method set_comments = set AboutDialog.P.comments obj
  method set_copyright = set AboutDialog.P.copyright obj
  method set_license = set AboutDialog.P.license obj
  method set_logo = set AboutDialog.P.logo obj
  method set_logo_icon_name = set AboutDialog.P.logo_icon_name obj
  method set_translator_credits = set AboutDialog.P.translator_credits obj
  method set_version = set AboutDialog.P.version obj
  method set_website = set AboutDialog.P.website obj
  method set_website_label = set AboutDialog.P.website_label obj
  method set_wrap_license = set AboutDialog.P.wrap_license obj
  method comments = get AboutDialog.P.comments obj
  method copyright = get AboutDialog.P.copyright obj
  method license = get AboutDialog.P.license obj
  method logo = get AboutDialog.P.logo obj
  method logo_icon_name = get AboutDialog.P.logo_icon_name obj
  method translator_credits = get AboutDialog.P.translator_credits obj
  method version = get AboutDialog.P.version obj
  method website = get AboutDialog.P.website obj
  method website_label = get AboutDialog.P.website_label obj
  method wrap_license = get AboutDialog.P.wrap_license obj
end

class virtual plug_sigs = object (self)
  method private virtual connect :
    'b. ('a,'b) GtkSignal.t -> callback:'b -> GtkSignal.id
  method private virtual notify :
    'b. ('a,'b) property -> callback:('b -> unit) -> GtkSignal.id
  method embedded = self#connect Plug.S.embedded
end

class virtual socket_sigs = object (self)
  method private virtual connect :
    'b. ('a,'b) GtkSignal.t -> callback:'b -> GtkSignal.id
  method private virtual notify :
    'b. ('a,'b) property -> callback:('b -> unit) -> GtkSignal.id
  method plug_added = self#connect Socket.S.plug_added
  method plug_removed = self#connect Socket.S.plug_removed
end

