function sleep_to(_day_number = global.day_number + 1)
{	
	
	
	
	var _room_to_get_up = rm_main_desk;
	var _reseting_day = _day_number == global.day_number; //for game overs 
	
	change_day_number(_day_number);
	
	
	todays_crimes_ids = crimes_ids_from_day_number(_day_number)
	if array_length(todays_crimes_ids) > 0
	{
		//CRIME APPEARANCE
		var _crimes_of_current_cases_ids = crimes_ids_of_cases(global.current_cases_ids);
		var _crimes_undiscovered = array_filter(_crimes_of_current_cases_ids, function(_crime_id)
		{
			return !global.crimes[_crime_id].discovered and global.crimes[_crime_id].day_number <= global.day_number ;
		});
		add_map_step(step_crimes_appearance(_crimes_undiscovered));
		//END OF CASE(S) ANIMATION
		var _cases_ids_that_ends_today = [];
		var _nb_current_cases = array_length(global.current_cases_ids);
		for(var _index = 0; _index < _nb_current_cases; _index ++)
		{
			
			if _day_number == get_cases_last_crime_day([global.current_cases_ids[_index]])
			{
				array_push(_cases_ids_that_ends_today, global.current_cases_ids[_index]);
			}
		}
		if array_length(_cases_ids_that_ends_today) > 0
		{
			add_map_step(step_menu_end_of_current_cases(_cases_ids_that_ends_today));
		}
	}
	
	
	
	
	
	
	//SE PASSE T IL QUELQUE CHOSE DE SPÉCIAL AUJOURD'HUI ?
	var _sequence_of_the_day = ds_map_find_value(global.day_events, global.day_number);
	if !is_undefined(_sequence_of_the_day)
	{
		_room_to_get_up = _sequence_of_the_day.starting_room;
		obj_sequence_manager.set_sequence(_sequence_of_the_day);
	}
	
	
	
	change_room(_room_to_get_up);
	
	
	
	////////////////////////////////////////////////
	//* RESET NUMBER OF INTERACTIONS FOR NEW DAY *//
	////////////////////////////////////////////////
	
	if _reseting_day == false
		reset_nb_interactions();
	
}