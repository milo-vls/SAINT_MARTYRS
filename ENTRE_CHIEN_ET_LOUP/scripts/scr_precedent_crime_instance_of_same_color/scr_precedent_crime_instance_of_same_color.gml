function precedent_crime_instance_of_same_color(_crime_instance_seeking_precedent, _crime_instances_number)
{
	static _crimes = global.crimes;
	var _crime_seeking_precedent_id = _crime_instance_seeking_precedent.crime_id;
	var _crime_seeking_precedent = _crimes[_crime_seeking_precedent_id];
	var _crime_seeking_precedent_color_id = _crime_seeking_precedent.get_color_id();
	
	var _max_precedent_crime_instance_of_same_color = noone;
	var _max_precedent_crime_of_same_color = noone;
	for (var _crime_instance_index = 0; _crime_instance_index < _crime_instances_number; _crime_instance_index ++)
	{
		var _crime_instance = instance_find(obj_crime, _crime_instance_index);	
		var _crime = _crimes[_crime_instance.crime_id];
		var _crime_color_id = _crime.get_color_id();
		if _crime_color_id != _crime_seeking_precedent_color_id 
			continue;
		if _crime.is_older_than(_crime_seeking_precedent) != 1
			continue
		
		
		if _max_precedent_crime_instance_of_same_color == noone
		{
			_max_precedent_crime_instance_of_same_color = _crime_instance;
			_max_precedent_crime_of_same_color = _crime;
			continue;
		}
		if _crime.is_older_than(_max_precedent_crime_of_same_color) != 1
		{
			_max_precedent_crime_instance_of_same_color = _crime_instance;
			_max_precedent_crime_of_same_color = _crime;
		}
			
	}
	return _max_precedent_crime_instance_of_same_color;
}