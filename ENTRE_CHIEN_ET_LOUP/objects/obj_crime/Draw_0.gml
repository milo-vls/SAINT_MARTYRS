if disappearing
{
	if instance_giving_string_id == -4
	{
		var _disappearing_animation_part_sys =  part_system_create(ps_covered_crime_appearing);
		part_system_position(_disappearing_animation_part_sys, x, y);
		crime_disappear(crime_id);
	}

}

image_blend = global.crimes[crime_id].get_color();
image_xscale = 0.75;
image_yscale = image_xscale;
draw_self();


