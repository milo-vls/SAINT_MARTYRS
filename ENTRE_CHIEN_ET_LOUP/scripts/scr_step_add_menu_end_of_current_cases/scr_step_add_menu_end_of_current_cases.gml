function step_menu_end_of_current_cases(_cases_ids)
{
	var _method = function(_cases_ids)
	{
		add_menu(new EndOfCases(_cases_ids));
	}
	var _is_finished = function()
	{
		return obj_menu_manager.get_active_menu(EndOfCases) == -1;
	}
	return new Step(_method, [_cases_ids], _is_finished);
}