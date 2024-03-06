function crime_is_from_cases(_crime_id, _case_ids)
{
	var _nb_case_ids = array_length(_case_ids)
	for (var _case_id = 0; _case_id < _nb_case_ids; _case_id ++)
	{
		var _crime_case_id = global.crimes[_crime_id].get_case_id()
		if   _crime_case_id == _case_id
		{
			return true;
		}
	}
	return false;
}