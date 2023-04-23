
#macro PAS_D_ECOUTEUR "pas d'écouteur"

function d(_txt, tlkingChar, _side, listener = noone, _endFun = noone, _startFun = noone)
{
	
	if listener == noone and nbBulles != 0
	{
		if bulle[nbBulles-1].side == _side
		{
			listener = bulle[nbBulles-1].char2;
		}
		else
		{
			listener = bulle[nbBulles-1].char;
		}
		
	}

	bulle[nbBulles]={
		y : display_get_gui_height(),
		tarY : 0,		//valeur vers laquelle tendra y
		h : 0,			//hauteur de la bulle
		tarH : 0,		//valeur vers laquelle tendra h
		side : _side,
		txt : _txt,		//texte
		ltxt : string_length(_txt),		//longeur du texte
		drewchar : 0,	//nombre de charactères dessinés //évolue durant le dialogue
		char : tlkingChar,
		tarAlpha : 0,
		alpha : 0,
		txtToDraw : "",
		char2 : listener,
		startFun : _startFun,
		endFun : _endFun,
	}
	if setup
	{
		bulle[nbBulles].txt = scribble("["+colFnt +"][ftDial][fa_top][fa_left]"+bulle[nbBulles].txt).wrap(wtxt);
		bulle[nbBulles].typist = scribble_typist();
		bulle[nbBulles].typist.in(0, fadingSpeed);
	}
	nbBulles ++;
	
	
	
}