
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
	var _mouse_over_change_color = crime_sheet_to_use.mouse_over_change_color;
	if _mouse_is_over_crime != noone
		void_is_pressed = false;
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
		if _mouse_over_change_color and obj_malus_canvas.confusion_on
		{
			change_crime_color_next(crime_id, crime_instance);
		}
		pressed_crime = _mouse_is_over_crime;
		void_is_pressed =  (_mouse_is_over_crime == noone and _mouse_over_change_color == noone);
	}
	if _mouse_is_over_crime != noone  then void_is_pressed = false;
	pressed_crime = _mouse_is_over_crime == noone ? noone : pressed_crime;
}

function change_crime_color_next(_crime_id, _crime_instance)
{
	//change color of the crime itself
	if global.crimes[_crime_id].color_id != CRIME_COLORS.NB_OF_CRIME_COLORS -1
	{
		global.crimes[_crime_id].color_id ++;
	}
	else
	{
		global.crimes[_crime_id].color_id = 0;
	}
	var _new_color_id = global.crimes[_crime_id].color_id;
	
	//find crime's next crime before the update
	var _next_crime_before_update = _crime_instance.instance_giving_string_id == noone ? noone : _crime_instance.instance_giving_string_id.crime_instance_id_dst;
	//delete all crime's string
	var _precedent_crime_before_update = noone;
	if _crime_instance.instance_giving_string_id != noone
		delete_string(_crime_instance.instance_giving_string_id);
	if _crime_instance.instance_coming_string_id != noone
	{
		_precedent_crime_before_update = _crime_instance.instance_coming_string_id.crime_instance_id_src;
		delete_string(_crime_instance.instance_coming_string_id);
	}
	//new strings of precedent color
	if _next_crime_before_update != noone and _precedent_crime_before_update != noone
		set_new_string(_precedent_crime_before_update, _next_crime_before_update, global.crimes[_next_crime_before_update.crime_id].color_id)
	
	
	//find precedent crime to get crime linked to	AND delete its string to its next crime if both exists AND link it to crime + link crime to new precedent if it exists
	var _crime_instances_number = instance_number(obj_crime);
	var _precedent_crime_to_be_linked_to = precedent_crime_instance_of_same_color(_crime_instance, _crime_instances_number);
	var _next_crime_of_precedent_crime_to_be_linked_to = noone;
	if _precedent_crime_to_be_linked_to != noone
	{
		if _precedent_crime_to_be_linked_to.instance_giving_string_id != noone
		{
			_next_crime_of_precedent_crime_to_be_linked_to = _precedent_crime_to_be_linked_to.instance_giving_string_id.crime_instance_id_dst;
			delete_string(_precedent_crime_to_be_linked_to.instance_giving_string_id);
			set_new_string(_crime_instance, _next_crime_of_precedent_crime_to_be_linked_to, _new_color_id);
		}
		//link crime to his new precedent
		set_new_string(_precedent_crime_to_be_linked_to, _crime_instance, _new_color_id);
	}
	
	if _crime_instance.instance_giving_string_id == noone
	{
		var _next_crime_to_be_linked_to = next_crime_instance_of_same_color(_crime_instance, _crime_instances_number);
		if _next_crime_to_be_linked_to != noone
			set_new_string(_crime_instance, _next_crime_to_be_linked_to, _new_color_id);
	}
		
	
}














