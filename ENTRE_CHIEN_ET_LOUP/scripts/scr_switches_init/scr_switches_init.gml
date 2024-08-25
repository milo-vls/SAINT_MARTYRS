enum SWITCHES
{
	CRIMES_UP_TO_DATE,
	COMPUTER_UNLOCKED,
	
	
	
	
	NUMBER_OF_SWITCHES,
	
}



function switches_init()
{
	var _array = array_create(SWITCHES.NUMBER_OF_SWITCHES);
	
	_array[SWITCHES.CRIMES_UP_TO_DATE] = false;
	_array[SWITCHES.COMPUTER_UNLOCKED] = false;
	
	return _array;
}