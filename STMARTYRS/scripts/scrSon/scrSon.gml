function init_sound(){

backgroundSound = noone;
backgroundMusic = noone;

}
function changeBackgroundSound(_newBGS)
{
	var _pastBGS = ojeu.backgroundSound;
	ojeu.backgroundSound = _newBGS;
	if _newBGS !=noone
	{
		if !audio_is_playing(_newBGS) audio_play_sound(_newBGS, 1, true);
	}
	else audio_stop_sound(_pastBGS)
}
function changeBackgroundMusic(_newBGM)
{
	var _pastBGM = ojeu.backgroundMusic;
	ojeu.backgroundMusic = _newBGM;
	if _newBGM != noone
	{
		if !audio_is_playing(_newBGM) audio_play_sound(_newBGM, 1, true);
	}
	else audio_stop_sound(_pastBGM)
}
