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
}