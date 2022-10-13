
//----initialisation date fin de patrouille----//
if ojeu.usi[usiID].retireDate == noone
{
		ojeu.usi[usiID].retireDate = date_inc_hour(global.currentDate, ojeu.usi[usiID].tpsPatrol);
}

//----DATE FIN DE PATROUILLE ATTEINTE----//
if date_compare_date(global.mapDate, ojeu.usi[usiID].retireDate)//global.mapDate > ojeu.usi[usiID].retireDate 
{
	instance_destroy();
}




#region position
x = clamp(x, 0, room_width);
y = clamp(y, 0, room_height);
ojeu.usi[usiID].x = x;
ojeu.usi[usiID].y = y;
#endregion


#region cliquer sur l'usi
if omapManager.currentMenu==noone and position_meeting(mouse_x, mouse_y, self) and global.cPrLeft
{
	omapManager.selectedUsi = self;
	pressed = true;
}
if global.cRlLeft
{
	if pressed 
	{
		omapManager.drawUsiModification = true;
	}
	pressed = false;
}
if pressed
{
	x = mouse_x;
	y = mouse_y;
	
}
#endregion