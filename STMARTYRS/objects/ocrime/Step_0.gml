
var _crime = crimeType[crimeID]
var _tueur = crimeType[_crime.tueur]
//------CAPTURE-------//
if !checkCapture
{
	if place_meeting(x, y, ousi) and _crime.date > date_inc_day(global.currentDate, -1) and _crime.vulnerable
	{
		tueurType[_crime.tueur].etat = KILLER_STATE.CAUGHT;
		tueurType[_crime.tueur].jourCaught = global.currentDate;
	}
	crimeType[crimeID].vulnerable = false;
	checkCapture = !checkCapture
}


//--------FUITE-----------------------//
if _crime.last
{
	_tueur.etat = KILLER_STATE.FLED;
}


//------DÉSACTIVATION----------//
if _tueur.etat == KILLER_STATE.CAUGHT or _tueur.etat == KILLER_STATE.FLED
{
	instance_destroy();
}


//------AFFICHAGE------------//
var _checkBool = (crimeType == ojeu.crimeProc)
visible = _checkBool == ojeu.tenseNight;