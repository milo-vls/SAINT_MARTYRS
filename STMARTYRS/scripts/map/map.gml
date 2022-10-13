//-----------	compte tueurs actifs						-----------//
function maj_nb_tueur()
{

var _tueur = ojeu.tueur;
var _nbTueur = array_length(_tueur);
var _toReturn = 0;
for (var i = 0; i < _nbTueur; i ++)
{

	if (_tueur[i].endActivityDate > global.mapDate) and (_tueur[i].startActivityDate < global.mapDate)
	{
		_toReturn ++;
	}
}
ojeu.nbTueurActifs = _toReturn;
}
//-----------	vérification de nouveaux meurtres-----------//
function maj_meurtre()
{
	
for (var i = 0; i < array_length(ojeu.crime);i++)
{
	if !ojeu.crime[i].appeared and ojeu.tueur[ojeu.crime[i].tueur].etat == KILLER_STATE.ACTIVE and ojeu.crime[i].date < global.mapDate
	{
		ojeu.crime[i].appeared = true;
		with instance_create_layer(ojeu.crime[i].x, ojeu.crime[i].y, "crime", ocrime)
		{
			crimeID = i;
		}
	}
}	

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
		}
	}
}
}
