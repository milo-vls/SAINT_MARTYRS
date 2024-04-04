

if nb_sounds_to_play > 0
{
	
	array_foreach(sounds_to_play, function(_sound_to_play)
	{
		audio_play_sound_at(_sound_to_play.sound_id, _sound_to_play.x, _sound_to_play.y, _sound_to_play.z, 420.69, 30000, 0.3,  false , SOUND_PRIORITY.EFFECT, 10);
	});
	sounds_to_play = array_create(0);
	nb_sounds_to_play = 0;
}


