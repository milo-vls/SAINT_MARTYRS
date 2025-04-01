if disappearing
{
	if instance_giving_string_id == -4 
	{
		crime_disappear(crime_id);
		if false == in_sequence
		{
			if layer_exists(disappearing_sequence_layer_name)
				layer_destroy(disappearing_sequence_layer_name);
		
			disappearing_sequence_layer = layer_create(depth, disappearing_sequence_layer_name);
			disappearing_sequence = layer_sequence_create(disappearing_sequence_layer, x, y, sqc_crime_disappearance);
			var _sequence_instance = layer_sequence_get_instance(disappearing_sequence);
			sequence_instance_override_object(_sequence_instance, obj_crime, self);
		}
	}
}


if false == in_sequence
{
	image_xscale = approach(image_xscale, target_scale, 0.06);
	image_yscale = image_xscale;
}


image_blend = global.crimes[crime_id].get_color();
draw_self();

