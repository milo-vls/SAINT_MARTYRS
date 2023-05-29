depth = DEPTH_OJEU;


//DESACTIVATE everything
time_source_pause(ojeu.minuterie);
if instance_exists(omapManager)
{
	if omapManager.minuterie != noone time_source_pause(omapManager.minuterie);
}
instance_deactivate_all(true);

//OPTIONS
pauseOption[0] = {
	txt : text("PAUSE_MENU_CONTINUE"),
	fonction : function()
	{
		instance_activate_all();
		time_source_resume(ojeu.minuterie);
		if instance_exists(omapManager)
		{
			if omapManager.minuterie != noone time_source_resume(omapManager.minuterie);
		}
		instance_destroy();
	},
}
pauseOption[1] = {
	txt : text("PAUSE_MENU_OPTIONS"),
	fonction : function()
	{
		currentOptions = parametersOptions;
	},
}
pauseOption[2] = {
	txt : text(),
	fonction : function()
	{
		sauvegarder();
	}
}


parametersOptions = [];

currentOptions = pauseOption;

draw_set_alpha(1);