#macro view view_camera[0]
global.lcamZoom = camera_l * TauxZoom;
global.hcamZoom = camera_h * TauxZoom;
camera_set_view_size(view, global.lcamZoom, global.hcamZoom);

if room == pcarte
{
	xCam = 0;
	yCam = 0;
}
else
{
	xCam = 0;
	yCam = 0;
}


camera_set_view_pos(view, xCam, yCam);

//GUI
//if window_get_fullscreen() then display_set_gui_size(global.largeur_jeu, global.hauteur_jeu) else ;

