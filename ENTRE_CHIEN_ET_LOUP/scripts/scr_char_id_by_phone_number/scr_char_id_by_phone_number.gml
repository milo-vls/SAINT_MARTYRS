function char_id_by_phone_number(_phone_number_string)
{
	var _phone_numbers = global.phone_numbers;
	var _characters = global.characters;
	var _nb_chars = array_length(_characters);
	for (var _char_id = 0; _char_id < _nb_chars; _char_id ++)
	{
		var _phone_id = _characters[_char_id].get_phone_number_id()
		if _phone_id != -1
		{
			var _phone_number_string_of_character = _phone_numbers[_phone_id].number
			if _phone_number_string_of_character == _phone_number_string
			{
				return _char_id;
			}
		}
	}
	return -1;
}