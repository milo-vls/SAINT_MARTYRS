function next_crime_instance_of_same_color(_crime_instance_seeking_next, _crime_instances_number)
{
	static _crimes = global.crimes;
	var _crime_seeking_next_id = _crime_instance_seeking_next.crime_id;
	var _crime_seeking_next = _crimes[_crime_seeking_next_id];
	var _crime_seeking_next_color_id = _crime_seeking_next.get_color_id();
	
	
	var _min_next_crime_instance_of_same_color = noone;
	var _min_next_crime_of_same_color = noone;
	for (var _crime_instance_index = 0; _crime_instance_index < _crime_instances_number; _crime_instance_index ++)
	{
		var _crime_instance = instance_find(obj_crime, _crime_instance_index);
		var _crime = _crimes[_crime_instance.crime_id];
		var _crime_color_id = _crime.get_color_id();
		
		if _crime_color_id != _crime_seeking_next_color_id
			continue;
		if  _crime.is_more_recent_than(_crime_seeking_next) != 1
			continue;
		
		
		if _min_next_crime_instance_of_same_color == noone
		{
			_min_next_crime_instance_of_same_color = _crime_instance;
			_min_next_crime_of_same_color = _crime;
			continue;
		}
		if _crime.is_more_recent_than(_min_next_crime_of_same_color) != 1
		{
			_min_next_crime_of_same_color = _crime;
			_min_next_crime_instance_of_same_color = _crime_instance;
		}
	}
	return _min_next_crime_instance_of_same_color;
}