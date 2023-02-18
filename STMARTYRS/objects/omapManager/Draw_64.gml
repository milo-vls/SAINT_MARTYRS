draw_set_alpha(1);

//Modification USI
#region ancien modif' usi
/*
if currentMenu == noone
{
	if drawUsiModification
	{
		var _xbutton = selectedUsi.x+75
		//DESSIN DES BOUTTONS
		draw_sprite(sprtrash, 0, _xbutton, selectedUsi.y);
		draw_sprite(sprrotateUsi, 0, _xbutton, selectedUsi.y+sprite_get_height(sprtrash)+5);
		//SUPPRIMER L'USI
		/*
		if point_in_circle(mouse_x, mouse_y, _xbutton+sprite_get_width(sprtrash)/2, selectedUsi.y+sprite_get_height(sprtrash)/2, sprite_get_width(sprtrash)/2) and global.cPrLeft
		{
			drawUsiModification = false;
			ojeu.usi[selectedUsi.usiID].x = noone;
			ojeu.usi[selectedUsi.usiID].y = noone;
			instance_destroy(selectedUsi);
			
		}
		//FAIRE TOURNER L'USI
		if point_in_circle(mouse_x, mouse_y, _xbutton+sprite_get_width(sprtrash)/2, selectedUsi.y+sprite_get_height(sprtrash)+5+sprite_get_height(sprtrash)/2, sprite_get_width(sprtrash)/2) and global.cPrLeft
		{
			rotateHeld = true;
		}
		if !global.cLeft
		{
			rotateHeld = false;
		}
		
		if rotateHeld
		{
			ojeu.usi[selectedUsi.usiID].rot ++;
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		if global.cPrLeft and !position_meeting(mouse_x, mouse_y, selectedUsi)
		{
			if !point_in_circle(mouse_x, mouse_y, _xbutton+sprite_get_width(sprtrash)/2, selectedUsi.y+sprite_get_height(sprtrash)+5+sprite_get_height(sprtrash)/2, sprite_get_width(sprtrash)/2) and !point_in_circle(mouse_x, mouse_y, _xbutton+sprite_get_width(sprtrash)/2, selectedUsi.y+sprite_get_height(sprtrash)/2, sprite_get_width(sprtrash)/2) and !position_meeting(mouse_x, mouse_y, all)
			{
				outPressed = true;
			}
		}
		if global.cRlLeft and !position_meeting(mouse_x, mouse_y, selectedUsi) and outPressed
		{
			if !point_in_circle(mouse_x, mouse_y, _xbutton+sprite_get_width(sprtrash)/2, selectedUsi.y+sprite_get_height(sprtrash)+5+sprite_get_height(sprtrash)/2, sprite_get_width(sprtrash)/2) and !point_in_circle(mouse_x, mouse_y, _xbutton+sprite_get_width(sprtrash)/2, selectedUsi.y+sprite_get_height(sprtrash)/2, sprite_get_width(sprtrash)/2) and !position_meeting(mouse_x, mouse_y, all)
			{
				drawUsiModification = false;
			}
		}
	}
}
*/
#endregion

#region menu explo

if currentMenu == "explo"
{
	draw_set_alpha(1)
	draw_visitables();
}




#endregion


draw_set_color(#829460 );
draw_set_alpha(1)
//draw_rectangle(0,0, wBarreSup, hBarreSup, false)
draw_sprite_stretched_ext(sprBarreSup, 0, 0, 0, wBarreSup, hBarreSup, #829460, 1)
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




#region USI

draw_set_alpha(1);



//----POSITION DES PANNEAUX
if currentMenu == "usi"
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