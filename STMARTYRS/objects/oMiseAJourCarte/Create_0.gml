global.inputOn = false;


enum MISE_A_JOUR_CARTE_ETATS
{
BASE,
CRIMES_FOCUS,
DEZOOM,
DESTROY,
}

#macro TARZOOM_MAX 3
#macro TPS_SECONDES_MIN 4

//LISTER LES CRIMES
indexsNouveauxCrimes = array_create(0);
for (var i = 0; i < array_length(ojeu.crime);i++)
{
	var _tueurId = ojeu.crime[i].tueur;
	var _tueurState = ojeu.tueur[_tueurId].etat
	if !ojeu.crime[i].appeared and _tueurState == KILLER_STATE.ACTIVE and ojeu.crime[i].date > ojeu.numeroJour
	{
		array_push(indexsNouveauxCrimes, i);
	}
	
}
nbNouveauxCrimes  = array_length(indexsNouveauxCrimes);


if (nbNouveauxCrimes > 0)
{
	
	array_sort(indexsNouveauxCrimes, plusVieuxCrime);
	
	//REPARTIR LES DUREES DES DIFFERENTS FOCUS
	dureeFocusTotale = (TPS_SECONDES_MIN + sqrt(nbNouveauxCrimes)) * room_speed;
	listeDureesFocus = array_create(nbNouveauxCrimes);
	channelFocusIndividuel = animcurve_get_channel(acCourbes, "cDuréeFocusSeul"); 
	tpsFocusIndividuel = 0;
	currentIndexIndexsCrimeFocus = 0;
	
	var _channelDureeFocus = animcurve_get_channel(acCourbes, "cDuréeFocus")
	listeDureesFocus[0] = animcurve_channel_evaluate(_channelDureeFocus, 1/nbNouveauxCrimes) * dureeFocusTotale;
	for (var i = 1; i < nbNouveauxCrimes; i ++)
	{
		var _quotientParcours = (i +1/nbNouveauxCrimes);
		var _pastQuotientParcours = (i/nbNouveauxCrimes);
		
		listeDureesFocus[i] = (animcurve_channel_evaluate(_channelDureeFocus, _quotientParcours)  - animcurve_channel_evaluate(_channelDureeFocus, _pastQuotientParcours)) * dureeFocusTotale;
		
		
	}


	//CAMERA
	function getTarXCamPosWithPointZoom(_xCentre)
	{
		return _xCentre - (ocam.camera_l/TARZOOM_MAX)/2;
	}
	function getTarYCamPosWithPointZoom(_yCentre)
	{
		return _yCentre - (ocam.camera_h/TARZOOM_MAX)/2;
	}

	startingXCam = ocam.xCam;
	startingYCam = ocam.yCam;
	tarXCam = getTarXCamPosWithPointZoom(ojeu.crime[indexsNouveauxCrimes[currentIndexIndexsCrimeFocus]].x);
	tarYCam = getTarYCamPosWithPointZoom(ojeu.crime[indexsNouveauxCrimes[currentIndexIndexsCrimeFocus]].y);

	ocam.tarTauxZoom = TARZOOM_MAX;



}
else
{
	instance_destroy();	
}


