


#macro view view_camera[0]
global.lcamZoom = camera_l;
global.hcamZoom = camera_h;
camera_set_view_size(view, global.lcamZoom, global.hcamZoom);

xCam = clamp(xCam, 0, room_width - global.lcamZoom);
yCam = clamp(yCam, 0, room_height - global.hcamZoom);
camera_set_view_pos(view, xCam, yCam);

//GUI
//if window_get_fullscreen() then display_set_gui_size(GAME_WIDTH, global.hauteur_jeu) else ;

