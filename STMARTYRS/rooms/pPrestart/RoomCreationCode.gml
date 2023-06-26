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

if file_exists(SAVE_FILE_NAME)
{
	with instance_create_depth(0, 0, DEPTH_OJEU, ojeu)
	{
	charger_langue();
	initTranslation(global.language);
	}
	charger();
	room_goto(pstart);

}
else
{
	room_goto(pLanguageSelection);	  
}