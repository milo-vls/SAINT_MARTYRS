// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function init_time()
{
	//sleep
	heureReveil = 19;
	heureCouche = 7;
	//
	numeroJour							= 3;
	startingDate							= date_create_datetime(2012, 12, 19, 19, 45, 0)
	global.currentDate				= date_inc_day(startingDate, -1);							//Mis à jour constamment 
	global.mapDate					= global.currentDate;												//mis à jour uniquement si présent sur la carte
	
	//// ÉCOULEMENT DU TEMPS
	minuteInSeconds		= 2;//il faut attendre 2 secondes avant d'ajouter une minute au compteur  
	var _plusUneMinute	= function(_minutes)
{
	global.currentDate = date_inc_minute(global.currentDate, _minutes);
}
	minuterie						= time_source_create(time_source_game, minuteInSeconds, time_source_units_seconds,_plusUneMinute , [1], -1);
	
	time_source_start(minuterie);
	time_source_pause(minuterie);

	//transforme en string
	#region mois
		global.month[1] = "JANVIER";
		global.month[2] = "FÉVRIER";
		global.month[3] = "MARS";
		global.month[4] = "AVRIL";
		global.month[5] = "MAI";
		global.month[6] = "JUIN";
		global.month[7] = "JUILLET";
		global.month[8] = "AOÛT";
		global.month[9] = "SEPTEMBRE";
		global.month[10] = "OCTOBRE";
		global.month[11] = "NOVEMBRE";
		global.month[12] = "DÉCEMBRE";
	#endregion
	#region heure
		hour[0] = "00";
		hour[1] = "01";
		hour[2] = "02";
		hour[3] = "03";
		hour[4] = "04";
		hour[5] = "05";
		hour[6] = "06";
		hour[7] = "07";
		hour[8] = "08";
		hour[9] = "09";
		hour[10] = "10";
		hour[11] = "11";
		hour[12] = "12";
		hour[13] = "13";
		hour[14] = "14";
		hour[15] = "15";
		hour[16] = "16";
		hour[17] = "17";
		hour[18] = "18";
		hour[19] = "19";
		hour[20] = "20";
		hour[21] = "21";
		hour[22] = "22";
		hour[23] = "23";
	#endregion
	
}