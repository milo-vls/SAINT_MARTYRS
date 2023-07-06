//ENSEMBLE DE PROCÉDURE AJOUTANT à UNE LISTE UNE STRUCT PRÉVUES 


function addScriptedCrime(_idKiller, _nomPrenom, _dateJour, _lastOfKiller,_x, _y, _portrait = noone, _indices = noone)
{
	ojeu.crime[ojeu.nbCrimes] = new setCrime(_idKiller, _nomPrenom, _dateJour, _lastOfKiller,_x, _y, false, c_white, false, _portrait, _indices)
	ojeu.nbCrimes ++;
}
function addScriptedKiller(_date)
{
	ojeu.tueur[ojeu.nbTueurs] = new setKiller(noone, 0, _date);
	ojeu.nbTueurs ++;
}


#macro	RESSOURCE_TYPE_WEB_SPRITE "spr"
#macro	RESSOURCE_TYPE_WEB_TEXTE "txt"
function addWebElement(_ressource, _decalage = 20)
{
	// Feather disable GM2043
	#region transformation de la resource

		if is_string(_ressource)	
		{
			var _type = RESSOURCE_TYPE_WEB_TEXTE;
			_ressource = scribble( _ressource).wrap(largeurPage - margeTexte*2);
			var _hauteur = _ressource.get_height();
			var _largeur = _ressource.get_width();
		}
		else
		{
			var _type = RESSOURCE_TYPE_WEB_SPRITE;
			var _scale = (largeurPage - margeImage*2)/sprite_get_width(_ressource);
			var _largeur = sprite_get_width(_ressource) * _scale;
			var _hauteur = sprite_get_height(_ressource) * _scale;
		}
	#endregion
	#region position
		if nbElementWeb != 0	
		{
			var _y = elementWeb[nbElementWeb - 1 ].y + elementWeb[nbElementWeb - 1 ].hauteur + _decalage	
		}
		else									
		{	
			var _y = _decalage																	
		}
	#endregion
	
	elementWeb[nbElementWeb] = {
		nature : _type,
		ressource : _ressource,
		y : _y,
		hauteur : _hauteur,
		largeur : _largeur,
	}
	hauteurPage = elementWeb[nbElementWeb].y + elementWeb[nbElementWeb].hauteur;
	nbElementWeb ++;
	
}

