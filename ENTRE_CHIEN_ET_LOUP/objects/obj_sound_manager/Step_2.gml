

if nb_sounds_to_play > 0
{
	
	array_foreach(sounds_to_play, function(_sound_to_play)
	{
		if _sound_to_play.centered
		{
			audio_play_sound_at(_sound_to_play.sound_id, room_width/2, room_height/2, listener_z, 420.69, 30000, 0.3,  false , SOUND_PRIORITY.EFFECT, 10, 0, _sound_to_play.random_pitch ? random_range(0.2, 1.9) : 1);
		}
		else
		{
			audio_play_sound_at(_sound_to_play.sound_id, _sound_to_play.x, _sound_to_play.y, _sound_to_play.z, 420.69, 30000, 0.3,  false , SOUND_PRIORITY.EFFECT, 10);
		}
	});
	sounds_to_play = array_create(0);
	nb_sounds_to_play = 0;
}


