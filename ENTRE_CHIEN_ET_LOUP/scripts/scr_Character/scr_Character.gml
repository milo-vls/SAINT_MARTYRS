function Character() constructor
{

	get_phone_number_id = function()
	{
		if phone_number_id == ""
		{
			return -1
		}
		return int64(phone_number_id);
	}
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