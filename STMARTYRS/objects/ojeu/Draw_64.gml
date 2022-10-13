depth = dpojeu;

if room != pstart and room != pcarte and !instance_exists(oDial) and !instance_exists(oParentManagerMG)
{

	#region menu explo
		#region menu pause général
			yIconeMenu = yPauseMenu - lSpr*1.5;

			if point_in_rectangle(mouse_x, mouse_y, xIconeMenu, yIconeMenu, xIconeMenu + lSpr, yIconeMenu + hSpr)
			{
				if global.cPrLeft
				{
					iconeMenuPressed = true;
				}
				if global.cRlLeft and iconeMenuPressed
				{
					pause = !pause;
					repertoire = false;
					iconeMenuPressed = false;
				}
			}
			else
			{
				iconeMenuPressed = false;
			}

			draw_set_alpha(1);

			draw_sprite(sprPause, 0, xIconeMenu, yIconeMenu);

			if pause
			{
				drawPauseMenu = true;
			}
			if drawPauseMenu
			{
				draw_set_color(c_black)
				draw_set_alpha(1);
				draw_rectangle(0, hgui , lgui, yPauseMenu, false);
	
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
	
				draw_set_font(ftMenu);
				for (var i = 0; i < nbPauseOption; i ++ )
				{
					var _xPauseOption = lPauseOption*i;
					var _xtxtPauseOption = _xPauseOption + lPauseOption/2;
					var _txtcol = "c_white";
					var _shake = "";
					draw_set_color(c_white);
					if pause 
					{		
						if point_in_rectangle(mouse_x, mouse_y, _xPauseOption, yPauseMenu, _xPauseOption + lPauseOption, hgui )
						{
							if global.cPrLeft
							{
								if pauseOption[i].command != noone
								pauseOption[i].command();
							}
							draw_set_color(c_yellow);
							_txtcol = "c_yellow";
							_shake = "[shake]";
						}
					}
					scribble("["+_txtcol+"][fa_middle][fa_center]"+_shake+pauseOption[i].txt)
					.draw(_xtxtPauseOption, yPauseMenu + hPauseMenu/4)
					//draw_text(_xtxtPauseOption, yPauseMenu + hPauseMenu/2, pauseOption[i].txt);
		
				}

				if !pause  
				{
					yPauseMenu = approach(yPauseMenu, hgui , 40);
		
		
					if yPauseMenu >= hgui 
					drawPauseMenu = false;
				}
				else
				{
					yPauseMenu = approach(yPauseMenu, minYPauseMenu, 40);
				}
			}
		#endregion
		#region répertoire
			if repertoire
			{
				drawRepertoire = true;
	
			}
			if drawRepertoire
			{
	
				//comment doit évoluer la scale
				//BOUTTON PAGES SUIVANTES/PRCEDENTES
				if repertoire
				{
					tarxRepertoire = mintarxRepertoire;
					tarscaleXCouverture = -1;
		
		
		
					//-----BOUTTONS
					if scaleXCouverture == -1
					{
						//flèche à droite
						if (currentPageRepNum + 1 ) < nbPageRep
						{
							var _xFlecheDroite = xRepertoire + lRepertoire/2;
							draw_sprite(sprArr, 0, _xFlecheDroite, yFlecheRep);
				
							if point_in_rectangle(mouse_x, mouse_y, _xFlecheDroite, yFlecheRep, _xFlecheDroite + lsprFleche, yFlecheRep + hsprFleche) and global.cPrLeft
							{
								currentPageRepNum += 2;
							}
				
						}
						//flèche à gauche si la page est différente de 0
						if currentPageRepNum != 0
						{
							var _xFlecheGauche = xRepertoire - lRepertoire/2;
							draw_sprite_ext(sprArr, 0, _xFlecheGauche, yFlecheRep, -1, 1, 0, -1, 1);
				
							if point_in_rectangle(mouse_x, mouse_y, _xFlecheGauche, yFlecheRep, _xFlecheGauche - lsprFleche, yFlecheRep + hsprFleche) and global.cPrLeft
							{
								currentPageRepNum -= 2;
							}
				
						}
					}
				}
				else
				{
					tarxRepertoire = maxtarxRepertoire
					tarscaleXCouverture = 1;
				}
				if scaleXCouverture == tarscaleXCouverture
				xRepertoire = approach(xRepertoire, tarxRepertoire, 60);
				scaleXCouverture = approach(scaleXCouverture, tarscaleXCouverture, 0.2);

				//-----DESSIN------//
				//page droite
				draw_sprite_stretched(sprPageRepertoire, 0, xRepertoire, yRepertoire, lRepertoire/2, hRepertoire);
				//page gauche
				var _scalePageGauche = abs(scaleXCouverture);
				if scaleXCouverture <= 0
				{
					draw_sprite_stretched(sprPageRepertoireGauche, 0, xRepertoire - lRepertoire/2*_scalePageGauche, yRepertoire, lRepertoire/2*_scalePageGauche, hRepertoire);
				}
				//couverture
				draw_sprite_stretched(sprCouvRep, 0, xRepertoire, yRepertoire, lRepertoire/2*scaleXCouverture, hRepertoire);
	
	
				//dessin numéro
				var _xNumPageGauche = xRepertoire - lRepertoire/4*_scalePageGauche;
				var _xNumPageDroite = xRepertoire + lRepertoire/4*_scalePageGauche;
				var _yNumMin = yRepertoire + margeVerticale;
				draw_set_font(ftRep);
				draw_set_color(c_black);
				draw_set_valign(fa_top);
				draw_set_halign(fa_center);
				nbNumero = nbPersonnages;
				if scaleXCouverture <= 0
				for (var i = 0;i < nbNumero;i ++)
				{
					//page gauche
					if global.char[i].page == currentPageRepNum
					{
						if 	global.char[i].spr != noone
						{
							draw_sprite_ext(global.char[i].spr, 0, _xNumPageGauche, _yNumMin+global.char[i].y, _scalePageGauche, 1, 0, -1, 1);
						}
						else
						{
							draw_text_ext_transformed(_xNumPageGauche, _yNumMin+global.char[i].y, string(global.char[i].num), 13, lRepertoire, _scalePageGauche, 1, 0);
						}
					}
					//page droite
					if global.char[i].page == currentPageRepNum + 1
					{
						if 	global.char[i].spr != noone
						{
							draw_sprite_ext(global.char[i].spr, 0, _xNumPageDroite, _yNumMin+global.char[i].y, 1, 1, 0, -1, 1);
						}
						else
						{
							draw_text_ext_transformed(_xNumPageDroite, _yNumMin+global.char[i].y, string(global.char[i].num), 13, lRepertoire, 1, 1, 0);
						}
					}
				}
	
	
	
	
	
	
	
	
	
				//stop dessin
				if !repertoire and xRepertoire == maxtarxRepertoire and scaleXCouverture == 1
				{
					drawRepertoire = false;
				}
			}
		#endregion
	#endregion
	#region montre bras droit
		yBrasDroit = yBrasDroitBas;

		#region commande
			if global.cRight and !pause
			{
				yBrasDroit = yBrasDroitHaut;
			}
		#endregion
		#region dessin
			#region desin bras et cadran montre
				draw_set_alpha(1);
				draw_sprite(sprBrasDroit, 0, xBrasDroit, yBrasDroit);
			#endregion
			#region dessin aigüilles
				
				var _rotAigHeure		= -360 * (date_get_hour(global.currentDate)/24);
				var _rotAigMinute		= -360 * (date_get_minute(global.currentDate)/60);
				draw_sprite_ext(sprAiguilleHeure, 0, xBrasDroit, yBrasDroit, 1, 1, _rotAigHeure, -1, 1);
				draw_sprite_ext(sprAiguilleMinute, 0, xBrasDroit, yBrasDroit, 1, 1, _rotAigMinute, -1, 1);
			#endregion
		#endregion
			

	#endregion
}


#region black screen
	if global.blackScreen == true
	{
		global.alphaBlackScreen = approach(global.alphaBlackScreen, 2, 0.2);
	}
	if global.blackScreen == false
	{
		global.alphaBlackScreen = approach(global.alphaBlackScreen, 0, 0.125);
	}
	draw_set_alpha(global.alphaBlackScreen)
	if global.alphaBlackScreen != 0
	{
		draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
	}
#endregion


#region debogage
	draw_set_alpha(1);
	draw_set_font(ftDial);
	draw_set_color(c_fuchsia);
	draw_text(50, 50, "heure globale"+string(date_get_day(global.currentDate))+ "  " + string(date_get_hour(global.currentDate))+":"+string(date_get_minute(global.currentDate)));
	draw_text(50, 150, "heure carte"+string(date_get_day(global.mapDate))+ "  " + string(date_get_hour(global.mapDate))+":"+string(date_get_minute(global.mapDate)));
	draw_text(50, 250, "secondes restantes" +string(time_source_get_time_remaining(minuterie)));

#endregion
