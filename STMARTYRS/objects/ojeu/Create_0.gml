
#macro DEPTH_OJEU 0
#macro DEPTH_TEXT 5

depth = DEPTH_OJEU;

blurFx = fx_create("_filter_large_blur")
blurLayer = layer_get_id("npc");
blur = false;
radiusBlur = 0;	//valeur qui évolue
blurDial = 8; //valeur visée


init_explo();
init_map();
init_time();
init_crimes_tueurs();
initPatterns();
init_usi();
init_objects();
init_map_tasks()
init_mini_game();
init_plage_texture();
init_personnages();
init_scribble_typist_events();

init_sound();

initTelephone();