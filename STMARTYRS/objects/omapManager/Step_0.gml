
//----MISE A JOUR DATE CARTE-----------------------//
if recapEnCours()
{
	time_source_pause(ojeu.minuterie);
	timer ++;
	minuteToAdd = twerp(TwerpType.inout_cubic, 0, diffTempsMinutes, timer/duree);
	//minuteToAdd = lerp(minuteToAdd, diffTempsMinutes, 0.004)
	global.mapDate = date_inc_minute(initMapDate, minuteToAdd);
	
	if timer==duree
	{
		global.mapDate = global.currentDate;
		mapTimeMAJ = true;
		global.inputOn = true;
		time_source_resume(ojeu.minuterie);
	}
}
else
{
	if !instance_exists(oGoToRoom)
	global.mapDate = global.currentDate;
}


//----MISE A JOUR ÉLÉMENTS SUR LA CARTE---//
maj_meurtre();



//-------MENU------//
switch (currentMenu)
{
	default:{
		//--JOUEUR LIBRE--//
		if player_free()
		{
			//TASKS
			var _lenTasks = array_length(ojeu.mapTasks)
			if _lenTasks>0
			{
				var _currentTasks = depile(ojeu.mapTasks)
				switch(_currentTasks.type)
				{
					case TASK_TYPE.USI_DEATH:{
					}break;
					case TASK_TYPE.DIALOGUE:{
						startDial(_currentTasks.dialogueId)
					}break;
				}
				
				ojeu.nbTasks --;
			}
			
			
			//COMPO USIs
			if !ojeu.recapTenseNight and ojeu.tenseNight
			{
				currentMenu = MAP_MENU.RECAP;
			}
			
		}
	
	
		//---MODIFICATION USI---//
		if selectedUsi != noone
		{
			if selectedUsi.pressed
			{
				drawUsiModification = false;
			}
		}
		else
		{
			drawUsiModification = false;
		}
		
		
		//---DÉTAILS CRIME---//
		instanceCrimeSurvole = instance_survole(ocrime, mouse_x, mouse_y);

		
	}break;
	case MAP_MENU.EXPLO:{
		tpsBufferInputExplo ++;
		if global.cRlLeft
		{
			if  lieuSurvole == noone 
			{
				if tpsBufferInputExplo > bufferInpupExplo 
				currentMenu = noone
			}
			else
			{
				var _lieu = ojeu.lieu[lieuSurvole]
				GoToRoom(_lieu.piece)
				
				if _lieu.connu != CONNAISSANCE_LIEU.VISITE
				{
					_lieu.connu = CONNAISSANCE_LIEU.VISITE
					var _lenConnections = array_length(_lieu.connections)
					for (var i = 0;i < _lenConnections;i ++)
					{
						if ojeu.lieu[_lieu.connections[i]].connu == CONNAISSANCE_LIEU.INCONNU{ojeu.lieu[_lieu.connections[i]].connu = CONNAISSANCE_LIEU.JUXTAPOSE}
					}
				}
			}
		}
																																		//createChoiceBox("Quitter la carte", quitMap, "Retour", noMenu);

	}break;
	case MAP_MENU.CRIME_DETAILS:{
	tarAlphaFondNoir = 0.7;
	tarAlphaMenupsc = 1;
	alphaMenupsc = 1;
	
	//QUITTER L'ÉCRAN PSC
	if !point_in_circle(mouse_x, mouse_y, x2RSup, y1RCentral, dcoin*1.25)
	{
		backbuttonPressed = false;
	}
	if point_in_circle(mouse_x, mouse_y, x2RSup, y1RCentral, dcoin*1.25) and global.cPrLeft
	{
		backbuttonPressed = true;
	}
	if backbuttonPressed and global.cRlLeft 
		{
			selectpsc =  noone;
			tarAlphaFondNoir = 0;
			tarAlphaMenupsc = 0;
			alphaMenupsc = 0;
			noMenu();
		}
	//incrémenter la couleur
	if !point_in_rectangle(mouse_x, mouse_y, xIncCol, yIncCol, xIncCol+sprite_get_width(sprChangeCol), yIncCol + sprite_get_height(sprChangeCol))
	{
		IncColpressed = false;
	}
	if point_in_rectangle(mouse_x, mouse_y, xIncCol, yIncCol, xIncCol+sprite_get_width(sprChangeCol), yIncCol + sprite_get_height(sprChangeCol)) and global.cPrLeft
	{
		IncColpressed = true;
	}
	if IncColpressed and global.cRlLeft
	{
		if ojeu.crime[selectpsc].col == array_length(global.crimeCol)-1
		{
			ojeu.crime[selectpsc].col = 0;
		}
		else
		{
			ojeu.crime[selectpsc].col ++;
		}
	}	
	//décrémenter la couleur
	if !point_in_rectangle(mouse_x, mouse_y, xDecCol, yDecCol, xDecCol+sprite_get_width(sprChangeCol), yDecCol + sprite_get_height(sprChangeCol))
	{
		DecColpressed = false;
	}
	if point_in_rectangle(mouse_x, mouse_y, xDecCol, yDecCol, xDecCol+sprite_get_width(sprChangeCol), yDecCol + sprite_get_height(sprChangeCol)) and global.cPrLeft
	{
		DecColpressed = true;
	}
	if DecColpressed and global.cRlLeft
	{
		if ojeu.crime[selectpsc].col == 0
		{
			ojeu.crime[selectpsc].col = array_length(global.crimeCol)-1;
		}
		else
		{
			ojeu.crime[selectpsc].col --;
		}
	}
	}break;
	case MAP_MENU.PHONE:{
		
		GoToRoom(pCall);
	}break;
	case MAP_MENU.ORDI:{
		GoToRoom(pordi)
	}
	case MAP_MENU.GAME_OVER:{
		 tarAlphaGameOver = 1;
		audio_stop_sound(mainTheme);
		if !gameOverSfxPlayed
		{
			gameOverSfxPlayed = true;
			playsound(snGameOver, 1);
		}
		
		if (alphaFinDePartie > 0.2)
		{
			alphaGameOverOption = approach(alphaGameOverOption, 1, 0.04);
			for (var _iOption = 0; _iOption < nbGameOverOption; _iOption ++)
			{
				var _option = gameOverOption[_iOption];
				var _scribble = _option.scrbbl;
				var _hauteurTexte = _scribble.get_height()/2;
				var _largeurTexte = _scribble.get_width()/2;
				if point_in_rectangle(mouse_x, mouse_y, GAME_WIDTH/2 - _largeurTexte, _option._y - _hauteurTexte/2, GAME_WIDTH/2 + _largeurTexte, _option._y + _hauteurTexte*2)
				{
					if global.cPrLeft
					{
						_option.procedure();
					}
				}
			}
		}
		
	}break;
	case MAP_MENU.RECAP:{
		//TIME STOP
		time_source_pause(ojeu.minuterie);
		if minuterie != noone
		{
			time_source_pause(minuterie);
		}
		
		
		//----FIN RÉCAP
		if global.cRlLeft
		{
			//SWITCH TO OTHER MENU
			currentMenu = noone;
			ojeu.recapTenseNight = true;
			
			//RESUME TIME STOPPED
			time_source_resume(ojeu.minuterie);
			if minuterie != noone
			{
				time_source_resume(minuterie);
			}
		}
		
		
	}break;
	case MAP_MENU.RETRY:{
		startTenseNight()
	}break;
	
}


//-----TENSE NIGHT-----//
if ojeu.tenseNight
{
	//-----CALCUL NOMBRE DE TUEURS ACTIFS-----//
	ojeu.nbTueurProcActifs =  maj_nb_tueur_proc();
	//-----CALCUL TEMPS PASSÉ-----//
	var _checkTimeRemaining = time_source_get_time_remaining(minuterie);
	minuterieTenseNightTimeSpent = currentNightDiff.dureeSeconde - _checkTimeRemaining ;
	
	//-----ENCLENCHEMENT GAME OVER------//
	if ojeu.nbTueurProcActifs > currentNightDiff.nbTueursMax and (currentMenu != MAP_MENU.RETRY and currentMenu != MAP_MENU.GAME_OVER_QUIT)
	{
		 currentMenu = MAP_MENU.GAME_OVER;
	}

}


//-----NOT TENSE NIGHT RELATED-------//
else
{
	ojeu.nbTueurActifs = maj_nb_tueurs();
}

//DEBUG
if keyboard_check(vk_down) then currentMenu = MAP_MENU.GAME_OVER;



