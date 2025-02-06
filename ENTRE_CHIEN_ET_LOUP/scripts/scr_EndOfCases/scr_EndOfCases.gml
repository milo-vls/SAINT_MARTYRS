#macro END_OF_CASE_LAYER_NAME "end_of_case_layer"

function EndOfCases(_cases_ids) : Menu(MENU_PRIORITIES.CRIME_APPEARANCE, rm_main_desk, false, true, false) constructor 
{
	cases_ids = _cases_ids;
	
	
	set_up_done = false;
	animation_is_finished = false;
	sequence = noone;
	sequence_layer = noone;
	sequence_struct = noone;
	
	activity = function()
	{
		if false == set_up_done
		{
			set_up_done = true;
			if layer_exists(END_OF_CASE_LAYER_NAME)
				layer_destroy(END_OF_CASE_LAYER_NAME);
			sequence_layer = layer_create(DEPTHS.GUI, ROOM_TRANSITION_LAYER_NAME);
			sequence = layer_sequence_create(sequence_layer, 0, 0, sqc_end_of_case_last_pannel);
			sequence_struct = layer_sequence_get_sequence(sequence);
			sequence_struct.tracks[2].tracks[1].keyframes[0].channels[0].text = text_id_to_string("TEXT END OF CASES");
			sequence_struct.tracks[3].tracks[1].keyframes[0].channels[0].text = get_date_string();
		}
		
		
		if true == layer_sequence_is_finished(sequence)
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
				global.cases[_case_id].day_caught = global.day_number;
				global.current_cases_ids = array_delete_by_value(global.current_cases_ids, _case_id);
			});
		
		
		
		
			end_reached = true;
			return;
		}
	}
	draw = function()
	{
		
	}
}
