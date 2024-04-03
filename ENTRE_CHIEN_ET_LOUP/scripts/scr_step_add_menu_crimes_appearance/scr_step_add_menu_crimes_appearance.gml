function step_crimes_appearance(_crimes_ids)
{
	var _method = function(_crimes_ids)
	{
		add_menu(new CrimeAppearance(_crimes_ids))
	}
	var _is_finished = function()
	{
		return obj_menu_manager.get_active_menu(CrimeAppearance) == -1;
	}
	return new Step(_method, [_crimes_ids], _is_finished);
}