
randomize();
global.largeur_jeu = 1920;
global.hauteur_jeu = 1080;
global.frameRate = 30;
game_set_speed(global.frameRate, gamespeed_fps);
#macro dpojeu 0
#macro dptxt 5
global.startingRoom = pcarte;
global.langage = "fr";//"fr" = français//"en" = anglais//"es" = espagnol
global.inputOn = true;
lastRoom = noone;
repertoire = false;
global.alphaBlackScreen = 0
global.blackScreen = false;
scribble_font_add_all();

blur = false;
radiusBlur = 0;	//valeur qui évolue
blurDial = 8; //valeur visée




init_map();
init_time();
init_crimes_tueurs();
init_usi();
init_objects();
init_menu_explo()
init_map_tasks()
init_mini_game();
init_plage_texture();
init_personnages();
init_scribble_typist_events();
init_resurgence();