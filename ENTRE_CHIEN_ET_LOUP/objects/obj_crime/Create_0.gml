if appearing_animation == true
{
	appearing_animation_part_sys =  part_system_create(covered ? ps_covered_crime_appearing : ps_crime_appearing_1);
	part_system_position(appearing_animation_part_sys, x, y);
	add_sound_to_play(new Sound(snd_sf_wind_crime, x, y, 0, false));
}
