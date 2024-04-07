function get_cases_last_crime_day(_cases_ids = global.current_cases_ids)
{
	var _max_day_found = -1;
	for (var _crime_id = 0; _crime_id < global.nb_crimes; _crime_id ++)
	{
		var _crime = global.crimes[_crime_id];
		if _crime.day_number > _max_day_found and crime_is_from_cases(_crime_id, _cases_ids)
		{
			_max_day_found = _crime.day_number;
		}
	}
	var _int = int64(_max_day_found);
	return _int;
}