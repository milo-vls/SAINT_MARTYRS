function dateStringFromDate(_date)
{
	var _dateJour = date_get_day(_date);
	var _strJour = str(_dateJour);
	if _dateJour < 10 then _strJour = "0" + _strJour;
	
	var _dateMois = date_get_month(_date);
	var _strMois = str(_dateMois)
	if _dateMois < 10 then _strMois = "0" + _strMois;
	
	return _strJour + "/" + _strMois;
}


function drawCrimeDetails(_crimeID, _xInstance, _yInstance)
{
	var _crime = ojeu.crime[_crimeID]
	
	var _largeurVolet = GAME_WIDTH*1.5/5
	var _hauteurVolet = GAME_HEIGHT/5;
	if _crime.indices == [noone, noone, noone, noone]
	{
			_hauteurVolet = GAME_HEIGHT/5;
	}
	var _marge = _largeurVolet/12;
	
	var _x1 = _xInstance;
	var _y1 = _yInstance;
	var _x2, _y2, _xLeft, _yTop;
	
	if _xInstance < GAME_WIDTH/2
	{
		_x2 = _xInstance + _largeurVolet;
		_xLeft = _x1;
	}
	else
	{
		_x2 = _xInstance - _largeurVolet;
		_xLeft = _x2;
	}
	
	if _yInstance < GAME_HEIGHT/2
	{
		 _y2 = _y1 + _hauteurVolet;
		 _yTop = _y1;
	}
	else
	{
		_y2 = _y1 - _hauteurVolet;
		_yTop = _y2;
	}
	
	
	draw_set_alpha(0.8);
	draw_roundrect_color_ext(_x1, _y1, _x2, _y2, _marge, _marge, c_black, c_black, false);
	
	
	draw_set_alpha(1); draw_set_color(c_white); draw_set_font(ftDial);draw_set_valign(fa_top); draw_set_halign(fa_left);
	//DESSIN NOM ET PRENOM
	var _xPrenom = _xLeft + _marge/2;
	var _yPrenom = _yTop + _marge/2;
	draw_text(_xPrenom, _yPrenom, _crime._name + "\n");
	
	//DATE
	var _xDate = _xPrenom;
	var _yDate = _yPrenom + string_height("W");
	draw_text(_xDate, _yDate, string(_crime.date));
}