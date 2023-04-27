function dateStringFromDate(_date)
{
	var _dateJour = date_get_day(_date);
	var _strJour = string(_dateJour);
	if _dateJour < 10 then _strJour = "0" + _strJour;
	
	var _dateMois = date_get_month(_date);
	var _strMois = string(_dateMois)
	if _dateMois < 10 then _strMois = "0" + _strMois;
	
	return _strJour + "/" + _strMois;
}

function heureStringFromDate(_date)
{
	var _heure = date_get_hour(_date);
	var _strHeure = string(_heure);
	if _heure < 10 then _strHeure = "0" + _strHeure;
	
	var _minute = date_get_minute(_date);
	var _strMinute = string(_minute);
	if _minute < 10 then _strMinute = "0" + _minute;
	
	return _strHeure + ":" + _strMinute;
}

function drawCrimeDetails(_crimeID, _xInstance, _yInstance)
{
	var _crime = ojeu.crime[_crimeID];
	var _hauteurVoletMinimale = GAME_HEIGHT/5;
	var _largeurVolet = GAME_WIDTH*1.5/6;
	var _hauteurVolet = _hauteurVoletMinimale;
	if  is_array(_crime.indices)
	{
			_hauteurVolet *= 2;
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
	
	
	draw_set_alpha(1);
	draw_roundrect_color_ext(_x1, _y1, _x2, _y2, _marge, _marge, c_black, c_black, false);
	
	
	draw_set_color(c_white); draw_set_font(ftDial);draw_set_valign(fa_top); draw_set_halign(fa_left);
	//DESSIN NOM ET PRENOM
	var _xPrenom = _xLeft + _marge/2;
	var _yPrenom = _yTop + _marge/2;
	draw_text(_xPrenom, _yPrenom, _crime._name + "\n");
	
	//DATE
	var _xDate = _xPrenom;
	var _yDate = _yPrenom + string_height("W");
	draw_text(_xDate, _yDate, dateStringFromDate(_crime.date));
	
	//HEURE
	var _xHeure = _xPrenom;
	var _yHeure = _yDate + string_height("W")*0.75;
	draw_text(_xHeure, _yHeure, heureStringFromDate(_crime.date));
	
	//PORTRAIT
	if _crime.portraitVictime != noone
	{
		var _largeurPortrait = _hauteurVoletMinimale/1 - _marge;
		var _xPortrait = _xLeft + _largeurVolet - _marge/2 - _largeurPortrait;
		var _yPortrait = _yTop + _marge/2;
		//var _hauteurPortrait = sprite_get_height(_crime.portraitVictime) * (_largeurPortrait/sprite_get_width(_crime.portraitVictime));
		draw_sprite_stretched(_crime.portraitVictime, 0, _xPortrait, _yPortrait, _largeurPortrait, _largeurPortrait);
	}
	
	//COORDONNÉES
	draw_set_color(c_yellow);
	var _xTextPos = _xPrenom;
	var _yTextPos = _yHeure  + string_height("W")*0.75;
	draw_text(_xTextPos, _yTextPos, string(_crime.x) + ", " + string(_crime.y));
	 
	//INDICES
	if is_array(_crime.indices)
	{
		var _coteCarre = min(_hauteurVoletMinimale-_marge/2, _largeurVolet - _marge);
		var _minLen = min(array_length(_crime.indices), 4)
		for (var i = 0; i < _minLen; i ++)
		{
			var _sprite = _crime.indices[i];
			var _largeurIndice = _coteCarre/2;
			var _hauteurIndice = _coteCarre/2;
			var _yIndice = (_yTop + _hauteurVoletMinimale) + (_hauteurIndice)*(i > 1);
			var _xIndice = (_xLeft + _largeurVolet/2 - _largeurIndice) + ((_largeurIndice) * ((i) % 2))
			draw_sprite_stretched(_sprite, 0, _xIndice, _yIndice, _largeurIndice, _hauteurIndice);
		}
	}
}

function drawCoordinates(_x, _y,  _width, _height)
{
	draw_set_alpha(0.9); draw_set_font(ftDial); draw_set_color(c_black); draw_set_halign(fa_center); draw_set_valign(fa_bottom); 
	var _yAbs = y_map_absolue(_y, _height);
	var _xAbs = x_map_absolue(_x, _width)
	draw_text(_x, _y, string(_xAbs) + ", " + string(_yAbs));
}