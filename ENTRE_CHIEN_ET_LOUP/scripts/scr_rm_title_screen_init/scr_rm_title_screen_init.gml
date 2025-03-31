
function rm_title_screen_init()
{
	var _title_screen_options = [];
	_title_screen_options[array_length(_title_screen_options)] = new TextMenuOption(
	"TITLE SCREEN NEW START",  
	function()
	{
		start_first_call_cutscene();
	});
	
	
	if file_exists(SAVE_FILE_NAME)
	{
		_title_screen_options[array_length(_title_screen_options)] = new TextMenuOption("TITLE SCREEN START", function(_id_menu){start_cutscene_test();change_room(rm_dev)});
	}
	_title_screen_options[array_length(_title_screen_options)] = new TextMenuOption("TITLE SCREEN PARAMETERS", function(_id_menu){show_parameters(MENU_CHANNELS.TITLE_SCREEN, MENU_PRIORITIES.TITLE_SCREEN + 1)}); 
	_title_screen_options[array_length(_title_screen_options)] = new TextMenuOption("TITLE SCREEN QUIT", game_end); 
	_title_screen_options[array_length(_title_screen_options)] = new TextMenuOption("TITLE SCREEN TEST COMPUTER", go_to_computer); 
	
	add_menu( new TextOptionsMenu(			_title_screen_options,
																													CENTERED_GUIDE_LINE,
																													MENU_PRIORITIES.TITLE_SCREEN,
																													room,
																													true,
																													false,
																													false,
																													MENU_CHANNELS.TITLE_SCREEN)
	);
	
}