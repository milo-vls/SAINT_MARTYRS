draw_set_alpha(1);
if currentMenu == noone
{
	if drawUsiModification
	{
		var _xbutton = selectedUsi.x+75
		//DESSIN DES BOUTTONS
		draw_sprite(sprtrash, 0, _xbutton, selectedUsi.y);
		draw_sprite(sprrotateUsi, 0, _xbutton, selectedUsi.y+sprite_get_height(sprtrash)+5);
		//SUPPRIMER L'USI
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

draw_set_alpha(1);
draw_set_font(ftDial);
draw_set_color(c_black);
draw_text(room_width/2, 100, ojeu.nbTueurActifs)

#region menu explo

if currentMenu == "explo"
{
	draw_set_alpha(1)
	draw_visitables();
}




#endregion
#region USI

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


draw_set_alpha(1);

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







#region menu usi *OLD*
/*
#region fond noir
//alphaFondNoir = lerp(alphaFondNoir, tarAlphaFondNoir, 0.2);
alphaFondNoir = tarAlphaFondNoir;
draw_set_alpha(alphaFondNoir);
draw_set_color(c_black);
//draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);

#endregion
#region cadran noir
//alphaCadran = lerp(alphaCadran, tarAlphaCadran, 0.1);
alphaCadran = tarAlphaCadran;
draw_set_alpha(alphaCadran);
draw_set_color(c_black);
draw_rectangle(x1Cadran+lCadran/4, y1Cadran, x2Cadran-lCadran/4, y2Cadran, false);
#endregion
#region back button
	draw_sprite_stretched(sprBack, 0, xbackbutton, ybackbutton, lbackbutton, lbackbutton);

#endregion
#region portrait usi & +
for (var i = 0;i < array_length(ojeu.usi);i ++)
{
	// xy ?
	if i < 4 
	{
		xcadranUsi = x1Cadran + (lcadreUsi * i);
		ycadranUsi = y1Cadran;
	}
	else
	{
		if i < 8
		{
			xcadranUsi = x1Cadran + (lcadreUsi * (i-4));
			ycadranUsi = y1Cadran + hcadreUsi;
		}
		else
		{
			xcadranUsi = x1Cadran + (lcadreUsi * (i-8));
			ycadranUsi = y1Cadran + hcadreUsi*2;
		}
	}
	
	switch (ojeu.usi[i].etat)
	{
	case USI_STATE.AVAILABLE:{
		//Portrait
		var _scale = hcadreUsi/ojeu.usi[i].hauteur;
		draw_sprite_ext(ojeu.usi[i].port, 0, xcadranUsi + lcadreUsi/2, ycadranUsi, _scale, _scale, 0, -1, alphaCadran);
		//FOND NOIR
		draw_set_alpha(alphaCadran - 0.5);
		draw_rectangle_color(xcadranUsi, ycadranUsi + hcadreUsi - hCadranNomUsi, xcadranUsi + lcadreUsi, ycadranUsi + hcadreUsi, c_black, c_black, c_black, c_black, false);
		draw_set_font(ftMenu);
		draw_set_color(c_white);
		draw_set_valign(fa_middle);
		draw_set_halign(fa_center);
		draw_set_alpha(alphaCadran);
		//nom portrait
		draw_text(xcadranUsi + lcadreUsi/2, ycadranUsi + hcadreUsi - hCadranNomUsi/2, ojeu.usi[i]._name);
		draw_sprite_stretched(sprCadreUsi, 0, xcadranUsi, ycadranUsi, lcadreUsi, hcadreUsi);
		//----PRÉVISUALISATION HITBOX---//		
		if point_in_rectangle(mouse_x, mouse_y, xcadranUsi+1, ycadranUsi+1, xcadranUsi + lcadreUsi-1, ycadranUsi + hcadreUsi-1)
		{
			demoHboxSprite = ojeu.usi[i].hbox;
			demoHboxRot ++;
			if currentMenu == "usi" and demoHboxSprite != noone
			{
				draw_sprite_ext(ojeu.usi[i].hbox, 0, mouse_x, mouse_y, 1, 1, demoHboxRot, -1, 0.8);
				if global.cPrLeft
				{
					with instance_create_layer(mouse_x, mouse_y, "usi", ousi)
					{
						omapManager.selectedUsi = self;
						usiID = i;
					}
					tarAlphaFondNoir = 0;
					tarAlphaCadran = 0;
					noMenu();
					//---changement d'état
					ojeu.usi[i].etat = USI_STATE.PATROL;
					
				}
			}
			else
			{
				demoHboxSprite = noone;
						
			}
		}
		else
		{
			demoHboxSprite = noone;
					
		}
	}break;
	case USI_STATE.NOT_AVAILABLE:{
	
	}break;
	case USI_STATE.DEAD:{
		draw_sprite_stretched(sprCadreUsiDead, 0, xcadranUsi, ycadranUsi, lcadreUsi, hcadreUsi);
	}break;
	case USI_STATE.RESTING:{
		draw_sprite_stretched(sprCadreUsiRest, 0, xcadranUsi, ycadranUsi, lcadreUsi, hcadreUsi);
		
		show_debug_message( str(ojeu.usi[i].dispoDate));
		show_debug_message( str(ojeu.usi[i].dispoDate - global.mapDate));
		
		if date_compare_date(global.mapDate, ojeu.usi[i].dispoDate)//ojeu.usi[i].dispoDate< global.mapDate
		{
			ojeu.usi[i].dispoDate	= noone;
			ojeu.usi[i].retireDate	= noone;
			ojeu.usi[i].etat				= USI_STATE.AVAILABLE;
		}
	}break;
	case USI_STATE.PATROL:{
		draw_sprite_stretched(sprCadreUsiPlaced, 0, xcadranUsi, ycadranUsi, lcadreUsi, hcadreUsi);
	}break;
	}
	
	
}

#endregion
*/
#endregion

var _x = display_get_gui_width();
draw_set_alpha(1);
draw_healthbar(_x, 0, _x-50, display_get_gui_height(), (ojeu.resurgence/ojeu.resurgenceMax)*100, c_white, c_white, c_red, 2, false, false);