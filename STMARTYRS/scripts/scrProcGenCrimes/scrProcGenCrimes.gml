
function killerProceduralGeneration(_night, _dateStart, _dateEnd)
{

var _listeKillersToReturn = []
var _nbDemiMinutes =  (_dateEnd - _dateStart)*2

var _patternsAutorises = _night.pool;
var _nbPatterns = array_length(_patternsAutorises);
var _listePatterns = [];


//génération tueurs
for (var _demiMinute = 0; _demiMinute <_nbDemiMinutes; _demiMinute ++)
{
	var _scoreRestantPourDemiMinute = _night.scoreMiSeconde + _demiMinute*_night.diffEvolScore;
	while _scoreRestantPourDemiMinute > 0
	{
		var _pattern = ojeu.patterns[_patternsAutorises [irandom(_nbPatterns-1)]];
		if _pattern.cout <= _scoreRestantPourDemiMinute and !(estDansListe(_pattern, _listePatterns) and _pattern.unParNuit)
		{
			_scoreRestantPourDemiMinute -= _pattern.cout
			array_push(_listePatterns, _pattern);
			var _checkDate = date_inc_minute(global.currentDate, irandom(29)+_demiMinute*30)
			array_push(_listeKillersToReturn, new setKiller(_pattern, random(10), _checkDate))
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




