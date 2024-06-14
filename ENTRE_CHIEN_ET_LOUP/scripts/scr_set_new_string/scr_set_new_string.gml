


function set_new_string(_crime_instance_id_src, _crime_instance_id_dst, _crime_color_id)
{	
	var _new_string_data = {
		crime_instance_id_src : _crime_instance_id_src,
		crime_instance_id_dst : _crime_instance_id_dst,
		color : global.crime_colors[_crime_color_id],
	}
	
	//IS CREATING A NEW STRING NEEDED ? => check if a string exists and if it points to the correct crime instance
	var _crime_source_string = _crime_instance_id_src.instance_giving_string_id;
	if _crime_source_string != -4
	{
		
		if _crime_source_string.crime_instance_id_dst == _crime_instance_id_dst and _crime_source_string.color == _new_string_data.color
			return;
	}
	
	
	
	
	var _new_string = instance_create_depth(_crime_instance_id_src.x, _crime_instance_id_src.y, DEPTHS.STRINGS, obj_case_string, _new_string_data);
	
	//destroy past strings
	if _crime_instance_id_src.instance_giving_string_id != -4
	{
		instance_destroy(_crime_instance_id_src.instance_giving_string_id);
	}
	if _crime_instance_id_dst.instance_coming_string_id != -4
	{
		instance_destroy(_crime_instance_id_dst.instance_coming_string_id);
	}
	
	//give linked crimes the id of the new string
	_crime_instance_id_src.instance_giving_string_id = _new_string;
	_crime_instance_id_dst.instance_coming_string_id = _new_string;
}