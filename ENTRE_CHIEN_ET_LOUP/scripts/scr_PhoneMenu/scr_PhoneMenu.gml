enum PHONE_ACTIONS
{
	ADD_0,
	ADD_1,
	ADD_2,
	ADD_3,
	ADD_4,
	ADD_5, 
	ADD_6,
	ADD_7,
	ADD_8,
	ADD_9,
	DELETE,
	CALL
}

function PhoneMenu() : Menu(MENU_PRIORITIES.PHONE_MENU, room, false, true, false) constructor 
{
	typed_digits = array_create(0);
	number_of_digits = 0;
	pressed_phone_key = noone;
	map_icone_is_pressed = false;
	
	add_digit = function(_int)
	{
		if number_of_digits == 10
		{
			return;
		}
		typed_digits[number_of_digits] = _int;
		number_of_digits ++;
	}
	delete_last_digit = function()
	{
		if number_of_digits > 0
		{
			array_delete(typed_digits, number_of_digits - 1, 1);
			number_of_digits --;
		}
	}
	call = function()
	{
		var _string_typed_digits = int_array_to_string(typed_digits);
		var _char_id_possessing_typed_number = char_id_by_phone_number(_string_typed_digits)
		if  _char_id_possessing_typed_number != -1
		{
			var _char_nickname = global.characters[_char_id_possessing_typed_number].nickname;
			start_dialogue(_char_nickname, "Phone" + _char_nickname);
			return;
		}
		var _phone_numbers = global.phone_numbers;
		var _nb_phone_numbers = array_length(_phone_numbers);
		for(var _phone_number_id = 0; _phone_number_id < _nb_phone_numbers; _phone_number_id ++)
		{
			var _phone_number = _phone_numbers[_phone_number_id];
			if _phone_number.number == _string_typed_digits
			{
				start_dialogue("otherPhoneNumbers", _string_typed_digits);
				return;
			}
		}
		start_dialogue("otherPhoneNumbers", "NoNumberFound")
	}
	
	activity = function()
	{
		var _mouse_over_phone_key = instance_position(mouse_x, mouse_y, obj_phone_key);
		var _mouse_over_map_icone = instance_position(mouse_x, mouse_y, obj_icone_map);
		if left_click_released()
		{
			if pressed_phone_key != noone
			{
				switch(pressed_phone_key.action)
				{
					case PHONE_ACTIONS.ADD_0 :
					case PHONE_ACTIONS.ADD_1 :
					case PHONE_ACTIONS.ADD_2 :
					case PHONE_ACTIONS.ADD_3 :
					case PHONE_ACTIONS.ADD_4 :
					case PHONE_ACTIONS.ADD_5 :
					case PHONE_ACTIONS.ADD_6 :
					case PHONE_ACTIONS.ADD_7 :
					case PHONE_ACTIONS.ADD_8 :
					case PHONE_ACTIONS.ADD_9 :
					{
						add_digit(pressed_phone_key.action);
					}
					break;
					case PHONE_ACTIONS.DELETE :
					{
						delete_last_digit();
					}
					break;
					case PHONE_ACTIONS.CALL :
					{
						call();
					}
					break;
				}
			}
			if map_icone_is_pressed
			{
				change_room(rm_main_desk);
			}
		}
		if left_click_pressed()
		{
			if _mouse_over_phone_key != noone
			{
				pressed_phone_key = _mouse_over_phone_key;
			}
			if _mouse_over_map_icone != noone
			{
				map_icone_is_pressed = true;
			}
		}
		
		if pressed_phone_key != _mouse_over_phone_key
		{
			pressed_phone_key = noone;
		}
		if _mouse_over_map_icone == noone
		{
			map_icone_is_pressed = false;
		}
		
		
	}
	draw = function()
	{
		draw_set_alpha(1); draw_set_color(c_black); draw_set_font(fnt_small_titles); draw_set_valign(fa_middle); draw_set_halign(fa_center);
		draw_text(1010, 859, string(typed_digits));
	}
}