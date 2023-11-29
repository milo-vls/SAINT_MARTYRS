
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
	
	set_width = function(_new_width)
	{
		switch(type)
		{
			case CARD_SUB_ELEMENT_TYPES.SPRITE:
			case CARD_SUB_ELEMENT_TYPES.ANIMATED_SPRITE:
			scale = _new_width/max(sprite_get_width(element), sprite_get_height(element));
			return;
			case CARD_SUB_ELEMENT_TYPES.SCRIBBLE_TEXT:
			element = element.align(fa_left, fa_top).wrap(_new_width);
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
			return TEXT_BUBBLE_MARGIN + element.get_height();
			
			default:
			return 0;
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
			return element.get_width();
			
			default :
			return 0;
		}
	}
	
	draw = function(_color = DIALOGUES_BASE_FONT_COLOR)
	{
		switch (type)
		{
			case CARD_SUB_ELEMENT_TYPES.SPRITE:
			case CARD_SUB_ELEMENT_TYPES.ANIMATED_SPRITE:
			draw_sprite_ext(element, 0, x_left, y_top, scale, scale, rotation, c_white, 1);
			return;
			case CARD_SUB_ELEMENT_TYPES.SCRIBBLE_TEXT:
			element.blend(_color).draw(x_left, y_top)
			return;
			default:
			return;
		}
	}
}