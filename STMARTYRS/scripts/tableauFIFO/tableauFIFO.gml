// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function depile(_tab)
{
	var _tabLen = array_length(_tab);
	var _toReturn = _tab[0];
	
	for (var i = 0; i<_tabLen-1;i++)
	{
		_tab[i] = _tab[i+1]
	}
	array_resize(_tab, _tabLen-1)
	return _toReturn;
}