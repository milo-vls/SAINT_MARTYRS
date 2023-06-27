

/*function init_menu_explo()
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

nbPauseOption = array_length(pauseOption);


iconeMenuPressed = false;
drawPauseMenu = false;

//--POSITIONS MENU GENERAL
lPauseOption = display_get_gui_width()/nbPauseOption;

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







	//---DESSIN BRAS DROIT
	xBrasDroit			= GAME_WIDTH - sprite_get_width(sprBrasDroit) + sprite_get_xoffset(sprBrasDroit);
	yBrasDroitBas		= GAME_HEIGHT + sprite_get_height(sprBrasDroit) - sprite_get_yoffset(sprBrasDroit);
	yBrasDroitHaut	= GAME_HEIGHT - sprite_get_height(sprBrasDroit) + sprite_get_yoffset(sprBrasDroit);
	yBrasDroit			= yBrasDroitBas;
}