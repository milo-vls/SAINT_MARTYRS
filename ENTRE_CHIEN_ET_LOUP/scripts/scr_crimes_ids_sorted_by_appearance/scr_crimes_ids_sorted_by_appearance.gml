function sorted_crimes_ids_by_appearance(_crimes_ids)
{
	var _to_return = _crimes_ids;
	array_sort(_to_return, function(_crime_id_1, _crime_id_2)
	{
		static _crimes = global.crimes;
		var _crime_1 = _crimes[_crime_id_1];
		var _crime_2 = _crimes[_crime_id_2];
		var _to_return = _crime_1.is_more_recent_than(_crime_2);
		return _to_return;
	})
	
	return _to_return;
}