function add_sound_to_play(_sound)
{
	array_push(obj_sound_manager.sounds_to_play, _sound);
	obj_sound_manager.nb_sounds_to_play ++;
}