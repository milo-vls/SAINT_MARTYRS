#region fil vers le précédents fil ayant la même couleur et le plus proche temporellement et inférieur


attachable = noone
//liste des crimes sur la carte de même couleur et antérieur à ce crime
for (var i = 0; i < array_length(ojeu.crime);i ++)
{
	if ojeu.crime[i].x != noone and ojeu.crime[i].y != noone and ojeu.crime[i].col == ojeu.crime[crimeID].col and ojeu.crime[i].date < ojeu.crime[crimeID].date
	{
		if attachable == noone
		{
			attachable = i;
		}
		else
		{
			if ojeu.crime[i].date > ojeu.crime[attachable].date
			{
				attachable = i;
			}
		}
	}
}

if attachable != noone
{
	xfil = ojeu.crime[attachable].x+sprite_width/2;
	yfil = ojeu.crime[attachable].y+sprite_width/2;
	
	draw_set_alpha(1);
	draw_line_width_color(x+sprite_width/2, y+sprite_width/2, xfil, yfil, wfil,global.crimeCol[ojeu.crime[attachable].col], global.crimeCol[ojeu.crime[attachable].col]);
}


#endregion


var _tueur = ojeu.tueur[ojeu.crime[crimeID].tueur]

//------CAPTURE-------//
if !checkCapture
{
	if place_meeting(x, y, ousi) and ojeu.crime[crimeID].date > date_inc_day(global.currentDate, -1) and ojeu.crime[crimeID].vulnerable
	{
		ojeu.tueur[ojeu.crime[crimeID].tueur].etat = KILLER_STATE.CAUGHT;
		ojeu.tueur[ojeu.crime[crimeID].tueur].jourCaught = global.currentDate;
	}
	ojeu.crime[crimeID].vulnerable = false;
	checkCapture = !checkCapture
}

//--------FUITE-----------------------//
if _tueur.dateLim < global.currentDate
{
	ojeu.tueur[ojeu.crime[crimeID].tueur].etat = KILLER_STATE.FLED;
}

//------DÉSACTIVATION----------//
if _tueur.etat == KILLER_STATE.CAUGHT or _tueur.etat == KILLER_STATE.FLED
{
	instance_destroy();
}

//----MENU CARTE------//
clickToChangeMenu("psc");

//-------DESSIN------//
draw_self();
image_blend = global.crimeCol[ojeu.crime[crimeID].col];

