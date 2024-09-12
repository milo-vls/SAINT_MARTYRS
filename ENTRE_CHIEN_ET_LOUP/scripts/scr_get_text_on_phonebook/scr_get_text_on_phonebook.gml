function get_phonebook_text(_phone_number_id)
{
	var _phone_number = global.phone_numbers[_phone_number_id];
	if _phone_number.text_id != ""
		return text_id_to_string(_phone_number.text_id);
	var _phone_number_string = get_phone_number_string(_phone_number);
	var _char_id = char_id_by_phone_number(_phone_number_string);
	if _char_id != -1
		return string_concat
		(
			global.characters[_char_id].nickname,
			" : ",
			_phone_number_string
		)	
		
	show_error("phone number " + _phone_number_string + " doesn't belong to anyone and doesn't have a description", true);
}