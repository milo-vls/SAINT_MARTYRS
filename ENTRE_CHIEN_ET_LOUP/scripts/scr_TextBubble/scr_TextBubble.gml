#macro DIALOGUES_FORMATING_TEXT "[fnt_dialogues]" +
#macro DIALOGUES_BASE_FONT_COLOR c_white
#macro MOUSE_OVER_TEXT_FONT_COLOR c_yellow

enum SIDES
{
	LEFT,
	RIGHT,
}

function TextBubble(_text, _speaking_character, _side, _text_color = DIALOGUES_BASE_FONT_COLOR) constructor
{
	speaking_character = _speaking_character
	scribble_text = scribble(DIALOGUES_FORMATING_TEXT _text).wrap(TEXT_BUBBLE_WIDTH - TEXT_BUBBLE_MARGIN*2).align(fa_left, fa_middle);
	side = _side;
	text_color = _text_color;


	typist = scribble_typist().in(1.3, 4);
	y_bot = GAME_HEIGHT - 10;
	get_height = function()
	{
		return scribble_text.get_height() + TEXT_BUBBLE_MARGIN;
	}
	is_fully_shown = function()
	{
		return typist.get_state() == 1;
	}
	
	
	
	draw = function()
	{
		draw_set_alpha(1); draw_set_color(c_black); draw_set_circle_precision(64);
		var _x_rec_left = side == SIDES.LEFT	? (GAME_WIDTH/2) - TEXT_BUBBLE_WIDTH - TEXT_BUBBLE_X_OFFSET : (GAME_WIDTH/2)  + TEXT_BUBBLE_X_OFFSET;
		var _x_rec_right = _x_rec_left + TEXT_BUBBLE_WIDTH;
		var _y_rec_bottom = self.y_bot;
		var _y_rec_top = _y_rec_bottom - self.get_height();
		draw_rectangle(_x_rec_left, _y_rec_top, _x_rec_right, _y_rec_bottom, false);
		
		var _x_text_left = _x_rec_left + TEXT_BUBBLE_MARGIN;
		var _y_text_middle = _y_rec_top + self.get_height()/2;
		scribble_text.blend(text_color).draw(_x_text_left, _y_text_middle, typist);
	}
}