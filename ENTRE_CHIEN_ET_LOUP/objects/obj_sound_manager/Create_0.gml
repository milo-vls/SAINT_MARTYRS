enum SOUND_PRIORITY
{
	EFFECT,
	MUSIC
}
sounds_to_play = array_create(0);
nb_sounds_to_play = 0;
current_music = -1;
listener_z = 0;

audio_listener_set_orientation(0, 1, 1, 0, 0, 0, 1);
audio_falloff_set_model(audio_falloff_linear_distance);