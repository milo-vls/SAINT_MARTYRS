
//-----------FAIRE APPAÎTRE CRIME					-----------//
function ocrime_instance_create(_index_crime)
{
ojeu.crime[_index_crime].appeared = true;
with instance_create_layer(ojeu.crime[_index_crime].x, ojeu.crime[_index_crime].y, "crime", ocrime)
{
		crimeID = _index_crime;
		crimeType = ojeu.crime;
		tueurType = ojeu.tueur;
}
}

//-----------	compte tueurs actifs						-----------//
function maj_nb_tueur_proc()
{
	
	
	var _toReturn = 0;
	
	var _nbCrime = instance_number(ocrime)
	for (var i = 0; i < _nbCrime; i ++)
	{
		if omapManager.crimeProc[instance_find(ocrime, i).crimeID].first == true
		{
 			_toReturn ++;
		}
	}
	
	return _toReturn;
	
	
}
function maj_nb_tueurs()
{
	
	
	var _nbTueurs = 0;
	var _nbCrimes = instance_number(ocrime);
	
	for (var i = 0; i < _nbCrimes; i ++)
	{
		if ojeu.crime[instance_find(ocrime, i).crimeID].first == true
		{
			_nbTueurs ++;
		}
	}
	
	return _nbTueurs;
	
	
}

//-----------	vérification de nouveaux meurtres-----------//
function maj_meurtre()
{
	

if !ojeu.tenseNight
{

	for (var i = 0; i < array_length(ojeu.crime);i++)
	{
		if !ojeu.crime[i].appeared and ojeu.tueur[ojeu.crime[i].tueur].etat == KILLER_STATE.ACTIVE and ojeu.crime[i].date = ojeu.numeroJour
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
	
	return 0;
}

var _listeCrimes = omapManager.crimeProc
var _nbCrimeProc = array_length(_listeCrimes);
var _listeTueurs = omapManager.tueurProc;
for (var _crime = 0; _crime < _nbCrimeProc; _crime ++)
{
	
	if _listeCrimes[_crime].date <  minuterieTenseNightTimeSpent and !_listeCrimes[_crime].appeared and _listeTueurs[_listeCrimes[_crime].tueur].etat == KILLER_STATE.ACTIVE
	{
		omapManager.crimeProc[_crime].appeared = true;
		with instance_create_layer(_listeCrimes[_crime].x, _listeCrimes[_crime].y, "crime", ocrime)
		{
			crimeID = _crime;
			crimeType = _listeCrimes;
			tueurType = _listeTueurs;
		}
		
	}
}



return 1;

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
		if ((ojeu.usi[_usi].section == USI_SECTIONS.TACTIC_UNIT and ojeu.tenseNight) or (ojeu.usi[_usi].section == USI_SECTIONS.PREVENTION_UNIT and !ojeu.tenseNight)) and (ojeu.usi[_usi].disponible)
		{
			with instance_create_layer(ojeu.usi[_usi].x, ojeu.usi[_usi].y, "usi", ousi)
			{
				pressed			= false;
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
	var _tueurId = ojeu.crime[i].tueur;
	var _tueurState = ojeu.tueur[_tueurId].etat
	if ojeu.crime[i].appeared and _tueurState == KILLER_STATE.ACTIVE and ojeu.crime[i].date > ojeu.numeroJour
	{
		ocrime_instance_create(i);
	}
}

}


//----------- détection, hitbox et autres                   -------------//
function instance_survole(_objID, _x, _y)
{
	var _nbInstances = instance_number(_objID);
	var _instanceTrouvee = noone;
	var _instance;
	for (var i = 0; i < _nbInstances; i ++)
	{
		_instance = instance_find(ocrime, i);
		if position_meeting(_x, _y, _instance)
		{
			_instanceTrouvee = _instance;	
		}
	}
	
	
	return _instanceTrouvee;
	
	
}


//--------    -fin du récap                            -------------------------------//
function endRecap()
{
	//SWITCH TO OTHER MENU
	omapManager.currentMenu = noone;
	ojeu.recapTenseNight = true;
	

	if omapManager.minuterieTenseNight != noone
	{
		time_source_start(omapManager.minuterieTenseNight);
	}
}
//---------coordonnées relatives-------------------------------//
#macro HAUTEUR_MAP_ABSOLUE 360
#macro LARGEUR_MAP_ABSOLUE 640
function y_map_absolue(_yBrut, _hauteurMapRelative)
{
	return round((HAUTEUR_MAP_ABSOLUE * (_yBrut/_hauteurMapRelative)) - (HAUTEUR_MAP_ABSOLUE/2));
}
function x_map_absolue(_xBrut, _largeurMapRelative)
{
	return round((LARGEUR_MAP_ABSOLUE * (_xBrut/_largeurMapRelative)) - (LARGEUR_MAP_ABSOLUE/2));
}

