function sleep_until_next_event()
{
	//NO MORE CRIMES (crimes of the day just resolved)
	if array_length(global.current_cases_ids) == 0
	{
		var _first_crime_day = set_current_cases();
		return sleep_to(chose_awaking_day(_first_crime_day));
	}
	
	//THEIR ARE CRIMES TO BE RESOLVED (the player must resolved them)
	if crimes_are_covered() 
	{
		return sleep_to(get_cases_last_crime_day());
	}
	
	sleep_to();
	return change_room(rm_main_desk);
}