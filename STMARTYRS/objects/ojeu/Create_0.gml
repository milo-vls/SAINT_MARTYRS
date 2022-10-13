
randomize();
global.largeur_jeu = 1920;
global.hauteur_jeu = 1080;
global.frameRate = 30;
game_set_speed(global.frameRate, gamespeed_fps);

global.startingRoom = P_RUE_BLUE;
global.langage = "fr";//"fr" = français//"en" = anglais//"es" = espagnol
global.inputOn = true;
lastRoom = noone;
repertoire = false;

scribble_font_add_all();
#region flou
	blur = false;
	radiusBlur = 0;	//valeur qui évolue
	blurDial = 8; //valeur visée
#endregion
#region écran noir
	global.alphaBlackScreen = 0
	global.blackScreen = false;
#endregion
#region depths
#macro dpojeu 0
#macro dptxt 5
#endregion

init_time();
init_crimes_tueurs();
init_usi();
init_objects();

#region menu PAUSE, répertoire, bras droit
	#region pause
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
		pause = false;
		#region position et affichage 
			iconeMenuPressed = false;
		
			drawPauseMenu = false;

			nbPauseOption = array_length(pauseOption);

			lPauseOption = display_get_gui_width()/nbPauseOption;
			hPauseMenu = display_get_gui_height()/4;
			yPauseMenu = display_get_gui_height();
			minYPauseMenu = display_get_gui_height() - hPauseMenu;

			lSpr = sprite_get_height(sprPause);
			hSpr = sprite_get_height(sprPause);
			lgui  = display_get_gui_width();
			hgui = display_get_gui_height();
			xIconeMenu = lgui - lSpr*1.5;
		#endregion
	#endregion
	#region répertoire
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
		numObtenu[0] = noone;
		nbNumObtenu = 0;

		margeVerticale = 50;
		placeUsed = 0; //valeur à laquelle on ajoute toutes les hauteurs des numéros ajoutés jusque là
		hZoneEcrivable = hRepertoire - margeVerticale*2;
		nbPageRep = 0;

		currentPageRepNum = 0;
	#endregion
	#region bras droit
		xBrasDroit			= global.largeur_jeu - sprite_get_width(sprBrasDroit) + sprite_get_xoffset(sprBrasDroit);
		yBrasDroitBas		= global.hauteur_jeu + sprite_get_height(sprBrasDroit) - sprite_get_yoffset(sprBrasDroit);
		yBrasDroitHaut	= global.hauteur_jeu - sprite_get_height(sprBrasDroit) + sprite_get_yoffset(sprBrasDroit);
		yBrasDroit			= yBrasDroitBas;
	#endregion
#endregion

init_mini_game();
init_plage_texture();
init_personnages();
init_scribble_typist_events();
