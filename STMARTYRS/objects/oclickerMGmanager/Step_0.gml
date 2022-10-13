
switch (step)
{
	case 0:{//ouverture
		//initialisation du niveau 1
		lvlFrequence = frequence[currentLevel];
		nbCiblesRestantes = nbCibles[currentLevel];
		global.blackScreen = false;
		if global.alphaBlackScreen <= 0
		step ++;
		
	}break;
	case 1:{//jeu
		
		if (nbCiblesRestantes > 0) and !gameLost	//si victoire défaite toujours pas atteint
		{
			decompteAvantSpawn --;
			if decompteAvantSpawn <= 0
			{
				nbCiblesRestantes --;	
				instance_create_layer(irandom_range(maxTailleCible/1.5, room_width - maxTailleCible/1.5), irandom_range(maxTailleCible/1.5, room_height - maxTailleCible/1.5), "cibles_layer", oCible);
				decompteAvantSpawn = lvlFrequence;
			}
		}
		else									//si VICTOIRE/DEFAITE
		{
			
			if gameLost
			instance_destroy(oCible);
			//initialisation pour le prochain niveau
			if currentLevel != nbLevel //reste t-il des niveaux ?
			{
				currentLevel ++;
				lvlFrequence = frequence[currentLevel];
				nbCiblesRestantes = nbCibles[currentLevel];
				gameLost = false;
			}
			else
			{
				if !instance_exists(oCible)
				step ++;
			}
		}
		
		
	}break;
	case 2:{//quitter vers la carte
		
		GoToRoom(pcarte, noone, true);
		
	}break;
}
