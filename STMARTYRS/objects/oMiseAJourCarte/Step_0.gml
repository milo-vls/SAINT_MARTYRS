
if currentIndexIndexsCrimeFocus < nbNouveauxCrimes 
{
	if   !instance_exists(oDial) and !instance_exists(oGoToRoom)
	{
		if tpsFocusIndividuel == 0
		{
			ocrime_instance_create(indexsNouveauxCrimes[currentIndexIndexsCrimeFocus]);
		}
		var _currentDuree = listeDureesFocus[currentIndexIndexsCrimeFocus]
		var _quotientParcours = tpsFocusIndividuel/_currentDuree;
		#macro CRIME_VISE ojeu.crime[indexsNouveauxCrimes[currentIndexIndexsCrimeFocus]]

		tpsFocusIndividuel ++;	
	

		if _quotientParcours >= 1
		{
			
			if ojeu.tueur[ojeu.crime[indexsNouveauxCrimes[currentIndexIndexsCrimeFocus]].tueur].etat == KILLER_STATE.CAUGHT then initoMiseAJourCarte();
						
			currentIndexIndexsCrimeFocus ++;
			tpsFocusIndividuel = 0;
			
		}
	
		

		
	}
}
else 
{
	timeLastScreen ++;
	if timeLastScreen = 1.5 * room_speed
	
	instance_destroy();
			
}