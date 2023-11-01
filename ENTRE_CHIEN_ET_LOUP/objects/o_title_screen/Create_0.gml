var _new_start = function()
{
	
}
var _start = function()
{
	
}
var _quit = function()
{
	game_end();
}

title_screen_options[0] = new MenuOption("TITLE SCREEN NEW START", _new_start);
title_screen_options[1] = new MenuOption("TITLE SCREEN START", _start);
title_screen_options[2] = new MenuOption("TITLE SCREEN QUIT", _quit); 