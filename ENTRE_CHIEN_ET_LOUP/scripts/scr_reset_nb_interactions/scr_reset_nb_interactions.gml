function reset_nb_interactions()
{
	var _nb_chars = array_length(global.characters);
	
	for (var _char_index = 0; _char_index < _nb_chars; _char_index ++)
		global.characters[_char_index].nb_interactions_today = 0;
}