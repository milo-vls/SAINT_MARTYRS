crime = global.crimes[crime_id];
if appearing_animation == true
{
	set_camera_focus_point(x, y, true);
	appearing_animation_part_sys =  part_system_create(covered ? ps_covered_crime_appearing : ps_crime_appearing_1);
	part_system_position(appearing_animation_part_sys, x, y);
	add_sound_to_play(new Sound(snd_sf_wind_crime, x, y, 0, false));
}

