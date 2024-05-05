border_width = sprite_get_xoffset(sprite_index);
border_height = sprite_get_yoffset(sprite_index);
surface_width = sprite_width - border_width * 2;
surface_height = sprite_height - border_height * 2;
surface = surface_create(surface_width, surface_height);

minimum_width = sprite_get_width(sprite_index);
minimum_height = sprite_get_height(sprite_index);

resize = function(_new_sprite_width, _new_sprite_hight)
{
	image_xscale = _new_sprite_width/sprite_get_width(sprite_index);
	image_yscale = _new_sprite_hight/sprite_get_height(sprite_index);
	
	image_xscale = clamp(image_xscale, minimum_width/sprite_get_width(sprite_index), room_width);
	image_yscale = clamp(image_yscale, minimum_height/sprite_get_height(sprite_index), room_height);
	
	surface_width = sprite_width - border_width * 2;
	surface_height = sprite_height - border_height * 2;
	surface_resize(surface, surface_width , surface_heigh);
}