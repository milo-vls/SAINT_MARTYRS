depth = ojeu.depth - 1
var _alpha = global.alphaBlackScreen;
if !instance_exists(oDial)
if !deplacementFait 
{
	global.inputOn = false;
	global.blackScreen = true;
	time_source_pause(ojeu.minuterie);
	if _alpha > 1.0
	{
		ojeu.lastRoom = room;
		room_goto(piece);
		deplacementFait = true
		if sndToPlay != noone
		playsound(sndToPlay);
		if dayNext
		{
			showDate = true; 
			global.currentDate = date_create_datetime(date_get_year(global.currentDate), date_get_month(global.currentDate), date_get_day(global.currentDate), ojeu.heureReveil, 0, 0);
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
			
			ojeu.numeroJour ++;
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
	
			draw_text(display_get_gui_width()/2, display_get_gui_height()/2, global.strDate);
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
		time_source_resume(ojeu.minuterie);
		instance_destroy();
	}
	
	
}