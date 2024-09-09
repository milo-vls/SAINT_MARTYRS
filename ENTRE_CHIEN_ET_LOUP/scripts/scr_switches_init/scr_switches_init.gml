enum SWITCHES
{
	CRIMES_UP_TO_DATE,
	COMPUTER_UNLOCKED,
	
	#region DIALOGUES AND RELATIONS
		#region EXE
			EXE_MET,
			EXE_BLOCKED,
		#endregion
	#endregion
	
	
	NUMBER_OF_SWITCHES,
	
}



function switches_init()
{
	var _array = array_create(SWITCHES.NUMBER_OF_SWITCHES, false);
	
	return _array;
}