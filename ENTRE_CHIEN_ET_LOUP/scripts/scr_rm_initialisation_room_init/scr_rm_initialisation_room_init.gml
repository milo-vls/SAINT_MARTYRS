enum DEPTHS 
{
	MENU_MANAGEMENT,
	INTERACTABLES_EXPLORATION,
	CRIMES,
}

/// @desc  import all the parameters set in the included CSV files
function rm_initialisation_room_init()
{
	#macro GAME_WIDTH 1920
	#macro GAME_HEIGHT 1080

	var _switches_init = function() 
	{
		return false;
	}
	global.switches = array_create_ext(SWITCHES.NUMBER_OF_SWITCHES, _switches_init);
	global.day_number = 0;
	global.ids_obtained_phone_numbers = [];
	global.current_sequence = noone;
	global.street_types = csv_to_1d_array("street_types.csv");
	global.characters = csv_to_structs_of_constructor("characters.csv", Character);
	var _nb_characters = array_length(global.characters);
	for (var _character_id = 0; _character_id < _nb_characters; _character_id ++)
	{
		var _character_sprite = asset_get_index("spr_char_" + global.characters[_character_id].nickname);
		global.characters[_character_id].sprite = asset_get_type(_character_sprite) == asset_sprite ? _character_sprite : spr_character_noone;
	}
	global.phone_numbers = csv_to_structs_of_constructor("phone_numbers.csv", PhoneNumber);
	global.streets = csv_to_structs_of_constructor("streets.csv", Street);
	global.addresses = csv_to_structs_of_constructor("addresses.csv", Address);
	global.cases = csv_to_structs_of_constructor("cases.csv", Case);
	global.crimes = csv_to_structs_of_constructor("crimes.csv",Crime);
	global.nb_crimes = array_length(global.crimes);
	enum LANGUAGES{FR, EN}
	global.language = LANGUAGES.FR;
	global.map_texts = csv_to_map_of_arrays("texts.csv");
	
	
	instance_create_depth(0, 0, DEPTHS.MENU_MANAGEMENT, obj_menu_management);
	instance_create_depth(0, 0, DEPTHS.MENU_MANAGEMENT, obj_sequence_management);
	
	
	display_set_gui_size(GAME_WIDTH, GAME_HEIGHT);
	surface_resize(application_surface, GAME_WIDTH, GAME_HEIGHT);
	scribble_font_set_default("fnt_test");
	room_goto(rm_title_screen);
}