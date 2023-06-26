#macro MARGE_PAUSE_OPTION (GAME_HEIGHT/20)
#macro OPTIONS_PAUSE_MIN_Y ((GAME_HEIGHT/2) - hauteurOptions/2)
function optionGetHeight(_option)
{
	draw_set_font(ftDial);
	return (string_height("|") + MARGE_PAUSE_OPTION) * array_length(_option);
	
}


depth = DEPTH_OJEU;


//DESACTIVATE everything
time_source_pause(ojeu.minuterie);
if instance_exists(omapManager)
{
	if omapManager.minuterie != noone time_source_pause(omapManager.minuterie);
}
instance_deactivate_all(true);
instance_activate_object(oInputs);

depause = function()
 {
	 		instance_activate_all();
		time_source_resume(ojeu.minuterie);
		if instance_exists(omapManager)
		{
			if omapManager.minuterie != noone time_source_resume(omapManager.minuterie);
		}
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
		oPause.currentOptions = oPause.parametersOptions;
		oPause.hauteurOptions = oPause.optionGetHeight(oPause.currentOptions);
	},
}
pauseOption[2] = {
	scrbbl : scribble("[ftDial][shake]" + text("PAUSE_MENU_SAVE")).align(fa_center, fa_top),
	fonction : function()
	{
		oPause.depause();
		sauvegarder();
		
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

currentOptions = pauseOption;
hauteurOptions = optionGetHeight(currentOptions);
draw_set_alpha(1);