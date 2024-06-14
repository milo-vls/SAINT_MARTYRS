function crime_appear(_crime_id, _appearing_animation, _covered)
{
	var _crime = global.crimes[_crime_id];
	var _case = global.cases[_crime.case_id];
	if _case.is_free()
	{
		instance_create_depth(_crime.get_x(), _crime.get_y(), DEPTHS.CRIMES, obj_crime, {crime_id : _crime_id, appearing_animation : _appearing_animation, covered : _covered});
		global.crimes[_crime_id].appeard = true;
		global.crimes[_crime_id].discovered = true;
		update_all_crimes_string(get_crime_string_mode());
	}
}