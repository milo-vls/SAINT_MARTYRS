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









