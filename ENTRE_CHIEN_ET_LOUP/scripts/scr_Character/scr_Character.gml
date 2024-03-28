function Character() constructor{}


function get_character_id_by_nickname(_nickname)
{
	var _character_id = -1;
	var _nb_characters = array_length(global.characters);
	for (var _i = 0; _i < _nb_characters; _i ++)
	{
		if global.characters[_i].nickname == _nickname then return _i;
	}
	
	return show_error("The nickname \"" + _nickname + "\" doesn't exist.", true);
}
function get_character_by_nickname(_nickname)
{
	return global.characters[get_character_id_by_nickname(_nickname)];
}
function get_character_portrait_sprite(_nickname)
{
	return asset_get_index("spr_"+_nickname+"_portrait");
}