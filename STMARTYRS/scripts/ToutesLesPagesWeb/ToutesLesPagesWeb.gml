// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function loadPageWeb(_IDWeb)
{

nbElementWeb	=	0;
largeurPage			=	1000;
margeTexte			=	100;
margeImage		=	50;
couleurSecondPlan = c_orange;
hauteurPage = 0;
layer_background_sprite(idBackground, sprOrdiChargement);


switch(_IDWeb)
{
	case "demo":{
		addWebElement("yoyoyo la démo");
		addWebElement("Petite photo de Blaise :3333")
		addWebElement(portPlayer);
	}break;
	case "news":{
		layer_background_sprite(idBackground, sprOrdiPageWeb);
		addWebElement("Ci dessous seront bientôt affichées les actualités de St Martyrs!", 200);
		addWebElement("Nous vous remercions pour votre patience ^^", 50);
		addWebElement(sprOrdiChargement);
	break;
	}
	case "base":{
		addWebElement("Bienvenu Blaise sur votre session", 200);
		addWebElement("Veuillez à bien saisir l'adresse de la page que vous souhaitez visiter", 50);
		addWebElement("essayer avec le mot : NEWS", 200);
	break;
	}
	default:{
		addWebElement("Oups, cette URL n'existe pas :,(");
		charsInputJoueur = "";
	break;	
	}
}

xDroitSecondPlan = display_get_gui_width()/2 - largeurPage/2;
xGaucheSecondPlan = display_get_gui_width()/2 + largeurPage/2;
hauteurScroller = hauteurCadreScroller * ( hauteurFauxEcran / hauteurPage);
yAjoute = yMin;
yScroller = yCadreScroller;
}








