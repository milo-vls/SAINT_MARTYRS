origin_y = y;
hidden_y = GAME_HEIGHT + (GAME_HEIGHT - y - sprite_get_yoffset(sprite_index));
mouse_over = false;
y = hidden_y;
origin_depth = depth;
origin_angle = image_angle;