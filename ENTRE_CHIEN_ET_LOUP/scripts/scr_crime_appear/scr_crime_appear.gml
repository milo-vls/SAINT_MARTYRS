function crime_appear(_crime_id, _appearing_animation, _covered)
{
	var _crime = global.crimes[_crime_id];
	var _case = global.cases[_crime.case_id];
	if _case.is_free()
	{
		var _crime_instance = instance_create_depth(_crime.get_x(), _crime.get_y(), DEPTHS.CRIMES, obj_crime, {crime_id : _crime_id, appearing_animation : _appearing_animation, covered : _covered});
		with _crime_instance
		{
			crime = global.crimes[_crime_id];
			if _appearing_animation
			{
				var  _appearing_animation_part_sys =  part_system_create(covered ? ps_covered_crime_appearing : ps_crime_appearing_1);
				part_system_position(_appearing_animation_part_sys, x, y);
				add_sound_to_play(new Sound(snd_sf_wind_crime, x, y, 0, false));
			}
		}
		
		global.crimes[_crime_id].appeard = true;
		global.crimes[_crime_id].discovered = true;
		update_all_crimes_string(get_crime_string_mode());
	}
}