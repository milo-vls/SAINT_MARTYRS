#macro SAVE_FILE_NAME "blaise.view"

function sauvegarder()
{
	var _structToSave = 
	{
		langue : global.language,
		numeroJour : ojeu.numeroJour,
		nbPageRep : ojeu.nbPageRep,
		nbNumObtenu : ojeu.nbNumObtenu,
		room : room,
		showButtonRetourCarte : ojeu.showButtonRetourCarte,
		peutAllerGendarmerie : ojeu.peutAllerGendarmerie,
	}
	
	//NUMÉROS OBTENUS
	for (var i = 0; i < ojeu.nbNumObtenu; i ++)
	{
		_structToSave.numObtenu[i] = ojeu.numObtenu[i];
	}
	
	//USI
	var _nbUsi = array_length(ojeu.usi)
	for (var i = 0; i < _nbUsi; i ++)
	{
		_structToSave.usi[i] =
		{
			x : ojeu.usi[i].x,
			y : ojeu.usi[i].y,
			rot : ojeu.usi[i].rot,
			disponible :  ojeu.usi[i].disponible,
		}
	}
	
	//CHARACTERS
	var _nbChar = array_length(global.char);
	for (var i = 0; i < _nbChar; i ++)
	{
		_structToSave.char[i] =
		{
			proximite : global.char[i],
			nbInteractionCeJour : global.char[i].nbInteractionCeJour,
		}
	}
	
	//CRIME scripctés
	var _nbCrimeScriptes = array_length(ojeu.crime);
	for (var i = 0; i < _nbCrimeScriptes; i ++)
	{
		_structToSave.crime[i] = 
		{
			col : ojeu.crime[i].col,
			vulnerable : ojeu.crime[i].vulnerable,
			appeared : ojeu.crime[i].appeared,
		}
	}
	
	//TUEUR scriptés
	var _nbTueurs = array_length(ojeu.tueur);
	for (var i = 0; i < _nbTueurs; i ++)
	{
		_structToSave.tueur[i] = 
		{
			jourCaught : ojeu.tueur[i].jourCaught,
			etat : ojeu.tueur[i].etat,
		}
	}
	
	
	stringToFichier(SAVE_FILE_NAME, json_stringify(_structToSave))
	
}

function stringToFichier(_nomFichier, _string)
{

	var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer, _nomFichier);
	buffer_delete(_buffer);

}