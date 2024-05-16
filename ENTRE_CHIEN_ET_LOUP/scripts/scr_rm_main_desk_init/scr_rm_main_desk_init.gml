function load_units()
{
	var _nb_units = array_length(global.units);
	for (var _unit_id = 0; _unit_id < _nb_units; _unit_id++)
	{
		var _unit = global.units[_unit_id];
		if _unit.real_x > -1 and _unit.is_available() then unit_appear(_unit_id, _unit.real_x, _unit.real_y, _unit.rotation);
	}
}
function load_crimes(_excluded_crimes_ids)
{
	for (var _crime_id = 0; _crime_id < global.nb_crimes; _crime_id ++)
	{	
		var _crime = global.crimes[_crime_id];
		if _crime.day_number <= global.day_number and !array_contains(_excluded_crimes_ids, _crime_id) and !global.cases[_crime.case_id].day_caught > -1
		{
			crime_appear(_crime_id, false, false);
		}
	}
}
function load_maluses()
{
	var _y_offset = 20;
	var _cases = global.cases;
	var _maluses = global.malus;
	var _current_cases_ids = global.current_cases_ids;
	var _nb_current_cases = array_length(_current_cases_ids);
	var _active_maluses_found = array_create(0);
	var _case_maluses, _nb_maluses, _malus;
	obj_malus_canvas.nb_cases = _nb_current_cases;
	obj_malus_canvas.added_height += 60;
	for (var _index = 0; _index < _nb_current_cases; _index ++)
	{
		_case_maluses = _cases[_current_cases_ids[_index]].maluses;
		_nb_maluses = array_length(_case_maluses);
		for ( var _case_malus_index = 0; _case_malus_index < _nb_maluses; _case_malus_index ++)
		{
			_malus = _case_maluses[_case_malus_index];
			if !array_contains(_active_maluses_found, _malus)
			{
				obj_malus_canvas.add_malus(_malus);
			}
		}
	}
	obj_malus_canvas.maluses = _active_maluses_found;

	
}


function rm_main_desk_init()
{
	add_menu(new MainDeskNeutral());
	load_units();
	var _crime_appearance_menu = obj_menu_manager.get_active_menu(CrimeAppearance);
	load_crimes(_crime_appearance_menu != -1 ? _crime_appearance_menu.sorted_crimes_ids : []);
	load_maluses();
}