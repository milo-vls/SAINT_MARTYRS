function MainDeskNeutral() : Menu(MENU_PRIORITIES.MAIN_DESK_NEUTRAL, room, false, true, false, MENU_CHANNELS.MAIN_DESK_NEUTRAL) constructor 
{
	pressed_crime = -1;

	draw = function()
	{
		
	}
	activity = main_desk_neutral;
}

function main_desk_neutral()
{
		var _mouse_is_over_crime = instance_position(mouse_x, mouse_y, obj_crime);
		if _mouse_is_over_crime > -1
		{
			if _mouse_is_over_crime == pressed_crime and left_click_released()
			{
				add_menu(new MainDeskCrimeFocus(pressed_crime.crime_id));
			}
		}
		if _mouse_is_over_crime > -1 and left_click_pressed() 
		{
			pressed_crime = _mouse_is_over_crime;
		}
		if !left_click()
		{
			pressed_crime = noone;
		}	
}
