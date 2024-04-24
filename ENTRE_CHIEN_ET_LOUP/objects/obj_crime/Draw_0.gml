image_blend = global.crimes[crime_id].get_color();
if disappearing
{
	y += y_speed;
	y_speed = approach(y_speed, 25, 1.5);
	
	if y > GAME_HEIGHT * 1.2
	{
		var _disappearing_animation_part_sys =  part_system_create(ps_explosion);
		part_system_position(_disappearing_animation_part_sys, x, GAME_HEIGHT);
		return crime_disappear(crime_id);
	}
}

draw_self();