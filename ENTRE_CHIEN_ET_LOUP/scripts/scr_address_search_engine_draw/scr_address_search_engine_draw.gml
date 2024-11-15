#macro ADDRESS_SEARCH_ENGINE_WINDOW_WIDTH 1775
#macro ADDRESS_SEARCH_ENGINE_WINDOW_HEIGHT 970

enum ADDRESS_SEARCH_ENGINE_WINDOW_STRUCT
{
	SCREEN, //0 = HOME, 1 = WHO, 2 = WHERE
	USER_INPUT,
	TEXT_LINES,
	LAST_NAME,
	STREET_ID,
	
	
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



function address_search_engine_last_name_command_handler(_command, _window, _lines_to_draw)
{
	var _characters_ids_having_command_as_last_name = get_characters_ids_by_last_name(_command);	
	if array_length(_characters_ids_having_command_as_last_name) > 0
	{
		var _last_name = global.characters[_characters_ids_having_command_as_last_name[0]].last_name
		array_push(_lines_to_draw, _last_name);
		array_push(_lines_to_draw, text_id_to_string("ASE WHERE 2"));
		
		struct_set(_window, ADDRESS_SEARCH_ENGINE_WINDOW_STRUCT.LAST_NAME, _last_name);
		
		return;
	}
	var _error_text = text_id_to_string("ASE WHERE 1");
	if array_last(_lines_to_draw) != _error_text
		array_push(_lines_to_draw, _error_text);
}

function address_search_engine_first_name_command_handler(_command, _window, _lines_to_draw, _last_name)
{
	var _char_id = get_character_id_by_full_name(_command, _last_name);
	
	if _char_id == -1
	{
		var _error_text = text_id_to_string("ASE WHERE 3");
		if array_last(_lines_to_draw) == _error_text
			array_push(_lines_to_draw, _error_text);
		return false;
	}
	
	var _character = global.characters[_char_id];
	var _address_id = _character.address_id;
	
	
	array_delete(_lines_to_draw, 0, array_length(_lines_to_draw));
	array_push(_lines_to_draw, get_character_full_name(_char_id));
	array_push(_lines_to_draw, text_id_to_string("RESULTS"));
	array_push(_lines_to_draw, get_address_full_name(_address_id));
	array_push(_lines_to_draw, get_address_position_text(_address_id));
	
	
	return true;
	
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
		case 1/*WHO*/:{
		
		
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
			}
			else
			{
				var _no_street_has_this_name_text = text_id_to_string("ASE WHO 1")
				if array_last(_lines_to_draw) != _no_street_has_this_name_text
					array_push(_lines_to_draw, _no_street_has_this_name_text);
			}
			
			break;
		}
		
		
		
		var _address_id = address_id_of_number_from_given_street(_street_id, real(_command))
		var _characters = get_characters_by_address_id(_address_id);
		
		var _nb_chars = array_length(_characters);
		
		//delete warning message and signal success/faillure
		if _nb_chars > 0
		{
			if array_last(_lines_to_draw) == text_id_to_string("ASE WHO 3")
				array_delete(_lines_to_draw, array_length(_lines_to_draw)-1, 1);
			
			
			array_push(_lines_to_draw, _command);
			
			_lines_to_draw = array_create(0);
			var _results_header = string_concat(text_id_to_string(global.streets[_street_id].name_text_id)," ",_command, ". " ,  text_id_to_string("RESULTS"));
			
			array_push(_lines_to_draw, _results_header);
			
		}
		else if array_last(_lines_to_draw) != text_id_to_string("ASE WHO 3")
			array_push(_lines_to_draw, text_id_to_string("ASE WHO 3"));

			
		//show found chars	
		for (var _i = 0; _i < _nb_chars; _i ++)
			array_push(_lines_to_draw, get_character_full_name(_characters[_i]));
		
		var _starting_lines_to_push = address_search_engine_get_starting_lines(0);
		for (var _i = 0; _i < array_length(_starting_lines_to_push); _i ++)
			array_push(_lines_to_draw, _starting_lines_to_push[_i]);
		
		_screen_state = 0;
		}break;
		case 2:
		{
			if _command == ""
				break;
			
			
			var _given_last_name = struct_get(_window, ADDRESS_SEARCH_ENGINE_WINDOW_STRUCT.LAST_NAME);
			if _given_last_name == ""
			{
				address_search_engine_last_name_command_handler(_command, _window, _lines_to_draw)
				break;
			}
			
			
			//LAST NAME OBTAINED
			if address_search_engine_first_name_command_handler(_command, _window, _lines_to_draw, _given_last_name)
				_screen_state = 0;
			
		}
		break;
	}
	
	
	struct_set(_window, ADDRESS_SEARCH_ENGINE_WINDOW_STRUCT.TEXT_LINES, _lines_to_draw);
	struct_set(_window, ADDRESS_SEARCH_ENGINE_WINDOW_STRUCT.USER_INPUT, _user_input);
	struct_set(_window, ADDRESS_SEARCH_ENGINE_WINDOW_STRUCT.SCREEN, _screen_state);
	
	draw_set_font(fnt_notpad);
	draw_set_color(c_white);
	draw_lines(array_func_push(_lines_to_draw, _user_input), 0, 35, 2, 1, "> ");
	
}