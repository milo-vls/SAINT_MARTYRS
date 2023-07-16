var _currentDuree = listeDureesFocus[currentIndexIndexsCrimeFocus]
var _quotientParcours = tpsFocusIndividuel/_currentDuree;
#macro CRIME_VISE ojeu.crime[indexsNouveauxCrimes[currentIndexIndexsCrimeFocus]]

tpsFocusIndividuel ++;


ocam.xCam = startingXCam + ((tarXCam - startingXCam) * animcurve_channel_evaluate(channelFocusIndividuel, _quotientParcours));
ocam.yCam = startingYCam + ((tarYCam - startingYCam) * animcurve_channel_evaluate(channelFocusIndividuel, _quotientParcours));




if _quotientParcours >= 1
{
	ocrime_instance_create(indexsNouveauxCrimes[currentIndexIndexsCrimeFocus]);
	if (currentIndexIndexsCrimeFocus == nbNouveauxCrimes)
	{
		tarXCam = 0;
		tarYCam = 0;
		
		if tarXCam == ocam.xCam and tarYCam == ocam.yCam  then instance_destroy();
		
	}
	else
	{
		
		
		currentIndexIndexsCrimeFocus ++;
		tpsFocusIndividuel = 0;
		
		ocam.xCam = tarXCam;
		ocam.yCam = tarYCam;
		startingXCam = ocam.xCam;
		startingYCam = ocam.yCam;
		tarXCam = getTarXCamPosWithPointZoom(CRIME_VISE.x);
		tarYCam = getTarYCamPosWithPointZoom(CRIME_VISE.y);
	}
		
}
