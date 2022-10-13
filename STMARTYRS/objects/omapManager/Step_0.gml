
//----MISE A JOUR DATE CARTE-----------------------//
if !mapTimeMAJ and !instance_exists(oGoToRoom)
{
	time_source_pause(ojeu.minuterie);
	timer ++;
	minuteToAdd = twerp(TwerpType.inout_cubic, 0, diffTempsMinutes, timer/duree);
	//minuteToAdd = lerp(minuteToAdd, diffTempsMinutes, 0.004)
	global.mapDate = date_inc_minute(initMapDate, minuteToAdd);
	
	if timer/duree == 1
	{
		global.mapDate = global.currentDate;
		mapTimeMAJ = true;
		global.inputOn = true;
		time_source_resume(ojeu.minuterie);
	}
}
else
{
	if !instance_exists(oGoToRoom)
	global.mapDate = global.currentDate;
}
//----MISE A JOUR ÉLÉMENTS SUR LA CARTE---//

maj_meurtre();
maj_nb_tueur();

//-------MENU------//
switch (currentMenu)
{
	case noone:{
		
		
	}break;
	case "options":{
		if !instance_exists(oMapPause)
		{
			createChoiceBox("Quitter la carte", quitMap, "Retour", noMenu);
		}
		else
		{
			GoToRoom(ojeu.lastRoom);
		}
		
	}break;
	case "usi":{
		
		
		if !instance_exists(oMapPause)
		{
		tarAlphaFondNoir = 0.7;
		tarAlphaCadran = 1;
		
		if !point_in_circle(mouse_x, mouse_y, xbackbutton + lbackbutton/2, ybackbutton + lbackbutton/2, lbackbutton/2)
		{
			backbuttonPressed = false;
		}
		if point_in_circle(mouse_x, mouse_y, xbackbutton + lbackbutton/2, ybackbutton + lbackbutton/2, lbackbutton/2) and global.cPrLeft
		{
			backbuttonPressed = true;
		}
		if backbuttonPressed and global.cRlLeft and point_in_circle(mouse_x, mouse_y, xbackbutton + lbackbutton/2, ybackbutton + lbackbutton/2, lbackbutton/2)
		{
			tarAlphaFondNoir = 0;
			tarAlphaCadran = 0;
			noMenu();
		}
		}
		else
		{
			createChoiceBox("Retourner à la gendarmerie ", returnToGend,"Retour", noMenu);
		}	
	}break;
	case "psc":{
	tarAlphaFondNoir = 0.7;
	tarAlphaMenupsc = 1;
	alphaMenupsc = 1;
	
	//quitter
	if !point_in_circle(mouse_x, mouse_y, x2RSup, y1RCentral, dcoin*1.25)
	{
		backbuttonPressed = false;
	}
	if point_in_circle(mouse_x, mouse_y, x2RSup, y1RCentral, dcoin*1.25) and global.cPrLeft
	{
		backbuttonPressed = true;
	}
	if backbuttonPressed and global.cRlLeft 
		{
			selectpsc =  noone;
			tarAlphaFondNoir = 0;
			tarAlphaMenupsc = 0;
			alphaMenupsc = 0;
			noMenu();
		}
	//incrémenter la couleur
	if !point_in_rectangle(mouse_x, mouse_y, xIncCol, yIncCol, xIncCol+sprite_get_width(sprChangeCol), yIncCol + sprite_get_height(sprChangeCol))
	{
		IncColpressed = false;
	}
	if point_in_rectangle(mouse_x, mouse_y, xIncCol, yIncCol, xIncCol+sprite_get_width(sprChangeCol), yIncCol + sprite_get_height(sprChangeCol)) and global.cPrLeft
	{
		IncColpressed = true;
	}
	if IncColpressed and global.cRlLeft
	{
		if ojeu.crime[selectpsc].col == array_length(global.crimeCol)-1
		{
			ojeu.crime[selectpsc].col = 0;
		}
		else
		{
			ojeu.crime[selectpsc].col ++;
		}
	}	
	//décrémenter la couleur
	if !point_in_rectangle(mouse_x, mouse_y, xDecCol, yDecCol, xDecCol+sprite_get_width(sprChangeCol), yDecCol + sprite_get_height(sprChangeCol))
	{
		DecColpressed = false;
	}
	if point_in_rectangle(mouse_x, mouse_y, xDecCol, yDecCol, xDecCol+sprite_get_width(sprChangeCol), yDecCol + sprite_get_height(sprChangeCol)) and global.cPrLeft
	{
		DecColpressed = true;
	}
	if DecColpressed and global.cRlLeft
	{
		if ojeu.crime[selectpsc].col == 0
		{
			ojeu.crime[selectpsc].col = array_length(global.crimeCol)-1;
		}
		else
		{
			ojeu.crime[selectpsc].col --;
		}
	}
	}break;
}

//---MODIFICATION USI---//
if selectedUsi != noone
{
	if selectedUsi.pressed
	{
		drawUsiModification = false;
	}
}
else
{
	drawUsiModification = false;
}



