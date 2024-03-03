enum INTRO_STATE
{
	SANITAIRES,
	BLACK_SCREEN,
	BUS_DRIVING_BGS,
	WAIT_BEFORE_STOP,
	STOPPED_BUS_LOOP_BGS,
	DRIVERS_TALK,
	WIND_LOOP_BGS,
	WAIT_BEFORE_TITLE,
	TITLE_SHOWN,
	TRAVEL_TO,
	SEARCH_FOR_COMMISSARIAT,
	GENDARMERIE,
	TUTO_MAP,
	
}

currentIntroState = 11;
currentIntroState = 11;


col1Rec = c_black;
col2Rec = c_black;
col3Rec = c_black;
col4Rec = c_black;

tpsWaitBeforeStop = 0;
dureeWaitBeforeStop = 8 * room_speed;

driversTalkTxt = scribble(text("DRIVERS_TALK"))
.wrap(GAME_WIDTH/2)
.align(fa_center, fa_middle)
.blend(c_white)
driversTalkTypist = scribble_typist().in(1, 3);

tpsWaitBeforeTitle = 0;
dureeWaitBeforeTitle = 8 * room_speed;

titleTxt = text("GAME_TITLE");
tpsTitle = 0;
waitTitle = 9 * room_speed;


//--TABLEAU DE NUIT
#macro OBS_ID_TABLEAU_DE_NUIT "intro_tableau_de_nuit"


//--SANITAIRES
#macro OBS_ID_SANITAIRE "intro_sanitaire"


//--CORRIDOR GENDARMERIE
#macro DIAL_ID_SCENE_3 "intro corridor"
#macro DIAL_ID_SCENE_4 "intro map"

//--TUTO_MAP
tutoMapState = 0;
textTutoMapTest = scribble("[ftDial]Cette punaise c'est un crime lié à une affaire encore non résolue. Empêcher le malfaiteur de continuer à perturber l’ordre public. Tu as accès à toutes nos informations.");
typistTextTutoMapTest = scribble_typist().in(1, 0);