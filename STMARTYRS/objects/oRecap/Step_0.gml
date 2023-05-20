/*switch (currentState)
{
	case RECAP_STATES.SHIFTING :{
		quotienParcours += 1 / tpsParcours;
		valeurCourbe = animcurve_channel_evaluate(courbe, quotienParcours);
		x = xStart + (DOCUMENT_DISTANCE_PARCOURS * valeurCourbe);
		
		//FIN ÉTAT
		if quotienParcours == 1
		{
			currentState = RECAP_STATES.TITLE_BRIEF;
		}
	}break;
	case RECAP_STATES.TITLE_BRIEF :{
		titleScribble.draw(TITLE_RECAP_X, TITLE_RECAP_Y, titleTypist);
		
		//FIN ÉTAT
		if (titleTypist.get_state() == 1)
		{
			currentState = RECAP_STATES.RAPPEL_MISSION;
		}
	}break;
	case  RECAP_STATES.RAPPEL_MISSION:{
		titleScribble.draw(TITLE_RECAP_X, TITLE_RECAP_Y, titleTypist);
		rappelScribble.draw(TITLE_RECAP_X, RECAP_RECAP_Y, rappelTypist);
		
		//FIN
		if (rappelTypist.get_state() == 1)
		{
			currentState = RECAP_STATES.UNITS;
		}		
	}break;
	case RECAP_STATES.UNITS:{
		//TEXTE
		titleScribble.draw(TITLE_RECAP_X, TITLE_RECAP_Y, titleTypist);
		rappelScribble.draw(TITLE_RECAP_X, RECAP_RECAP_Y, rappelTypist);
		unitsScribble.draw(TITLE_RECAP_X, UNITS_TEXT_RECAP_Y, unitsTypist);
		
		if true//nbUsisMontres < nbUsisAMontrer
		{
			tpsApparitionPortUsi ++;
			for (var i = 0; i < min(nbUsisAMontrer, tpsApparitionPortUsi div dureeApparitionPortUsi); i ++)
			{
					var _x = (LARGEUR_DOC/QUOTIEN_MARGE_DOC) + (LARGEUR_PORTRAIT_USI_DOC + LARGEUR_DOC/QUOTIEN_MARGE_DOC) * i;
					draw_sprite_stretched_ext(usisAMontrer[i], 0, _x, UNITS_PORTRAIT_SPRITE_Y, LARGEUR_PORTRAIT_USI_DOC, sprite_get_height(usisAMontrer[i]) * (LARGEUR_PORTRAIT_USI_DOC/sprite_get_width(usisAMontrer[i])), -1, 1)
			}
			
		}
		//FIN
		else
		{
			currentState = RECAP_STATES.DATES_END_OF_DOC;	
		}
		
	}break;
}