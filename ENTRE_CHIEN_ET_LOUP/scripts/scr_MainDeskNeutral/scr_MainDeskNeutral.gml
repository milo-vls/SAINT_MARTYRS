function MainDeskNeutral() : Menu(MENU_PRIORITIES.MAIN_DESK_NEUTRAL, room, false, true, false, MENU_CHANNELS.MAIN_DESK_NEUTRAL) constructor 
{
	pressed_crime = noone;
	
	
	
	draw = function()
	{
		
	}
	activity = function()
	{
		var _mouse_is_over_crime = instance_position(mouse_x, mouse_y, obj_crime);
		if _mouse_is_over_crime > -1 and left_click_released() and _mouse_is_over_crime == pressed_crime
		{
			obj_menu_management.add_menu(new MainDeskCrimeFocus(pressed_crime.crime_id));
		}		
		pressed_crime = _mouse_is_over_crime > -1 and left_click_pressed() ? _mouse_is_over_crime : !left_click() ? noone : pressed_crime;
		
	}
}


