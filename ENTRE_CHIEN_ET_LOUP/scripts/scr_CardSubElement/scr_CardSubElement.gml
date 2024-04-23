
enum CARD_SUB_ELEMENT_TYPES
{
	SPRITE,
	ANIMATED_SPRITE,
	SCRIBBLE_TEXT,
}

function CardSubElement(_element, _type) constructor 
{
	element = _element;
	type = _type;
	
	x_left = -1.0;
	x_left_hidden = -1.0;
	x_left_revealed = -1.0;
	y_top = -1.0;
	y_top_hidden = -1.0;
	y_top_revealed = -1.0;
	scale = 1.0;
	rotation = 0.0;
	switch(type)
	{
		case CARD_SUB_ELEMENT_TYPES.SPRITE :
		case CARD_SUB_ELEMENT_TYPES.ANIMATED_SPRITE :
		{
			width = sprite_get_width(element);
		}break;
		case CARD_SUB_ELEMENT_TYPES.SCRIBBLE_TEXT:
		{
			var _scribble = scribble(element)
			width = _scribble.get_width();
		}break;
	}
	
	sub_image = 0;
	sprite_fsp_speed = type == CARD_SUB_ELEMENT_TYPES.ANIMATED_SPRITE ? sprite_get_speed(_element) :
	0;
	
	set_width = function(_new_width)
	{
		switch(type)
		{
			case CARD_SUB_ELEMENT_TYPES.SPRITE:
			case CARD_SUB_ELEMENT_TYPES.ANIMATED_SPRITE:
			scale = _new_width/max(sprite_get_width(element), sprite_get_height(element));
			return;
			case CARD_SUB_ELEMENT_TYPES.SCRIBBLE_TEXT:
			width = _new_width;
			return;
		}
	}
	
	get_height = function()
	{
		switch (type)
		{
			case CARD_SUB_ELEMENT_TYPES.SPRITE:
			case CARD_SUB_ELEMENT_TYPES.ANIMATED_SPRITE:
			return TEXT_BUBBLE_MARGIN + sprite_get_height(element) * scale;
			
			case CARD_SUB_ELEMENT_TYPES.SCRIBBLE_TEXT:
			return TEXT_BUBBLE_MARGIN + scribble(element).wrap(width).get_height();
			

		}
	}
	get_width = function()
	{
		switch(type)
		{
			case CARD_SUB_ELEMENT_TYPES.SPRITE:
			case CARD_SUB_ELEMENT_TYPES.ANIMATED_SPRITE:
			return sprite_get_width(element) * scale;
			case CARD_SUB_ELEMENT_TYPES.SCRIBBLE_TEXT:
			return scribble(element).wrap(width).get_width();
		}
	}
	
	draw = function(_mouse_is_over = false)
	{
		switch (type)
		{
			case CARD_SUB_ELEMENT_TYPES.SPRITE:
			draw_sprite_ext(element, sub_image, x_left, y_top, scale, scale, rotation, c_white, 1);
			break;
			case CARD_SUB_ELEMENT_TYPES.ANIMATED_SPRITE:
			sub_image = sub_image + sprite_fsp_speed / game_get_speed(gamespeed_fps);
			draw_sprite_ext(element, sub_image, x_left, y_top, scale, scale, rotation, c_white, 1);
			return;
			case CARD_SUB_ELEMENT_TYPES.SCRIBBLE_TEXT:
			var _shake = _mouse_is_over ? "[shake]" : "";
			var _color = _mouse_is_over ? "[c_yellow]" : "[c_white]"
			var _width = width;
			scribble(_shake + _color + element).wrap(width).draw(x_left, _mouse_is_over ? y_top - TEXT_BUBBLE_MARGIN : y_top);
			return;
			default:
			return;
		}
	}
}