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
	global.repertoire = false;
	GoToRoom(pcarte);
	},
pressed : false,
}
pauseOption[1] = {
txt : "Répertoire",
command : function(){
	global.repertoire = !global.repertoire
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
#macro HAUTEUR_MENU_EXPLO display_get_gui_height()/4
yPauseMenu = display_get_gui_height();
minYPauseMenu = display_get_gui_height() - HAUTEUR_MENU_EXPLO;
lSpr = sprite_get_height(sprPause);
hSpr = sprite_get_height(sprPause);
lgui  = display_get_gui_width();
hgui = display_get_gui_height();
xIconeMenu = lgui - lSpr*1.5;


//----------------REPERTOIRE
//le répertoire est il entrain d'être consulté ?


//position et proportion répertoire








//sert a tourner la page




//position numéros
//liste des numéros aquis par le joueur	



placeUsed = 0; //valeur à laquelle on ajoute toutes les hauteurs des numéros ajoutés jusque là
hZoneEcrivable = HAUTEUR_REPERTOIRE - REPERTOIRE_VERTICAL_BUFFER*2;



	//---DESSIN BRAS DROIT
	xBrasDroit			= global.largeur_jeu - sprite_get_width(sprBrasDroit) + sprite_get_xoffset(sprBrasDroit);
	yBrasDroitBas		= global.hauteur_jeu + sprite_get_height(sprBrasDroit) - sprite_get_yoffset(sprBrasDroit);
	yBrasDroitHaut	= global.hauteur_jeu - sprite_get_height(sprBrasDroit) + sprite_get_yoffset(sprBrasDroit);
	yBrasDroit			= yBrasDroitBas;
}