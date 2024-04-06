
function rm_game_over_init()
{	
	add_menu(new GameOver());
	add_sound_to_play(new Sound(snd_game_over, 0, 0, 0, true, 5));
}