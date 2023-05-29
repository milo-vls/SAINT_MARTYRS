//dessin
depth = DEPTH_OJEU +1
var _idlayer = layer_get_id("Background");
idBackground = layer_background_get_id(_idlayer);
var _ninesliceFauxEcran = sprite_get_nineslice(sprContourOrdi);
yTopEcran = _ninesliceFauxEcran.top;
hauteurFauxEcran = display_get_gui_height() - _ninesliceFauxEcran.top - _ninesliceFauxEcran.bottom;
hauteurCadreScroller = hauteurFauxEcran - 10;
yMin = yTopEcran - 180;
yAjoute = yMin;
yCadreScroller = yTopEcran;
yScroller = yCadreScroller;

loadPageWeb("base");


xScroller = display_get_gui_width() - 275;
lScroller = sprite_get_width(sprCadreScroller);
scrollerPressed = false;










//input
charsInputJoueur = "";	//Texte input par le joueur jusque là
canPlayerInput =true;//le joueur est il en mesure d'entrer des input ?
keyboard_lastchar = -1;
