function crimes_ids_of_cases(_cases_ids)
{
	var _crimes_ids_to_return = array_create(0);
	var _nb_cases = array_length(_cases_ids);
	for (var _index = 0; _index < _nb_cases; _index ++)
	{
		_crimes_ids_to_return = array_concat(_crimes_ids_to_return, crimes_ids_of_case(_cases_ids[_index]))
	}
	return _crimes_ids_to_return;
}