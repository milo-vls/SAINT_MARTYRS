// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function txtEnzino() begin



switch(global.char[p.Enzino].proximite)
{
	case 0:{
		D "Vous êtes pas du coin, si ?", p.Enzino, r, p.player);
		D "J'ai été muté iuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuci" el
		D "Muté ?"enr
		D "iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii"pl
		D "Je vois le genre, il te plaît ton boulot ?"enr
		D"On verra bien, j'ai pas encore commencé"el
		D"Bonne chance alors"enr
		
		
	}break;
	case 1:{
		D "Tu regardes quoi ? Tu vois quelque chose là haut ?", p.player, l, p.Enzino);
		D"J'essaye de regarder des étoiles, mais bon, l'affaire n'est pas des plus concluantes"enr
		D"'Faut dire qu'on voit rien avec ces luminaires"enr
		
	}break;
	case 2:{
		D "Ton nom ?",p.player, l, p.Enzino);
		D"Enzino, le tiens ?"enr
		D"Bélaïse"pl
	}break;
	default:instance_destroy();break;

}


global.char[p.Enzino].proximite ++;

end