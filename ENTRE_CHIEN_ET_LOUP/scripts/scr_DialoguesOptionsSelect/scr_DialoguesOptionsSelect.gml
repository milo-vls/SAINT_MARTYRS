


function DialoguesOptionsSelect(_options_array, _dialogue_menu, _side) : Menu(MENU_PRIORITIES.OPTIONS_SELECT, room, true, false, false, MENU_CHANNELS.OPTIONS_SELECT) constructor 
{
	options_array = _options_array;
	dialogue_menu = _dialogue_menu;
	side = _side;
	
	pressed_option = -1;
	nb_options = array_length(_options_array);
	var _cards = array_create(nb_options);
	for (var _option = 0; _option < nb_options; _option ++)
	{
		var _scribble = scribble(DIALOGUES_FORMATING_TEXT options_array[_option].text).blend(DIALOGUES_BASE_FONT_COLOR)
		_cards[_option] = new Card(_scribble);
	}
	cards_set = new CardsSet(_cards, ORIENTATION.BOT_DOWN_PIN, CIRCLE_DIRECTION.NEGATIVE);//side == SIDES.LEFT ? CIRCLE_DIRECTION.NEGATIVE : CIRCLE_DIRECTION.POSITIVE);
	
	draw = function()
	{
		cards_set.draw();
	}
	#region OLDER SYSTEM
	/*

	options_bubbles_width = min(TEXT_BUBBLE_WIDTH, (GAME_WIDTH - ((nb_options + 1) * GAP_BETWEEN_OPTION_BUBBLES )) /nb_options);
	options_bubbles_height = 0;
	
	typists = array_create(0);
	scribble_texts = array_create(0);
	x_lefts = array_create(0);
	pressed = array_create(0);
	for (var _i = 0; _i < nb_options; _i++)
	{
		color[_i] = c_white;
		pressed[_i] = false;
		scribble_texts[_i] = scribble("[fnt_dialogues]" + _options_array[_i].text).wrap(options_bubbles_width).align(fa_left, fa_top);
		typists[_i] = scribble_typist();
		
		if _side == SIDES.LEFT
		{
			x_lefts[_i] = GAP_BETWEEN_OPTION_BUBBLES + _i * (options_bubbles_width + GAP_BETWEEN_OPTION_BUBBLES);
		}
		else
		{
			x_lefts[_i] = GAP_BETWEEN_OPTION_BUBBLES + options_bubbles_width + _i * (options_bubbles_width + GAP_BETWEEN_OPTION_BUBBLES);
		}
		
		
		
		
		
		if scribble_texts[_i].get_height() > options_bubbles_height then options_bubbles_height = scribble_texts[_i].get_height();
	}
	options_bubbles_height += TEXT_BUBBLE_MARGIN * 2;
	_dialogue_menu.y_bottom_target_minimum_bubble = min(TEXT_BUBBLE_MINIMUM_Y_BOTTOM_TARGET, GAME_HEIGHT - options_bubbles_height - GAP_BETWEEN_TEXT_BUBBLES);
	
	draw = function()
	{
		for (var _i = 0; _i < self.nb_options; _i ++)
		{
			var _y_top = GAME_HEIGHT - options_bubbles_height;
			var _y_bot = GAME_HEIGHT;
			var _x_right = x_lefts[_i] + options_bubbles_width;
			var _x_left = x_lefts[_i];
			draw_set_alpha(1);
			draw_rectangle_color(_x_left, _y_top, _x_right, _y_bot, c_black, c_black, c_black, c_black, false);
			
			var _x_text_left = _x_left + TEXT_BUBBLE_MARGIN;
			var _y_text_middle = _y_top + TEXT_BUBBLE_MARGIN;
			scribble_texts[_i].blend(color[_i]).draw(_x_text_left, _y_text_middle, typists[_i]);
			
		}
	}
	*/
	#endregion
	activity = function()
	{
		var _card_mouse_over = cards_set.get_card_mouse_over();
		if pressed_option > -1 and left_click_released()
		{
			dialogue_menu.selected_option_index = pressed_option;
			end_reached = true;
		}
		pressed_option = (_card_mouse_over > -1 and left_click_pressed()) ? _card_mouse_over : (!left_click() ? -1 : pressed_option);
	}
}








/*
		for (var _i = 0; _i < nb_options; _i ++)
		{
			if left_click_released() and pressed[_i]
			{
				dialogue_menu.selected_option_index = _i;
				end_reached = true;
			}
			
			var _y_top = GAME_HEIGHT - options_bubbles_height;
			var _y_bot = GAME_HEIGHT; 
			var _x_right = x_lefts[_i] + options_bubbles_width;
			var _x_left = x_lefts[_i];
			
			var _mouse_is_over = point_in_rectangle(mouse_x, mouse_y, _x_left, _y_top, _x_right, _y_bot);
			if left_click_pressed() and _mouse_is_over then pressed[_i] = true;
			if !left_click() or !_mouse_is_over then pressed[_i] = false;
			
			color[_i] = _mouse_is_over ? c_yellow : c_white;
				

			
		}