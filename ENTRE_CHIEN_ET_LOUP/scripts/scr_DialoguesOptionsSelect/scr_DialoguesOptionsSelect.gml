function option_card_clicked(_card_id, _card_data)
{
	var _dialogue_option_select = obj_menu_manager.get_active_menu(DialoguesOptionsSelect);
	var _dialogue_menu = obj_menu_manager.get_active_menu(DialogueMenu);
	_dialogue_menu.selected_option_index = _card_data[0];
	_dialogue_option_select.end_reached = true;
}


function DialoguesOptionsSelect(_options_array, _dialogue_menu, _side) : Menu(MENU_PRIORITIES.OPTIONS_SELECT, room, true, false, false, MENU_CHANNELS.OPTIONS_SELECT) constructor 
{
	options_array = _options_array;
	dialogue_menu = _dialogue_menu;
	side = _side;
	
	pressed_option = -1;
	nb_options = array_length(options_array);
	var _cards = array_create(0);
	for (var _option_index = 0; _option_index < nb_options; _option_index ++)
	{
		if options_array[_option_index].conditionBool == false
			continue;
		var _sub_elements = 
		[
			new CardSubElement(DIALOGUES_FORMATING_TEXT options_array[_option_index].text, CARD_SUB_ELEMENT_TYPES.SCRIBBLE_TEXT)
		];
		array_push( _cards, new Card(_sub_elements, option_card_clicked, false, [_option_index]) );
	}
	cards_set = new CardsSet(_cards, ORIENTATION.BOT_DOWN_PIN, CIRCLE_DIRECTION.NEGATIVE);
	
	
	draw = cards_set.draw;
	activity = cards_set.activity;

}


