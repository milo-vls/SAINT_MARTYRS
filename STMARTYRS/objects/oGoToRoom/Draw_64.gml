depth = DEPTH_OJEU -1 
var _alpha = global.alphaBlackScreen;
if !instance_exists(oDial)
if !deplacementFait 
{
	global.inputOn = false;
	global.blackScreen = true;
	if _alpha > 1.0
	{
		global.lastRoom = room;
		room_goto(piece);
		deplacementFait = true
		if sndToPlay != noone
		playsound(sndToPlay);
		if dayNext
		{
			ojeu.crimeProc = [];
			ojeu.nbCrimeProc = 0;
			ojeu.tueurProc = 0;
			ojeu.nbTueurProc = 0;
			showDate = true; 
			ojeu.numeroJour ++;
		}
	}
}
if deplacementFait
{
	if instanceToCreate != noone
	{
		if !instance_exists(instanceToCreate)
		{
			instance_create_depth(0, 0, 0, instanceToCreate);
		}
	}
	
	//show the date
	if dayNext
	{
		//initialisation de la journée
		if !setup
		{
			init_day();
			setup = true;
		}
		
		
		if showDate
		{
			alphaDate = approach(alphaDate, 1, 0.02);
			if alphaDate == 1
			{
				
				showDate = false;
			}
		}
		if !showDate
		{
			alphaDate = approach(alphaDate, 0, 0.02)
			if alphaDate ==0 
			{
				global.blackScreen = false;
			}

		}
		
		#region dessin date
			draw_set_alpha(alphaDate);
			draw_set_color(c_white);
			draw_set_font(ftMenu);
			draw_set_valign(fa_middle);
			draw_set_halign(fa_center);
			var _strDay =string(date_get_day(getCurrentDate()));
			var _strMonth = global.month[date_get_month(getCurrentDate())];
			var _strYear = string(date_get_year(getCurrentDate()))
			var _strDate = _strDay + " " + _strMonth + " " + _strYear;
	
	
			draw_text(display_get_gui_width()/2, display_get_gui_height()/2, _strDate);
		#endregion
	}
	else
	{
		if command != noone //fonction indiquée par la fonction goToRoom
		command();
		
		global.blackScreen = false;
	}
	
	if _alpha == 0
	{
		global.inputOn = true;
		instance_destroy();
	}
	
	
}