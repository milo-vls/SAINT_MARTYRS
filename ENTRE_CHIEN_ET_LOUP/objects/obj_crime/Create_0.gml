if appearing_animation == true
{
	appearing_animation_part_sys = part_system_create(ps_crime_appearing_1);
	part_system_position(appearing_animation_part_sys, x, y);
	add_sound_to_play(snd_sf_wind_crime);
}