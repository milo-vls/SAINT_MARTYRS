//-------TOUTES FONCTION DÉCLARÉES ICI SERA JOUÉE DANS L'OBJET oDial------//


//termine la bulle de dialogue automatiquement sans attendre une action du joueur
function forcedDialogueSkip(){

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