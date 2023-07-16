#macro MARGE_PAUSE_OPTION (GAME_HEIGHT/20)
#macro OPTIONS_PAUSE_MIN_Y ((GAME_HEIGHT/2) - hauteurOptions/2)
function optionGetHeight(_option)
{
	draw_set_font(ftDial);
	return (string_height("|") + MARGE_PAUSE_OPTION) * array_length(_option);
	
}
function changePauseOptions(_options)
{
	oPause.currentOptions = _options;
	oPause.hauteurOptions = oPause.optionGetHeight(_options);
}

depth = DEPTH_OJEU;


//DESACTIVATE everything

if instance_exists(omapManager)
{
	if omapManager.minuterieTenseNight != noone time_source_pause(omapManager.minuterieTenseNight);
}
instance_deactivate_all(true);
instance_activate_object(oInputs);

depause = function()
 {
	 	instance_activate_all();
		
		if instance_exists(omapManager)
		{
			if omapManager.minuterieTenseNight != noone time_source_resume(omapManager.minuterieTenseNight);
		}
		instance_destroy(oPause);
 }


//OPTIONS
pauseOption[0] = {
	scrbbl : scribble("[ftDial][shake]" + text("PAUSE_MENU_CONTINUE")).align(fa_center, fa_top),
	fonction : function()
	{
		oPause.depause();
		instance_destroy(oPause);
	},
};
pauseOption[1] = {
	scrbbl : scribble("[ftDial][shake]" + text("PAUSE_MENU_OPTIONS")).align(fa_center, fa_top),
	fonction : function()
	{
		oPause.changePauseOptions(oPause.parametersOptions);
	},
}
pauseOption[2] = {
	scrbbl : scribble("[ftDial][shake]" + text("PAUSE_MENU_SAVE")).align(fa_center, fa_top),
	fonction : function()
	{
		sauvegarder();
		oPause.changePauseOptions(oPause.savingOption)	
	},
}
pauseOption[3] = {
	scrbbl : scribble("[ftDial][shake]" + text("PAUSE_MENU_QUIT")).align(fa_center, fa_top),
	fonction : function()
	{
		oPause.depause();
		sauvegarder();
		game_restart();
	}
}

parametersOptions[0] = {
	scrbbl : scribble("[ftDial][shake]" + text("PAUSE_PARAMETERS_RETOUR")).align(fa_center, fa_top),
	fonction : function()
	{
		oPause.currentOptions = oPause.pauseOption;
		oPause.hauteurOptions = oPause.optionGetHeight(oPause.currentOptions);
	},
}

feedbackSavingText = "[ftDial][shake]" + "SAUVEGARDE EN COURS"
savingOption[0] = {
	scrbbl : scribble(feedbackSavingText).align(fa_center, fa_top),
	fonction : function(){},
}
tpsDelayPoint = 0;
#macro DELAY_BEFORE_NEW_POINT room_speed
#macro NUMBER_OF_POINTS 3


currentOptions = pauseOption;
hauteurOptions = optionGetHeight(currentOptions);
draw_set_alpha(1);