function MainDeskUnitSelection() : Menu(MENU_PRIORITIES.MAIN_DESK_CRIME_FOCUS, room, false, true, false, MENU_CHANNELS.MAIN_DESK_NEUTRAL) constructor 
{
	reset_release_timer();
	pressed_unit_sheet = noone;
	
	
	activity = function()
	{
		var _mouse_over_unit_sheet = instance_position(mouse_x, mouse_y, obj_unit_sheet);
		if _mouse_over_unit_sheet > -1
		{
			obj_unit_sheet.mouse_over = false;
			_mouse_over_unit_sheet.mouse_over = true;
			if left_click_released() and _mouse_over_unit_sheet == pressed_unit_sheet
			{
				var _unit_id = pressed_unit_sheet.unit_id;
				if destroy_existing_instance_of_unit_id(_unit_id) == false
				{
					instance_create_depth(mouse_x, mouse_y, DEPTHS.UNITS, obj_unit, {unit_id : _unit_id, sprite_index : asset_get_index("spr_unit_hitbox_" + string(_unit_id))});
					add_menu(new MainDeskUnitFocus(_unit_id));
				}
			}
			if left_click_pressed()
			{
				if _mouse_over_unit_sheet.available
				{
					pressed_unit_sheet = _mouse_over_unit_sheet;
				}
			}
			if !left_click() or _mouse_over_unit_sheet == noone
			{
				pressed_unit_sheet = noone;
			}
		}
		else
		{
			obj_unit_sheet.mouse_over = false;
			if left_click_released() then end_reached = true;
		}
	}
	draw = function()
	{
		obj_unit_sheet.shown = true;
	}
}