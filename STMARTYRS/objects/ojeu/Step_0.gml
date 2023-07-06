
///------------EFFET FLOU
if blurLayer!=noone and blurFx != -1 ///FLOU
{
	blur =  instance_exists(oDial) and !instance_exists(oObservation)?   oDial.blur : false;
	radiusBlur =  blur ? approach(radiusBlur, blurDial, 1)  : approach(radiusBlur, 0, 1)
	
	fx_set_parameter(blurFx,"g_Radius", radiusBlur);
	layer_set_fx(blurLayer, blurFx);
}


///----------INPUT 
//DEV
if keyboard_check(vk_escape)	{game_end()																					}
if keyboard_check(vk_f10)		{GoToRoom(ptestexplo3)															}
if keyboard_check(vk_f1)			{ojeu.peutAllerGendarmerie = true; ojeu.showButtonRetourCarte = true}
if keyboard_check(vk_f9)			{dormir()};

//USER
if global.canPause and global.inputPause
{
	global.inputPause = false;
	instance_create_depth(0, 0, 0, oPause);
}




	

	


