enum KILLER_STATE
{
ACTIVE,
FLED,
CAUGHT,	
}

#macro pastCrime crime[nbCrimes - 1]
#macro jourSuivant date_inc_day(crime[nbCrimes - 1].date, 1)

enum TYPE_OF_CRIME{};


function init_crimes_tueurs() begin

tueur[0] = {
dateLim : date_create_datetime(2012, 12, 25, date_get_hour(startingDate), 0, 0),
}
	

	

nbTueurActifs = 0;
nbCrimes = 0;
	
addCrime(0, "Géraud Loigaud",portArmandusi, date_inc_hour(date_inc_day(startingDate, 1), -9), 500, 500);
addCrime(0, "Léo Meinard", portErnestusi, jourSuivant, pastCrime.x +100, pastCrime.y +100);
addCrime(0, "Lukas Sennouris",  portDidierusi, jourSuivant, pastCrime.x +100, pastCrime.y +100);
		
for (var i = 0;i < nbCrimes;i++)
{
	crime[i].col				= 0;
	crime[i].appeared	= false;
	crime[i].vulnerable	= true;
}
	
	
#region psc col
	global.crimeCol[0] = c_white;
	global.crimeCol[1] = c_red;
	global.crimeCol[2] = c_aqua;
	global.crimeCol[3] = c_yellow;
	global.crimeCol[4] = c_black;
	global.crimeCol[5] = c_lime;
	global.crimeCol[6] = c_grey;
	#endregion
	

var nbTueurs = array_length(tueur)
for (var i = 0;i < nbTueurs;i ++)
{
	tueur[i].jourCaught = noone;
	tueur[i].etat = KILLER_STATE.ACTIVE;
	tueur[i].startActivityDate = date_create_datetime(3000, 0, 0, 0, 0, 0);
	tueur[i].endActivityDate = date_create_datetime(1990, 0, 0, 0, 0, 0);
	for (var j = 0; j< nbCrimes; j++)
	{
		if crime[j].tueur == i 
		{
			if crime[j].date < tueur[i].startActivityDate
			{
				tueur[i].startActivityDate = date_inc_day(crime[j].date, -1);
			}
			if crime[j].date > tueur[i].endActivityDate
			{
				tueur[i].endActivityDate = crime[j].date;
			}
		}
	}
}







end