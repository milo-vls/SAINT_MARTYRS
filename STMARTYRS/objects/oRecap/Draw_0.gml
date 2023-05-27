draw_self();

switch (currentState)
{
	case RECAP_STATES.SHIFTING :{
		quotienParcours += 1 / tpsParcours;
		valeurCourbe = animcurve_channel_evaluate(courbe, quotienParcours);
		x = xStart + (DOCUMENT_DISTANCE_PARCOURS * valeurCourbe);
		
		//FIN ÉTAT
		if quotienParcours > 1
		{
			currentState = RECAP_STATES.TITLE_BRIEF;
		}
	}break;
	case RECAP_STATES.TITLE_BRIEF :{
		drawTitle = true;
		
		//FIN ÉTAT
		if (titleTypist.get_state() == 1)
		{
			currentState = RECAP_STATES.RAPPEL_MISSION;
		}
	}break;
	case  RECAP_STATES.RAPPEL_MISSION:{
		drawRappel = true;
		
		//FIN
		if (rappelTypist.get_state() == 1)
		{
			currentState = RECAP_STATES.UNITS;
		}		
	}break;
	case RECAP_STATES.UNITS:{
		drawUnitsText = true;
		drawUnits = true;
		if tpsApparitionPortUsi < dureeApparitionPortUsi * nbUsisAMontrer
		{
			tpsApparitionPortUsi ++;
		}
		//FIN
		else
		{
			currentState = RECAP_STATES.POSSIBLE_PATTERN;	
		}
		
	}break;
	case RECAP_STATES.POSSIBLE_PATTERN:{
		drawPatternText = true;
		drawPatterns = true;
		
		if patternsTypist.get_state() == 1
		{
			currentState = RECAP_STATES.DATES_END_OF_DOC;
		}
	}break;
	case RECAP_STATES.DATES_END_OF_DOC:{
		drawDates = true;
		
	}break;
}


//DESSIN
if drawTitle titleScribble.draw(TITLE_RECAP_X, TITLE_RECAP_Y, titleTypist);
if drawRappel rappelScribble.draw(TITLE_RECAP_X, RECAP_RECAP_Y, rappelTypist);
if drawUnitsText unitsScribble.draw(TITLE_RECAP_X, UNITS_TEXT_RECAP_Y, unitsTypist);
if drawUnits
{
	for (var i = 0; i < min(nbUsisAMontrer, tpsApparitionPortUsi div dureeApparitionPortUsi); i ++)
	{
		var _x =(x - LARGEUR_DOC/2) + INTER_PORTRAIT_USI_DOC + (INTER_PORTRAIT_USI_DOC + LARGEUR_PORTRAIT_USI_DOC) * i;
		draw_sprite_stretched_ext(usisAMontrer[i], 0, _x, UNITS_PORTRAIT_SPRITE_Y, LARGEUR_PORTRAIT_USI_DOC, sprite_get_height(usisAMontrer[i]) * (LARGEUR_PORTRAIT_USI_DOC/sprite_get_width(usisAMontrer[i])), -1, 1)
	}
}
if drawPatternText patternsScribble.draw(TITLE_RECAP_X, PATTERNS_DOC_TEXT_Y, patternsTypist);
if drawPatterns
{
	for (var i = 0; i < nbPatterns; i ++)
	{
		var _x = (x - LARGEUR_DOC/2) + INTER_PATTERN_DOC + (INTER_PATTERN_DOC + LARGEUR_APPERCUS_PATTERNS_DOC)* i;
		var _y = APPERCUS_PATTERN_MIN_Y + (QUOTIEN_MARGE_DOC) * ( i div NOMBRE_PATTERNS_MAX_LIGNE);
		draw_sprite_stretched(ojeu.patterns[patterns[i]].illustration, 0, _x, _y, LARGEUR_APPERCUS_PATTERNS_DOC, sprite_get_height(ojeu.patterns[patterns[i]].illustration) * (LARGEUR_APPERCUS_PATTERNS_DOC/sprite_get_width(ojeu.patterns[patterns[i]].illustration)));
	}
}
if drawDates datesScribble.draw(TITLE_RECAP_X, DATES_RECAP_DOC_Y, datesTypist);;