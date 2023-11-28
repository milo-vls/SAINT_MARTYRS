

function Card(_scribble_title, _function = function(){}, _hidden_text = "", _hidden_sprite = noone, _typist = undefined) constructor 
{
	scribble_title = _scribble_title.align(fa_left, fa_middle);
	hidden_text = _hidden_text;
	hidden_sprite = _hidden_sprite;
	function_when_clicked = _function;
	typist = _typist;
	
	color = DIALOGUES_BASE_FONT_COLOR;
	x_left = -1.0;
	x_right = -1.0;
	y_top = -1.0;
	y_bot = -1.0;
	x_left_title = -1.0;
	y_middle_title = -1.0;
	mouse_is_over = function()
	{
		return point_in_rectangle(mouse_x, mouse_y, self.x_left, self.y_top, self.x_right, self.y_bot);
	}
	
	draw = function()
	{
		draw_set_color(CARDS_COLOR); draw_set_alpha(1);
		draw_rectangle(x_left, y_top, x_right, y_bot, false);
		var _color = point_in_rectangle(mouse_x, mouse_y, self.x_left, self.y_top, self.x_right, self.y_bot) ? 
		MOUSE_OVER_TEXT_FONT_COLOR : 
		DIALOGUES_BASE_FONT_COLOR;
		scribble_title
		.blend(_color)
		.draw(x_left_title, y_middle_title, typist);
	}
}














