
display_set_gui_size(global.largeur_jeu, global.hauteur_jeu);
camera_l = 1920;
camera_h = 1080;

xCam = 0;
yCam = 0;



window_set_size(global.largeur_jeu, global.hauteur_jeu);
alarm[0] = 1;
surface_resize(application_surface, global.largeur_jeu, global.hauteur_jeu);
#region carte
vtsZoom = 0.05;
TauxZoom = 1;
zoomage = false;
vBord = 100;
hBord = 100;
#endregion