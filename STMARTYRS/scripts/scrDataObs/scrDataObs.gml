function obsData(ID)
{
	
switch(ID)
{
	#region test
	case "obsID test":{
		obs("Un mec chelou seul dans la nuit");
		obs("A tout moment il m'attrape mdr");
		
		
	}break;
	case "test obtention num Ernest":{
		obs("Un bout de papier oublié sur un banc...");
		obs("C'est un numéro de téléphone!\nIl a été ajouté à votre répertoire.");
		
	}break;
	#endregion
	#region DEMO
	case "OPTIONS DEMO INDISPO":
	obs("Oops, it looks like this part isn't done yet")
	obs("That being said, thank you for believing it would :p")
	obs("Just start the demo please")
	break;
	case "WELCOME DEMO":
	obs("This demo's only purpose is to show the exploration system and the dialogue system")

	
	break;
	#endregion
	#region map option
	case "NBTUEURS_OBS_ID":{
		var _nbTueur = ojeu.nbTueurActifs
		if _nbTueur  == 0
		{
			obs(text("PAS_DE_CRIMINELS"));
		}
		else
		{
			if _nbTueur == 1
			obs(text("UN_CRIMINEL"))
			else
			obs(text("NOMBRE_CRIMINELS", _nbTueur));
		}
	}break;
	
	
	#endregion
	#region CINÉMATIQUE
		#region SCENE 1 & 2
			case OBS_ID_TABLEAU_DE_NUIT:{
				obs("Il fait déjà nuit.");
				obs("Le rendez-vous est pour bientôt.");
				obs("...");
				obs("Je dois aller mettre mon uniforme.");
			}break;
			case OBS_ID_SANITAIRE:{
				obs("...");
				obs("C’est pas la mer à boire. Tu t’es investi et maintenant tu y es.");
				obs("...", function(){oRefletBlaise.image_index = BLAISES_SMILING_FACE});
				obs("Quitter famille et amis pour bosser dans un coin paumé ? Je me forme, rien de grave, je suis tout juste diplômé je dois apprendre du terrain.");
				obs("C’est l’histoire d’attendre une mutation à la Capitale, deux petites semaines ici et « ciao les ploucs ». ");
				obs("...");
				obs("Bientôt l’heure, reste pas là trop longtemps à parler seul tu vas ficher la trouille à tes très chers futurs collègues.");
				obs("...", function(){oRefletBlaise.image_index = BLAISES_NEUTRAL_FACE});
				obs(" . . . ");
			}break;
		#endregion
	
	
	#endregion
	#region MENUS ET SYSTEME
		case OBS_ID_RECAP_NOUVEAUX_CRIMES_FAIT :{
			if oMiseAJourCarte.nbNouveauxCrimes == 0
			{
				obs(text("RECAP SANS CRIMES"));
			}
			if oMiseAJourCarte.nbNouveauxCrimes == 1
			{
				obs(text("RECAP UN CRIME"));
			}
			else
			{
				obs(text("RECAP CRIMES", oMiseAJourCarte.nbNouveauxCrimes));
			}
		}break;
	#endregion
}
		
}