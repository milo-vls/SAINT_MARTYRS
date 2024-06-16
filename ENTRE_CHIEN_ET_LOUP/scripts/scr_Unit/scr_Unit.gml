function Unit() constructor 
{
	real_x = -1;
	real_y =  -1;
	rotation = 0;
	
	is_available = function()
	{
		return available == "true";
	}
	get_character_id = function()
	{
		return character_id;
	}
}


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

function unit_appear(_unit_id, _real_x, _real_y, _rotation)
{
	return instance_create_layer(_real_x, _real_y, "units", obj_unit, {unit_id : _unit_id, sprite_index : asset_get_index("spr_unit_hitbox_" + string(_unit_id))}) 
}

function unit_disappear(_unit_id)
{
	var _nb_obj_units = instance_number(obj_unit);
	for (var _obj_unit_index = 0; _obj_unit_index < _nb_obj_units; _obj_unit_index ++)
	{
		var _obj_unit = instance_find(obj_unit, _obj_unit_index);
		if _obj_unit_index == _unit_id
		{
			instance_destroy(_obj_unit);
			global.units[_unit_id].real_x = -1;
			global.units[_unit_id].real_y = -1;
		}
	}
}