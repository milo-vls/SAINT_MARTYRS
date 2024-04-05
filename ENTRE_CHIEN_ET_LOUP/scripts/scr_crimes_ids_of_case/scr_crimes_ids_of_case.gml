function crimes_ids_of_case(_case_id)
{
	var _to_return = array_create(0);
	for (var _crime_id = 0; _crime_id < global.nb_crimes; _crime_id ++)
	{
		if global.crimes[_crime_id].get_case_id() == _case_id
		{
			array_push(_to_return, _crime_id);
		}
	}
	
	return _to_return;
}