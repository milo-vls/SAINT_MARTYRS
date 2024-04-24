function crime_disappear(_crime_id)
{
	var _nb_obj_crimes = instance_number(obj_crime);
	for (var _obj_crime_index = 0; _obj_crime_index < _nb_obj_crimes; _obj_crime_index ++)
	{
		var _obj_crime = instance_find(obj_crime, _obj_crime_index);
		if _obj_crime != -4
		{
			var _obj_crime_crime_id = _obj_crime.crime_id;
			if _obj_crime_crime_id == _crime_id
			{
				instance_destroy(_obj_crime);
				global.crimes[_crime_id].appeard = false;
			}
		}
	}
}
function crime_appear(_crime_id, _appearing_animation, _covered)
{
	var _crime = global.crimes[_crime_id];
	var _case = global.cases[_crime.case_id];
	if _case.is_free()
	{
		instance_create_depth(_crime.get_x(), _crime.get_y(), DEPTHS.CRIMES, obj_crime, {crime_id : _crime_id, appearing_animation : _appearing_animation, covered : _covered});
		global.crimes[_crime_id].appeard = true;
		global.crimes[_crime_id].discovered = true;
	}
}
function crime_appeard(_crime_id)
{
	return global.crimes[_crime_id].appeard;
}