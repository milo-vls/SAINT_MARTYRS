function crimes_are_covered()
{
	for (var _crime_id = 0; _crime_id < global.nb_crimes; _crime_id ++)
	{
		var _crime = global.crimes[_crime_id];
		if crime_is_from_cases(_crime_id, global.current_cases_ids) and _crime.get_first_of_case() == false
		{
			var _is_covered = crime_is_covered(_crime_id);
			if !_is_covered
			{
				return false;
			}
		}
	}
	
	return true;
}