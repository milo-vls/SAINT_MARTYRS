// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function init_menu_explo()
{
//lieuxToShow = array_create(0);
yCenterMapExplo = display_get_gui_height() *(3/8)
xCenterMapExplo = display_get_gui_width()/2
hMaxMapExplo = display_get_gui_height() *(10/16)
xMapExplo = xCenterMapExplo
yMapExplo = yCenterMapExplo
hMapExplo = 0 //tend vers hMaxMapExplo
//twerp
tpsHauteurMapExplo = 0
dureeHauteurMapExplo = room_speed * 0.5


	
	
	
	
//--OPTIONS
pauseOption[0] = {
txt : "Carte",
command : function(){
	ojeu.repertoire = false;
	GoToRoom(pcarte);
	},
pressed : false,
}
pauseOption[1] = {
txt : "Répertoire",
command : function(){
	ojeu.repertoire = !ojeu.repertoire
	},
pressed : false,
	
}
pauseOption[2] = {
txt : "Options",
command : noone,
pressed : false,
}
nbPauseOption = array_length(pauseOption);


pause = false;
iconeMenuPressed = false;
drawPauseMenu = false;

//--POSITIONS MENU GENERAL
lPauseOption = display_get_gui_width()/nbPauseOption;
hPauseMenu = display_get_gui_height()/4;
yPauseMenu = display_get_gui_height();
minYPauseMenu = display_get_gui_height() - hPauseMenu;
lSpr = sprite_get_height(sprPause);
hSpr = sprite_get_height(sprPause);
lgui  = display_get_gui_width();
hgui = display_get_gui_height();
xIconeMenu = lgui - lSpr*1.5;


//----------------REPERTOIRE
//le répertoire est il entrain d'être consulté ?
drawRepertoire = false;

//position et proportion répertoire
xRepertoire = display_get_gui_width();
mintarxRepertoire = display_get_gui_width()/2;
maxtarxRepertoire = display_get_gui_width();
tarxRepertoire = xRepertoire;
hRepertoire = display_get_gui_height() - hPauseMenu*1.5;
yRepertoire = hRepertoire/6;
lRepertoire = (16/10)*hRepertoire;  

scaleXCouverture = 1;//sert a tourner la page
tarscaleXCouverture = 1;
sprFleche = sprArr;
hsprFleche = sprite_get_height(sprFleche);
lsprFleche = sprite_get_width(sprFleche);
yFlecheRep = yRepertoire + hRepertoire - hsprFleche;
//position numéros
//liste des numéros aquis par le joueur	


margeVerticale = 50;
placeUsed = 0; //valeur à laquelle on ajoute toutes les hauteurs des numéros ajoutés jusque là
hZoneEcrivable = hRepertoire - margeVerticale*2;
nbPageRep = 0;
currentPageRepNum = 0;

		//---DESSIN BRAS DROIT
		xBrasDroit			= global.largeur_jeu - sprite_get_width(sprBrasDroit) + sprite_get_xoffset(sprBrasDroit);
		yBrasDroitBas		= global.hauteur_jeu + sprite_get_height(sprBrasDroit) - sprite_get_yoffset(sprBrasDroit);
		yBrasDroitHaut	= global.hauteur_jeu - sprite_get_height(sprBrasDroit) + sprite_get_yoffset(sprBrasDroit);
		yBrasDroit			= yBrasDroitBas;
}