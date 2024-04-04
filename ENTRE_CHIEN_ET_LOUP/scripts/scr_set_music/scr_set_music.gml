function set_music(_music_index)
{
	with obj_sound_manager
	{
		if _music_index > -1 and _music_index != current_music
		{
			current_music = _music_index;
			audio_play_sound(current_music, SOUND_PRIORITY.MUSIC, true);
		}
	}
}