function sleep_to(_day_number = global.day_number + 1)
{
	var _room_to_get_up = rm_main_desk;
	var _reseting_day = _day_number == global.day_number; //for game overs 
	
	global.day_number = _day_number;
	
	var _todays_crimes_ids = crimes_ids_from_day_number(_day_number)
	if array_length(_todays_crimes_ids) > 0
	{
		add_map_step(step_crimes_appearance(_todays_crimes_ids));
	}
	
	//SE PASSE T IL QUELQUE CHOSE DE SPÉCIAL AUJOURD'HUI ?
	var _sequence_of_the_day = ds_map_find_value(global.day_events, global.day_number);
	if !is_undefined(_sequence_of_the_day)
	{
		_room_to_get_up = _sequence_of_the_day.starting_room;
		obj_sequence_manager.set_sequence(_sequence_of_the_day);
	}
	
	
	
	change_room(_room_to_get_up, new RoomTransitionStyle(ROOM_TRANSITION_STYLES.SHOW_DATE, c_black));
}