draw_set_alpha(1);

#region second plan (entre le background et les éléments)
	var _yDecalage = yTopEcran - yAjoute; 
	var _yBottomSecondPlan = _yDecalage + hauteurPage + 100;
	draw_rectangle_color(xDroitSecondPlan, _yDecalage, xGaucheSecondPlan, _yBottomSecondPlan, couleurSecondPlan, couleurSecondPlan, couleurSecondPlan, couleurSecondPlan, false);

#endregion





#region dessin des éléments dans elementWeb
	draw_set_color(c_black);
	var _xImage = xDroitSecondPlan + margeImage;
	var _xTexte = xDroitSecondPlan + margeTexte;
	
	for (var i = 0; i < nbElementWeb; i ++)
	{
		var _element = elementWeb[i];
		var _y = _element.y + _yDecalage
		#region images
			if _element.nature == RESSOURCE_TYPE_WEB_SPRITE
			{
				draw_sprite_stretched(_element.ressource, 0, _xImage, _y, _element.largeur, _element.hauteur);
			}
		#endregion
		#region texte
			if _element.nature == RESSOURCE_TYPE_WEB_TEXTE
			{
				_element.ressource.draw(_xTexte, _y);
			}
		#endregion
	
	
	}
#endregion

#region premier plan, contour faux écran

draw_sprite_stretched(sprContourOrdi, 0, 0, 0, display_get_gui_width(), display_get_gui_height());

#endregion

#region dessin scroller
	
	if hauteurScroller < hauteurCadreScroller
	{
		draw_sprite_stretched(sprCadreScroller, 0, xScroller, yTopEcran, lScroller, hauteurCadreScroller);
		draw_sprite_stretched(sprScroller, 0, xScroller, yScroller + 10 , lScroller, hauteurScroller-20);
	}

#endregion

#region URL

draw_set_color(c_white);
draw_set_font(ftMenu);
var _toDraw = scribble("[shake]"+charsInputJoueur).transform(1, 0.75, 0);
_toDraw.align(fa_center,fa_bottom)
_toDraw.draw(room_width/2, yTopEcran-15)

#endregion






