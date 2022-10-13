
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