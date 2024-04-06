function EndOfCases(_cases_ids) : Menu(MENU_PRIORITIES.CRIME_APPEARANCE, rm_main_desk, false, true, false) constructor 
{
	cases_ids = _cases_ids;
	animation_is_finished = false;
	scribble_text = scribble("[fnt_small_titles]"+text_id_to_string("TEXT END OF CASES")).align(fa_center, fa_middle);
	scribble_text_height = scribble_text.get_height();
	starting_scribble_text_y = GAME_HEIGHT + scribble_text_height/2;
	target_scribble_text_y = 0 - scribble_text_height/2;
	scribble_text_y = starting_scribble_text_y;
	y_distance_to_go = abs(starting_scribble_text_y - target_scribble_text_y);
	animcurve_channel = animcurve_get_channel(ac_end_of_cases, 0);
	start_frame_duration = room_speed * 0.5;
	start_frame_timer = 0;
	animation_frame_duration = room_speed * 5;
	animation_frame_timer = 0;
	
	activity = end_of_cases_activity;
	draw = end_of_cases_draw;
}


function end_of_cases_activity()
{
	if animation_is_finished
	{
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
	var _quotient = animcurve_channel_evaluate(animcurve_channel, animation_frame_timer/animation_frame_duration);
	scribble_text_y = starting_scribble_text_y - y_distance_to_go * _quotient;
	scribble_text.draw(room_width/2, scribble_text_y);
	
	if _quotient > 0.99
	{
		animation_is_finished = true;
	}
}