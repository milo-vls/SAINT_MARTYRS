function crimes_are_covered_until(_cases_ids = global.current_cases_ids)
{
	var _maximum_day_possible = get_cases_last_crime_day(_cases_ids);
	var _last_day_covered = global.day_number
	for (var _day_number = global.day_number; _day_number <= _maximum_day_possible; _day_number ++)
	{
		var _crimes_ids_of_day = crimes_ids_from_day_number(_day_number);
		var _nb_crimes_ids_of_day = array_length(_crimes_ids_of_day);
		for (var _index = 0; _index < _nb_crimes_ids_of_day; _index ++)
		{
			if crime_is_from_cases(_crimes_ids_of_day[_index], _cases_ids) and false ==crime_is_covered(_crimes_ids_of_day[_index])
			{
				return _last_day_covered;
			}
		}
		_last_day_covered = _day_number;
	}
	//tous les crimes de tous les cas sont couverts
	return _maximum_day_possible;
}