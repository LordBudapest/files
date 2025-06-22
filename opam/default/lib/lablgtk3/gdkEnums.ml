(** gdk enums *)

type event_type =
  [ `NOTHING | `DELETE | `DESTROY | `EXPOSE | `MOTION_NOTIFY | `BUTTON_PRESS
  | `TWO_BUTTON_PRESS | `THREE_BUTTON_PRESS | `BUTTON_RELEASE | `KEY_PRESS
  | `KEY_RELEASE | `ENTER_NOTIFY | `LEAVE_NOTIFY | `FOCUS_CHANGE | `CONFIGURE
  | `MAP | `UNMAP | `PROPERTY_NOTIFY | `SELECTION_CLEAR | `SELECTION_REQUEST
  | `SELECTION_NOTIFY | `PROXIMITY_IN | `PROXIMITY_OUT | `DRAG_ENTER
  | `DRAG_LEAVE | `DRAG_MOTION | `DRAG_STATUS | `DROP_START | `DROP_FINISHED
  | `CLIENT_EVENT | `VISIBILITY_NOTIFY | `SCROLL | `WINDOW_STATE | `SETTING
  | `OWNER_CHANGE | `GRAB_BROKEN | `DAMAGE | `TOUCH_BEGIN | `TOUCH_UPDATE
  | `TOUCH_END | `TOUCH_CANCEL | `TOUCHPAD_SWIPE | `TOUCHPAD_PINCH ]
type visibility_state = [ `UNOBSCURED | `PARTIAL | `FULLY_OBSCURED ]
type touchpad_gesture_phase = [ `BEGIN | `UPDATE | `END | `CANCEL ]
type scroll_direction = [ `UP | `DOWN | `LEFT | `RIGHT | `SMOOTH ]
type crossing_mode =
  [ `NORMAL | `GRAB | `UNGRAB | `GTK_GRAB | `GTK_UNGRAB | `STATE_CHANGED
  | `TOUCH_BEGIN | `TOUCH_END | `DEVICE_SWITCH ]
type notify_type =
  [ `ANCESTOR | `VIRTUAL | `INFERIOR | `NONLINEAR | `NONLINEAR_VIRTUAL
  | `UNKNOWN ]
type setting_action = [ `NEW | `CHANGED | `DELETED ]
type owner_change = [ `NEW_OWNER | `DESTROY | `CLOSE ]
type window_state =
  [ `WITHDRAWN | `ICONIFIED | `MAXIMIZED | `STICKY | `FULLSCREEN | `ABOVE
  | `BELOW | `FOCUSED | `TILED ]
type input_source =
  [ `MOUSE | `PEN | `ERASER | `CURSOR | `KEYBOARD | `TOUCHSCREEN
  | `TOUCHPAD ]
type input_mode = [ `DISABLED | `SCREEN | `WINDOW ]
type device_type = [ `MASTER | `SLAVE | `FLOATING ]
type visual_type =
  [ `STATIC_GRAY | `GRAYSCALE | `STATIC_COLOR | `PSEUDO_COLOR | `TRUE_COLOR
  | `DIRECT_COLOR ]
type drag_action = [ `DEFAULT | `COPY | `MOVE | `LINK | `PRIVATE | `ASK ]
type drag_protocol =
  [ `NONE | `MOTIF | `XDND | `ROOTWIN | `WIN32_DROPFILES | `OLE2 | `LOCAL
  | `WAYLAND ]
type xdata = [ `BYTES | `SHORTS | `INT32S | `NONE ]
type property_state = [ `NEW_VALUE | `DELETE ]
type property_mode = [ `REPLACE | `PREPEND | `APPEND ]
type window_class = [ `INPUT_OUTPUT | `INPUT_ONLY ]
type window_type =
  [ `ROOT | `TOPLEVEL | `CHILD | `TEMP | `FOREIGN | `OFFSCREEN
  | `SUBSURFACE ]
type window_attributes_type =
  [ `TITLE | `X | `Y | `CURSOR | `VISUAL | `WMCLASS | `NOREDIR | `TYPE_HINT ]
type window_hints =
  [ `POS | `MIN_SIZE | `MAX_SIZE | `BASE_SIZE | `ASPECT | `RESIZE_INC
  | `WIN_GRAVITY | `USER_POS | `USER_SIZE ]
type wm_decoration =
  [ `ALL | `BORDER | `RESIZEH | `TITLE | `MENU | `MINIMIZE | `MAXIMIZE ]
type wm_function =
  [ `ALL | `RESIZE | `MOVE | `MINIMIZE | `MAXIMIZE | `CLOSE ]
type gravity =
  [ `NORTH_WEST | `NORTH | `NORTH_EAST | `WEST | `CENTER | `EAST
  | `SOUTH_WEST | `SOUTH | `SOUTH_EAST | `STATIC ]
type window_edge =
  [ `NORTH_WEST | `NORTH | `NORTH_EAST | `WEST | `EAST | `SOUTH_WEST | `SOUTH
  | `SOUTH_EAST ]
type fullscreen_mode = [ `ON_CURRENT_MONITOR | `ON_ALL_MONITORS ]
type modifier =
  [ `SHIFT | `LOCK | `CONTROL | `MOD1 | `MOD2 | `MOD3 | `MOD4 | `MOD5
  | `BUTTON1 | `BUTTON2 | `BUTTON3 | `BUTTON4 | `BUTTON5 | `SUPER | `HYPER
  | `META | `RELEASE ]
type modifier_intent =
  [ `PRIMARY_ACCELERATOR | `CONTEXT_MENU | `EXTEND_SELECTION
  | `MODIFY_SELECTION | `NO_TEXT_INPUT | `SHIFT_GROUP | `DEFAULT_MOD_MASK ]
type status = [ `OK | `ERROR | `ERROR_PARAM | `ERROR_FILE | `ERROR_MEM ]
type grab_status =
  [ `SUCCESS | `ALREADY_GRABBED | `INVALID_TIME | `NOT_VIEWABLE | `FROZEN
  | `FAILED ]
type grab_ownership = [ `NONE | `WINDOW | `APPLICATION ]
type event_mask =
  [ `EXPOSURE | `POINTER_MOTION | `POINTER_MOTION_HINT | `BUTTON_MOTION
  | `BUTTON1_MOTION | `BUTTON2_MOTION | `BUTTON3_MOTION | `BUTTON_PRESS
  | `BUTTON_RELEASE | `KEY_PRESS | `KEY_RELEASE | `ENTER_NOTIFY
  | `LEAVE_NOTIFY | `FOCUS_CHANGE | `STRUCTURE | `PROPERTY_CHANGE
  | `VISIBILITY_NOTIFY | `PROXIMITY_IN | `PROXIMITY_OUT | `SUBSTRUCTURE
  | `SCROLL | `TOUCH | `SMOOTH_SCROLL | `TOUCHPAD_GESTURE | `ALL_EVENTS ]
type gl_error =
  [ `NOT_AVAILABLE | `UNSUPPORTED_FORMAT | `UNSUPPORTED_PROFILE ]
type window_type_hint =
  [ `NORMAL | `DIALOG | `MENU | `TOOLBAR | `SPLASHSCREEN | `UTILITY | `DOCK
  | `DESKTOP | `DROPDOWN_MENU | `POPUP_MENU | `TOOLTIP | `NOTIFICATION
  | `COMBO | `DND ]
type axis_use =
  [ `IGNORE | `X | `Y | `PRESSURE | `XTILT | `YTILT | `WHEEL | `LAST ]
type cursor_type =
  [ `X_CURSOR | `ARROW | `BASED_ARROW_DOWN | `BASED_ARROW_UP | `BOAT
  | `BOGOSITY | `BOTTOM_LEFT_CORNER | `BOTTOM_RIGHT_CORNER | `BOTTOM_SIDE
  | `BOTTOM_TEE | `BOX_SPIRAL | `CENTER_PTR | `CIRCLE | `CLOCK | `COFFEE_MUG
  | `CROSS | `CROSS_REVERSE | `CROSSHAIR | `DIAMOND_CROSS | `DOT | `DOTBOX
  | `DOUBLE_ARROW | `DRAFT_LARGE | `DRAFT_SMALL | `DRAPED_BOX | `EXCHANGE
  | `FLEUR | `GOBBLER | `GUMBY | `HAND1 | `HAND2 | `HEART | `ICON
  | `IRON_CROSS | `LEFT_PTR | `LEFT_SIDE | `LEFT_TEE | `LEFTBUTTON
  | `LL_ANGLE | `LR_ANGLE | `MAN | `MIDDLEBUTTON | `MOUSE | `PENCIL | `PIRATE
  | `PLUS | `QUESTION_ARROW | `RIGHT_PTR | `RIGHT_SIDE | `RIGHT_TEE
  | `RIGHTBUTTON | `RTL_LOGO | `SAILBOAT | `SB_DOWN_ARROW
  | `SB_H_DOUBLE_ARROW | `SB_LEFT_ARROW | `SB_RIGHT_ARROW | `SB_UP_ARROW
  | `SB_V_DOUBLE_ARROW | `SHUTTLE | `SIZING | `SPIDER | `SPRAYCAN | `STAR
  | `TARGET | `TCROSS | `TOP_LEFT_ARROW | `TOP_LEFT_CORNER
  | `TOP_RIGHT_CORNER | `TOP_SIDE | `TOP_TEE | `TREK | `UL_ANGLE | `UMBRELLA
  | `UR_ANGLE | `WATCH | `XTERM ]


(**/**)

module Conv = struct
  open Gpointer

  external _get_tables : unit ->
      event_type variant_table
    * visibility_state variant_table
    * touchpad_gesture_phase variant_table
    * scroll_direction variant_table
    * crossing_mode variant_table
    * notify_type variant_table
    * setting_action variant_table
    * owner_change variant_table
    * window_state variant_table
    * input_source variant_table
    * input_mode variant_table
    * device_type variant_table
    * visual_type variant_table
    * drag_action variant_table
    * drag_protocol variant_table
    * xdata variant_table
    * property_state variant_table
    * property_mode variant_table
    * window_class variant_table
    * window_type variant_table
    * window_attributes_type variant_table
    * window_hints variant_table
    * wm_decoration variant_table
    * wm_function variant_table
    * gravity variant_table
    * window_edge variant_table
    * fullscreen_mode variant_table
    * modifier variant_table
    * modifier_intent variant_table
    * status variant_table
    * grab_status variant_table
    * grab_ownership variant_table
    * event_mask variant_table
    * gl_error variant_table
    * window_type_hint variant_table
    * axis_use variant_table
    * cursor_type variant_table
    = "ml_gdk_get_tables"

  let event_type_tbl, visibility_state_tbl, touchpad_gesture_phase_tbl,
      scroll_direction_tbl, crossing_mode_tbl, notify_type_tbl,
      setting_action_tbl, owner_change_tbl, window_state_tbl,
      input_source_tbl, input_mode_tbl, device_type_tbl, visual_type_tbl,
      drag_action_tbl, drag_protocol_tbl, xdata_tbl, property_state_tbl,
      property_mode_tbl, window_class_tbl, window_type_tbl,
      window_attributes_type_tbl, window_hints_tbl, wm_decoration_tbl,
      wm_function_tbl, gravity_tbl, window_edge_tbl, fullscreen_mode_tbl,
      modifier_tbl, modifier_intent_tbl, status_tbl, grab_status_tbl,
      grab_ownership_tbl, event_mask_tbl, gl_error_tbl, window_type_hint_tbl,
      axis_use_tbl, cursor_type_tbl = _get_tables ()

  let _make_enum = Gobject.Data.enum
  let event_type = _make_enum event_type_tbl
  let visibility_state = _make_enum visibility_state_tbl
  let touchpad_gesture_phase = _make_enum touchpad_gesture_phase_tbl
  let scroll_direction = _make_enum scroll_direction_tbl
  let crossing_mode = _make_enum crossing_mode_tbl
  let notify_type = _make_enum notify_type_tbl
  let setting_action = _make_enum setting_action_tbl
  let owner_change = _make_enum owner_change_tbl
  let window_state = _make_enum window_state_tbl
  let input_source = _make_enum input_source_tbl
  let input_mode = _make_enum input_mode_tbl
  let device_type = _make_enum device_type_tbl
  let visual_type = _make_enum visual_type_tbl
  let drag_action = _make_enum drag_action_tbl
  let drag_protocol = _make_enum drag_protocol_tbl
  let xdata = _make_enum xdata_tbl
  let property_state = _make_enum property_state_tbl
  let property_mode = _make_enum property_mode_tbl
  let window_class = _make_enum window_class_tbl
  let window_type = _make_enum window_type_tbl
  let window_attributes_type = _make_enum window_attributes_type_tbl
  let window_hints = _make_enum window_hints_tbl
  let wm_decoration = _make_enum wm_decoration_tbl
  let wm_function = _make_enum wm_function_tbl
  let gravity = _make_enum gravity_tbl
  let window_edge = _make_enum window_edge_tbl
  let fullscreen_mode = _make_enum fullscreen_mode_tbl
  let modifier = _make_enum modifier_tbl
  let modifier_intent = _make_enum modifier_intent_tbl
  let status = _make_enum status_tbl
  let grab_status = _make_enum grab_status_tbl
  let grab_ownership = _make_enum grab_ownership_tbl
  let event_mask = Gobject.Data.flags event_mask_tbl
  let gl_error = _make_enum gl_error_tbl
  let window_type_hint = _make_enum window_type_hint_tbl
  let axis_use = _make_enum axis_use_tbl
  let cursor_type = _make_enum cursor_type_tbl
end
