// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function estDansListe(_val, _liste)
{
	

var _lenListe = array_length(_liste);
var _res = false;
for (var i = 0; i < _lenListe; i ++)
{
	if _liste[i] == _val
	{
		_res = true;
	}
}

return _res;

}


function array_push_array(_listeAModifier, _listeAPousser)
{
	var _lenAPousser = array_length(_listeAPousser);
	for (var i = 0; i < _lenAPousser; i ++)
	{
		array_push(_listeAModifier, _listeAPousser[i])
	}
}