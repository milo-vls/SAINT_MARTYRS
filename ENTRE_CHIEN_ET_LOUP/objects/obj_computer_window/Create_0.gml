unchanged_sprite_width = sprite_get_width(sprite_index);
unchanged_sprite_height = sprite_get_height(sprite_index);
border_width = 20;
border_height_top = 49;
border_height_bottom = 20;
surface_width = sprite_width - border_width * 2;
surface_height = sprite_height - (border_height_top + border_height_bottom);
surface = surface_create(surface_width, surface_height);
minimum_width = sprite_get_width(sprite_index);
minimum_height = sprite_get_height(sprite_index);
origin_depth = depth;
resize = function(_new_width, _new_height)
{
	image_xscale = _new_width/sprite_get_width(sprite_index);
	image_yscale = _new_height/sprite_get_height(sprite_index);
	
	image_xscale = clamp(image_xscale, minimum_width/sprite_get_width(sprite_index), room_width);
	image_yscale = clamp(image_yscale, minimum_height/sprite_get_height(sprite_index), room_height);
	
	surface_width = sprite_width - border_width * 2;
	surface_height = sprite_height - (border_height_top + border_height_bottom);
	surface_resize(surface, surface_width , surface_height);
}


given_cursor = COMPUTER_CURSOR_STATES.DEFAULT;
give_cursor = false;
//move & resize infos

move_x_offset = -1;
move_y_offset = -1;

resize_x_offset = -1;
resize_y_offset = -1;



origin_top_left_x = -1;
origin_top_left_y = -1;
origin_bottom_right_x = -1;
origin_bottom_right_y = -1;
origin_height = -1;
origin_width = -1;