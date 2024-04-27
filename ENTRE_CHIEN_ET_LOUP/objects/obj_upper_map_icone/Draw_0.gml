image_blend = pressed ? c_ltgray : c_white;
image_angle = part_rotation_timer < part_rotation_frames_delay ? 6 : -5;
if part_rotation_timer == part_rotation_frames_delay * 2
{
	part_rotation_timer = 0;
}

shown = false;
pressed = false;
draw_self();