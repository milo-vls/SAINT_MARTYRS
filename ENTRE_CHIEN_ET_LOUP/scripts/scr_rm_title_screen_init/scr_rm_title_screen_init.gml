// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function rm_title_screen_init()
{
	var _new_start = function()
	{
	
	}
	var _start = function(_id_menu)
	{
		_id_menu.end_reached = true;
	}
	var _quit = function()
	{
		game_end();
	}
	
	var _title_screen_options = [];
	_title_screen_options[0] = new TextMenuOption("TITLE SCREEN NEW START", _new_start);
	_title_screen_options[1] = new TextMenuOption("TITLE SCREEN START", _start);
	_title_screen_options[2] = new TextMenuOption("TITLE SCREEN QUIT", _quit); 
	
	obj_menu_managment.add_menu( new TextOptionsMenu(	_title_screen_options,
																													new MenuGuideLine(room_width/2, 0, room_width/2, room_height),
																													0,
																													room,
																													true,
																													false)
	);
	
}