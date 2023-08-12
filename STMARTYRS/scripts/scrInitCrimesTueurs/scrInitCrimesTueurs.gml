#region psc col
	global.crimeCol[0] = c_white;
	global.crimeCol[1] = c_red;
	global.crimeCol[2] = c_aqua;
	global.crimeCol[3] = c_yellow;
	global.crimeCol[4] = c_black;
	global.crimeCol[5] = c_lime;
	global.crimeCol[6] = c_grey;
#endregion




enum KILLER_STATE{ACTIVE,FLED,CAUGHT}
enum TYPE_OF_CRIME{ROBBERY, AGGRESSION, MURDER};

//MACRO SCRIPTAGE CRIME
#macro pastCrime crime[nbCrimes - 1]
#macro jourSuivant date_inc_day(crime[nbCrimes - 1].date, 1)




function init_crimes_tueurs() 
{	
nbTueurActifs = 0;

nbTueurs = 0;

nbCrimes = 0;


tueur				= []		//liste tueurs scriptés

crime				= []		//liste crimes scriptés 

addScriptedKiller(startingDate);
addScriptedKiller(startingDate);

addScriptedCrime(0, "Milo Vilas", -1, false, 500, 600, 14, 10, sprPortraitVictimePlaceHolder);
addScriptedCrime(0, "R.G.", 1, false, 800, 470, 14, 15);
addScriptedCrime(0, "R.G.", 2, false, 850, 470, 14, 15);
addScriptedCrime(0, "R.G.", 2, false, 900, 470, 14, 15);
addScriptedCrime(0, "R.G.", 2, false, 950, 470, 14, 15);
addScriptedCrime(0, "Clipper", -3, false, 360, 900, 14, 15);





}