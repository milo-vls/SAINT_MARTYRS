function spawn_crimes()
{
	for (var _crime_id = 0; _crime_id < global.nb_crimes; _crime_id ++)
	{
		var _crime = global.crimes[_crime_id];
		if global.switches[SWITCHES.CRIMES_UP_TO_DATE] == false
		{
			if older_than_yersteday(_crime.day_number) then _crime.create(_crime_id);
		}
		else
		{
			if older_than_now(_crime.day_number, _crime.hour, _crime.minute) then _crime.create(_crime_id);
		}
	}	
}


function rm_main_desk_init()
{
	obj_menu_management.add_menu(new MainDeskNeutral());
	spawn_crimes();
	

}