

function Card(_scribble_title, _function = function(){}, _hidden_scribble = noone, _hidden_sprite = noone, _typist = undefined) constructor 
{
	hidden_sprite = _hidden_sprite;
	function_when_clicked = _function;
	typist = _typist;
	
	
	width = min(_scribble_title.get_width() + TEXT_BUBBLE_MARGIN*2, TEXT_BUBBLE_WIDTH);
	scribble_title = _scribble_title.align(fa_left, fa_top).wrap(width - TEXT_BUBBLE_MARGIN*2);
	hidden_scribble = _hidden_scribble == noone ? noone : _hidden_scribble.align(fa_left, fa_top).wrap(width - TEXT_BUBBLE_MARGIN*2);
	height = scribble_title.get_height() + TEXT_BUBBLE_MARGIN*2;
	
	x_left = -1.0;
	x_left_hidden = -1.0;
	x_left_revealed = -1.0;
	
	x_right = -1.0;
	x_right_hidden = -1.0;
	x_right_revealed = -1.0;
	
	y_top = -1.0;
	y_top_hidden = -1.0;
	y_top_revealed = -1.0;
	
	y_bot = -1.0;
	y_bot_hidden = -1.0;
	y_bot_revealed = -1.0;
	
	x_left_title = -1.0;
	x_left_title_hidden = -1.0;
	x_left_title_revealed = -1.0;
	
	y_top_title = -1.0;
	y_top_title_hidden = -1.0;
	y_top_title_revealed = -1.0;
	
	x_left_hidden_scribble = -1.0;
	x_left_hidden_scribble_hidden = -1.0;
	x_left_hidden_scribble_revealed = -1.0;
	
	y_top_hidden_scribble = -1.0;
	y_top_hidden_scribble_hidden = -1.0;
	y_top_hidden_scribble_revealed = -1.0;
	
	hidden_sprite_scale = 0;
	
	x_left_hidden_sprite = -1.0;
	x_left_hidden_sprite_hidden = -1.0;
	x_left_hidden_sprite_revealed = -1.0;
	
	y_top_hidden_sprite = -1.0;
	y_top_hidden_sprite_hidden = -1.0;
	y_top_hidden_sprite_revealed = -1.0;
	
	color = DIALOGUES_BASE_FONT_COLOR;
	static mouse_is_over = function()
	{
		return point_in_rectangle(mouse_x, mouse_y, self.x_left_hidden, self.y_top_hidden, self.x_right_hidden, self.y_bot_hidden);
	}
	static get_hidden_scribble_height = function()
	{
		return (hidden_scribble == noone ? 0 : hidden_scribble.get_height() + TEXT_BUBBLE_MARGIN)
	}
	static get_hidden_sprite_height = function()
	{
		return (hidden_sprite == noone ? 0 : sprite_get_height(hidden_sprite) * hidden_sprite_scale + TEXT_BUBBLE_MARGIN);
	}
	static get_hidden_part_height = function()
	{
		return get_hidden_sprite_height() + get_hidden_scribble_height();
	}
	static update_points_of_draw = function(_is_hidden)
	{
		x_left = !_is_hidden ? x_left_hidden : x_left_revealed;
		y_top = !_is_hidden ? y_top_hidden : y_top_revealed;
		x_left_title = !_is_hidden ? x_left_title_hidden : x_left_title_revealed;
		y_top_title = !_is_hidden ? y_top_title_hidden : y_top_title_revealed;
		y_top_hidden_scribble = !_is_hidden ? y_top_hidden_scribble_hidden : y_top_hidden_scribble_revealed;
		y_top_hidden_sprite = !_is_hidden ? y_top_hidden_sprite_hidden : y_top_hidden_sprite_revealed;
	}
	
	static draw = function()
	{
		draw_set_color(CARDS_COLOR); draw_set_alpha(1);
		draw_rectangle(x_left, y_top, x_right, y_bot, false);
		var _color = point_in_rectangle(mouse_x, mouse_y, self.x_left, self.y_top, self.x_right, self.y_bot) ? 
		MOUSE_OVER_TEXT_FONT_COLOR : 
		DIALOGUES_BASE_FONT_COLOR;
		scribble_title
		.blend(_color)
		.draw(x_left_title, y_top_title, typist);
		
		if hidden_scribble != noone
		{
			hidden_scribble.draw(x_left_hidden_scribble, y_top_hidden_scribble);
		}
		if hidden_sprite != noone
		{
			draw_sprite_ext(hidden_sprite, 0, x_left_hidden_sprite, y_top_hidden_sprite, hidden_sprite_scale, hidden_sprite_scale, 0, c_white, 1);
		}
	}
}














