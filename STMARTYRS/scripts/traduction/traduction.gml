//traducible txt
function str(_string)
{
	global._string = _string;
	global._toReturn = global._string;
	
	if global.langage == "en"
	{
		trad("Nouvelle partie", "New Game");
		trad("Quitter", "Quit");
	}
	
	if global.langage == "es"
	{
		
	}
	
	
	
	return global._toReturn;
}

function trad(_txtToTraduce, translation)
{
	if global._string == _txtToTraduce
	{
		global._toReturn = translation;
	}
}