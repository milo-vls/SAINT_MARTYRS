

hovered_desktop_icon_instance = noone;
if cursor_locked == noone
{
	hovered_window_id = -1;
	array_foreach(windows, window_is_hovered);
}

if hovered_window_id == -1
{
	var _variable_getter = noone;
	with obj_desktop_icon
		if position_meeting(CURSOR_X, CURSOR_Y, self)
			_variable_getter = self.id;
	hovered_desktop_icon_instance = _variable_getter;
}


//WINDOW MOVE AND RESIZE
if !left_click()
{
	cursor_locked = noone;
}
if cursor_locked == noone
	obj_computer_cursor.state = COMPUTER_CURSOR_STATES.DEFAULT;
if hovered_window_id >= 0 
{
	if cursor_locked == noone
	{
		hovered_region = border_region_hovered(get_window(hovered_window_id), CURSOR_X, CURSOR_Y);
		if left_click_pressed()
		{
			cursor_locked = hovered_region;
			if hovered_region == COMPUTER_WINDOW_BORDER_REGIONS.MOVE_AREA or hovered_region == COMPUTER_WINDOW_BORDER_REGIONS.TOP_CENTER or hovered_region == COMPUTER_WINDOW_BORDER_REGIONS.CENTER
				windows = give_window_focus(hovered_window_id);
		}
		switch hovered_region
		{
			/*
			case COMPUTER_WINDOW_BORDER_REGIONS.BOTTOM_CENTER :
				give_cursor_state(COMPUTER_CURSOR_STATES.RESIZE_N_S);
			break;
			case COMPUTER_WINDOW_BORDER_REGIONS.CENTER_LEFT :
			case COMPUTER_WINDOW_BORDER_REGIONS.CENTER_RIGHT :
				give_cursor_state(COMPUTER_CURSOR_STATES.RESIZE_W_E);
			break;
			case COMPUTER_WINDOW_BORDER_REGIONS.TOP_LEFT :
			case COMPUTER_WINDOW_BORDER_REGIONS.BOTTOM_RIGHT:
				give_cursor_state(COMPUTER_CURSOR_STATES.RESIZE_NW_SE);
			break;
			case COMPUTER_WINDOW_BORDER_REGIONS.TOP_RIGHT :
			case COMPUTER_WINDOW_BORDER_REGIONS.BOTTOM_LEFT :
				give_cursor_state(COMPUTER_CURSOR_STATES.RESIZE_NE_SW);
			break;
			*/
			case COMPUTER_WINDOW_BORDER_REGIONS.TOP_CENTER :
			case COMPUTER_WINDOW_BORDER_REGIONS.MOVE_AREA :
				give_cursor_state(COMPUTER_CURSOR_STATES.MOVE_CROSS, get_window(hovered_window_id));
			break;
			case COMPUTER_WINDOW_BORDER_REGIONS.CENTER :
				cursor_locked = noone;
			break;
			default :
			break;
		}
	}
}
else
{
	cursor_locked = noone;
}