function option_card_clicked(_card_id)
{
	var _dialogue_option_select = obj_menu_manager.get_active_menu(DialoguesOptionsSelect);
	var _dialogue_menu = obj_menu_manager.get_active_menu(DialogueMenu);
	_dialogue_menu.selected_option_index = _card_id;
	_dialogue_option_select.end_reached = true;
}


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
		var _sub_elements = 
		[
			new CardSubElement(_scribble, CARD_SUB_ELEMENT_TYPES.SCRIBBLE_TEXT)
		];
		_cards[_option] = new Card(_sub_elements, option_card_clicked);
	}
	cards_set = new CardsSet(_cards, ORIENTATION.BOT_DOWN_PIN, CIRCLE_DIRECTION.NEGATIVE);
	
	
	draw = cards_set.draw;
	activity = cards_set.activity;

}


