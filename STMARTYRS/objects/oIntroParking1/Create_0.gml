enum INTRO_STATE
{
	BLACK_SCREEN,
	BUS_DRIVING_BGS,
	WAIT_BEFORE_STOP,
	STOPPED_BUS_LOOP_BGS,
	DRIVERS_TALK,
	WIND_LOOP_BGS,
	WAIT_BEFORE_TITLE,
	TITLE_SHOWN,
	TRAVEL_TO,
	GENDARMERIE,
	TUTO_MAP,
	
}

currentIntroState = 0;


col1Rec = c_black;
col2Rec = c_black;
col3Rec = c_black;
col4Rec = c_black;

tpsWaitBeforeStop = 0;
dureeWaitBeforeStop = 8 * room_speed;

driversTalkTxt = scribble("[ftDial]Terminus, St. Martyrs, veillez à n’oublier aucun bagage. Merci de nous avoir accompagné au cours de ce voyage, nous espérons vous revoir, à bientôt.")
.wrap(GAME_WIDTH/2)
.align(fa_center, fa_middle)
.blend(c_white)
driversTalkTypist = scribble_typist().in(1, 3);

tpsWaitBeforeTitle = 0;
dureeWaitBeforeTitle = 8 * room_speed;

titleTxt = "ENTRE CHIEN ET LOUP";
tpsTitle = 0;
waitTitle = 9 * room_speed;


//--TABLEAU DE NUIT
#macro OBS_ID_TABLEAU_DE_NUIT "intro_tableau_de_nuit"


//--SANITAIRES
#macro OBS_ID_SANITAIRE "intro_sanitaire"


//--CORRIDOR GENDARMERIE
#macro DIAL_ID_SCENE_3 "intro_corridor"


//--TUTO_MAP
tutoMapState = 0;