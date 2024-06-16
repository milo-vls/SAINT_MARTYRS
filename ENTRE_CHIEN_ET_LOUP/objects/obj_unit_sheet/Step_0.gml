if !available
{
	shown = false;
}

image_xscale = approach(image_xscale, mouse_over ? selected_scale : origin_scale, SHIFTING_SPEED*0.005);
image_yscale = image_xscale;
y = approach(y, shown ? origin_y - (mouse_over ? 50 : 0) : hidden_y - (mouse_over ? 80 : 0), SHIFTING_SPEED*2.75);

depth = mouse_over ? origin_depth -1 : origin_depth;
image_angle = approach(image_angle, mouse_over ? 0 : origin_angle, 8);

shown = false;



