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








/*
if window_with_focus != noone
{
	with window_with_focus
	{
		depth = origin_depth -1;
		event_user(0);
	}
	
	
}

if hovered_window != noone
{
	if left_click_pressed()
	{
		window_with_focus = hovered_window;
		with window_with_focus
		{
			depth = origin_depth -1;
			event_user(0);
		}
	}
	return;
}
else
{
	if left_click_released() and get_release_timer() >= 1
		window_with_focus = noone;
	if hovered_desktop_icon != noone
	{
		if left_click_pressed()
		{
			if hovered_desktop_icon.double_click_timer_frames <= 0 
				hovered_desktop_icon.double_click_timer_frames = hovered_desktop_icon.double_click_delay_frames;
			else
				if hovered_desktop_icon.on_double_click != noone
					hovered_desktop_icon.on_double_click();
		}
	}
}








