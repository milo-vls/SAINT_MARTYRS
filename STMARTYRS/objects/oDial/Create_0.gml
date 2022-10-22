#region définitif
	fadingSpeed = 5;
	wCentralSlide = display_get_gui_width()/2.5;
	//hCentralSlide = display_get_height();
	xCentralSlide = display_get_gui_width()/2 - wCentralSlide/2;
	yCentralSlide = display_get_height();
	decaBulleSlide = 1;
	decaHChoiceBulle = 300;
	decaTexteBulle = 20;
	decaBulle = 60; //décalage entre les bulles
	wBulle = wCentralSlide - decaBulleSlide*2;
	hBulleMin = decaTexteBulle*2
	xBulle = display_get_gui_width()/2 - wBulle/2;
	hChoiceBox = display_get_height()/5;
	xChoiceBox = xCentralSlide;
	yChoiceBoxMin = display_get_height();
	yChoiceBoxMax = display_get_height()-hChoiceBox;
	xtxt = xCentralSlide + decaBulleSlide + decaTexteBulle;
	font = ftDial;
	draw_set_font(font);
	sepTxt = string_height("W")-10;
	baseTypeSpeed = 0.5;
	maxTypeSpeed = 1;
	spriteBulle = sprBulle;
	hBulleMin = decaTexteBulle*2 + sepTxt;
	decaArrChoice = 20;
	Arr = sprArr;
	xLeftArr = xChoiceBox - decaArrChoice;
	xRightArr = xChoiceBox + wCentralSlide + decaArrChoice;
	visibleRightArr = false;
	visibleLeftArr = false;
	xAnsIcone = display_get_gui_width()/2;
	iconeAnswer = sprAnsIcone;
	visibleIconeAnswer = false;
	xChoiceTxt = xtxt + 20;
	wChoiceTxt = wCentralSlide - decaTexteBulle*2;
	//wPort = ((display_get_gui_width() - wCentralSlide)/3);
	colFnt = "c_white";
	decaBulleOtherSide = 200;
	wtxt = wBulle - decaTexteBulle*2 - decaBulleOtherSide;
	hPort = display_get_gui_height();
	alphaRPort = 0.1;
	alphaLPort = 0.1;

	antLeftPort = noone;
	antRightPort = noone;
	//alphaAntLPort = 1;
	alphaAntRPort = 1;
	//xAntLPort = 0;

	//xAntRPort = 0;


	yrightPort = display_get_gui_height();
	yleftPort = display_get_gui_height();

	setupPort = false;

#endregion
#region animation portrait
//---REBOND
targetHPort = hPort;
vitesseScale = 7;
tensionScale = 0.5;
//---SYNCHRONIE LABIALE
cptr = 0;
numSubImage = 1
#endregion
#region To load
	nbBulles = 0;
	bulle[0]={
		y : 0,
		tarY : 0,		//valeur vers laquelle tendra y
		h : 0,			//hauteur de la bulle
		tarH : 0,		//valeur vers laquelle tendra h
		side : noone,
		txt : "",		//texte
		ltxt : 0,		//longeur du texte
		drewchar : 0,	//nombre de charactères dessinés //évolue durant le dialogue
		char : noone,
		tarAlpha : 0,
		alpha : 0,
		txtToDraw : "",
	}
	choice[0]={
	txt : "",
	ltxt : 0,
	choiceID : "",
}
#endregion
#region évolue durant le dialogue
	currentBulle = 0;

	typingSpeed = baseTypeSpeed;
	//choix
	showChoice = false;
	currentChoice = 0;
	choiceDrewChar = 0;
	yChoiceBox = yChoiceBoxMin;
	tarYChoiceBox = yChoiceBox;
	choiceTxtToDraw = "";
	nbChoices = 0;
	//portrait
	leftPort = noone;
	rightPort = noone;
	//commandes
	rightArrPressed = false;
	leftArrPressed = false;
	ansPressed = false;
#endregion

clickAuto = false;
setup = false;