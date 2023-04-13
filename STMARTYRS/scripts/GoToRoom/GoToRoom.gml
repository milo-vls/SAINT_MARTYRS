// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
 function GoToRoom(targetRoom, _sound = noone, _sleep = false, nouvel_objet = noone, _method = noone, _tenseNight = false)
{
	with (instance_create_depth(0, 0, 0, oGoToRoom))
	{
		command = _method;
		instanceToCreate = nouvel_objet;
		dayNext = _sleep;
		piece = targetRoom;
		sndToPlay = _sound;
		tenseNight = _tenseNight;
	}
}




//usage spécifique
function GoToMap()
{
	GoToRoom(pcarte);
	//startTenseNight();
}
	
function dormir(_sound = noone)
{
	switch (global.currentDate)
	{
		default :{
			GoToRoom(pcarte, _sound, true);
		}break;
	}
}

function startTenseNight()
{
	
	GoToRoom(pcarte, noone, false, noone, function(){ojeu.tenseNight = true; instance_destroy(ocrime);}, true);
}





