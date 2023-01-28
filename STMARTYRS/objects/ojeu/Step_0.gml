//tests
if keyboard_check_pressed(vk_shift) then ajout_resurgence(5);






if player_free()
{
	var _heureActuelle = date_get_hour(global.currentDate)
	
	if END_OF_NIGHT_HOUR <= _heureActuelle and _heureActuelle < START_OF_NIGHT_HOUR
	{
		GoToRoom(pcarte, noone, true);
	}

	tenseNight = START_TENSE_NIGHT <= _heureActuelle and _heureActuelle <= END_OF_NIGHT_HOUR

}



show_debug_message(string(array_length(crimeProc) == 0))

if tenseNight and array_length(crimeProc) == 0
{
	
	tueurProc = killerProceduralGeneration(new setNightDiff(4, [PATTERN.RECTILIGNE], 0, 1), START_TENSE_NIGHT, END_OF_NIGHT_HOUR);
	nbTueurProc = array_length(tueurProc);
	
	for (var _tueur = 0; _tueur < nbTueurProc; _tueur ++)
	{
		array_push_array(crimeProc, crimeProceduralGeneration(_tueur))
	}
	
}



///------------EFFET FLOU
if blurLayer!=noone and blurFx != -1 ///FLOU
{
	blur =  instance_exists(oDial) and !instance_exists(oObservation)?   oDial.blur : false;
	radiusBlur =  blur ? approach(radiusBlur, blurDial, 1)  : approach(radiusBlur, 0, 1)
	
	fx_set_parameter(blurFx,"g_Radius", radiusBlur);
	layer_set_fx(blurLayer, blurFx);
}


///----------INPUT 
if keyboard_check(vk_escape)	{game_end()																					};
if keyboard_check(vk_f10)		{GoToRoom(ptestexplo3)															};
if keyboard_check(vk_right)		{global.currentDate = date_inc_hour(global.currentDate, 1)	};


global.cRight = global.inputOn ? mouse_check_button(mb_right) : false;
global.cPrRight = global.inputOn ?  mouse_check_button_pressed(mb_right) : false;
global.cRlRight = global.inputOn ? mouse_check_button_released(mb_right) : false;
	
global.cLeft = global.inputOn ? mouse_check_button(mb_left) : false;
global.cPrLeft = global.inputOn ? mouse_check_button_pressed(mb_left) : false;
global.cRlLeft = global.inputOn ? mouse_check_button_released(mb_left) : false;


////-------DATES
global.strDay = string(date_get_day(global.currentDate));
global.strMonth = global.month[date_get_month(global.currentDate)];
global.strYear = string(date_get_year(global.currentDate))
global.strDate = global.strDay + " " + global.strMonth + " " + global.strYear;
	
	
	

	


