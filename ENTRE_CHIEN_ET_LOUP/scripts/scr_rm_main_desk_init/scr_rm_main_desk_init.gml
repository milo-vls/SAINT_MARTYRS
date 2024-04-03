function load_units()
{
	var _nb_units = array_length(global.units);
	for (var _unit_id = 0; _unit_id < _nb_units; _unit_id++)
	{
		var _unit = global.units[_unit_id];
		if _unit.real_x > -1 and _unit.is_available() then unit_appear(_unit_id, _unit.real_x, _unit.real_y, _unit.rotation);
	}
}
function load_crimes(_excludes_todays_crimes)
{
	var _day_until_crimes_must_appear = _excludes_todays_crimes ? global.day_number - 1 : global.day_number;
	for (var _crime_id = 0; _crime_id < global.nb_crimes; _crime_id ++)
	{	
		if global.crimes[_crime_id].day_number <= _day_until_crimes_must_appear
		{
			crime_appear(_crime_id, false);
		}
	}
}


function rm_main_desk_init()
{
	add_menu(new MainDeskNeutral());
	load_units();
	load_crimes(obj_menu_manager.get_active_menu(CrimeAppearance) != -1);
}