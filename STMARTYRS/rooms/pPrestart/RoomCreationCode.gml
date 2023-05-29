#macro GAME_WIDTH 1920
#macro GAME_HEIGHT 1080
#macro FRAME_RATE 60

global.alphaBlackScreen = 0
global.blackScreen = false;
global.lastRoom = noone;
global.startingRoom = P_PARKING_1;
global.canPause = false;

randomize();
instance_create_depth(0, 0, 0, oInputs);
game_set_speed(FRAME_RATE, gamespeed_fps);

if file_exists("save.data")
{
	/*CHARGER SAUVEGARDE 
	->déduire la langue
	->modifier l'écran titre
	*/
}
else
{
	room_goto(pLanguageSelection);	
}