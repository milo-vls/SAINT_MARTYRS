

var _crime =crimeType[crimeID]



attachable = indexCrimeAttachable(crimeType, _crime.col, _crime.date, _crime.tueur)

if attachable != noone
{
	xfil = crimeType[attachable].x+sprite_width/2;
	yfil = crimeType[attachable].y+sprite_width/2;
	
	draw_set_alpha(1);
	if crimeType[attachable].col != c_white or crimeType == ojeu.crimeProc
	{
		draw_line_width_color(x+sprite_width/2, y+sprite_width/2, xfil, yfil, wfil, crimeType[attachable].col, crimeType[attachable].col);
	}
}

 









//----MENU CARTE------//
clickToChangeMenu("psc");

//-------DESSIN------//
draw_self();
image_blend = _crime.col;

