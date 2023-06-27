
if position_meeting(mouse_x, mouse_y, self)  and !(instance_exists(oDial))
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
