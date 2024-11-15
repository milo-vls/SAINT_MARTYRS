function Street() constructor{}



function get_street_full_name(_street_id)
{
	//	
}



///@param {String} _street_name_text_id
function get_street_id_by_name(_street_name_text_id)
{
	var _streets = global.streets;
	var _nb_streets = array_length(_streets);
	
	for (var _street_id = 0; _street_id < _nb_streets; _street_id ++)
		if _streets[_street_id].name_text_id == _street_name_text_id
			return _street_id;
	
	return -1;
}

