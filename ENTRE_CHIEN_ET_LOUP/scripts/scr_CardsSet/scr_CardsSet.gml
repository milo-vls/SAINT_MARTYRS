#macro CARDS_COLOR c_black

#macro CARD cards[_card]

enum ORIENTATION
{
	BOT_DOWN_PIN,
	BOT_UP_PIN,
	BOT_RIGHT_PIN,
	BOT_LEFT_PIN,
}
enum CIRCLE_DIRECTION
{
	POSITIVE,	//	TOP BOT; LEFT RIGHT
	NEGATIVE	//	BOT TOP; RIGHT LEFT
}

function CardsSet(_cards, _orientation = ORIENTATION.BOT_DOWN_PIN, _circle_direction = CIRCLE_DIRECTION.POSITIVE) constructor 
{
	cards = _cards;
	orientation = _orientation;
	circle_direction = _circle_direction;
	
	pressed_card = -1;
	nb_cards = array_length(cards);	
	for (_card = 0; _card < nb_cards; _card ++)
	{
		
		var _hidden_scribble_height = CARD.get_hidden_scribble_height();
		
		var _hidden_sprite = CARD.hidden_sprite;
		var _hidden_sprite_width = _hidden_sprite != noone ? sprite_get_width(_hidden_sprite) : 1;
		var _hidden_sprite_height = _hidden_sprite != noone ? sprite_get_height(_hidden_sprite) : 1;
		CARD.hidden_sprite_scale = (CARD.width - TEXT_BUBBLE_MARGIN*2)/max(_hidden_sprite_width, _hidden_sprite_height);
		
		var _hidden_part_height = CARD.get_hidden_part_height();
		
		switch(orientation)
		{
			case ORIENTATION.BOT_LEFT_PIN :
			break;
			case ORIENTATION.BOT_RIGHT_PIN :
			break;
			case ORIENTATION.BOT_UP_PIN :
			break;

			case ORIENTATION.BOT_DOWN_PIN :{
				CARD.y_top_hidden = GAME_HEIGHT - CARD.height;
				CARD.y_top_revealed = CARD.y_top_hidden - _hidden_part_height;
				CARD.y_top = CARD.y_top_hidden;
				
				CARD.y_bot_hidden = GAME_HEIGHT;
				CARD.y_bot_revealed = GAME_HEIGHT;
				CARD.y_bot = GAME_HEIGHT;
				
				if _card == 0
				{
					CARD.x_left_hidden = circle_direction == CIRCLE_DIRECTION.POSITIVE ? GAME_WIDTH - GAP_BETWEEN_TEXT_BUBBLES/2 - CARD.width : GAP_BETWEEN_TEXT_BUBBLES/2;
					CARD.x_right_hidden = CARD.x_left_hidden + CARD.width;	
				}
				else
				{
					CARD.x_left_hidden = cards[_card-1].x_left_hidden + (circle_direction == CIRCLE_DIRECTION.POSITIVE ? -(cards[_card-1].width + GAP_BETWEEN_TEXT_BUBBLES) : cards[_card-1].width + GAP_BETWEEN_TEXT_BUBBLES);
					CARD.x_right_hidden = CARD.x_left_hidden + CARD.width;
				}
				CARD.x_left_revealed = CARD.x_left_hidden;
				CARD.x_left = CARD.x_left_hidden;
				
				CARD.x_right_revealed = CARD.x_right_hidden;
				CARD.x_right = CARD.x_right_revealed;	
				
				CARD.x_left_title_hidden = CARD.x_left_hidden + TEXT_BUBBLE_MARGIN;
				CARD.x_left_title_revealed = CARD.x_left_title_hidden;
				CARD.x_left_title = CARD.x_left_title_hidden;
				
				CARD.y_top_title_hidden = CARD.y_top_hidden + TEXT_BUBBLE_MARGIN;
				CARD.y_top_title_revealed = CARD.y_top_title_hidden - _hidden_part_height;
				CARD.y_top_title = CARD.y_top_title_hidden;
				
				CARD.x_left_hidden_scribble_hidden = CARD.x_left_title;
				CARD.x_left_hidden_scribble_revealed = CARD.x_left_title;
				CARD.x_left_hidden_scribble = CARD.x_left_title;
				
				CARD.y_top_hidden_scribble_hidden = GAME_HEIGHT;
				CARD.y_top_hidden_scribble_revealed = GAME_HEIGHT - _hidden_part_height;
				CARD.y_top_hidden_scribble = CARD.y_top_hidden_scribble_hidden;
				
				CARD.x_left_hidden_sprite_hidden = CARD.x_left_hidden_scribble;
				CARD.x_left_hidden_sprite_revealed = CARD.x_left_hidden_sprite_hidden;
				CARD.x_left_hidden_sprite = CARD.x_left_hidden_sprite_revealed;
				
				CARD.y_top_hidden_sprite_hidden = GAME_HEIGHT + _hidden_scribble_height;
				CARD.y_top_hidden_sprite_revealed = CARD.y_top_hidden_scribble_revealed + _hidden_scribble_height;
				CARD.y_top_hidden_sprite = CARD.y_top_hidden_sprite_hidden;
			}
			break;
		}
	}
	
	static get_card_mouse_over = function()
	{
		for (var _card_id = 0; _card_id < nb_cards; _card_id ++)
		{
			var _card = cards[_card_id]
			if point_in_rectangle(mouse_x, mouse_y, _card.x_left, _card.y_top, _card.x_right, _card.y_bot)
			then return _card_id;
		}
		return -1;
	}
	get_highest_card_height = function()
	{
		var _max_height = 0;
		for (var _card = 0; _card < nb_cards; _card ++)
		{
			_max_height = _max_height < CARD.height ? CARD.height : _max_height;
		}
		return _max_height;
	}
	
	draw = function()
	{
		for (var _card = 0; _card < nb_cards; _card ++)
		{
			CARD.draw();
		}
		
	}
	activity = function()
	{
		var _card_mouse_over = get_card_mouse_over();
		if pressed_card > -1 and left_click_released()
		{
			cards[_card_mouse_over].function_when_clicked(_card_mouse_over);
		}
		pressed_card = (_card_mouse_over > -1 and left_click_pressed()) ? _card_mouse_over : (!left_click() ? -1 : pressed_card);
		
		for (var _card = 0; _card < nb_cards; _card ++)
		{
			CARD.update_points_of_draw(_card_mouse_over == _card);
		}
	}
}




