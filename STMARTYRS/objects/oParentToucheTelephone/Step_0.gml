if !ojeu.pause
{
	if position_meeting(mouse_x, mouse_y, self)
	{
		if global.cPrLeft
		{
			pressed = true;
		}
		if global.cRlLeft and pressed
		{
			event();
		}
	}
	else
	{
		pressed = false;
	}
}
else
{
	pressed = false;
}