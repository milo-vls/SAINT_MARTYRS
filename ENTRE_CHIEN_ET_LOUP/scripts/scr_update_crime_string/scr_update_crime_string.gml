function update_crime_string(_crime_instance, _mode, _number_of_crime_instances, _no_animation)
{
	static _crimes = global.crimes;
	var _instance_to_get_linked_to = _mode == CRIME_STRING_MODE.BY_CASE ? 
		precedent_crime_instance_of_same_case(_crime_instance, _number_of_crime_instances) :
		precedent_crime_instance_of_same_color(_crime_instance, _number_of_crime_instances);
		
	if _instance_to_get_linked_to != noone
	{
		var _string_color = _mode == CRIME_STRING_MODE.BY_CASE ? CRIME_COLORS.RED : _crimes[_crime_instance.crime_id].get_color_id();
		set_new_string(_instance_to_get_linked_to, _crime_instance, _string_color, _no_animation);
		return;
	}
	
	if _crime_instance.instance_coming_string_id != noone
		instance_destroy(_crime_instance.instance_giving_string_id);
}