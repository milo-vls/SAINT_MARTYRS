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
	nb_cards = array_length(cards);
	cards_height = 0;for (var _card = 0; _card < nb_cards; _card ++)
	{
		var _card_height = cards[_card].scribble_title.get_height();
		if _card_height > cards_height
		{
			cards_height = _card_height;
		}
		
	}cards_height += TEXT_BUBBLE_MARGIN*2;
	cards_width = TEXT_BUBBLE_WIDTH - TEXT_BUBBLE_MARGIN*2; for (var _card = 0; _card < nb_cards; _card ++)
	{
		var _card_width = cards[_card].scribble_title.get_width();
		if _card_width > cards_width then cards_width = _card_width;
	}cards_width += TEXT_BUBBLE_MARGIN * 2;
	

	var _x_origin, _y_origin;
	for (var _card = 0; _card < nb_cards; _card ++)
	{
		switch(orientation)
		{
			case ORIENTATION.BOT_LEFT_PIN :
			_x_origin = 0;
			_y_origin = circle_direction == CIRCLE_DIRECTION.POSITIVE ? GAME_HEIGHT - GAP_BETWEEN_TEXT_BUBBLES/2 : GAP_BETWEEN_TEXT_BUBBLES/2;
			CARD.x_left = _x_origin;
			CARD.x_right = _x_origin + cards_height;
			CARD.y_top = (circle_direction == CIRCLE_DIRECTION.POSITIVE ? _y_origin - cards_width : _y_origin)
			+ (circle_direction == CIRCLE_DIRECTION.POSITIVE ? -(cards_width + GAP_BETWEEN_TEXT_BUBBLES) : (cards_width + GAP_BETWEEN_TEXT_BUBBLES));
			CARD.y_bot = circle_direction == CIRCLE_DIRECTION.POSITIVE ? _y_origin : _y_origin + cards_width
			+ (circle_direction == CIRCLE_DIRECTION.POSITIVE ? -(cards_width + GAP_BETWEEN_TEXT_BUBBLES) : (cards_width + GAP_BETWEEN_TEXT_BUBBLES));
			break;
			case ORIENTATION.BOT_RIGHT_PIN :
			_x_origin = GAME_WIDTH;
			_y_origin = circle_direction != CIRCLE_DIRECTION.POSITIVE ? GAME_HEIGHT - GAP_BETWEEN_TEXT_BUBBLES/2 : GAP_BETWEEN_TEXT_BUBBLES/2;
			CARD.x_left = _x_origin - cards_height;
			CARD.x_right = _x_origin;
			CARD.y_top = circle_direction == CIRCLE_DIRECTION.POSITIVE ? _y_origin - cards_width : _y_origin
			+ (circle_direction != CIRCLE_DIRECTION.POSITIVE ? -(cards_width + GAP_BETWEEN_TEXT_BUBBLES) : (cards_width + GAP_BETWEEN_TEXT_BUBBLES));
			CARD.y_bot = circle_direction == CIRCLE_DIRECTION.POSITIVE ? _y_origin : _y_origin + cards_width
			+ (circle_direction != CIRCLE_DIRECTION.POSITIVE ? -(cards_width + GAP_BETWEEN_TEXT_BUBBLES) : (cards_width + GAP_BETWEEN_TEXT_BUBBLES));
			break;
			case ORIENTATION.BOT_UP_PIN :
			CARD.y_top = 0;
			CARD.y_bot = cards_height;
			if _card == 0
			{
				CARD.x_left = circle_direction == CIRCLE_DIRECTION.POSITIVE ? GAME_WIDTH - GAP_BETWEEN_TEXT_BUBBLES/2 - cards_width : GAP_BETWEEN_TEXT_BUBBLES/2;
				CARD.x_right = CARD.x_left + cards_width;
			}
			else
			{
				CARD.x_left = cards[_card-1].x_left
				+ (circle_direction == CIRCLE_DIRECTION.POSITIVE ? -(cards_width + GAP_BETWEEN_TEXT_BUBBLES) : cards_width + GAP_BETWEEN_TEXT_BUBBLES);
				CARD.x_right = cards[_card-1].x_right
				+ (circle_direction == CIRCLE_DIRECTION.POSITIVE ? -(cards_width + GAP_BETWEEN_TEXT_BUBBLES) : cards_width + GAP_BETWEEN_TEXT_BUBBLES);
			}
			CARD.x_left_title = CARD.x_left + TEXT_BUBBLE_MARGIN;
			CARD.y_middle_title = CARD.y_top + TEXT_BUBBLE_MARGIN;
			break;
			case ORIENTATION.BOT_DOWN_PIN :
			CARD.y_top = GAME_HEIGHT - cards_height;
			CARD.y_bot = GAME_HEIGHT;
			if _card == 0
			{
				CARD.x_left = circle_direction == CIRCLE_DIRECTION.POSITIVE ? GAME_WIDTH - GAP_BETWEEN_TEXT_BUBBLES/2 - cards_width : GAP_BETWEEN_TEXT_BUBBLES/2;
				CARD.x_right = CARD.x_left + cards_width;
			}
			else
			{
				CARD.x_left = cards[_card-1].x_left
				+ (circle_direction == CIRCLE_DIRECTION.POSITIVE ? -(cards_width + GAP_BETWEEN_TEXT_BUBBLES) : cards_width + GAP_BETWEEN_TEXT_BUBBLES);
				CARD.x_right = cards[_card-1].x_right
				+ (circle_direction == CIRCLE_DIRECTION.POSITIVE ? -(cards_width + GAP_BETWEEN_TEXT_BUBBLES) : cards_width + GAP_BETWEEN_TEXT_BUBBLES);
			}
			CARD.x_left_title = CARD.x_left + TEXT_BUBBLE_MARGIN;
			CARD.y_middle_title = CARD.y_top + TEXT_BUBBLE_MARGIN;		
			break;
		}
	}
	
	
	get_card_mouse_over = function()
	{
		for (var _card_id = 0; _card_id < nb_cards; _card_id ++)
		{
			var _card = cards[_card_id]
			if point_in_rectangle(mouse_x, mouse_y, _card.x_left, _card.y_top, _card.x_right, _card.y_bot)
			then return _card_id;
		}
		return -1;
	}
	
	draw = function()
	{
		for (var _card = 0; _card < nb_cards; _card ++)
		{
			CARD.draw();
		}
		
	}
}




