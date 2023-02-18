
//-----------	compte tueurs actifs						-----------//
function maj_nb_tueur()
{
var _listeIDTueur = []
var _toReturn = 0
for (var i = 0; i < instance_number(ocrime); i ++)
{
	var _instanceOcrime = instance_find(ocrime, i)
	if _instanceOcrime.crimeType == ojeu.crime
	{
		var _idTueur = ojeu.crime[_instanceOcrime.crimeID].tueur
		if !estDansListe(_idTueur, _listeIDTueur)
		{
			array_push(_listeIDTueur, _idTueur)
			_toReturn ++;
		}
	}
	
}


ojeu.nbTueurActifs =  _toReturn;
}


//-----------	vérification de nouveaux meurtres-----------//
function maj_meurtre()
{
if !ojeu.tenseNight
{

	for (var i = 0; i < array_length(ojeu.crime);i++)
	{
		if !ojeu.crime[i].appeared and ojeu.tueur[ojeu.crime[i].tueur].etat == KILLER_STATE.ACTIVE and ojeu.crime[i].date < global.mapDate
		{
			ajout_resurgence(ojeu.crime[i].coutResurgence)
			ojeu.crime[i].appeared = true;
			with instance_create_layer(ojeu.crime[i].x, ojeu.crime[i].y, "crime", ocrime)
			{
				crimeID = i;
				crimeType = ojeu.crime;
				tueurType = ojeu.tueur;
			}
		}
	}	
}
else
{
	var _listeCrimes = ojeu.crimeProc
	var _nbCrimeProc = array_length(_listeCrimes);
	var _listeTueurs = ojeu.tueurProc;
	for (var _crime = 0; _crime < _nbCrimeProc; _crime ++)
	{
		if _listeCrimes[_crime].date < global.mapDate and !_listeCrimes[_crime].appeared and _listeTueurs[_listeCrimes[_crime].tueur].etat == KILLER_STATE.ACTIVE
		{
			ajout_resurgence(_listeCrimes[_crime].coutResurgence);
			ojeu.crimeProc[_crime].appeared = true;
			with instance_create_layer(_listeCrimes[_crime].x, _listeCrimes[_crime].y, "crime", ocrime)
			{
				crimeID = _crime;
				crimeType = _listeCrimes;
				tueurType = _listeTueurs;
			}
		}
	}
}
}


//-----------	ajout résurgence									-----------//
function ajout_resurgence(_res)
{
	ojeu.resurgence += _res;
	ojeu.resurgence = clamp(ojeu.resurgence, 0, ojeu.resurgenceMax);
}


//-----------	chargement icônes habitants			-----------//
function maj_npc()
{
var _nbChar = array_length(global.char);
for (var i = PREMIER_PNJ; i < _nbChar; i ++)
{
	if global.char[i].mapIcone != noone and global.char[i].mapX != noone and global.char[i].mapY != noone
	{
		with instance_create_layer(global.char[i].mapX, global.char[i].mapY, "icone_pnj", oIconeMapPnj)
		{
			sprite_index = global.char[i].mapIcone;
		}
	}
}
}


//-----------	chargement usi 									-----------//
function load_usi()
{
	var _nbUsi = array_length(ojeu.usi)
	for (var _usi = 0; _usi < _nbUsi; _usi ++)
	{
		//l'usi doit-il bien être sur la carte ?
		if ojeu.usi[_usi].etat == USI_STATE.PATROL	
		{
			with instance_create_layer(ojeu.usi[_usi].x, ojeu.usi[_usi].y, "usi", ousi)
			{
				pressed				= false;
				isNew				= true;
				usiID					= _usi;
			}
			
		}
	}
}


//-----------	chargement psc 									-----------//
function load_psc()
{
	for (var i = 0; i < array_length(ojeu.crime);i++)
	{
		if ojeu.crime[i].appeared and ojeu.tueur[ojeu.crime[i].tueur].etat == KILLER_STATE.ACTIVE and ojeu.crime[i].date < global.mapDate
		{
				ojeu.crime[i].appeared = true;

			with instance_create_layer(ojeu.crime[i].x, ojeu.crime[i].y, "crime", ocrime)
			{
				crimeID = i;
				crimeType = ojeu.crime;
				tueurType = ojeu.tueur;
			}
		}
	}
}



