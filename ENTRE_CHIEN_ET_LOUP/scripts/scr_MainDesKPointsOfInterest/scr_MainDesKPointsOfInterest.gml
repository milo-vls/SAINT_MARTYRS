function MainDesKPointsOfInterest() : Menu(MENU_PRIORITIES.MAIN_DESK_CRIME_FOCUS, room, false, true, false) constructor 
{
	void_is_pressed = false;
	pressed_point_of_interest = noone;
	
	draw = function()
	{
		obj_point_of_interest.shown = true;
	}
	activity = function()
	{
		var _mouse_is_over_point_of_interest = instance_position(mouse_x, mouse_y, obj_point_of_interest);
		if left_click_released()
		{
			if pressed_point_of_interest != noone
			{
				with pressed_point_of_interest
				event_user(0);
			}
			else if void_is_pressed
			{
				end_reached = true;
			}
			
		}
		if left_click_pressed()
		{
			pressed_point_of_interest = _mouse_is_over_point_of_interest;
			void_is_pressed = (_mouse_is_over_point_of_interest == noone);
		}
		if _mouse_is_over_point_of_interest != noone then void_is_pressed = false;
		pressed_point_of_interest = _mouse_is_over_point_of_interest == noone ? noone : pressed_point_of_interest;
	}
}