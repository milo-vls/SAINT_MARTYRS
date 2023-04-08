draw_set_alpha(1);
switch(currentIntroState)
{
case INTRO_STATE.BLACK_SCREEN :{
	changeBackgroundMusic(noone);
	draw_rectangle_color(0, 0, GAME_WIDTH, GAME_HEIGHT, col1Rec, col2Rec, col3Rec, col4Rec, false);
	if !instance_exists(oGoToRoom)
	currentIntroState = INTRO_STATE.BUS_DRIVING_BGS;
}break;
case INTRO_STATE.BUS_DRIVING_BGS:{
	
	draw_rectangle_color(0, 0, GAME_WIDTH, GAME_HEIGHT, col1Rec, col2Rec, col3Rec, col4Rec, false);
	changeBackgroundSound(snBGSBusDriving);
	currentIntroState = INTRO_STATE.WAIT_BEFORE_STOP; 
}break;
case INTRO_STATE.WAIT_BEFORE_STOP:{
	draw_rectangle_color(0, 0, GAME_WIDTH, GAME_HEIGHT, col1Rec, col2Rec, col3Rec, col4Rec, false);
	tpsWaitBeforeStop ++;
	if tpsWaitBeforeStop >dureeWaitBeforeStop
	{
		changeBackgroundSound(noone);
		playsound(snStoppingBus, 1);
		currentIntroState =INTRO_STATE.STOPPED_BUS_LOOP_BGS;
	}
}break;
case INTRO_STATE.STOPPED_BUS_LOOP_BGS:{
	draw_rectangle_color(0, 0, GAME_WIDTH, GAME_HEIGHT, col1Rec, col2Rec, col3Rec, col4Rec, false);
	if !audio_is_playing(snStoppingBus)
	{
		changeBackgroundSound(snBGSStoppedBus);	
		currentIntroState = INTRO_STATE.DRIVERS_TALK;
	}
}break;
case INTRO_STATE.DRIVERS_TALK :{
	draw_rectangle_color(0, 0, GAME_WIDTH, GAME_HEIGHT, col1Rec, col2Rec, col3Rec, col4Rec, false);
	draw_set_alpha(1)
	driversTalkTxt.draw(GAME_WIDTH/2, GAME_HEIGHT/2, driversTalkTypist);
	var checkState = driversTalkTypist.get_state();
	if checkState >= 1 and global.cPrLeft
		{
			currentIntroState = INTRO_STATE.WIND_LOOP_BGS;
		}
}break
case INTRO_STATE.WIND_LOOP_BGS:{
	draw_rectangle_color(0, 0, GAME_WIDTH, GAME_HEIGHT, col1Rec, col2Rec, col3Rec, col4Rec, false);
	changeBackgroundSound(noone);
	changeBackgroundSound(snBGSWind);
	currentIntroState = INTRO_STATE.WAIT_BEFORE_TITLE;
}break;
case INTRO_STATE.WAIT_BEFORE_TITLE:{
	draw_rectangle_color(0, 0, GAME_WIDTH, GAME_HEIGHT, col1Rec, col2Rec, col3Rec, col4Rec, false);
	tpsWaitBeforeTitle ++;
	if tpsWaitBeforeTitle >= dureeWaitBeforeTitle
	{
		currentIntroState = INTRO_STATE.TITLE_SHOWN;	
	}
}break;
case INTRO_STATE.TITLE_SHOWN:{
	//col2Rec = c_purple;
	//col3Rec = c_red;
	//col4Rec = c_red;
	draw_rectangle_color(0, 0, GAME_WIDTH, GAME_HEIGHT, col1Rec, col2Rec, col3Rec, col4Rec, false);
	draw_set_font(ftMenu);draw_set_halign(fa_center); draw_set_valign(fa_middle);
	draw_text_color(GAME_WIDTH/2, GAME_HEIGHT/2, titleTxt, c_white, c_white, c_black, c_black, 0.9);
	tpsTitle ++;
	if tpsTitle >= waitTitle
	{
		currentIntroState = INTRO_STATE.TRAVEL_TO;
	}
}break;
case INTRO_STATE.TRAVEL_TO:{
	if room == P_TABLEAU_DE_NUIT and !instance_exists(oObservation)
	{
		GoToRoom(P_SANITAIRES);
		currentIntroState = INTRO_STATE.GENDARMERIE;
	}
}break;
case INTRO_STATE.GENDARMERIE:{
	if room == P_SANITAIRES and !instance_exists(oObservation)
	{
		 if !instance_exists(oGoToRoom) GoToRoom(P_CORRIDOR);
	}
	if (!instance_exists(oGoToRoom) and !instance_exists(oDial))
	{
		currentIntroState = INTRO_STATE.TUTO_MAP;
		GoToMap();
	}
}break;
case INTRO_STATE.TUTO_MAP:{
	if room == P_CORRIDOR and !instance_exists(oDial)
	{
		GoToRoom(pcarte);	
	}
	
	switch(tutoMapState)
	{
		case 0:
		{
			if room == pcarte tutoMapState ++;
		}break;
		case 1:
		{
			drawRectangleHighlightText(200, 400, 1600, 650, c_blue, 0.4, textTutoMapTest, typistTextTutoMapTest);
			tutoMapState += waitForAnyInputPressed();
		}break;
	}
	
}break;
default:{}break;

}