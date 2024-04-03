

if nb_sounds_to_play > 0
{
	
	array_foreach(sounds_to_play, function(_sound_to_play)
	{
		audio_play_sound(_sound_to_play, SOUND_PRIORITY.EFFECT, false);
	});
	sounds_to_play = array_create(0);
	nb_sounds_to_play = 0;
}