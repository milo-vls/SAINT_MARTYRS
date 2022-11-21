currentMenu = noone;

#region OLD MENU USI
//fond noir
alphaFondNoir = 0;
tarAlphaFondNoir = 0;
//cadran 
alphaCadran = 0;
tarAlphaCadran = 0;
lCadran = 1620;
hCadran = 780;
x1Cadran = display_get_gui_width()/2 - lCadran/2;
y1Cadran = display_get_gui_height()/2 - hCadran/2;
x2Cadran = x1Cadran + lCadran;
y2Cadran = y1Cadran + hCadran;
//boutton back
backbuttonPressed = false;
bufferbackbutton = 10;
lbackbutton = (display_get_gui_width() - lCadran)/2 - bufferbackbutton*2;
ybackbutton = 0 + bufferbackbutton;
xbackbutton = display_get_gui_width()-bufferbackbutton - lbackbutton;
// usi
lcadreUsi = lCadran/4;
hcadreUsi = hCadran/3;
hCadranNomUsi = hcadreUsi/3;
//demo hbox
demoHboxRot = 0;
#endregion

#region modif usi
selectedUsi = noone;
drawUsiModification = false;
rotateHeld = false;
outPressed = false;
#endregion
#region psc

selectpsc = noone;

//fond noir
alphaMenupsc = 0;
tarAlphaMenupsc = 0;
cMpsc = c_black;
//cadran
lMpsc = lCadran;
hMpsc = hCadran;
dcoin = 120;
x1RCentral = display_get_gui_width()/2 - lMpsc/2;
y1RCentral = display_get_gui_height()/2 - hMpsc/2 + dcoin;
x2RCentral = display_get_gui_width()/2 + lMpsc/2;
y2RCentral = display_get_gui_height()/2 + hMpsc/2 - dcoin;
x1RSup = x1RCentral + dcoin;
y1RSup = y1RCentral - dcoin
x2RSup = x2RCentral - dcoin;
y2RSup = y1RCentral;
x1RInf = x1RSup;
y1RInf = y2RCentral;
x2RInf = x2RSup;
y2RInf = y1RInf + dcoin;
//portrait
xport = x1RSup;
yport = y1RCentral;
lport = 400;
hport = 500;
//nom
decaElement = 20;
xname = xport;
yname = yport + hport + decaElement;
//date
xdate = xport + lport + decaElement;
ydate = yport;
//changement de couleur
sprChangeCol = sprChangepscCol
IncColpressed = false;
DecColpressed = false;
xIncCol = x2RCentral - sprite_get_width(sprChangeCol);
yIncCol = hMpsc/2;
xColPreview = xIncCol - decaElement - sprite_get_width(sprCrime);
yColPreview = yIncCol;
xDecCol = xColPreview - decaElement - sprite_get_width(sprChangeCol);
yDecCol = yIncCol;


#endregion

#region affichage rue

var nbLimiteRue = instance_number(olimiteRue);


nbRue = 0;
for (var i = 0;i < nbLimiteRue;i ++)
{
	limiteRue[i] = instance_find(olimiteRue, i);
	
	if limiteRue[i].indiceDeRue > nbRue
	{
		nbRue = limiteRue[i].indiceDeRue;
	}
}
nbRue ++;
for (var i = 0;i < nbRue;i ++)
{
	var _countRue = 0;
	for (var j = 0;j < nbLimiteRue;j ++)
	{
		if limiteRue[j].indiceDeRue  == i
		{
			rue[i][_countRue] = limiteRue[j];
			_countRue ++;
		}	
	}
	
}



rueObserve = noone;

#endregion

//----temps----//
global.inputOn = false;
time_source_pause(ojeu.minuterie);
initMapDate = global.mapDate;
mapTimeMAJ = false;
//twerp pour maj timer//
					timer = 0;
/*end*/		diffTempsMinutes = date_minute_span(global.currentDate, global.mapDate);
/*durée*/	duree = room_speed * 3;

#region USI MENU

hPanUsi = display_get_gui_height() * (3/4);
wPanUsi = display_get_gui_width()/9
xMin = ((display_get_gui_width() * (3/9))/2)// + wPanUsi
yWhenShown = display_get_gui_height()/2 - hPanUsi/2;
yWhenHidden = display_get_gui_height()
currentY = [yWhenHidden, yWhenHidden, yWhenHidden, yWhenHidden, yWhenHidden, yWhenHidden];
//twerp arguments
temps =[0, 0, 0, 0, 0, 0];;
duree = room_speed/2;//une seconde



#endregion


