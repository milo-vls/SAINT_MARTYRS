function initoMiseAJourCarte()
{



indexsNouveauxCrimes = array_create(0);
for (var i = 0; i < array_length(ojeu.crime);i++)
{
	var _tueurId = ojeu.crime[i].tueur;
	var _tueurState = ojeu.tueur[_tueurId].etat
	if !ojeu.crime[i].appeared and _tueurState == KILLER_STATE.ACTIVE and ojeu.crime[i].date < ojeu.numeroJour
	{
		array_push(indexsNouveauxCrimes, i);
	}
	
}
nbNouveauxCrimes  = array_length(indexsNouveauxCrimes);
if (nbNouveauxCrimes > 0)
{
	timeLastScreen = 0;
	
	array_sort(indexsNouveauxCrimes, plusVieuxCrime);
	
	//REPARTIR LES DUREES DES DIFFERENTS FOCUS
	dureeFocusTotale = (TPS_SECONDES_MIN + sqrt(nbNouveauxCrimes)/2) * room_speed;
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
		show_debug_message("listeDureesFocus :")
		show_debug_message(listeDureesFocus);
		
	}
}
else
{
	instance_destroy();	
}



}