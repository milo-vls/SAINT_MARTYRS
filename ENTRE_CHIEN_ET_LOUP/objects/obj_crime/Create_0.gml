max_image_scale = 1.1;
base_image_scale = .75;
target_scale = .75;
image_xscale = .75;
image_yscale = .75;

disappearing_sequence = noone;
disappearing_sequence_layer = noone;
disappearing_sequence_layer_name = "crime_disappearing_sequence_" + string(crime_id);


if instance_coming_string_id != -4 and appearing_animation
	screen_shake(40, 0);