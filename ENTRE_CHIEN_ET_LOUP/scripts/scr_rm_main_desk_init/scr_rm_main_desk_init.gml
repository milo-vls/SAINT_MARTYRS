function spawn_yerstedays_crimes()
{
	for (var _crime_id = 0; _crime_id < global.nb_crimes; _crime_id ++)
	{
		if older_than_yersteday(global.crimes[_crime_id].day_number) then crime_appear(_crime_id);
	}	
}
function spawn_todays_crimes()
{
	for (var _crime_id = 0; _crime_id < global.nb_crimes; _crime_id ++)
	{
		var _crime = global.crimes[_crime_id];
		if older_than_now(_crime.day_number, _crime.hour, _crime.minute) and !older_than_yersteday(_crime.day_number)
		then crime_appear(_crime_id);
	}
}
function start_crime_update()
{
	//TO DO - ANIMATION
	global.switches[SWITCHES.CRIMES_UP_TO_DATE] = true;
	spawn_todays_crimes();
}
function load_units()
{
	var _nb_units = array_length(global.units);
	for (var _unit_id = 0; _unit_id < _nb_units; _unit_id++)
	{
		var _unit = global.units[_unit_id];
		if _unit.real_x > -1 and _unit.is_available() then unit_appear(_unit_id, _unit.real_x, _unit.real_y, _unit.rotation);
	}
}


function rm_main_desk_init()
{
	add_menu(new MainDeskNeutral());
	load_units();
	spawn_yerstedays_crimes();
	if global.switches[SWITCHES.CRIMES_UP_TO_DATE] == false
	then start_crime_update();
	else spawn_todays_crimes();
	
}