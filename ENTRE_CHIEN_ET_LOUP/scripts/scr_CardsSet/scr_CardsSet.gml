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
	for (var _card = 0; _card < nb_cards; _card ++)
	{
		var _hidden_part_height = CARD.get_hidden_part_height();
		switch(orientation)
		{
			case ORIENTATION.BOT_LEFT_PIN :
			break;
			
			case ORIENTATION.BOT_RIGHT_PIN :
			break;
			
			case ORIENTATION.BOT_UP_PIN :{
				if _card == 0
				{
					CARD.x_left = CIRCLE_DIRECTION.POSITIVE == circle_direction ? GAP_BETWEEN_TEXT_BUBBLES/2 : GAME_WIDTH - GAP_BETWEEN_TEXT_BUBBLES/2 - CARD.width;
				}
				else
				{
					CARD.x_left = CIRCLE_DIRECTION.POSITIVE == circle_direction ? cards[_card-1].x_left + cards[_card-1].width + GAP_BETWEEN_TEXT_BUBBLES :  cards[_card-1].x_left - (CARD.width + GAP_BETWEEN_TEXT_BUBBLES);
				}
				CARD.x_left_hidden = CARD.x_left;
				CARD.x_left_revealed = CARD.x_left;
				
				CARD.x_right = CARD.x_left + CARD.width;
				CARD.x_right_hidden = CARD.x_right;
				CARD.x_right_revealed = CARD.x_right;
				
				CARD.y_top_hidden = 0;
				CARD.y_top_revealed = 0;
				CARD.y_top = 0;
				
				CARD.y_bot = CARD.height;
				CARD.y_bot_hidden = CARD.height;
				CARD.y_bot_revealed = CARD.height + _hidden_part_height;
				
				
				CARD.x_left_title = CARD.x_left + TEXT_BUBBLE_MARGIN;
				CARD.x_left_title_hidden = CARD.x_left_title;
				CARD.x_left_title_revealed = CARD.x_left_title;
				
				CARD.y_top_title = CARD.y_top + TEXT_BUBBLE_MARGIN;
				CARD.y_top_title_hidden = CARD.y_top_title;
				CARD.y_top_title_revealed = CARD.y_top_title + _hidden_part_height;
				
				CARD.x_left_hidden_scribble = CARD.x_left_title;
				CARD.x_left_hidden_scribble_hidden = CARD.x_left_hidden_scribble;
				CARD.x_left_hidden_scribble_revealed = CARD.x_left_hidden_scribble;
				
				CARD.y_top_hidden_scribble = CARD.hidden_scribble == noone ? 0 : -CARD.hidden_scribble.get_height();
				CARD.y_top_hidden_scribble_hidden = CARD.y_top_hidden_scribble;
				CARD.y_top_hidden_scribble_revealed = CARD.y_top_hidden_scribble + _hidden_part_height;
				
				CARD.x_left_hidden_sprite = CARD.x_left_title;
				CARD.x_left_hidden_sprite_hidden = CARD.x_left_title;
				CARD.x_left_hidden_sprite_revealed = CARD.x_left_title;
				
				CARD.y_top_hidden_sprite = - _hidden_part_height + TEXT_BUBBLE_MARGIN;
				CARD.y_top_hidden_sprite_hidden = CARD.y_top_hidden_sprite;
				CARD.y_top_hidden_sprite_revealed = TEXT_BUBBLE_MARGIN;
				
			}
			break;

			case ORIENTATION.BOT_DOWN_PIN :{
				if _card == 0
				{
					CARD.x_left_hidden = circle_direction == CIRCLE_DIRECTION.POSITIVE ? GAME_WIDTH - GAP_BETWEEN_TEXT_BUBBLES/2 - CARD.width : GAP_BETWEEN_TEXT_BUBBLES/2;
				}
				else
				{
					CARD.x_left_hidden = cards[_card-1].x_left_hidden + (circle_direction == CIRCLE_DIRECTION.POSITIVE ? -(cards[_card-1].width + GAP_BETWEEN_TEXT_BUBBLES) : cards[_card-1].width + GAP_BETWEEN_TEXT_BUBBLES);
				}
				CARD.x_left_revealed = CARD.x_left_hidden;
				CARD.x_left = CARD.x_left_hidden;
				
				CARD.x_right_hidden = CARD.x_left_hidden + CARD.width;	
				CARD.x_right_revealed = CARD.x_right_hidden;
				CARD.x_right = CARD.x_right_revealed;	
				
				CARD.y_top_hidden = GAME_HEIGHT - CARD.sub_elements[0].get_height() - TEXT_BUBBLE_MARGIN;
				CARD.y_top_revealed = CARD.y_top_hidden - _hidden_part_height;
				CARD.y_top = CARD.y_top_hidden;
				
				CARD.y_bot_hidden = GAME_HEIGHT;
				CARD.y_bot_revealed = GAME_HEIGHT;
				CARD.y_bot = GAME_HEIGHT;
				
				
				CARD.sub_elements[0].x_left = CARD.x_left + TEXT_BUBBLE_MARGIN;
				CARD.sub_elements[0].x_left_hidden = CARD.sub_elements[0].x_left;
				CARD.sub_elements[0].x_left_revealed = CARD.sub_elements[0].x_left;
				
				CARD.sub_elements[0].y_top = CARD.y_top + TEXT_BUBBLE_MARGIN;
				CARD.sub_elements[0].y_top_hidden = CARD.sub_elements[0].y_top;
				CARD.sub_elements[0].y_top_revealed = CARD.sub_elements[0].y_top - _hidden_part_height;
				for (var _sub_element = 1; _sub_element < CARD.nb_sub_elements; _sub_element ++)
				{
					CARD.sub_elements[_sub_element].x_left = CARD.x_left + TEXT_BUBBLE_MARGIN;
					CARD.sub_elements[_sub_element].x_left_hidden = CARD.x_left + TEXT_BUBBLE_MARGIN;
					CARD.sub_elements[_sub_element].x_left_revealed = CARD.x_left + TEXT_BUBBLE_MARGIN;
					
					CARD.sub_elements[_sub_element].y_top = CARD.sub_elements[_sub_element-1].y_top + CARD.sub_elements[_sub_element-1].get_height();
					CARD.sub_elements[_sub_element].y_top_hidden = CARD.sub_elements[_sub_element].y_top;
					CARD.sub_elements[_sub_element].y_top_revealed = CARD.sub_elements[_sub_element].y_top - _hidden_part_height;
				}
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




