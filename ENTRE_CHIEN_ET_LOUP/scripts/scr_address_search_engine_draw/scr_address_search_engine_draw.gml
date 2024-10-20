#macro ADDRESS_SEARCH_ENGINE_WINDOW_WIDTH 1775
#macro ADDRESS_SEARCH_ENGINE_WINDOW_HEIGHT 500

enum ADDRESS_SEARCH_ENGINE_WINDOW_STRUCT
{
	SCREEN, //0 = HOME, 1 = WHO, 2 = WHERE
	USER_INPUT,
	TEXT_LINES,
	FIRST_NAME,
	STREET_ID,
	ADDRESSES,
	
}


///@param {real} _screen_state cf ADDRESS_SEARCH_ENGGINE_WINDOW_STRUCT.SCREEN
function address_search_engine_get_starting_lines(_screen_state)
{
	var _array_to_return = array_create(0);
	
	//HOME
	if _screen_state == 0
	{
		array_push(_array_to_return, text_id_to_string("ASE HOME 0"), text_id_to_string("ASE HOME 1"),text_id_to_string("ASE HOME 2"));
		return _array_to_return;
	}
	
	
	//WHO
	if _screen_state == 1
	{
		array_push(_array_to_return, text_id_to_string("ASE WHO 0"));
		return _array_to_return;
	}
	
	
	
	//WHERE
	array_push(_array_to_return, text_id_to_string("ASE WHERE 0"));
	return _array_to_return;
	
	
}


///@param _manager_id 
///@param {struct.ComputerWindow} _window
function address_search_engine_draw(_manager_id, _window)
{
	draw_clear(make_color_rgb(32, 53, 98));
	
	var _screen_state = struct_get(_window, ADDRESS_SEARCH_ENGINE_WINDOW_STRUCT.SCREEN);
	
	var _user_input = struct_get(_window, ADDRESS_SEARCH_ENGINE_WINDOW_STRUCT.USER_INPUT);
	if array_last(obj_computer_manager.windows).id == _window.id
		_user_input = text_input(_user_input, 30);

	
	var _lines_to_draw = struct_get(_window, ADDRESS_SEARCH_ENGINE_WINDOW_STRUCT.TEXT_LINES);
	
	
	var _command = "";
	if keyboard_check_pressed(vk_enter)
	{
		_command = _user_input;
		_user_input = "";
		
	}
	
	
	switch(_screen_state)
	{
		case 0/*HOME*/:
		if _command == "1" or _command == "2"
		{
			_lines_to_draw = address_search_engine_get_starting_lines(int64(_command));
			_screen_state = int64(_command);
		}
		break;
		case 1/*WHO*/:
		var _street_id = struct_get(_window, ADDRESS_SEARCH_ENGINE_WINDOW_STRUCT.STREET_ID)
		if _command == ""
			break;
		if _street_id == -1
		{
			var _street_name_text_id = string_to_text_id(_command)
			_street_id = get_street_id_by_name(_street_name_text_id)
			if _street_id > -1
			{
				array_push(_lines_to_draw, text_id_to_string(_street_name_text_id), text_id_to_string("ASE WHO 2"));
				struct_set(_window, ADDRESS_SEARCH_ENGINE_WINDOW_STRUCT.STREET_ID, _street_id);
				struct_set(_window, ADDRESS_SEARCH_ENGINE_WINDOW_STRUCT.STREET_ID, get_addresses_ids_of_given_street_id(_street_id));
			}
			else
			{
				var _no_street_has_this_name_text = text_id_to_string("ASE WHO 1")
				if array_last(_lines_to_draw) != _no_street_has_this_name_text
					array_push(_lines_to_draw, _no_street_has_this_name_text);
			}
		}
		else if address_id_of_number_from_given_ids(struct_get(_window, ADDRESS_SEARCH_ENGINE_WINDOW_STRUCT.ADDRESSES), _command) > -1
			
			
		
		break;
		case 2:
		
		break;
	}
	
	
	struct_set(_window, ADDRESS_SEARCH_ENGINE_WINDOW_STRUCT.TEXT_LINES, _lines_to_draw);
	struct_set(_window, ADDRESS_SEARCH_ENGINE_WINDOW_STRUCT.USER_INPUT, _user_input);
	struct_set(_window, ADDRESS_SEARCH_ENGINE_WINDOW_STRUCT.SCREEN, _screen_state);
	
	draw_set_font(fnt_notpad);
	draw_set_color(c_white);
	draw_lines(array_func_push(_lines_to_draw, _user_input), 0, 27, 2, 1, "> ");
	
}