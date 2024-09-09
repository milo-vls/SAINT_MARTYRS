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