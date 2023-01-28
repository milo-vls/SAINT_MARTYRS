

var _crime =crimeType[crimeID]



attachable = noone
//liste des crimes sur la carte de même couleur et antérieur à ce crime
for (var i = 0; i < array_length(crimeType);i ++)
{
	if crimeType[i].x != noone and crimeType[i].y != noone and crimeType[i].col == _crime.col and crimeType[i].date < _crime.date
	{
		if attachable == noone
		{
			attachable = i;
		}
		else
		{
			if crimeType[i].date > crimeType[attachable].date
			{
				attachable = i;
			}
		}
	}
}

if attachable != noone
{
	xfil = crimeType[attachable].x+sprite_width/2;
	yfil = crimeType[attachable].y+sprite_width/2;
	
	draw_set_alpha(1);
	draw_line_width_color(x+sprite_width/2, y+sprite_width/2, xfil, yfil, wfil,global.crimeCol[crimeType[attachable].col], global.crimeCol[crimeType[attachable].col]);
}











//----MENU CARTE------//
clickToChangeMenu("psc");

//-------DESSIN------//
draw_self();
image_blend = global.crimeCol[_crime.col];

