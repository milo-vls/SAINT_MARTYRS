if instance_coming_string_id != noone
{
	instance_coming_string_id.deployment_state = CASE_STRING_DEPLOYMENT_STATE.DESTROYING;
	instance_coming_string_id.crime_instance_id_dst = noone;
}
if instance_giving_string_id != noone
	delete_string(instance_giving_string_id);
else
	screen_shake(40, 0);
	
add_sound_to_play(new Sound(snd_sf_wind_crime, x, y, 0, true, 1, true) );