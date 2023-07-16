
var _crime = crimeType[crimeID]
var _tueur = tueurType[_crime.tueur]
var _isNotProc = !_crime.estProcedural
//------CAPTURE-------//
if !checkCapture
{
	var _dateIsPassed;
	if  !_isNotProc
	{
		_dateIsPassed = true;
	}
	else
	{
		_dateIsPassed = _crime.date == ojeu.numeroJour;
	}
	
	var _nbUsi = instance_number(ousi);
	if _dateIsPassed  and _crime.vulnerable and !_crime.first
	{
		for (var _usi = 0; _usi < _nbUsi; _usi ++)
		{
			var _instanceUsi =  instance_find(ousi, _usi)
			if place_meeting(x, y, _instanceUsi) and _instanceUsi.pressed == false
			{
				tueurType[_crime.tueur].etat = KILLER_STATE.CAUGHT;
				tueurType[_crime.tueur].jourCaught = ojeu.numeroJour;	
			}
		}
	}
	crimeType[crimeID].vulnerable = false;
	checkCapture = true;
}


//--------FUITE-----------------------//
if _crime.last and !instance_exists(oMiseAJourCarte)
{
	_tueur.etat = KILLER_STATE.FLED;
}


//------DÉSACTIVATION----------//
if _tueur.etat == KILLER_STATE.CAUGHT or _tueur.etat == KILLER_STATE.FLED
{
	crimeType[crimeID].col = c_white
	instance_destroy();
}
if _tueur.etat == KILLER_STATE.CAUGHT
{
	
}


//------AFFICHAGE------------//
visible = (_isNotProc and !ojeu.tenseNight) or (!_isNotProc and ojeu.tenseNight)





