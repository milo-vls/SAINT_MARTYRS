function charger()
{
	if !file_exists(SAVE_FILE_NAME)
	{
		return false;	
	}
	var _structToLoad = fichierToJson(SAVE_FILE_NAME);
	
	global.language = _structToLoad.langue;
	ojeu.numeroJour = _structToLoad.numeroJour;
	ojeu.nbPageRep = _structToLoad.nbPageRep;
	ojeu.nbNumObtenu = _structToLoad.nbNumObtenu;
	global.startingRoom = _structToLoad.room;
	ojeu.showButtonRetourCarte = _structToLoad.showButtonRetourCarte;
	ojeu.peutAllerGendarmerie = _structToLoad.peutAllerGendarmerie;

	
	//NUMÉROS OBTENUS
	if ojeu.nbNumObtenu > 0
	{
		for (var i = 0; i < ojeu.nbNumObtenu; i ++)
		{
			ojeu.numObtenu[i] = _structToLoad.numObtenu[i]
		}
	}
	//USI
	var _nbUsi  = array_length(ojeu.usi);
	for (var i = 0; i < _nbUsi; i ++)
	{
		ojeu.usi[i].x = _structToLoad.usi[i].x;
		ojeu.usi[i].y = _structToLoad.usi[i].y;
		ojeu.usi[i].rot = _structToLoad.usi[i].rot;
		ojeu.usi[i].disponible = _structToLoad.usi[i].disponible;
	}
	
	//CHARACTERS
	var _nbChar = array_length(global.char);
	for (var i = 0; i < _nbChar; i ++)
	{
		global.char[i].proximite = _structToLoad.char[i].proximite;
		global.char[i].nbInteractionCeJour = _structToLoad.char[i].nbInteractionCeJour;
	}
	
	//CRIMES scriptés
	var _nbCrimeScriptes = array_length(ojeu.crime);
	for (var i = 0; i < _nbCrimeScriptes; i ++)
	{
		ojeu.crime[i].col = _structToLoad.crime[i].col;
		ojeu.crime[i].vulnerable = _structToLoad.crime[i].vulnerable;
		ojeu.crime[i].appeared = _structToLoad.crime[i].appeared;
	}
	
	//TUEURS scriptés
	var _nbTueurs = array_length(ojeu.tueur);
	for (var i = 0; i < _nbTueurs; i ++)
	{
		ojeu.tueur[i].jourCaught  =  _structToLoad.tueur[i].jourCaught;
		ojeu.tueur[i].etat = _structToLoad.tueur[i].etat;
		
	}
	
	
	return true;
}


function charger_langue()
{
	if !file_exists(SAVE_FILE_NAME)
	{
		return false;	
	}
	var _structToLoad = fichierToJson(SAVE_FILE_NAME);
	global.language = _structToLoad.langue;
	
}




































function fichierToJson(_nomFichier)
{
	var _buffer = buffer_load(_nomFichier);
	var _string = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	var _json = json_parse(_string);
	return _json;

}