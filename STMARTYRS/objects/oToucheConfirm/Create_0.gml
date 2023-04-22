/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur

// Inherit the parent event
event_inherited();

event = function()
{
	var _nbNumero = array_length(ojeu.num);
	for (var i = 0; i < _nbNumero; i ++)
	{
		if ojeu.num[i].numero == oCall.currentNum
		{
			startDial(ojeu.num[i].numero, false);
		}
		else
		{
			//INCOMPLET
			//Ce numéro n'est pas attribué ^^
		}
	}
}