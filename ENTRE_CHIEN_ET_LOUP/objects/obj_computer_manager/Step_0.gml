//DESTOP ICON

if hovered_desktop_icon_instance != noone
	if left_click_pressed()
		hovered_desktop_icon_instance.on_click();


//MOVE WINDOW
if cursor_locked != noone and hovered_window_id >= 0
{
	switch hovered_region
	{
		default : break;
		case COMPUTER_WINDOW_BORDER_REGIONS.TOP_CENTER :
		case COMPUTER_WINDOW_BORDER_REGIONS.MOVE_AREA :
			computer_window_repos(hovered_window_id, CURSOR_X - cursor_x_offset, CURSOR_Y - cursor_y_offset);
			obj_computer_icon_ben.shown = true;
		break;
	}
}


