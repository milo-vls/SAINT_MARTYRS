// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations

function time_add_minute(_minutes)
{
	global.currentDate = date_inc_minute(global.currentDate, _minutes);
	if room = pcarte and global.currentDate == global.mapDate
	{
		global.mapDate = date_inc_minute(global.mapDate, _minutes);
		
		//METTRE VÉRIFICATION MEURTRE EN TEMPS RÉEL ICI
		
		
	}
}