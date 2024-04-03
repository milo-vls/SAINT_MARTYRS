function crimes_ids_from_day_number(_day_number)
{
	var _crimes_ids_from_day_number = array_create(0);
	for (var _i = 0; _i < global.nb_crimes; _i ++) 
	{
		if global.crimes[_i].day_number == _day_number
		{
			array_push(_crimes_ids_from_day_number, _i);
		}
	}
	return _crimes_ids_from_day_number;
}