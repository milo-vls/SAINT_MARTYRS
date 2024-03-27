function get_highest_minimum_days_prediction_of_cases(_case_ids)
{
	var _highest_found = 1;
	var _nb_of_cases = array_length(_case_ids);
	for (var _i = 0; _i < _nb_of_cases; _i ++)
	{
		var _minimum_days_prediction = global.cases[_case_ids[_i]].minimum_days_prediction;
		if _minimum_days_prediction > _highest_found
		{
			_highest_found = _minimum_days_prediction;
		}
	}
	return _highest_found;
}