
function txtEnzino() begin



switch(global.char[p.Enzino].proximite)
{
	
	
	case 0:{
		D "Hi thx for letting me test this one", p.Ernest, l, p.Enzino);
		D"Pas de problème ;););););););););)"enr
		D"'Frappe le printemps en son coeur et normalise l''action banale du courrant que consomme la plupart that's long enough"pl
		
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