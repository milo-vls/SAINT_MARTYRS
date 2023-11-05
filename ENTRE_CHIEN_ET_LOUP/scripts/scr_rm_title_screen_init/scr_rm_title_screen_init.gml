
#macro TITLE_SCREEN_CHANNEL 44
#macro TITLE_SCREEN_PRIORITY 0

function rm_title_screen_init()
{
	var _title_screen_options = [];
	if !file_exists(SAVE_FILE_NAME)
	{
		_title_screen_options[array_length(_title_screen_options)] = new TextMenuOption("TITLE SCREEN NEW START",  function(){save_game();change_room(rm_dev)});
	}
	else
	{
		_title_screen_options[array_length(_title_screen_options)] = new TextMenuOption("TITLE SCREEN START", function(_id_menu){change_room(rm_dev)});
	}
	_title_screen_options[array_length(_title_screen_options)] = new TextMenuOption("TITLE SCREEN PARAMETERS", function(_id_menu){show_parameters(TITLE_SCREEN_CHANNEL, TITLE_SCREEN_PRIORITY + 1)}); 
	_title_screen_options[array_length(_title_screen_options)] = new TextMenuOption("TITLE SCREEN QUIT", game_end); 
	
	obj_menu_managment.add_menu( new TextOptionsMenu(	_title_screen_options,
																													CENTERED_GUIDE_LINE,
																													TITLE_SCREEN_PRIORITY,
																													room,
																													true,
																													false,
																													false,
																													TITLE_SCREEN_CHANNEL)
	);
	
}