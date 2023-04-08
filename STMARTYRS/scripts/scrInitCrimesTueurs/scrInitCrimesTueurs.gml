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

addScriptedCrime(0, "Nouveaux crimes 0", startingDate, false, 400, 400, false)
addScriptedCrime(0, "Nouveaux crimes 1", date_inc_day(startingDate, 1), false, 470, 440, false)
addScriptedCrime(0, "Nouveaux crimes 2", date_inc_day(startingDate, 2), true, 540, 440, false)





}