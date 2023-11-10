
enum SIDES
{
	LEFT,
	RIGHT
}

function TextBubble(_text, _speaking_character, _side) constructor
{
	speaking_character = _speaking_character
	scribble_text = scribble("[fnt_pally][c_black]" + _text).wrap(TEXT_BUBBLE_WIDTH - TEXT_BUBBLE_MARGIN*2).align(fa_left, fa_middle);
	side = _side;

	typist = scribble_typist().in(1.3, 4);
	y_top = GAME_HEIGHT - 10;
	get_height = function()
	{
		return scribble_text.get_height() + TEXT_BUBBLE_MARGIN;
	}
	
	draw = function()
	{
		draw_set_alpha(1); draw_set_color(c_white); draw_set_circle_precision(64);
		var _x_rec_left = (GAME_WIDTH/2) - TEXT_BUBBLE_WIDTH/2 - TEXT_BUBBLE_MARGIN - TEXT_BUBBLE_X_OFFSET;
		var _x_rec_right = _x_rec_left + TEXT_BUBBLE_WIDTH;
		var _y_rec_top = self.y_top;
		var _y_rec_bottom = _y_rec_top + self.get_height();
		draw_rectangle(_x_rec_left, _y_rec_top, _x_rec_right, _y_rec_bottom, false);
		
		var _x_text_left = _x_rec_left + TEXT_BUBBLE_MARGIN;
		var _y_text_middle = _y_rec_top + self.get_height()/2;
		scribble_text.draw(_x_text_left, _y_text_middle, typist);
	}
}