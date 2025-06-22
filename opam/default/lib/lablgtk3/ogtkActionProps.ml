open GtkSignal
open Gobject
open Data
let set = set
let get = get
let param = param
open GtkActionProps

class virtual action_props = object
  val virtual obj : _ obj
  method set_hide_if_empty = set Action.P.hide_if_empty obj
  method set_is_important = set Action.P.is_important obj
  method set_label = set Action.P.label obj
  method set_icon_name = set Action.P.icon_name obj
  method set_sensitive = set Action.P.sensitive obj
  method set_short_label = set Action.P.short_label obj
  method set_stock_id = set Action.P.stock_id obj
  method set_tooltip = set Action.P.tooltip obj
  method set_visible = set Action.P.visible obj
  method set_visible_horizontal = set Action.P.visible_horizontal obj
  method set_visible_vertical = set Action.P.visible_vertical obj
  method hide_if_empty = get Action.P.hide_if_empty obj
  method is_important = get Action.P.is_important obj
  method label = get Action.P.label obj
  method icon_name = get Action.P.icon_name obj
  method name = get Action.P.name obj
  method sensitive = get Action.P.sensitive obj
  method short_label = get Action.P.short_label obj
  method stock_id = get Action.P.stock_id obj
  method tooltip = get Action.P.tooltip obj
  method visible = get Action.P.visible obj
  method visible_horizontal = get Action.P.visible_horizontal obj
  method visible_vertical = get Action.P.visible_vertical obj
end

class virtual action_sigs = object (self)
  method private virtual connect :
    'b. ('a,'b) GtkSignal.t -> callback:'b -> GtkSignal.id
  method private virtual notify :
    'b. ('a,'b) property -> callback:('b -> unit) -> GtkSignal.id
  method activate = self#connect Action.S.activate
  method notify_hide_if_empty ~callback =
    self#notify Action.P.hide_if_empty ~callback
  method notify_is_important ~callback =
    self#notify Action.P.is_important ~callback
  method notify_label ~callback = self#notify Action.P.label ~callback
  method notify_icon_name ~callback =
    self#notify Action.P.icon_name ~callback
  method notify_name ~callback = self#notify Action.P.name ~callback
  method notify_sensitive ~callback =
    self#notify Action.P.sensitive ~callback
  method notify_short_label ~callback =
    self#notify Action.P.short_label ~callback
  method notify_stock_id ~callback = self#notify Action.P.stock_id ~callback
  method notify_tooltip ~callback = self#notify Action.P.tooltip ~callback
  method notify_visible ~callback = self#notify Action.P.visible ~callback
  method notify_visible_horizontal ~callback =
    self#notify Action.P.visible_horizontal ~callback
  method notify_visible_vertical ~callback =
    self#notify Action.P.visible_vertical ~callback
end

class virtual toggle_action_props = object
  val virtual obj : _ obj
  method set_draw_as_radio = set ToggleAction.P.draw_as_radio obj
  method draw_as_radio = get ToggleAction.P.draw_as_radio obj
end

class virtual toggle_action_sigs = object (self)
  method private virtual connect :
    'b. ('a,'b) GtkSignal.t -> callback:'b -> GtkSignal.id
  method private virtual notify :
    'b. ('a,'b) property -> callback:('b -> unit) -> GtkSignal.id
  method toggled = self#connect ToggleAction.S.toggled
  method notify_draw_as_radio ~callback =
    self#notify ToggleAction.P.draw_as_radio ~callback
end

class virtual radio_action_props = object
  val virtual obj : _ obj
  method set_group = set RadioAction.P.group obj
  method set_value = set RadioAction.P.value obj
  method value = get RadioAction.P.value obj
end

class virtual ui_manager_props = object
  val virtual obj : _ obj
  method set_add_tearoffs = set UIManager.P.add_tearoffs obj
  method add_tearoffs = get UIManager.P.add_tearoffs obj
  method ui = get UIManager.P.ui obj
end

class virtual ui_manager_sigs = object (self)
  method private virtual connect :
    'b. ('a,'b) GtkSignal.t -> callback:'b -> GtkSignal.id
  method private virtual notify :
    'b. ('a,'b) property -> callback:('b -> unit) -> GtkSignal.id
  method actions_changed = self#connect UIManager.S.actions_changed
  method add_widget = self#connect
    {UIManager.S.add_widget with marshaller = fun f ->
     marshal1 GObj.conv_widget "GtkUIManager::add_widget" f}
  method notify_add_tearoffs ~callback =
    self#notify UIManager.P.add_tearoffs ~callback
  method notify_ui ~callback = self#notify UIManager.P.ui ~callback
end

class virtual action_group_props = object
  val virtual obj : _ obj
  method set_sensitive = set ActionGroup.P.sensitive obj
  method set_visible = set ActionGroup.P.visible obj
  method name = get ActionGroup.P.name obj
  method sensitive = get ActionGroup.P.sensitive obj
  method visible = get ActionGroup.P.visible obj
end

