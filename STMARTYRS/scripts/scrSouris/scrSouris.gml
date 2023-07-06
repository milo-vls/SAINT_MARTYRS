function objetSurvole()
{
	
if instance_exists(oDial) or instance_exists(oGoToRoom) 
return noone;
	
if position_meeting(mouse_x, mouse_y, oParentClickObj) 
return instance_nearest(mouse_x, mouse_y, oParentClickObj);
	
if position_meeting(mouse_x, mouse_y, oParentObservable) 
return instance_nearest(mouse_x, mouse_y, oParentObservable);
	
if position_meeting(mouse_x, mouse_y, oNPCparent) 
return instance_nearest(mouse_x, mouse_y, oNPCparent);
	
if position_meeting(mouse_x, mouse_y, omoveArrow)
return instance_nearest(mouse_x, mouse_y, omoveArrow);

if position_meeting(mouse_x, mouse_y, oParentButton)
return instance_nearest(mouse_x, mouse_y, oParentButton);

return noone;
	
}

function comportementCliqueObjetCliquable(_instanceObjetCliquable)
{

if _instanceObjetCliquable.pressed and global.cRlLeft
{
	ojeu.ClickObj[_instanceObjetCliquable.cObjID].event();
}
	
}

function comportementCliqueObjetObservable(_instanceObservable)
{

if _instanceObservable.pressed and global.cRlLeft
{
	_instanceObservable.pressed = false;
	_instanceObservable.visible = true;
	startObs(ojeu.obsObj[_instanceObservable.obsObjID].obsID);
	_instanceObservable.desac = _instanceObservable.usageUnique;
}
	
}

function comportementCliquePnj(_instance)
{
	
if global.cRlLeft and _instance.pressed
{
	startDial(global.char[_instance.charID].dialID, _instance);
}
	
}

function comportementCliqueArrow(_instance)
{

if _instance.pressed and global.cRlLeft
{
	GoToRoom(_instance.destination, _instance.TransiSound);
}

}

function comportementCliqueRetourCarte(_instance)
{
	ojeu.showButtonRetourCarte = true;
	GoToRoom(pcarte);
}


function desacPress()
{

if !position_meeting(mouse_x, mouse_y, self) or !global.cLeft
{
	pressed = false;	
}

}




