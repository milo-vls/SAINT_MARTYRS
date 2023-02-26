
function killerProceduralGeneration(_night, _dateStart, _dateEnd)
{

var _listeKillersToReturn = []
#macro COEFF_PORTION_TEMPS 3
var _nbPortionsTemps =  (_dateEnd - _dateStart)*COEFF_PORTION_TEMPS;

var _patternsAutorises = _night.pool;
var _nbPatterns = array_length(_patternsAutorises);
var _listePatterns = [];


//génération tueurs
for (var _portionTemps = 0; _portionTemps <_nbPortionsTemps; _portionTemps ++)
{
	var _scoreRestantPourPortionTemps = _night.scorePortionTemps + _portionTemps*_night.diffEvolScore;
	while _scoreRestantPourPortionTemps > 0
	{
		var _pattern = ojeu.patterns[_patternsAutorises [irandom(_nbPatterns-1)]];
		if _pattern.cout <= _scoreRestantPourPortionTemps and !(estDansListe(_pattern, _listePatterns) and _pattern.unParNuit)
		{
			_scoreRestantPourPortionTemps -= _pattern.cout
			array_push(_listePatterns, _pattern);
			var _checkDate = date_inc_minute(global.currentDate, irandom(19)+_portionTemps *20);
			array_push(_listeKillersToReturn, new setKiller(_pattern, random(10), _checkDate));
		}
	}
}

return _listeKillersToReturn

}


function crimeProceduralGeneration(_idKiller)
{
	
var _col = make_colour_hsv(random(255), 40, 255);
	
var _listeCrimesToReturn = []

var _killer = ojeu.tueurProc[_idKiller];
var _pattern = _killer.pattern;

var _firstCrimePos = _pattern.firstCrimePos();
var _firstCrime        = new setCrime(_idKiller, randomNomPrenom(), _killer.firstCrimeDate, false, _firstCrimePos[0], _firstCrimePos[1], true, _col, true)
array_push(_listeCrimesToReturn,  _firstCrime);


array_push_array(_listeCrimesToReturn, _pattern.nextCrimesPos(_firstCrime, _idKiller, _col));



return _listeCrimesToReturn

}
 



function randomNomPrenom()
{
	return "ranNom ranPrénom";
}




