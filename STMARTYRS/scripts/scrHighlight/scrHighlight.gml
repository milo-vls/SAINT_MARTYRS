function drawRectangleHighlight(_x1, _y1, _x2, _y2, _colour, _alpha)
{
	draw_set_alpha(_alpha);
	
	draw_rectangle_color(0, 0, _x1, GAME_HEIGHT, _colour, _colour, _colour, _colour, false);		//gauche
	draw_rectangle_color(_x1+1, 0, _x2-1, _y1, _colour, _colour, _colour, _colour, false);	//haut
	draw_rectangle_color(_x1+1, _y2, _x2-1, GAME_HEIGHT, _colour, _colour, _colour, _colour, false);	//bas
	draw_rectangle_color(_x2, 0, GAME_WIDTH, GAME_HEIGHT, _colour, _colour, _colour, _colour, false);	//droite
}

function drawRectangleHighlightText(_xLeft, _yTop, _xRight, _yBottom, _colour, _alpha, _scrbbl, _typist)
{
	
	drawRectangleHighlight(_xLeft, _yTop, _xRight, _yBottom, _colour, _alpha);
	var _valign;
	var _halign;
	var _yScribble;
	var _xScribble;
	if _yTop == max(_yTop, GAME_HEIGHT - _yBottom)
	{
		_yScribble = _yTop;
		_valign = fa_bottom;
	}
	else
	{
		_yScribble = _yBottom;
		_valign = fa_top;
	}
	if _xLeft == max(_xLeft, GAME_WIDTH - _xRight)
	{
		_xScribble = _xRight;
		_halign = fa_right;
	}
	else
	{
		_xScribble = _xLeft;
		_halign = fa_left;
	}
	
	_scrbbl.align(_halign, _valign).wrap(_xRight - _xLeft).draw(_xScribble, _yScribble, _typist);
	
}