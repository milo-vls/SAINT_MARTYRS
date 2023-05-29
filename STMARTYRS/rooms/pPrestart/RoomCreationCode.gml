
randomize();
global.alphaBlackScreen = 0
global.largeur_jeu = 1920;
global.hauteur_jeu = 1080;
#macro GAME_WIDTH 1920
#macro GAME_HEIGHT 1080
global.frameRate = 30;
global.startingRoom = pLanguageSelection;
game_set_speed(global.frameRate, gamespeed_fps);
global.blackScreen = false;
global.lastRoom = noone;

instance_create_depth(0, 0, 0, oInputs);

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