var _survole = position_meeting(mouse_x, mouse_y, self);

if global.cPrLeft and _survole
{
	grabbed = true;	
	xOffset = mouse_x - x;
	yOffset = mouse_y - y;
}

if global.cRlLeft or !global.cLeft
{
	grabbed = false;	
}

if grabbed
{
	x = mouse_x - xOffset;
	y = mouse_y - yOffset;
}