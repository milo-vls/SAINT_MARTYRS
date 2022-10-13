// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations

function txtAmandine(){
	

 global.char[p.Amandine].nbInteractionCeJour ++;
 
if global.char[p.Amandine].nbInteractionCeJour == 1 //ne se joue qu'une fois par jour
{
	global.char[p.Amandine].proximite ++;
	switch (JOUR_SELON_DIALOGUES)
	{
	
		#region	0	=>	9
			case 0 :{
				d("Sinon ça, rien d'anormal? Il y a eu un meurtre pas loin", pl
				d("Vous voyez bien que vous soupçonnez ", mr
				d("S'il vous plaît je veux juste enquêter sur la mort d'un pauvre homme", pl
				d("[wave]Oh non, il est [/wave][blink]mort", mr
				d("Votre silence vous rend suspec[skip]te", pl
				d("[skip]J'ai vu le tueur", mr
				d("Ne vous en faites pas je- PARDON ?", pl
				d("Il avait l'air super louche avec un couteau de cuisine dans la rue, vérifiant tous les coins de rue", mr
				d("Parfait à quoi ressemblait-il !", pl
				d("Je sais pas", mr
				d("Vous ne vous souvenez vraiment de rien ?!", pl
				d(" Si, si. Qu'il est zarbi.", mr
				d("Merci beaucoup cette description me sera très utile surtout dans cette ville.", pl
				d("Que voulez-vous que je vous dise ? Il prend une rue parmi 2 avec un pile ou face, pour le coup il est vraiment atteint.", mr
				d("(même pour un gars du coin)", mr
				d("Vous savez quoi, c'est pas mal, je sais maintenant comme il se déplace", pl
				d("J'en sais pas plus monsieur l'agent mais maintenant laissez moi tranquille ou bien j'appelle votre supérieur", mr
				d("...", p.player, l, PAS_D_ECOUTEUR);
				d("Aimable", p.player, l, PAS_D_ECOUTEUR);
			}break;
			case 1 :{
			
			}break;
			case 2 :{
			
			}break;
			case 3 :{
			
			}break;
			case 4 :{
			
			}break;
			case 5 :{
			
			}break;
			case 6 :{
			
			}break;
			case 7 :{
			
			}break;
			case 8 :{
			
			}break;
			case 9 :{
			
			}break;
		#endregion
		#region	10	=>	19
			case 10 :{
			
			}break;
			case 11 :{
			
			}break;
			case 12 :{
			
			}break;
			case 13 :{
			
			}break;
			case 14 :{
			
			}break;
			case 15 :{
			
			}break;
			case 16 :{
			
			}break;
			case 17 :{
			
			}break;
			case 18 :{
			
			}break;
			case 19 :{
			
			}break;
		#endregion
		#region	20	=>	29
			case 20 :{
			
			}break;
			case 21 :{
			
			}break;
			case 22 :{
			
			}break;
			case 23 :{
			
			}break;
			case 24 :{
			
			}break;
			case 25 :{
			
			}break;
			case 26 :{
			
			}break;
			case 27 :{
			
			}break;
			case 28 :{
			
			}break;
			case 29 :{
			
			}break;
		#endregion
		#region	30	=>	39
			case 30 :{
			
			}break;
			case 31 :{
			
			}break;
			case 32 :{
			
			}break;
			case 33 :{
			
			}break;
			case 34 :{
			
			}break;
			case 35 :{
			
			}break;
			case 36 :{
			
			}break;
			case 37 :{
			
			}break;
			case 38 :{
			
			}break;
			case 39 :{
			
			}break;
		#endregion
		#region	40	=>	49
			case 40 :{
			
			}break;
			case 41 :{
			
			}break;
			case 42 :{
			
			}break;
			case 43 :{
			
			}break;
			case 44 :{
			
			}break;
			case 45 :{
			
			}break;
			case 46 :{
			
			}break;
			case 47 :{
			
			}break;
			case 48 :{
			
			}break;
			case 49 :{
			
			}break;	
		#endregion
		#region	50	=>	59
			case 50 :{
			
			}break;
			case 51 :{
			
			}break;
			case 52 :{
			
			}break;
			case 53 :{
			
			}break;
			case 54 :{
			
			}break;
			case 55 :{
			
			}break;
			case 56 :{
			
			}break;
			case 57 :{
			
			}break;
			case 58 :{
			
			}break;
			case 59 :{
			
			}break;
		#endregion
		#region	60	=>	69
			case 60 :{
			
			}break;
			case 61 :{
			
			}break;
			case 62 :{
			
			}break;
			case 63 :{
			
			}break;
			case 64 :{
			
			}break;
			case 65 :{
			
			}break;
			case 66 :{
			
			}break;
			case 67 :{
			
			}break;
			case 68 :{
			
			}break;
			case 69 :{
			
			}break;
		#endregion
	
	}
}
else
{
	switch (global.char[p.Amandine].nbInteractionCeJour)
	{
	case 2: break;	
		
		
	default:instance_destroy(oDial);
	}
}





}