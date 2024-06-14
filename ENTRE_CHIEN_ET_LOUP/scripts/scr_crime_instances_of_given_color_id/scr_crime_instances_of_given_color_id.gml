function crime_ids_from_instances_of_given_color_id(_crime_instances_number, _color_id, _crime_instance_to_ignore)
{
	var _crime_ids_to_return = array_create(0);
	var _crimes = global.crimes;
	var _crime;
	for (var _crime_instance_index = 0; _crime_instance_index < _crime_instances_number; _crime_instance_index ++)
	{
		var _crime_instance = instance_find(obj_crime, _crime_instance_index);
		if _crime_instance == _crime_instance_to_ignore
			continue;
		_crime = _crimes[_crime_instance.crime_id];
		if _crime.get_color_id() == _color_id
			array_push(_crime_ids_to_return, _crime_instance.crime_id);		
	}
	return _crime_ids_to_return;	
}