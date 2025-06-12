function wheel_upward(_amount)
{
	if mouse_wheel_down()
		return _amount;
	
	if mouse_wheel_up()
		return -_amount;
		
	return 0;
}