function option_card_clicked(_card_id, _card_data)
{
	/*
	var _dialogue_option_select = obj_menu_manager.get_active_menu(DialoguesOptionsSelect);
	var _dialogue_menu = obj_menu_manager.get_active_menu(DialogueMenu);
	_dialogue_menu.selected_option_index = _card_data[0];
	_dialogue_option_select.end_reached = true;
	*/
	choose_dialogue_option(_card_data[0])
}

function choose_dialogue_option(_option_index)
{
	var _dialogue_option_select = obj_menu_manager.get_active_menu(DialoguesOptionsSelect);
	var _dialogue_menu = obj_menu_manager.get_active_menu(DialogueMenu);
	_dialogue_menu.selected_option_index = _option_index;
	_dialogue_option_select.end_reached = true;
}


function DialoguesOptionsSelect(_options_array, _dialogue_menu, _side) : Menu(MENU_PRIORITIES.OPTIONS_SELECT, room, true, false, false, MENU_CHANNELS.OPTIONS_SELECT) constructor 
{
	options_array = _options_array;
	dialogue_menu = _dialogue_menu;
	side = _side;
	
	nb_options = array_length(options_array);
	
	
	var _texts = array_create(0);
	var _methods = array_create(0);
	var _card_meta_datas = array_create(0);
	for (var _option_index = 0; _option_index < nb_options; _option_index ++)
	{
		if options_array[_option_index].conditionBool == false
			continue;
				
		array_push(_texts, options_array[_option_index].text);
		array_push(_methods, choose_dialogue_option);
		array_push(_card_meta_datas, _option_index);
		
	}
	
	range_of_cards = new RangeOfCards(_texts, _methods, _card_meta_datas);
	hovered_card_id = -1;
	
	
	draw = function()
	{
		hovered_card_id = range_of_cards_get_hovered_card_id(range_of_cards, mouse_x, mouse_y);
		range_of_cards_update_padding(range_of_cards, hovered_card_id);
		draw_range_of_cards(range_of_cards, hovered_card_id);
	}
	activity = function()
	{
		if left_click_pressed() and hovered_card_id > -1
			range_of_cards_use_card_method(range_of_cards, hovered_card_id);
	}

}


