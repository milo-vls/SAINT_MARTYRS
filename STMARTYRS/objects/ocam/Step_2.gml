#macro view view_camera[0]
global.lcamZoom = camera_l * TauxZoom;
global.hcamZoom = camera_h * TauxZoom;
camera_set_view_size(view, global.lcamZoom, global.hcamZoom);

camera_set_view_pos(view, xCam, yCam);

//GUI
//if window_get_fullscreen() then display_set_gui_size(GAME_WIDTH, global.hauteur_jeu) else ;

