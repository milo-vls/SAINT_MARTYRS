
function MainDeskCrimeFocus(_crime_id) : Menu(MENU_PRIORITIES.MAIN_DESK_CRIME_FOCUS, room, false, true, false, MENU_CHANNELS.MAIN_DESK_NEUTRAL) constructor 
{
	crime_id = _crime_id;
	
	crime_instance = crime_instance_by_crime_id(_crime_id);
	
	var _crime_instance_is_left_sided = crime_instance.x <  (GAME_WIDTH/2);
	for (var _crime_sheet_index = 0; _crime_sheet_index < 2; _crime_sheet_index ++)
	{
		var _crime_sheet_instance = instance_find(obj_crime_focus_sheet, _crime_sheet_index);
		if _crime_sheet_instance.left_side != _crime_instance_is_left_sided then crime_sheet_to_use = _crime_sheet_instance;
	}
	crime_sheet_to_use.set_crime_id(_crime_id);
	
	
	pressed_crime = -1;
	void_is_pressed = false;
	
	draw = function()
	{
		crime_sheet_to_use.shown = true;
	}
	activity = main_desk_crime_focus_activity;
}

function main_desk_crime_focus_activity()
{
	var _mouse_is_over_crime = instance_position(mouse_x, mouse_y, obj_crime);
	
	if left_click_released()
	{
		if pressed_crime > -1 
		{
			if pressed_crime == crime_instance
			{
				return;
			}
			end_reached = true;
			add_menu(new MainDeskCrimeFocus(pressed_crime.crime_id));
		}
		else if void_is_pressed then end_reached = true;
	}
	if left_click_pressed()
	{
		pressed_crime = _mouse_is_over_crime;
		void_is_pressed =  (_mouse_is_over_crime == noone);
	}
	if _mouse_is_over_crime != noone  then void_is_pressed = false;
	pressed_crime = _mouse_is_over_crime == noone ? noone : pressed_crime;
}

function change_crime_color_next(_crime_id)
{
	if global.crimes[_crime_id].color_id != CRIME_COLORS.NB_OF_CRIME_COLORS -1
	{
		global.crimes[_crime_id].color_id ++;
	}
	else
	{
		global.crimes[_crime_id].color_id = 0;
	}
}