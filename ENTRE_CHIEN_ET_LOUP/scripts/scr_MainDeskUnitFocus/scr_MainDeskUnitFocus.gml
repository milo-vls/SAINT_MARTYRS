function MainDeskUnitFocus(_unit_id) : Menu(MENU_PRIORITIES.MAIN_DESK_CRIME_FOCUS, room, false, true, false, MENU_CHANNELS.MAIN_DESK_NEUTRAL) constructor
{
	unit_instance_focus = get_unit_instance_focus(_unit_id);
	
	
	draw = function(){};
	activity = function()
	{

		
		
		//EXIT CONDITIONS
		if (left_click_released() or unit_instance_focus == noone) and get_release_timer() >= 1
		{
			if position_meeting(unit_instance_focus.x, unit_instance_focus.y, obj_units_ben)
				instance_destroy(unit_instance_focus);
			
			reset_regrab_timer();
			end_reached = true;
			return;
		}
		
		//UNIT MANIPULATION
		unit_instance_focus.x = mouse_x;
		unit_instance_focus.y = mouse_y;
	}
}

function get_unit_instance_focus(_unit_id)
{
	var _nb_of_units_on_map = instance_number(obj_unit);
	for (var _i= 0; _i < _nb_of_units_on_map; _i ++)
	{
		var _current_unit_instance = instance_find(obj_unit, _i);
		if _current_unit_instance.unit_id == _unit_id
		{
			return _current_unit_instance;
		}
	}
	return noone;
}