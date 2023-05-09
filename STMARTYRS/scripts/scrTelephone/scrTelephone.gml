enum INDEX_NUM
{
	CASE_1,
	MAMAN,

}

function getNumeroHauteur(_numero, _sprite = noone)
{
	if _sprite == noone
	{
		draw_set_font(ftRepertoire);	
		return string_height(_numero);
	}
	
	return sprite_get_height(_sprite);
	
}

function setNumero(_numero, _sprite = noone) constructor
{
	numero = _numero;
	sprite = _sprite;
	y = 0;
	page = -1;
	hauteur = getNumeroHauteur(_numero, _sprite);
	
	
}

function ajoutNumRep(_index_numero)
{
var _estDejaObtenu = false;
var _nbNumObtenu = ojeu.nbNumObtenu

for (var i = 0; i < _nbNumObtenu;i ++)
{
	if ojeu.numObtenu[i] == _index_numero
	{
		_estDejaObtenu = true;
	}
	
}

if _estDejaObtenu == false
{
	ojeu.numObtenu[_nbNumObtenu] = _index_numero;
	ojeu.nbNumObtenu ++;
	
	
	//quels position ?
	
	//reste t-il de la place sur la page ? Si non, passer à la prochaine page. Si oui, mettre à jour la place utilisée et donner au numéro son y et sa page
	
	//--------- /!\/!\ NBPAGEREP est le nombre de page -1 /!\/!\ ------------//
	
	if (ojeu.hZoneEcrivable + ojeu.hZoneEcrivable * ojeu.nbPageRep)-(ojeu.placeUsed) < ojeu.num[_index_numero].hauteur
	{
		ojeu.nbPageRep ++;
		ojeu.placeUsed = ojeu.hZoneEcrivable + ojeu.hZoneEcrivable * ojeu.nbPageRep + ojeu.num[_index_numero].hauteur;
		ojeu.num[_index_numero].y = 0;
		ojeu.num[_index_numero].page = ojeu.nbPageRep;
	}
	else
	{
		ojeu.num[_index_numero].y = (ojeu.placeUsed) - ojeu.hZoneEcrivable * ojeu.nbPageRep
		ojeu.num[_index_numero].page = ojeu.nbPageRep;
		ojeu.placeUsed += ojeu.num[_index_numero].hauteur;
	}
	
}



}

function formatageNumero(_numBrut)
{
	var _numLength = string_length(_numBrut);
	if _numLength = 6
	{
		var _toReturn = string_insert( " ", _numBrut, 7);
		return _toReturn;
	}
	
	if _numLength = 3
	{
		var _toReturn = string_insert( " ", _numBrut, 3);
		return _toReturn;
	}
	
	return _numBrut;
	
}

function initTelephone()
{
	ojeu.nbPageRep = 0;
	ojeu.numObtenu[0] = noone;
	ojeu.nbNumObtenu = 0;
	
	ojeu.num[INDEX_NUM.CASE_1] = new setNumero("12 582 21");
	ojeu.num[INDEX_NUM.MAMAN] = new setNumero("55 987 14");
	
	
	
	
	
	
	ajoutNumRep(INDEX_NUM.MAMAN);
}




