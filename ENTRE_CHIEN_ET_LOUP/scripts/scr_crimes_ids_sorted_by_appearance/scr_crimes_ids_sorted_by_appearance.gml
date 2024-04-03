function sorted_crimes_ids_by_appearance(_crimes_ids)
{
	var _to_return = _crimes_ids;
	array_sort(_to_return, function(_crime_id_1, _crime_id_2)
	{
		return global.crimes[_crime_id_1].day_number - global.crimes[_crime_id_2].day_number;
	})
	
	return _to_return;
}