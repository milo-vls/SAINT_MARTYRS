function delete_string(_string_instance)
{
	if !instance_exists(_string_instance)
	{
		return false;
	}
	
	if _string_instance.crime_instance_id_dst.instance_coming_string_id == _string_instance
		_string_instance.crime_instance_id_dst.instance_coming_string_id = noone;
	if _string_instance.crime_instance_id_dst.instance_giving_string_id == _string_instance
		_string_instance.crime_instance_id_dst.instance_giving_string_id = noone;
	if _string_instance.crime_instance_id_src.instance_coming_string_id == _string_instance
		_string_instance.crime_instance_id_src.instance_coming_string_id = noone;
	if _string_instance.crime_instance_id_src.instance_giving_string_id == _string_instance
		_string_instance.crime_instance_id_src.instance_giving_string_id = noone;
	
	instance_destroy(_string_instance);
	return true;
}













