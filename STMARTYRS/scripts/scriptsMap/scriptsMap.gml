function noMenu()
{	
	omapManager.currentMenu = noone;
	instance_destroy(ochoiceBox);
}
function quitMap()
{
	GoToRoom(P_POLICE_STATION);
}
function clickToChangeMenu(_menuID)
{
if !position_meeting(mouse_x, mouse_y, self)
	{
		iconPressed = false;
		if object_index == ocrime
		{
			if  omapManager.selectpsc == crimeID
			omapManager.selectpsc = noone;
		}
	}
	else if object_index == ocrime
	{ojeu.selectpsc = crimeID};
	
	if position_meeting(mouse_x, mouse_y, self) and global.cPrLeft
	{
		iconPressed = true;
	}
	if omapManager.currentMenu == noone and iconPressed and global.cRlLeft
	{
		if _menuID != "psc"
		{
			omapManager.currentMenu = _menuID;
			
		}
		else
		{
			if ojeu.crime[crimeID].col == array_length(global.crimeCol)-1
			{
				ojeu.crime[crimeID].col = 0;
			}
			else
			{
				ojeu.crime[crimeID].col ++;
			}
		}

	}
	
	
}
function returnToGend()
{
	GoToRoom(ptestexplo2);
	ojeu.pause = false;
}
function recapEnCours()
{
	return  !omapManager.mapTimeMAJ and !instance_exists(oGoToRoom)// and omapManager.currentMenu != "usi"
}


//OBJET CRIME
