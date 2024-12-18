function Character() constructor
{
	nb_interactions_today = 0;
}

function phone_number_id_by_character_id(_char_id)
{
	var _char = global.characters[_char_id];
	if _char.phone_number_id == ""
		return -1;
	return int64(phone_number_id);
}

function character_may_appear(_char_id)
{
	var _to_return = global.characters[_char_id].may_appear == "1";
	
	return _to_return;
}

function get_character_full_name(_char_id)
{
	var _char = global.characters[_char_id];
	return string_concat(_char.first_name, " ",_char.last_name);
}

function character_get_first_name(_char_id)
{
	return global.characters[_char_id].first_name;
}

function character_get_last_name(_char_id)
{
	return global.characters[_char_id].last_name;
}

///@param {String} _last_name
function get_characters_ids_by_last_name(_last_name)
{
	var _chars = global.characters;
	var _chars_ids_by_last_name = array_create(0);
	var _nb_chars = array_length(global.characters);
	
	for (var _char_id = 0; _char_id < _nb_chars; _char_id ++)
		if string_equals_ignore_cases(_chars[_char_id].last_name, _last_name)
			array_push(_chars_ids_by_last_name, _char_id);
	
	return _chars_ids_by_last_name;
	
}

///@param {String} _first_name
///@param {String} _last_name
function get_character_id_by_full_name(_first_name, _last_name)
{
	var _shearched_full_name = string_concat(_first_name, " ", _last_name)
	var _chars = global.characters;
	var _nb_chars = array_length(global.characters);
	
	for (var _char_id = 0; _char_id < _nb_chars; _char_id ++)
		if string_equals_ignore_cases(get_character_full_name(_char_id), _shearched_full_name)
			return _char_id;
	return -1;
}


function get_character_id_by_nickname(_nickname)
{
	var _character_id = -1;
	var _nb_characters = array_length(global.characters);
	for (var _i = 0; _i < _nb_characters; _i ++)
	{
		if global.characters[_i].nickname == _nickname then 
		return _i;
	}
	return _character_id;
}
function get_character_by_nickname(_nickname)
{
	return global.characters[get_character_id_by_nickname(_nickname)];
}
function get_character_portrait_sprite(_nickname)
{
	if _nickname == NO_ONE
		return spr_character_noone;
	var _sprite = asset_get_index(get_character_by_nickname(_nickname).sprite);
	if sprite_exists(_sprite)
		return _sprite;
	return spr_character_noone;
}
function get_characters_by_address_id(_address_id)
{
	var _chars = global.characters;
	var _nb_chars = array_length(_chars);
	var _chars_found = array_create(0);
	
	if _address_id < 0 
		return _chars_found
	
	
	for (var _char_id = 0; _char_id < _nb_chars; _char_id ++)
		if _chars[_char_id].address_id == string(_address_id)
		 array_push(_chars_found, _char_id);
		 
	return _chars_found;
}

///@param {String} _first_name
function character_of_this_first_name_exists(_first_name)
{
	var _chars = global.characters;
	var _nb_chars = array_length(_chars);
	
	for (var _char_i = 0; _char_i < _nb_chars; _char_i ++)
	{
		if _chars[_char_i].first_name == _first_name
			return true;
	}
	
	return false;
}


///@param {String} _first_name
///@param {String} _last_name
function get_character_id_from_full_name(_first_name, _last_name)
{
	var _chars = global.characters;
	var _nb_chars = array_length(_chars);
	
	for (var _char_i = 0; _char_i < _nb_chars; _char_i ++)
	{
		var _char = _chars[_char_i]
		if _char.first_name == _first_name
		and _char.last_name == _last_name
			return _char_id;
	}
	
	return -1;
}