draw_set_alpha(1);



if ojeu.tenseNight == false
{
	if currentMenu == MAP_MENU.EXPLO
	{
		draw_set_alpha(1)
		draw_visitables();
	}

	draw_set_color(#829460 );
	draw_set_alpha(1);
	draw_sprite_stretched_ext(sprBarreSup, 0, 0, 0, wBarreSup, hBarreSup, #829460, 1);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(ftMenu);
	draw_set_color(c_white);

	for(var i = 0 ; i <nbMapOption ; i ++)
	{
		//--DONNÉES POUR LE TEXTE
		if is_method(mapOption[i].txt)
		{
			var _txtToDraw =  mapOption[i].txt()
		}
		else
		{
			var _txtToDraw =  mapOption[i].txt
		}
		var _xTxt = wMapOption/2+wMapOption*i
		var _txtcol = "c_white";
		var _shake = "";
	
	
		//---COMPORTEMENT ET CLIQUE
		if currentMenu == noone
		{
			if point_in_rectangle(mouse_x, mouse_y,_xTxt-wMapOption/2, 0, _xTxt+wMapOption/2, hBarreSup)
			{
				if global.cPrLeft
				{
					if  mapOption[i].fonction != noone
					{
						mapOption[i].fonction();
					}
				}
				draw_set_color(c_yellow);
				_txtcol = "c_yellow";
				_shake = "[shake]";
			}
		
		}
	
	
		//---DESSIN
		scribble("["+_txtcol+"][fa_middle][fa_center][ftMenu]"+_shake+_txtToDraw).draw(_xTxt, _yTxt)
	}

}
else
{
	scribble("[fa_middle][fa_center][ftMenu]"+string(ojeu.nbTueurProcActifs)).draw(GAME_WIDTH/2, GAME_HEIGHT/2);	
}

#region USI

draw_set_alpha(1);

//----POSITION DES PANNEAUX
if currentMenu == MAP_MENU.SELECTION_USI
{
	for( var i = 0; i!=6;i++)
	{
			
		//POSITION DES PANNEAUX
		if i == 0
		{
			temps[0] ++;
			currentY[0] = twerp(TwerpType.out_elastic, yWhenHidden, yWhenShown, temps[i]/duree);
		}
		else
		{
			if temps[i-1] > duree/3
			{
				temps[i] ++;
				currentY[i] = twerp(TwerpType.out_elastic, yWhenHidden, yWhenShown, temps[i]/duree);
			}
		}
	}
}
else
{
	for( var i = 0; i!=6;i++)
	{
		currentY[i] = approach(currentY[i], yWhenHidden, 60);
	}
}



var _usi = ojeu.usi
for (var i = 0; i!=6;i++)
{
	//position
	var _x = xMin + wPanUsi*i
	var _y = currentY[i]
	//couleur
	if _usi[i].etat = USI_STATE.PATROL
	draw_set_color(c_grey)
	else
	draw_set_color(c_orange)
	//rectangle
	draw_rectangle(_x, _y, _x + wPanUsi, _y + hPanUsi, false);
	//portrait
	var _port = _usi[i].port;
	var _width = sprite_get_width(_port)
	var _scale = wPanUsi/(_width)
	draw_sprite_ext(_port, 0, _x+ (_width*_scale)/2, _y, _scale, _scale, 0, -1, 1);
	
	
}



#endregion


//--GAME OVER
alphaGameOver = approach(alphaGameOver, tarAlphaGameOver, 0.05);
draw_set_alpha(alphaGameOver);
draw_set_color(c_black);
draw_rectangle(0, 0, GAME_WIDTH, GAME_HEIGHT, false);

if (alphaGameOver == 1)
{
	alphaFinDePartie = approach(alphaFinDePartie, 1, 0.01);
	scrbblFinDePartie.blend(c_white, alphaFinDePartie).draw(GAME_WIDTH/2, yFinDePartie);

}
if currentMenu == MAP_MENU.GAME_OVER or currentMenu == MAP_MENU.RETRY 
{
	for (var i = 0; i < nbGameOverOption; i++)
	{
		var _option = gameOverOption[i];
		var _scribble = _option.scrbbl;
		var _hauteurTexte = _scribble.get_height()/2;
		var _largeurTexte = _scribble.get_width()/2;
		draw_set_alpha(0.3);
		draw_rectangle_color( GAME_WIDTH/2 - _largeurTexte, _option._y - _hauteurTexte/2, GAME_WIDTH/2 + _largeurTexte, _option._y + _hauteurTexte*2, c_blue, c_blue, c_blue, c_blue, false)
		draw_set_alpha(alphaGameOver);
		gameOverOption[i].scrbbl.blend(c_white, alphaGameOverOption).draw(GAME_WIDTH/2, gameOverOption[i]._y);
	}
}
