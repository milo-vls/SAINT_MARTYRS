function sleep_to(_day_number = global.day_number + 1)
{
	var _room_to_get_up = rm_main_desk;
	
	
	global.day_number = _day_number;
	if ds_map_exists(global.day_events, global.day_number)
	{
		var _sequence_of_the_day = ds_map_find_value(global.day_events, global.day_number);
		_room_to_get_up = _sequence_of_the_day.starting_room;
		obj_sequence_management.set_sequence(_sequence_of_the_day);
	}
	
	change_room(_room_to_get_up, new RoomTransitionStyle(ROOM_TRANSITION_STYLES.SHOW_DATE, c_black));
}