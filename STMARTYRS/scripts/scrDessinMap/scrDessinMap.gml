

function drawCrimeDetails(_crimeID, _xInstance, _yInstance)
{
	var _largeurVolet = GAME_WIDTH*1.5/5
	var _hauteurVolet = GAME_HEIGHT/5;
	if ojeu.crime[_crimeID].indices == [noone, noone, noone, noone]
	{
			_hauteurVolet = GAME_HEIGHT/5;
	}
	var _marge = _largeurVolet/12;
	
	var _x1 = _xInstance;
	var _y1 = _yInstance;
	var _x2, _y2;
	
	if _xInstance < GAME_WIDTH/2
	{
		_x2 = _xInstance + _largeurVolet;
	}
	else
	{
		_x2 = _xInstance - _largeurVolet;
	}
	
	if _yInstance < GAME_HEIGHT/2
	{
		 _y2 = _y1 + _hauteurVolet;
	}
	else
	{
		_y2 = _y1 - _hauteurVolet;
	}
	
	draw_set_alpha(0.8);
	draw_roundrect_color_ext(_x1, _y1, _x2, _y2, _marge, _marge, c_black, c_black, false);
}