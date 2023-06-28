event_inherited();

if ojeu.obsObj[obsObjID].room != room
{
	instance_destroy();
	visible = false;
}



if desac
{
	if !instance_exists(oDial)
	{
		ojeu.obsObj[obsObjID].room = noone;
		instance_destroy();
	}
}