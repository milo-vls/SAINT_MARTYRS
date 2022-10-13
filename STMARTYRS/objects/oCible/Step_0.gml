
if global.cPrLeft and position_meeting(mouse_x, mouse_y, self)
{
	oclickerMGmanager.nbDeCiblesTouchees ++;
	touched = true;
	instance_destroy();
}


if scale < maxScale
{
	scale += vtsGrossissementCible
}
else
{
	instance_destroy();
}



image_xscale = scale;
image_yscale = scale;