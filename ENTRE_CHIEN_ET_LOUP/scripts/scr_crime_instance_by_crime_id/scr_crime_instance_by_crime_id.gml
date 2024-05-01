function crime_instance_by_crime_id(_crime_id)
{
	var _nb_instances = instance_number(obj_crime);
	for (var _instance_index = 0; _instance_index < _nb_instances; _instance_index ++)
	{
		var _instance = instance_find(obj_crime, _instance_index)
		if _instance.crime_id == _crime_id
		{
			return _instance;
		}
	}
	return noone;
}