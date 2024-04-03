function add_sound_to_play(_sound_index)
{
	with obj_sound_manager
	{
		array_push(sounds_to_play, _sound_index);
		nb_sounds_to_play ++;
	}
}