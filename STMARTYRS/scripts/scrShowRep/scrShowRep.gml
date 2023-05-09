function drawRepInit()
{
	global.repertoire = false;
	global.drawRepertoire = false;
	global.xRepertoire = display_get_gui_width();
	global.tarxRepertoire = global.xRepertoire;
	global.tarscaleXCouverture = 1;
	global.scaleXCouverture = 1;
	global.currentPageRepNum = 0;
	global.hsprFleche = sprite_get_height(sprArr);
	
	#macro MAX_TAR_X_REPERTOIRE display_get_gui_width()
	#macro MIN_TAR_X_REPERTOIRE display_get_gui_width()/2
	#macro HAUTEUR_REPERTOIRE display_get_gui_height() - HAUTEUR_MENU_EXPLO*1.5
	#macro Y_REPERTOIRE HAUTEUR_REPERTOIRE/6
	#macro LARGEUR_REPERTOIRE  (16/10)*HAUTEUR_REPERTOIRE
	#macro REPERTOIRE_VERTICAL_BUFFER  50
}
drawRepInit();

function drawRep()
{

//---ACTIVATION DESSIN CAHIER ET NUMÉROS
if global.repertoire
{
	global.drawRepertoire = true;
	
}
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
		
		
		
		
	if global.scaleXCouverture == global.tarscaleXCouverture
	global.xRepertoire = approach(global.xRepertoire, global.tarxRepertoire, 60);
	global.scaleXCouverture = approach(global.scaleXCouverture, global.tarscaleXCouverture, 0.2);

	//-----DESSIN------//
	//page droite
	draw_sprite_stretched(sprPageRepertoire, 0, global.xRepertoire, Y_REPERTOIRE, LARGEUR_REPERTOIRE/2, HAUTEUR_REPERTOIRE);
	//page gauche
	var _scalePageGauche = abs(global.scaleXCouverture);
	if global.scaleXCouverture <= 0
	{
		draw_sprite_stretched(sprPageRepertoireGauche, 0, global.xRepertoire - LARGEUR_REPERTOIRE/2*_scalePageGauche, Y_REPERTOIRE, LARGEUR_REPERTOIRE/2*_scalePageGauche, HAUTEUR_REPERTOIRE);
	}
	//couverture
	draw_sprite_stretched(sprCouvRep, 0, global.xRepertoire, Y_REPERTOIRE, LARGEUR_REPERTOIRE/2*global.scaleXCouverture, HAUTEUR_REPERTOIRE);
	
	
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


}