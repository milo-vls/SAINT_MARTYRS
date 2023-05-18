function drawRepInit()
{
	global.repertoire = false;
	global.drawRepertoire = false;
	global.repEnMain = false;
	global.decalageMainRepertoire = 0;
	global.tarscaleXCouverture = 1;
	global.scaleXCouverture = 1;
	global.currentPageRepNum = 0;
	global.hsprFleche = sprite_get_height(sprArr);
	global.largeurRepertoire = (16/10) *( display_get_gui_height() - display_get_gui_height()/4*1.5)
	global.xRepertoire = MAX_TAR_X_REPERTOIRE;
	global.tarxRepertoire = global.xRepertoire;
	
	#macro HAUTEUR_MENU_EXPLO display_get_gui_height()/4
	#macro MAX_TAR_X_REPERTOIRE display_get_gui_width() - global.largeurRepertoire/7
	#macro DECALAGE_REPERTOIRE global.largeurRepertoire/7
	#macro MIN_TAR_X_REPERTOIRE display_get_gui_width()/2
	#macro HAUTEUR_REPERTOIRE display_get_gui_height() - display_get_gui_height()/4*1.5
	#macro Y_REPERTOIRE (display_get_gui_height() - display_get_gui_height()/4*1.5)/6
	#macro LARGEUR_REPERTOIRE  global.largeurRepertoire
	#macro REPERTOIRE_VERTICAL_BUFFER  50
	#macro VITESSE_X_REPERTOIRE 30
	#macro VITESSE_DEPLI_REPERTOIRE 0.2
}
drawRepInit();

function drawRep()
{
draw_set_alpha(1);
//---ACTIVATION DESSIN CAHIER ET NUMÉROS
if global.repertoire
{
	global.drawRepertoire = true;
}

//---POSITION RÉPERTOIRE
if !global.repEnMain//global.scaleXCouverture == global.tarscaleXCouverture
{
	global.xRepertoire = approach(global.xRepertoire, global.tarxRepertoire, VITESSE_X_REPERTOIRE);
}
else
{
	global.xRepertoire = mouse_x - global.decalageMainRepertoire;
}

//---DESSIN PAGES
if global.drawRepertoire
{
	
	//comment doit évoluer la scale
	//BOUTTON PAGES SUIVANTES/PRCEDENTES
	if global.repertoire
	{
		global.tarxRepertoire = MIN_TAR_X_REPERTOIRE;
		global.tarscaleXCouverture = -1;
		
		
		
		//-----BOUTTONS
		if global.scaleXCouverture == -1
		{
			var _lsprFleche = sprite_get_width(sprArr);
			var _yFlecheRep = Y_REPERTOIRE + HAUTEUR_REPERTOIRE - global.hsprFleche;
			//flèche à droite
			if (global.currentPageRepNum + 1 ) < ojeu.nbPageRep
			{
				var _xFlecheDroite = global.xRepertoire + LARGEUR_REPERTOIRE/2;
				draw_sprite(sprArr, 0, _xFlecheDroite, _yFlecheRep);
				
				if point_in_rectangle(mouse_x, mouse_y, _xFlecheDroite, _yFlecheRep, _xFlecheDroite + _lsprFleche, _yFlecheRep + global.hsprFleche) and global.cPrLeft
				{
					global.currentPageRepNum += 2;
				}
				
			}
			//flèche à gauche si la page est différente de 0
			if global.currentPageRepNum != 0
			{
				var _xFlecheGauche = global.xRepertoire - LARGEUR_REPERTOIRE/2;
				draw_sprite_ext(sprArr, 0, _xFlecheGauche, _yFlecheRep, -1, 1, 0, -1, 1);
				
				if point_in_rectangle(mouse_x, mouse_y, _xFlecheGauche, _yFlecheRep, _xFlecheGauche - _lsprFleche, _yFlecheRep + global.hsprFleche) and global.cPrLeft
				{
					global.currentPageRepNum -= 2;
				}
				
			}
		}
	}
	else
	{
		global.tarxRepertoire = MAX_TAR_X_REPERTOIRE;
		global.tarscaleXCouverture = 1;
	}
		
		

	
	global.scaleXCouverture = approach(global.scaleXCouverture, global.tarscaleXCouverture, VITESSE_DEPLI_REPERTOIRE);

	//-----DESSIN------//
	//page droite
	draw_sprite_stretched(sprPageRepertoire, 0, global.xRepertoire, Y_REPERTOIRE, LARGEUR_REPERTOIRE/2, HAUTEUR_REPERTOIRE);
	//page gauche
	var _scalePageGauche = abs(global.scaleXCouverture);
	if global.scaleXCouverture <= 0
	{
		draw_sprite_stretched(sprPageRepertoireGauche, 0, global.xRepertoire - LARGEUR_REPERTOIRE/2*_scalePageGauche, Y_REPERTOIRE, LARGEUR_REPERTOIRE/2*_scalePageGauche, HAUTEUR_REPERTOIRE);
	}
		
	
	//dessin numéro
	var _xNumPageGauche = global.xRepertoire - LARGEUR_REPERTOIRE/4*_scalePageGauche;
	var _xNumPageDroite = global.xRepertoire + LARGEUR_REPERTOIRE/4*_scalePageGauche;
	var _yNumMin = Y_REPERTOIRE + REPERTOIRE_VERTICAL_BUFFER;
	draw_set_font(ftRepertoire);
	draw_set_color(c_black);
	draw_set_valign(fa_top);
	draw_set_halign(fa_center);
	var _nbNumero = array_length(ojeu.num);
	if global.scaleXCouverture <= 0
	for (var i = 0;i < _nbNumero;i ++)
	{
		//page gauche
		if ojeu.num[i].page == global.currentPageRepNum
		{
			if ojeu.num[i].sprite != noone
			{
				draw_sprite_ext(ojeu.num[i].sprite, 0, _xNumPageGauche, _yNumMin+ojeu.num[i].y, _scalePageGauche, 1, 0, -1, 1);
			}
			else
			{
				draw_text_ext_transformed(_xNumPageGauche, _yNumMin+ojeu.num[i].y, ojeu.num[i].numero, 13, LARGEUR_REPERTOIRE, _scalePageGauche, 1, 0);
			}
		}
		//page droite
		if ojeu.num[i].page == global.currentPageRepNum + 1
		{
			if 	ojeu.num[i].sprite != noone
			{
				draw_sprite_ext(ojeu.num[i].sprite, 0, _xNumPageDroite, _yNumMin+ojeu.num[i].y, 1, 1, 0, -1, 1);
			}
			else
			{
				draw_text_ext_transformed(_xNumPageDroite, _yNumMin+ojeu.num[i].y, ojeu.num[i].numero, 13, LARGEUR_REPERTOIRE, 1, 1, 0);
			}
		}
	}
	
		
	//stop dessin
	if !global.repertoire and global.xRepertoire == MAX_TAR_X_REPERTOIRE and global.scaleXCouverture == 1
	{
		global.drawRepertoire = false;
	}
}

//---DESSIN COUVERTURE
draw_sprite_stretched(sprCouvRep, 0, global.xRepertoire, Y_REPERTOIRE, LARGEUR_REPERTOIRE/2*global.scaleXCouverture, HAUTEUR_REPERTOIRE);

//---INPUTS
if !global.repertoire
{
	if point_in_rectangle(mouse_x, mouse_y, global.xRepertoire, Y_REPERTOIRE, global.xRepertoire + DECALAGE_REPERTOIRE * global.scaleXCouverture, Y_REPERTOIRE + HAUTEUR_REPERTOIRE)
	{
		if (global.cPrLeft)
		{
			global.decalageMainRepertoire = mouse_x - global.xRepertoire;
			global.repEnMain = true;
		}
		if (global.cRlLeft) global.repEnMain = false;
	
	
	
	}
	else
	{
		global.repEnMain = false;
	}
}
else
{
	if !point_in_rectangle(mouse_x, mouse_y, global.xRepertoire - LARGEUR_REPERTOIRE/2, Y_REPERTOIRE, global.xRepertoire + LARGEUR_REPERTOIRE/2, Y_REPERTOIRE + HAUTEUR_REPERTOIRE) and global.cPrLeft
	{
		global.repertoire = false;
	}
}

//---MANIPULATION DU RÉPERTOIRE
if global.repEnMain
{
	if global.repertoire == false
	{
		if mouse_x < GAME_WIDTH*2/3
		{
			global.repEnMain = false;
			global.repertoire = true;
		}
	}
	else
	{
		if mouse_x > GAME_WIDTH/2 
		{
			global.repEnMain = false;
			global.repertoire = false;
		}
	}
}

}