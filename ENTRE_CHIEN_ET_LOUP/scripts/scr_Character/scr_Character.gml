function Character() constructor{}


function get_character_id_by_nickname(_nickname)
{
	var _character_id = -1;
	var _nb_characters = array_length(global.characters);
	for (var _i = 0; _i < _nb_characters; _i ++)
	{
		if global.characters[_i].nickname == _nickname then return _i;
	}
	
	show_error("The nickname \"" + _nickname + "\" doesn't exist.", true);
}
