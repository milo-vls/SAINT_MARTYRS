y = approach(y, shown ? origin_y - (mouse_over ? 50 : 0) : hidden_y - (mouse_over ? 80 : 0), SHIFTING_SPEED*2);
depth = mouse_over ? origin_depth -1 : origin_depth;
image_angle = approach(image_angle, mouse_over ? 0 : origin_angle, 8);

shown = false;