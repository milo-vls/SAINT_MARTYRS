function CrimeAppearance(_crimes_ids) : Menu(MENU_PRIORITIES.CRIME_APPEARANCE, rm_main_desk, false, true, false) constructor 
{
	sorted_crimes_ids = sorted_crimes_ids_by_appearance(_crimes_ids);
	nb_crimes = array_length(_crimes_ids);
	appearing_crime_id = 0;
	crime_timer = 0;
	crime_delay_frames = int64(room_speed * 0.5);
	room_transition_ended = false;
	
	activity = crime_appearance_activity;
	draw = function(){};
	
}
function crime_appearance_activity()
{
	if room_transition_ended == false
	{
		if obj_menu_manager.get_active_menu(RoomTransition) == -1
		{
			room_transition_ended = true
		}
		else
		{
			return;
		}
	}
	else
	{
		crime_timer ++;
	}
	if appearing_crime_id == nb_crimes
	{
		end_reached = true;
		return;
	}
	if crime_timer == crime_delay_frames
	{
		if !crime_appeard(sorted_crimes_ids[appearing_crime_id])
		{
			crime_appear(sorted_crimes_ids[appearing_crime_id], true);
		}
		crime_timer = 0;
		appearing_crime_id ++;
	}
	

}



