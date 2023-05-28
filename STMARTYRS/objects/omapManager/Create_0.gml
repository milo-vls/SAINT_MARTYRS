enum MAP_MENU
{
	EXPLO,
	SELECTION_USI,
	CRIME_DETAILS,
	PHONE,
	ORDI,
	GAME_OVER,
	RETRY,
	GAME_OVER_QUIT,
	RECAP,
};



currentMenu = noone;

#region tueur
nbTueurProcActifs = 0;
nbTueurProc = 0;
nbCrimeProc = 0;
tueurProc	= []		//liste tueurs procéduraux, reset chaque matin
crimeProc	= []		//liste crimes procéduraux, reset chaque matin

currentNightDiff = noone;

#endregion

#region OLD MENU USI
//fond noir
//alphaFondNoir = 0;
tarAlphaFondNoir = 0;
//cadran 
//alphaCadran = 0;
//tarAlphaCadran = 0;
lCadran = 1620;
hCadran = 780;
//x1Cadran = display_get_gui_width()/2 - lCadran/2;
//y1Cadran = display_get_gui_height()/2 - hCadran/2;
//x2Cadran = x1Cadran + lCadran;
//y2Cadran = y1Cadran + hCadran;
//boutton back
backbuttonPressed = false;
//bufferbackbutton = 10;
//lbackbutton = (display_get_gui_width() - lCadran)/2 - bufferbackbutton*2;
//ybackbutton = 0 + bufferbackbutton;
//xbackbutton = display_get_gui_width()-bufferbackbutton - lbackbutton;
// usi
//lcadreUsi = lCadran/4;
//hcadreUsi = hCadran/3;
//hCadranNomUsi = hcadreUsi/3;
//demo hbox
//demoHboxRot = 0;
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
lieuSurvole = noone;
bufferInpupExplo = 10;
tpsBufferInputExplo = 0
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

#region temps
//----temps----//
global.inputOn = false;
time_source_pause(ojeu.minuterie);
initMapDate = global.mapDate;
mapTimeMAJ = false;
//twerp pour maj timer//
					timer = 0;
/*end*/		diffTempsMinutes = date_minute_span(global.currentDate, global.mapDate);
/*durée*/	duree = room_speed * 3;

//-----CRIME PROC----//
minuterieTenseNightTimeSpent = 0;
minuterie = noone;

#endregion

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

#region menu sup
hBarreSup = display_get_gui_height()/6.5;
wBarreSup = display_get_gui_width();

mapOption[0] = {
	txt : function()
			{
					return string(ojeu.nbTueurActifs);
			},
	fonction : function(){ startObs("NBTUEURS_OBS_ID")},
	pressed : false,
	}
mapOption[1] = {
	txt : text("EXPLORATION"),
	fonction : function()
		{
				omapManager.currentMenu = MAP_MENU.EXPLO;
		},
	pressed : false,
	}
mapOption[2] = {
	txt : text("ORDINATEUR"),
	fonction : function()
	{
		omapManager.currentMenu = MAP_MENU.ORDI;
	},
	pressed : false
}
mapOption[3] = {
	txt : text("TÉLÉPHONE"),
	fonction : function()
		{
			omapManager.currentMenu = MAP_MENU.PHONE
		},
	pressed : false,
}
mapOption[4] = {
	txt : text("FICHES"),
	fonction : function(){},
	pressed : false,
		
}
mapOption[5] = {
	txt : function()
		{
			var _heure = string(date_get_hour(global.mapDate));
			var _minute = string(date_get_minute(global.mapDate));
			var _addHour =( string_length(_heure) == 1 ?  "0": "");
			var _addMinute = (string_length(_minute) != 2 ? "0": "");
			return _addHour+ _heure +":" +  _addMinute + _minute;
		},
	fonction : function(){},
	pressed : false,
}
nbMapOption = 6

wMapOption = wBarreSup/nbMapOption
_yTxt = hBarreSup/2

#endregion

#region game over 
#macro GAME_OVER_TITLE_SCALE 2.25
alphaGameOver = 0;
tarAlphaGameOver = 0;
gameOverSfxPlayed = false;
scrbblFinDePartie = scribble("[ftMenu]Fin de la partie").gradient(c_red, 0.6).align(fa_center, fa_top).scale(GAME_OVER_TITLE_SCALE);
alphaFinDePartie = 0;
alphaGameOverOption = 0;


gameOverOption[0] = {
	scrbbl: scribble("[ftMenu]Réessayer").gradient(c_red, 0.6).align(fa_center, fa_top),
	procedure : function()
	{
		omapManager.currentMenu = MAP_MENU.RETRY;
	},
	_y : 0,
	};
gameOverOption[1] = {
	scrbbl: scribble("[ftMenu]Sauvegarder et quitter").gradient(c_red, 0.6).align(fa_center, fa_top),
	procedure : function()
	{
		currentMenu = MAP_MENU.GAME_OVER_QUIT;
	},
	_y : 0,
	};
	

nbGameOverOption =1//array_length(gameOverOption);

yFinDePartie = scrbblFinDePartie.get_height()*GAME_OVER_TITLE_SCALE;
for (var _option = 0; _option < nbGameOverOption; _option ++)
{
	gameOverOption[_option]._y = yFinDePartie*1.5 + (yFinDePartie/2)*(_option+1);
}


#endregion

#region particules
partSys = part_system_create_layer("icone_pnj", false);


typePartPoussiere = part_type_create();

part_type_sprite(typePartPoussiere, sprPartPoussiere, false, false, true);
part_type_speed(typePartPoussiere, 12, 6, -1, 0);
part_type_direction(typePartPoussiere, 0, 359, 0, 0);
part_type_alpha3(typePartPoussiere, 1, 0.6, 0);
part_type_size(typePartPoussiere, 0.5, 0.6, 0.001, 0.002);
part_type_orientation(typePartPoussiere, 0, 359, 12, 0, false);
part_type_life(typePartPoussiere, room_speed*0.4, room_speed*0.6);







#endregion