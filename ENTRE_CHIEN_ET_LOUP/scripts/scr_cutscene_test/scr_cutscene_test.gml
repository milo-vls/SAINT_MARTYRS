function start_cutscene_test()
{
	var _steps = array_create(0)
	_steps[0] = new Step(
		start_dialogue,
		["test.yarn"],
		function()
		{
			return obj_menu_management.dialogue_exists == false;
		});
	
	var _sequence = new Sequence(_steps);
	
	obj_sequence_management.set_sequence(_sequence);
	
}