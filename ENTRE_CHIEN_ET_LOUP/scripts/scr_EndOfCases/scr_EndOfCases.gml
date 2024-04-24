function EndOfCases(_cases_ids) : Menu(MENU_PRIORITIES.CRIME_APPEARANCE, rm_main_desk, false, true, false) constructor 
{
	cases_ids = _cases_ids;
	animation_is_finished = false;
	scribble_text = scribble("[fnt_small_titles]"+text_id_to_string("TEXT END OF CASES")).align(fa_center, fa_middle);
	scribble_text_width = scribble_text.get_width();
	scribble_text_height = scribble_text.get_height();
	starting_scribble_text_y = GAME_HEIGHT + scribble_text_height/2;
	target_scribble_text_y = 0 - scribble_text_height * 2;
	scribble_text_y = starting_scribble_text_y;
	scribble_text_x = room_width/2;
	y_distance_to_go = abs(starting_scribble_text_y - target_scribble_text_y);
	text_animcurve_channel = animcurve_get_channel(ac_end_of_cases, "text");
	background_animcurve_channel = animcurve_get_channel(ac_end_of_cases, "background");
	background_bottom_target_y = GAME_HEIGHT;
	background_bottom_y = GAME_HEIGHT;
	start_frame_duration = room_speed * 0.5;
	start_frame_timer = 0;
	animation_frame_duration = room_speed * 3;
	animation_frame_timer = 0;
	
	activity = end_of_cases_activity;
	draw = end_of_cases_draw;
}


function end_of_cases_activity()
{
	if animation_is_finished
	{
		for (var _i = 0; _i < instance_number(obj_crime); ++ _i;)
		{
			var _crime_instance = instance_find(obj_crime, _i);
			if array_contains(cases_ids, global.crimes[_crime_instance.crime_id].case_id)
			{
				_crime_instance.disappearing = true;
			}
		}
		array_foreach(cases_ids, function(_case_id)
		{
			array_delete_by_value(global.current_cases_ids, _case_id);
		});
		
		
		
		
		end_reached = true;
		return;
	}
}
function end_of_cases_draw()
{
	
	start_frame_timer ++
	if start_frame_timer < start_frame_duration
	{
		return;
	}
	animation_frame_timer ++;
	var _quotient = animation_frame_timer/animation_frame_duration;
	var _background_quotient = animcurve_channel_evaluate(background_animcurve_channel, _quotient)
	var _text_quotient = animcurve_channel_evaluate(text_animcurve_channel, _quotient);
	background_y = GAME_HEIGHT - GAME_HEIGHT * _background_quotient;
	scribble_text_y = starting_scribble_text_y - y_distance_to_go * _text_quotient;
	
	draw_set_color(c_black); draw_set_alpha(0.8);
	background_bottom_y = approach(background_bottom_y, background_bottom_target_y, 25);
	draw_rectangle(scribble_text_x - scribble_text_width, background_bottom_y, scribble_text_x + scribble_text_width, background_y, false);
	
	draw_set_color(MOUSE_OVER_TEXT_FONT_COLOR);draw_set_alpha(1);
	scribble_text.draw(scribble_text_x, scribble_text_y);
	
	if _text_quotient > 0.99
	{
		background_bottom_target_y = 0;
		animation_is_finished = background_bottom_y == background_bottom_target_y ;
	}
}