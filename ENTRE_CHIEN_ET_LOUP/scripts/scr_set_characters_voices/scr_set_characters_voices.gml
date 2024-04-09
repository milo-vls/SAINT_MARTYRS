function set_characters_voices()
{
	var _characters_voices_to_return = ds_map_create();
	var _nb_characters =  array_length(global.characters);
	for (var _character_id = 0; _character_id < _nb_characters; _character_id ++)
	{
		var _character = global.characters[_character_id];
		var _character_voices = array_create(0);
		var _nickname = _character.nickname;
		var _nb_voices = 1;
		while (_nb_voices > -1)
		{
			var _sound_index = asset_get_index("snd_voice_" + _nickname+"_" + string(_nb_voices));
			if _sound_index != -1
			{
				array_push(_character_voices, _sound_index);
				_nb_voices ++;
			}
			else
			{
				_nb_voices = -1;
			}
		}
		ds_map_add(_characters_voices_to_return, _character_id, _character_voices);
	}
	return _characters_voices_to_return;
}