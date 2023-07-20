if resetingPosition
{
	xCam = approach(xCam, 0, 20);
	yCam = approach(yCam, 0, 20);
	
	if xCam == 0 and yCam == 0 then resetingPosition = false;
	
}

TauxZoom = approach(TauxZoom, tarTauxZoom, 25)



#macro view view_camera[0]
global.lcamZoom = camera_l / TauxZoom;
global.hcamZoom = camera_h / TauxZoom;
camera_set_view_size(view, global.lcamZoom, global.hcamZoom);

xCam = clamp(xCam, 0, room_width - global.lcamZoom);
yCam = clamp(yCam, 0, room_height - global.hcamZoom);
camera_set_view_pos(view, xCam, yCam);

//GUI
//if window_get_fullscreen() then display_set_gui_size(GAME_WIDTH, global.hauteur_jeu) else ;

