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

function plusVieuxCrime(_indexCrime1, _indexCrime2)
{
	
//RENVOIE POSITIF SI crime 1 PLUS JEUNE
//RENVOIE NEGATIF SI CRIME 1 PLUS VIEUX


	var _crime1 = ojeu.crime[_indexCrime1];
	var _crime2 = ojeu.crime[_indexCrime2];
	
	if _crime1.date != _crime2.date
	{
		return 	_crime1.date - _crime2.date;
	}
	if _crime1.heure != _crime2.heure
	{
		return _crime1.heure - _crime2.heure;
	}
	return _crime1.minute - _crime2.minute;
}

function jourHeureMinuteComparaison(_jour1, _jour2, _heure1, _heure2, _minute1, _minute2)
{
//Est ce que date 1 est plus vieux que date 2?

if _jour1 != _jour2 return _jour1 < _jour2;
if _heure1 != _heure2 return _heure1 < _heure2;
return _minute1 < _minute2;

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


function indexCrimePrecedentSelonTueur(_crimeId)
{

var _toReturn = noone;
var _tueur = ojeu.crime[_crimeId].tueur;


for (var i = 0; i < array_length(ojeu.crime); i ++)
{
	var _inspectedCrime = ojeu.crime[i];
	if _tueur == _inspectedCrime.tueur and _inspectedCrime.x != noone and plusVieuxCrime(_crimeId, i) > 0
	{
		if _toReturn == noone then _toReturn = i;
		else if plusVieuxCrime(_toReturn, i) > 0 then _toReturn = i;
	}
}



}









