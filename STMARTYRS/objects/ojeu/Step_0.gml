//tests
if keyboard_check_pressed(vk_shift) then ajout_resurgence(5);






if player_free()
{
	/////-----------SOMEIL FORCÉ
	if heureCouche <= date_get_hour(global.currentDate) and date_get_hour(global.currentDate) < heureReveil
	{
		GoToRoom(pcarte, noone, true);
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
	
	
	

	


