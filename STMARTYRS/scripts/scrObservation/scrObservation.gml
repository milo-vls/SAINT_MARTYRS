
function obs(_str)
{
	txt[nbPages] = _str;
	ltxt[nbPages] = string_length(_str);
	
	nbPages ++;
}

function startObs(_obsID)
{
	if !instance_exists(oDial)
	{
		with instance_create_depth(0, 0, dptxt, oObservation)
		{
			obsData(_obsID);
		}
	}
	
}

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
	case "nombre de tueur":{
		var _nbTueur = ojeu.nbTueurActifs
		if _nbTueur  == 0
		{
			obs("Aucun criminel menace Saints Martyrs")
		}
		else
		{
			if _nbTueur == 1
			obs("1 criminel menace Saints Martyrs")
			else
			obs(string(_nbTueur) + "criminels menacent Saints Martyrs");
		}
	}break;
	
	
	#endregion
}
		
}