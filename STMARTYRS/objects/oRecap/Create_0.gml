enum RECAP_STATES
{
	SHIFTING,
	TITLE_BRIEF,
	RAPPEL_MISSION,
	UNITS,
	POSSIBLE_PATTERN,
	DATES_END_OF_DOC,
	WAITING_FOR_SIGNATURE,
	END_RECAP
}


//--- INFORMATIONS GENERALES
currentState = RECAP_STATES.SHIFTING;


#macro LARGEUR_DOC sprite_get_width(sprDocumentBlank)
#macro HAUTEUR_DOC sprite_get_height(sprDocumentBlank)
#macro QUOTIEN_MARGE_DOC sprite_get_width(sprDocumentBlank)/13
#macro DOC_TEXT_SCALE 3
//----SHIFTING
quotienParcours = 0;
tpsParcours = room_speed * 1.25;
courbe = animcurve_get_channel(acCourbes, "cDocumentShift");
xStart = self.x;
xEnd = GAME_WIDTH/2;
#macro DOCUMENT_DISTANCE_PARCOURS xEnd - xStart


//----TITLE_BRIEFING
titleScribble = scribble("[ftDial]" + text("TITLE_BRIEFING_DOC")).align(fa_left, fa_top).blend(c_black);
titleTypist = scribble_typist();
titleTypist.in(1, 0);

#macro TITLE_RECAP_X x - (LARGEUR_DOC/2 - QUOTIEN_MARGE_DOC)
#macro TITLE_RECAP_Y y - (HAUTEUR_DOC/2 - QUOTIEN_MARGE_DOC)

//----RAPPEL MISSION
rappelScribble = scribble("[ftDial]" + text("RECAP_BRIEFING_DOC")).align(fa_left, fa_top).blend(c_black).wrap(LARGEUR_DOC - (2 * QUOTIEN_MARGE_DOC));
rappelTypist = scribble_typist();
rappelTypist.in(1, 0);

#macro RECAP_RECAP_Y TITLE_RECAP_Y + titleScribble.get_height()
//----UNITS
unitsScribble = scribble("[ftDial]" + text("UNITS_BRIEFING_DOC")).align(fa_left, fa_top).blend(c_black);
unitsTypist = scribble_typist();
unitsTypist.in(1, 0);

#macro UNITS_TEXT_RECAP_Y RECAP_RECAP_Y + rappelScribble.get_height()

usisAMontrer = [];
nbUsisAMontrer = 0;
nbUsisMontres = 0;
tpsApparitionPortUsi = 0;
dureeApparitionPortUsi = room_speed * 0.5;
var _nbusi = array_length(ojeu.usi);
for (var i = 0; i < _nbusi; i ++)
{
	if ojeu.usi[i].section == USI_SECTIONS.TACTIC_UNIT and ojeu.usi[i].disponible == true
	{
		array_push(usisAMontrer, ojeu.usi[i].port);
		nbUsisAMontrer ++;
	}
}

#macro LARGEUR_PORTRAIT_USI_DOC (LARGEUR_DOC-(QUOTIEN_MARGE_DOC)*4)/3
#macro UNITS_PORTRAIT_SPRITE_Y UNITS_TEXT_RECAP_Y + unitsScribble.get_height()
#macro INTER_PORTRAIT_USI_DOC  (LARGEUR_DOC - (LARGEUR_PORTRAIT_USI_DOC * 3))/4
//----POSSIBLES PATTERNS
patternsScribble = scribble("[ftDial]" + text("PATTERNS_BRIEFING_DOC")).align(fa_left, fa_top).blend(c_black);
patternsTypist = scribble_typist();
patternsTypist.in(1, 0);
patterns = omapManager.currentNightDiff.pool;


//----DATES END OF DOC
datesScribble = scribble("[ftDial]" + text("DATES_BRIEFING_DOC")).align(fa_left, fa_top);
datesTypist = scribble_typist();
datesTypist.in(1, 0);


//----










