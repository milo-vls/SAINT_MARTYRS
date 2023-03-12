// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function init_scribble_typist_events(){

scribble_typists_add_event("skip",forcedDialogueSkip);
scribble_typists_add_event("limpOff", turnLimpSynchOff);


}

function forcedDialogueSkip()
{

if currentBulle < nbBulles -1
{
	typingSpeed = baseTypeSpeed;
	setupPort = false;
	currentBulle ++;
	bulle[currentBulle].typist.in(baseTypeSpeed, fadingSpeed);
				
}
else
{
	if nbChoices < 1
	{
					
		instance_destroy();
	}
	else
	{
		typingSpeed = baseTypeSpeed;
		showChoice = true;	
	}
}


}

function turnLimpSynchOff()
{
	cptr = 0;
	limpSynchSpd = 0;
}