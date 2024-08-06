#macro PAPER_WINDS_COUNT 9

function play_paper_wind(_x, _y, _center)
{
	var _snd_paper_wind_randomized = asset_get_index("snd_paper_wind_" + string(irandom(PAPER_WINDS_COUNT)));
	
	add_sound_to_play(new Sound(_snd_paper_wind_randomized, _x, _y, 0, _center, -1, true) );
}