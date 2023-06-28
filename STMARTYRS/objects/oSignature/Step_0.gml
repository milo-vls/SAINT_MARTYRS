event_inherited();

mouseDetected = point_in_rectangle(mouse_x, mouse_y, x, y, x + largeurCadre, y + hauteurCadre);
//pressed = global.cLeft or global.cRight;

drawHighlight = mouseDetected;
if  pressed
{
	quotienParcours += 1/tpsParcours;
}
else
{
	quotienParcours -= 1/tpsParcours;
}
quotienParcours = clamp(quotienParcours, 0, 1);

if quotienParcours == 1
{
	drawProgress = false;
	drawSignature = true;
}

if drawSignature
{
	quotienParcoursSignature += 1/tpsParcoursSignature;
	if quotienParcoursSignature == 1
	{
		oRecap.signed = true;	
	}	
}


