
function change_language()
{
	if global.language == LANGUAGES.FR 
	{
		global.language = LANGUAGES.EN;
		return;
	}
	if global.language == LANGUAGES.EN
	{
		global.language = LANGUAGES.FR;
		return;
	}
	
}

function show_parameters(_channel, _priority)
{
	var _parameters_options = [];
	_parameters_options[0] = new TextMenuOption("PARAMETERS LANGUAGE", change_language);
	_parameters_options[1] = new TextMenuOption("BACK", function(_id_menu){_id_menu.end_reached = true});
	
	var _text_options_menu = new TextOptionsMenu(_parameters_options, CENTERED_GUIDE_LINE, _priority);
	obj_menu_managment.add_menu(_text_options_menu)
}