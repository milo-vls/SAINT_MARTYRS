step = 0;
nbLevel = 3;
stage = ojeu.miniGameStage[MINI_GAME.CLICKER]; //va de 1 à 4
nbDeCiblesTouchees = 0;	//augmente de 1 quand une cible meurt (incrémentation depuis CIBLE)//retourne à 0 une fois le niveau terminé			
nbCiblesRestantes = 0;	//à déterminer selon le niveau//diminue quand on en fait apparaître une
gameLost = false;		//est ce que l'une des cibles à éclater ? (défaite)
vtsGrossissementCible = 0.05;
maxScale = 5;
maxTailleCible = sprite_get_width(sprCible)*maxScale;
decompteAvantSpawn = 0;
tpsAvantSpawn = 0;
currentLevel = 0; //va de 0 à 3
switch (stage)
{
	case 1:{
		nbCibles = [15, 15, 15, 15];
		frequence = [30, 30, 30, 30];//en millisecondes
	}break;
	case 2:{
		nbCibles = [20, 25, 25, 30];
		frequence = [2000, 1500, 750, 500];
	}break;
	case 3:{
		nbCibles = [20, 25, 25, 30];
		frequence = [2000, 1500, 750, 500];
	}break;
	case 4:{
		nbCibles = [20, 25, 25, 30];
		frequence = [2000, 1500, 750, 500];
	}break;
}
