
display_set_gui_size(GAME_WIDTH, GAME_HEIGHT);
camera_l = 1920;
camera_h = 1080;

xCam = 0;
yCam = 0;
resetingPosition = false;
function resetPosition()
{
	ocam.resetingPosition = true;
}


TauxZoom = 1;
tarTauxZoom = 1;
function resetZoom()
{
	ocam.tarTauxZoom = 1;
}

function resetCam()
{
	ocam.resetPosition();
	ocam.resetZoom();
}


window_set_size(GAME_WIDTH, GAME_HEIGHT);
alarm[0] = 1;
surface_resize(application_surface, GAME_WIDTH, GAME_HEIGHT);


