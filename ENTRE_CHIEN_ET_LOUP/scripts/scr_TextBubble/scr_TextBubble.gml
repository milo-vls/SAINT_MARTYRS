
#macro DIALOGUES_BASE_FONT_COLOR c_white
#macro MOUSE_OVER_TEXT_FONT_COLOR c_yellow
#macro TEXT_BUBBLE_BACKGROUND_COLOR c_black

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
	
	bubble_alpha = 1;
	is_last_speaker_bubble = true;
	starting_link_x = -1;
	ending_link_x = -1;
	
	static left_side_bubble_x_rec_left = (GAME_WIDTH/2) - TEXT_BUBBLE_WIDTH/2 + TEXT_BUBBLE_X_OFFSET;
	static right_side_bubble_x_rec_left = (GAME_WIDTH/2) - TEXT_BUBBLE_WIDTH/2 - TEXT_BUBBLE_X_OFFSET;
	
	static left_side_bubble_x_rec_right = left_side_bubble_x_rec_left + TEXT_BUBBLE_WIDTH;
	static right_side_bubble_x_rec_right = right_side_bubble_x_rec_left + TEXT_BUBBLE_WIDTH;
	
	static left_side_bubble_tail_x = left_side_bubble_x_rec_left + sprite_get_width(spr_text_bubble_tail)/2 + 10 ;
	static right_side_bubble_tail_x = right_side_bubble_x_rec_right - sprite_get_width(spr_text_bubble_tail)/2 - 10;
	
	var _char_id = get_character_id_by_nickname(_speaking_character)
	var _sounds = _char_id == -1 ? [] : ds_map_find_value(global.character_id_to_voices_map, _char_id);
	typist = scribble_typist().in(1.3, 4).sound(_sounds, 100, 1, 1, .2);
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
		draw_set_alpha(bubble_alpha); draw_set_color(TEXT_BUBBLE_BACKGROUND_COLOR);
		var _x_rec_left = side == SIDES.LEFT	? left_side_bubble_x_rec_left : right_side_bubble_x_rec_left;
		var _x_rec_right = side == SIDES.LEFT ? left_side_bubble_x_rec_right : right_side_bubble_x_rec_right;
		var _y_rec_bottom = self.y_bot;
		var _y_rec_top = _y_rec_bottom - self.get_height();
		//draw_roundrect(_x_rec_left, _y_rec_top, _x_rec_right, _y_rec_bottom, false);
		draw_rectangle(_x_rec_left, _y_rec_top, _x_rec_right, _y_rec_bottom, false);
		
		if is_last_speaker_bubble
		{
			if side == SIDES.LEFT
			{
				draw_sprite_ext(spr_text_bubble_tail, 0, left_side_bubble_tail_x, _y_rec_bottom, -1, 1, 0, -1, bubble_alpha);
			}
			else
			{
				draw_sprite_ext(spr_text_bubble_tail, 0, right_side_bubble_tail_x, _y_rec_bottom, 1, 1, 0, -1, bubble_alpha);
			}
		}
		else
		{
			if starting_link_x == -1
			{
				starting_link_x = irandom_range(_x_rec_left + TEXT_BUBBLE_MARGIN, _x_rec_right - TEXT_BUBBLE_MARGIN);
				ending_link_x = irandom_range(_x_rec_left + TEXT_BUBBLE_MARGIN, _x_rec_right - TEXT_BUBBLE_MARGIN);
			}
			draw_line_width(starting_link_x, _y_rec_bottom - TEXT_BUBBLE_MARGIN, ending_link_x, _y_rec_bottom + TEXT_BUBBLE_MARGIN*2, irandom_range(5, 20));
		}
		
		var _x_text_left = _x_rec_left + TEXT_BUBBLE_MARGIN;
		var _y_text_middle = _y_rec_top + self.get_height()/2;
		scribble_text.blend(text_color).draw(_x_text_left, _y_text_middle, typist);
	}
}