function Unit() constructor 
{}

function get_unit_id_by_nickname(_nickname)
{
	var _unit_id = -1;
	var _nb_units = array_length(global.units);
	for (var _i = 0; _i < _nb_units; _i ++)
	{
		if global.units[_i].nickname == _nickname then return _i;
	}
	
	show_error("The nickname \"" + _nickname + "\" doesn't exist for any unit.", true);
}

function first_available_units()
{
	var _first_units = array_create(0);
	array_push(_first_units, 
	global.units[get_unit_id_by_nickname("Didier")]
	);
	return _first_units;
}