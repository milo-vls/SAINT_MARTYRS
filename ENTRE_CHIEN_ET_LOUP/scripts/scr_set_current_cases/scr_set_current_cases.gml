function set_current_cases(_day_number = global.day_number)
{
	
	
	global.current_cases = [];
	
	
	var _minimal_crime_id = -1;
	for (var _crime_id = 0; _crime_id < global.nb_crimes; _crime_id ++)
	{
		var _crime = global.crimes[_crime_id];
		if _crime.day_number > _day_number and _crime.first_of_case == true
		{
			if _minimal_crime_id == -1 
			{
				_minimal_crime_id = _crime_id;
			}
			else
			{
				if global.crimes[_minimal_crime_id].day_number > _crime.day_number then _minimal_crime_id = _crime_id;
			}
		}
	}
	
	
	var _minimal_day = global.crimes[_minimal_crime_id].day_number;
	
	
	for (var _crime_id = 0; _crime_id < global.nb_crimes; _crime_id ++)
	{
		var _crime = global.crimes[_crime_id];
		if _minimal_day == _crime.day_number and _crime.first_of_case == true
		{
			if array_contains(global.current_cases, _crime.case_id) == false
			{
				array_push(global.current_cases, _crime.case_id);
			}
		}
	}
}