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
		if _menuID != MAP_MENU.CRIME_DETAILS
		{
			omapManager.currentMenu = _menuID;
			
		}
		else
		{
			if crimeType[crimeID].col == array_length(global.crimeCol)-1
			{
				crimeType[crimeID].col = 0;
			}
			else
			{
				crimeType[crimeID].col ++;
			}
		}

	}
	
	
}


function jourHeureMinuteComparaison(_jour1, _jour2, _heure1, _heure2, _minute1, _minute2)
{
//Est ce que date 1 est plus grande que date 2?

if _jour1 != _jour2 return _jour1 > _jour2;
if _heure1 != _heure2 return _heure1 > _heure2;
 return _minute1 > _minute2;

}


function indexCrimeAttachable(_typeDeCrime, _color, _date, _tueur)
{
	
	var _ARenvoyer = noone;
	
	if _typeDeCrime ==  ojeu.crime
	{
		for (var i = 0; i < array_length(_typeDeCrime );i ++)
		{
			if _typeDeCrime[i].x != noone and _typeDeCrime[i].y != noone and _color == _typeDeCrime[i].col  and  _typeDeCrime[i].date < _date
			{
				if _ARenvoyer == noone
				{
						_ARenvoyer = i;
				}
				else if _typeDeCrime[i].date > _typeDeCrime[_ARenvoyer].date
				{
						_ARenvoyer = i;
				}
			}
		}
		
		return _ARenvoyer;
		
	}
	
	//pour les crimes procéde*uraux, lier selon le tueur et non la couleur
	for (var i = 0; i < array_length(_typeDeCrime );i ++)
		{
			if _typeDeCrime[i].x != noone and _typeDeCrime[i].y != noone and _tueur == _typeDeCrime[i].tueur  and  _typeDeCrime[i].date < _date
			{
				if _ARenvoyer == noone
				{
						_ARenvoyer = i;
				}
				else if _typeDeCrime[i].date > _typeDeCrime[_ARenvoyer].date
				{
						_ARenvoyer = i;
				}
			}
		}
		
		return _ARenvoyer;
		
}
