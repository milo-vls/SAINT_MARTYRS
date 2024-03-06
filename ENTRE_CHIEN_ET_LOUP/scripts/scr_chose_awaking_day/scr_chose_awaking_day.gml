function chose_awaking_day(_first_crime_day)
{

	var _day_to_check = global.day_number;
	while _day_to_check < _first_crime_day
	{
		_day_to_check ++;
		if ds_map_exists(global.day_events, _day_to_check) return _day_to_check;
	}
	return _first_crime_day;

}