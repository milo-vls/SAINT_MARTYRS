function CrimeAppearance(_crimes_ids) : Menu(MENU_PRIORITIES.CRIME_APPEARANCE, rm_main_desk, false, false, false) constructor 
{
	#macro CRIME_DELAY_FRAMES (room_speed * 0.5)
	
	sorted_crimes_ids = sorted_crimes_ids_by_appearance(_crimes_ids);
	nb_crimes = array_length(_crimes_ids);
	appearing_crime_id = 0;
	crime_timer = 0;
	room_transition_ended = false;
	last_crime_is_first = false;
	
	inter_end_reached = false;
	end_duration = room_speed * 1.5;
	end_timer = 0;
	
	//DRAW METHOD VARIABLES
	thorns_color = c_black;
	thorns_alpha = 0;
	nb_crimes_appeard_so_far = 0;
	
	
	//METHODS
	activity = crime_appearance_activity;
	draw = crime_appearance_draw;
	
}
function crime_appearance_activity()
{
	if inter_end_reached
	{
		end_timer ++;
		if end_timer >= end_duration
		{
			obj_camera.zoom_speed = ZOOM_SPEED_DEFAULT;
			set_camera_zoom_target(MAXIMAL_ZOOM);
			end_reached = true;	
		}
	}
	
	if appearing_crime_id == nb_crimes
	{
		
		inter_end_reached = true;
		return;
	}
	
	
	if room_transition_ended == false
	{
		if obj_menu_manager.get_active_menu(RoomTransition) == -1
		{
			room_transition_ended = true;
			set_camera_zoom_target(.65);
			obj_camera.zoom_speed = 0.5;
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
	

	if crime_timer > CRIME_DELAY_FRAMES
	{
		var _is_first_of_case = global.crimes[sorted_crimes_ids[appearing_crime_id]].get_first_of_case();
		if !_is_first_of_case and last_crime_is_first
		{
			inter_end_reached = true;
			return;
		}
		
		
		
		if !crime_appeard(sorted_crimes_ids[appearing_crime_id])
		{
			crime_appear(sorted_crimes_ids[appearing_crime_id], true, !_is_first_of_case);
			crime_timer = 0;
			last_crime_is_first = _is_first_of_case;
			
			thorns_alpha = 1;
			nb_crimes_appeard_so_far ++;

			
		}
		
		appearing_crime_id ++;
	}
	

}

function crime_appearance_draw()
{
	var _cam_x = camera_get_view_x(VIEW);
	var _cam_y = camera_get_view_y(VIEW);
	var _cam_width = camera_get_view_width(VIEW);
	var _cam_height = camera_get_view_height(VIEW);
	thorns_alpha = approach(thorns_alpha, 0, 0.05);
	draw_set_alpha(thorns_alpha);
	draw_set_color(make_color_rgb(160,47,64));
	
	draw_rectangle(_cam_x, _cam_y, _cam_x + _cam_width, _cam_y + _cam_height, false);
	

}















