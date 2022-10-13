
if !instance_exists(oDial)
{
if global.char[charID].room = room 
{	

	visible = true;
}
else
{
	instance_destroy();
	visible = false;
}
}


	
