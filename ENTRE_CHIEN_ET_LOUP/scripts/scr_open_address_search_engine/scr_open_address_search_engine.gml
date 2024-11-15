function open_address_search_engine()
{
	var _address_search_engine_window = new
	ComputerWindow(CURSOR_X, CURSOR_Y, ADDRESS_SEARCH_ENGINE_WINDOW_WIDTH, ADDRESS_SEARCH_ENGINE_WINDOW_HEIGHT, address_search_engine_draw, spr_computer_address_search_database_icon, text_id_to_string("ADDRESS SEARCH ENGINE TITLE"));
	
	var _window_variables = 
	[
		[ADDRESS_SEARCH_ENGINE_WINDOW_STRUCT.SCREEN, 0],
		[ADDRESS_SEARCH_ENGINE_WINDOW_STRUCT.USER_INPUT, ""],
		[ADDRESS_SEARCH_ENGINE_WINDOW_STRUCT.TEXT_LINES, address_search_engine_get_starting_lines(ADDRESS_SEARCH_ENGINE_WINDOW_STRUCT.SCREEN)],
		[ADDRESS_SEARCH_ENGINE_WINDOW_STRUCT.LAST_NAME, ""],
		[ADDRESS_SEARCH_ENGINE_WINDOW_STRUCT.STREET_ID, -1],
		
	];
	
	set_struct_variables(_window_variables, _address_search_engine_window);
	add_window(_address_search_engine_window);
	
}