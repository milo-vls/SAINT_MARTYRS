

if explore()
{

	//---CLIQUE ET DESSIN DU +
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
			tpsHauteurMapExplo = 0;
			global.repertoire = false;
			iconeMenuPressed = false;
		}
	}
	else
	{
		iconeMenuPressed = false;
	}
	draw_set_alpha(1);
	draw_sprite(sprPause, 0, xIconeMenu, yIconeMenu);
			
	//---ACTIVATION DESSIN
	if pause
	{
		drawPauseMenu = true;
	}
			
			
	//DESSINS MENU + CLIQUE OPTION MENU
	if drawPauseMenu
	{
		//---DESSIN BANDEAU NOIR
		draw_set_color(c_black)
		draw_set_alpha(1);
		draw_rectangle(0, hgui , lgui, yPauseMenu, false);
				
		//---SETUP DESSIN TEXTE
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_font(ftMenu);
		draw_set_color(c_white);
		for (var i = 0; i < nbPauseOption; i ++ )
		{
			//---DONNÉES POUR DESSINER
			var _xPauseOption = lPauseOption*i;
			var _xtxtPauseOption = _xPauseOption + lPauseOption/2;
			var _txtcol = "c_white";
			var _shake = "";
					
					
			//---CLIQUER SUR UNE OPTION DU MENU PAUSE (+modif couleur texte)
			if pause 
			{		
				if point_in_rectangle(mouse_x, mouse_y, _xPauseOption, yPauseMenu, _xPauseOption + lPauseOption, hgui )
				{
					if global.cPrLeft and pauseOption[i].command != noone
					{
						playsound(snUi, 1);
						pauseOption[i].command();
					}
					draw_set_color(c_yellow);
					_txtcol = "c_yellow";
					_shake = "[shake]";
				}
			}
					
			//---DESSIN DU TEXTE DES OPTIONS
			scribble("["+_txtcol+"][fa_middle][fa_center][ftMenu]"+_shake+pauseOption[i].txt)
			.draw(_xtxtPauseOption, yPauseMenu + HAUTEUR_MENU_EXPLO/4)
					
		
		}
				
		

		
				
		//---POSITION DU BANDEAU + DÉSACTIVATION DESSIN
		if !pause  
		{
			yPauseMenu = approach(yPauseMenu, hgui , 40);
			var _tarHeightMapExplo = 0
			var _startHeight = hMaxMapExplo;
		
			if yPauseMenu >= hgui and hMapExplo == 0 //ET CARTE DISPARUE
			drawPauseMenu = false;
		}
		else
		{
			var _tarHeightMapExplo = hMaxMapExplo;
			var _startHeight = 0;
			yPauseMenu = approach(yPauseMenu, minYPauseMenu, 40);
		}
	
		
		//---DESSIN CARTE
		tpsHauteurMapExplo ++;
		hMapExplo		= twerp(TwerpType.out_elastic, _startHeight, _tarHeightMapExplo, tpsHauteurMapExplo/dureeHauteurMapExplo);	
		var _sprHeight = sprite_get_height(sprMap)
		var _scale			= hMapExplo / _sprHeight;
		var _x					= xCenterMapExplo - (sprite_get_width(sprMap)*_scale)/2
		var _y					= yCenterMapExplo -( _sprHeight*_scale)/2
		
		draw_sprite_ext(sprMap, 0, _x, _y, _scale, _scale, 0, -1, 1)
		
		
		//---DÉPLACEMENTS VIA CARTE
		if hMapExplo == hMaxMapExplo
		{
			draw_visitables(_scale, _x, _y);
			if global.cRlLeft
		{
			if  lieuSurvole != noone 
			{
				var _lieu = ojeu.lieu[lieuSurvole]
				GoToRoom(_lieu.piece)
				
				if _lieu.connu != CONNAISSANCE_LIEU.VISITE
				{
					_lieu.connu = CONNAISSANCE_LIEU.VISITE
					var _lenConnections = array_length(_lieu.connections)
					for (var i = 0;i < _lenConnections;i ++)
					{
						if ojeu.lieu[_lieu.connections[i]].connu == CONNAISSANCE_LIEU.INCONNU{ojeu.lieu[_lieu.connections[i]].connu = CONNAISSANCE_LIEU.JUXTAPOSE}
					}
				}
			}
		}
		}
	}
		
	
	drawRep();


	
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
/*
	draw_set_alpha(1);
	draw_set_font(ftDial);
	draw_set_color(c_fuchsia);
	draw_text(50, 50, "heure globale"+string(date_get_day(global.currentDate))+ "  " + string(date_get_hour(global.currentDate))+":"+string(date_get_minute(global.currentDate)));
	draw_text(50, 150, "heure carte"+string(date_get_day(global.mapDate))+ "  " + string(date_get_hour(global.mapDate))+":"+string(date_get_minute(global.mapDate)));
	draw_text(50, 250, "secondes restantes" +string(time_source_get_time_remaining(minuterie)));
*/
#endregion
