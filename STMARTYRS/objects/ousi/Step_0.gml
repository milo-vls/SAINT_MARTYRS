




#region position
x = clamp(x, 0, room_width);
y = clamp(y, 0, room_height);
ojeu.usi[usiID].x = x;
ojeu.usi[usiID].y = y;
#endregion


#region clique gauche

if pressed and omapManager.selectedUsi == self and !instance_exists(oOmbreUsi)
{
	diffSourisUsiX = mouse_x - x;
	diffSourisUsiY = mouse_y - y;
	instance_create_layer(x, y, "ombre_usi", oOmbreUsi, {sprite_index : ojeu.usi[usiID].hbox, image_blend : c_black, image_alpha : 0.8});
	depth = layer_get_depth("usi_select");
}



if omapManager.currentMenu==noone and position_meeting(mouse_x, mouse_y, self) and global.cPrLeft
{
	omapManager.selectedUsi = self;
	pressed = true;
}
if global.cRlLeft
{
	if pressed and omapManager.selectedUsi == self and instance_exists(oOmbreUsi)
	{
		omapManager.drawUsiModification = true;
		x = oOmbreUsi.x;
		y = oOmbreUsi.y;
	}
	pressed = false;
	omapManager.selectedUsi = noone;
	instance_destroy(oOmbreUsi);
	depth = layer_get_depth("usi");
}

tarXScale = DROP_SCALE;
tarYScale = DROP_SCALE;

if pressed and omapManager.selectedUsi == self and instance_exists(oOmbreUsi)
{
	x = mouse_x - diffSourisUsiX;
	y = mouse_y - diffSourisUsiY;
	
	oOmbreUsi.x = x - DECALAGE_OMBRE;
	oOmbreUsi.y = y - DECALAGE_OMBRE;
	
	oOmbreUsi.image_angle = image_angle;
	
	tarXScale = DRAG_SCALE;
	tarYScale = DRAG_SCALE;
	
	
	
}
#endregion


#region clique droit
if omapManager.currentMenu==noone and position_meeting(mouse_x, mouse_y, self) and global.cPrRight
{
	startRotX = mouse_x;
	pressedRight = true
}
if global.cRight and pressedRight
{
	ojeu.usi[usiID].rot = mouse_x - startRotX
}
else
{
	pressedRight = false
	startRotX = -4
}

#endregion
