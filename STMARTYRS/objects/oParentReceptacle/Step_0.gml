#macro VITESSE_RECEPLACLE_JETON 25

if place_meeting(x, y, toDetect)
{
	var _instanceDetected = instance_nearest(x, y, toDetect);
	var _tarX = x + sprite_width/2 - _instanceDetected.sprite_width/2;
	var _tarY = y + sprite_height/2 - _instanceDetected.sprite_height/2;
	
	if !_instanceDetected.grabbed
	{
		_instanceDetected.x = approach(_instanceDetected.x, _tarX, VITESSE_RECEPLACLE_JETON);
		_instanceDetected.y = approach(_instanceDetected.y, _tarY, VITESSE_RECEPLACLE_JETON);
	}
	
	if _instanceDetected.x == _tarX and _instanceDetected.y == _tarY
	{
		objectReceiving.value = value;
	}
}
