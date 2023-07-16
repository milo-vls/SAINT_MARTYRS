


//---POINT DE DÉPLACEMENT EN VILLE
if currentMenu == MAP_MENU.EXPLO
{
	draw_set_alpha(1)
	draw_visitables();
}


//---MENU SUPERIEUR
draw_set_color(#829460 );
draw_set_alpha(1);
draw_sprite_stretched_ext(sprBarreSup, 0, 0, 0, wBarreSup, hBarreSup, #829460, 1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(ftMenu);
draw_set_color(c_white);
for(var i = 0 ; i < nbMapOption ; i ++)
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
	scribble("["+_txtcol+"][fa_middle][fa_center][ftDial]"+_shake+_txtToDraw).draw(_xTxt, _yTxt)
}
	
	
//---VOLET DÉTAIL CRIME---//
if instanceCrimeSurvole != noone
{
	drawCrimeDetails(instanceCrimeSurvole.crimeID, instanceCrimeSurvole.x, instanceCrimeSurvole.y);
}
	
//---COORDONNÉES---//

drawCoordinates(10, hBarreSup + 10, room_width, room_height);	






