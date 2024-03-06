function load_units()
{
	var _nb_units = array_length(global.units);
	for (var _unit_id = 0; _unit_id < _nb_units; _unit_id++)
	{
		var _unit = global.units[_unit_id];
		if _unit.real_x > -1 and _unit.is_available() then unit_appear(_unit_id, _unit.real_x, _unit.real_y, _unit.rotation);
	}
}
function load_crimes()
{
	for (var _crime_id = 0; _crime_id < global.nb_crimes; _crime_id ++)
	{
		var _crime = global.crimes[_crime_id];
		if _crime.day_number <= global.day_number
		{
			crime_appear(_crime_id);
		}
	}
}


function rm_main_desk_init()
{
	add_menu(new MainDeskNeutral());
	load_units();
	load_crimes();
}