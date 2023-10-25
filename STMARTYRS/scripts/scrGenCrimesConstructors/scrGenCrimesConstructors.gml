

//VARIABLE DIFFICULTÉ D'UNE NUIT
/// @param score_par_30Secondes	score permettant de répartir homogénéiquement les patterns sur le long des 6 minutes
/// @param liste_indices_pattern_autorisés	liste des INDICES de la liste "patterns" dans ojeu.
/// @param évolution_difficulté			comment évolue le score d'une trentaine de secondes à une autre
/// @param difficulté_gen_tueurs		paramètre pouvant influer la variance 
function setNightDiff(_score,_pool, _diffEv, _diffVariance, _dureeSeconde, _nbTueursMax) constructor
{
	scorePortionTemps = _score;
	pool = _pool;
	diffEvolScore = _diffEv;
	diffVariance = _diffVariance;
	dureeSeconde = _dureeSeconde;
	nbTueursMax = _nbTueursMax
}

//VARIABLE PATTERN, PAS UN TUEUR 
/// @param score								nombre permettant de répartire un nombre de patterns par minute en respectant le score par 30aines secondes défini pour la nuit
/// @param un_seul_par_nuit			booléen selon si le le pattern ne peut apparaître qu'une fois par nuit 
/// @param premier_point				méthode déterminant le premier point du pattern, renvoie un couple (x, y)
/// @param variance							méthode déterminant les potentiels 
/// @param autres_points				méthode pour placer les autres points selon le premier points et les variances.
/// @param illustration						sprite qui sera affiché surant le recap
function setPattern(_score, _unique, _firstPoint, _nextPoints, _ilu) constructor
{
	cout = _score;
	unParNuit = _unique;
	firstCrimePos = _firstPoint;
	nextCrimesPos = _nextPoints;
	illustration = _ilu
}


 //variable tueur
 function setKiller(_pattern, _diffVariance, _firstCrimeDate) constructor
 {
	 pattern = _pattern;
	 diffVariance = _diffVariance; 
	 firstCrimeDate = _firstCrimeDate
	 jourCaught = noone;
	 etat = KILLER_STATE.ACTIVE;
	 color = c_white;
 } 
 
 
///VARIABLE CRIME/POINT CRIME
function setCrime(_idKiller, _nomPrenom, _date, _lastOfKiller,_x, _y, _heure = noone, _minute = noone,_couleur=c_white, _first = false, _portraitVictime=noone, _indices = [noone, noone, noone, noone]) constructor 
{
 tueur = _idKiller;
 _name = _nomPrenom;
 date = _date;
 heure = _heure;
 minute = _minute;
 x = _x;
 y = _y;
 col = _couleur;
 vulnerable = true;
 first = _first;
 last = _lastOfKiller;
 appeared = false;
 portraitVictime = _portraitVictime;
 indices = _indices;
 }
 

 
 

 