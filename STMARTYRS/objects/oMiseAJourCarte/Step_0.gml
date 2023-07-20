
if currentIndexIndexsCrimeFocus < nbNouveauxCrimes 
{
	if   !instance_exists(oDial)
	{
		ocrime_instance_create(indexsNouveauxCrimes[currentIndexIndexsCrimeFocus]);
	
		var _currentDuree = listeDureesFocus[currentIndexIndexsCrimeFocus]
		var _quotientParcours = tpsFocusIndividuel/_currentDuree;
		#macro CRIME_VISE ojeu.crime[indexsNouveauxCrimes[currentIndexIndexsCrimeFocus]]

		tpsFocusIndividuel ++;


		ocam.xCam = startingXCam + ((tarXCam - startingXCam) * animcurve_channel_evaluate(channelFocusIndividuel, _quotientParcours));
		ocam.yCam = startingYCam + ((tarYCam - startingYCam) * animcurve_channel_evaluate(channelFocusIndividuel, _quotientParcours));

	
	

		if _quotientParcours >= 1
		{
			currentIndexIndexsCrimeFocus ++;
			tpsFocusIndividuel = 0;
		
			ocam.xCam = tarXCam;
			ocam.yCam = tarYCam;
			startingXCam = ocam.xCam;
			startingYCam = ocam.yCam;
		
			if currentIndexIndexsCrimeFocus < nbNouveauxCrimes
			{
				tarXCam = getTarXCamPosWithPointZoom(CRIME_VISE.x);
				tarYCam = getTarYCamPosWithPointZoom(CRIME_VISE.y);	
			}

		
		}
	
	}
}
else 
{
	timeLastScreen ++;
	if timeLastScreen = 1.5 * room_speed
	
	instance_destroy();
			
}