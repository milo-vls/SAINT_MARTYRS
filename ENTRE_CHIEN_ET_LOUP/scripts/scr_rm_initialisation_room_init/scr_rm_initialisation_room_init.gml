enum DEPTHS 
{
	GUI,
	
	
	MENU_MANAGEMENT,
	INTERACTABLES_EXPLORATION,
	CRIME_SHEETS,
	UNITS,
	CRIMES,
	
	
	BACKGROUND
}

/// @desc  import all the parameters set in the included CSV files
function rm_initialisation_room_init()
{
	#macro GAME_WIDTH 1920
	#macro GAME_HEIGHT 1080


	global.switches = array_create(SWITCHES.NUMBER_OF_SWITCHES);
	global.day_number = 0;
	global.minimum_days_prediction = 1;
	global.starting_date = date_create_datetime(2012, 09, 17, 19, 30, 0);
	global.ids_obtained_phone_numbers = [];
	global.current_cases_ids = array_create(0);
	global.map_steps = array_create(0);
	
	
	global.street_types = csv_to_1d_array("street_types.csv");
	global.characters = csv_to_structs_of_constructor("characters.csv", Character);var _nb_characters = array_length(global.characters);for (var _character_id = 0; _character_id < _nb_characters; _character_id ++)
	{
		var _character_sprite = asset_get_index("spr_char_" + global.characters[_character_id].nickname);
		global.characters[_character_id].sprite = asset_get_type(_character_sprite) == asset_sprite ? _character_sprite : spr_character_noone;
	}
	global.phone_numbers = csv_to_structs_of_constructor("phone_numbers.csv", PhoneNumber);
	global.streets = csv_to_structs_of_constructor("streets.csv", Street);
	global.addresses = csv_to_structs_of_constructor("addresses.csv", Address);
	global.cases = csv_to_structs_of_constructor("cases.csv", Case);
	global.crimes = csv_to_structs_of_constructor("crimes.csv",Crime);
	global.malus = csv_to_structs_of_constructor("malus.csv", Malus); malus_distribution_init();
	global.nb_crimes = array_length(global.crimes);enum LANGUAGES{FR, EN}
	global.language = LANGUAGES.FR;
	global.map_texts = csv_to_map_of_arrays("texts.csv");
	global.units = csv_to_structs_of_constructor("units.csv", Unit);for (var _unit_id = 0; _unit_id < array_length(global.units); _unit_id ++)
	{
		global.units[_unit_id].character_id = int64(global.units[_unit_id].character_id);
		global.units[_unit_id].nickname = global.characters[global.units[_unit_id].character_id].nickname;
	}
	
	
	instance_create_depth(0, 0, DEPTHS.MENU_MANAGEMENT, obj_menu_manager);
	instance_create_depth(0, 0, DEPTHS.MENU_MANAGEMENT, obj_sequence_manager);
	instance_create_depth(0, 0, DEPTHS.MENU_MANAGEMENT, obj_input_delay);
	instance_create_depth(0, 0, DEPTHS.MENU_MANAGEMENT, obj_sound_manager);
	instance_create_depth(0, 0, DEPTHS.MENU_MANAGEMENT, obj_map_events_manager);
	
	
	
	
	display_set_gui_size(GAME_WIDTH, GAME_HEIGHT);
	surface_resize(application_surface, GAME_WIDTH, GAME_HEIGHT);
	scribble_font_set_default("fnt_test");
	
	
	global.day_events = set_day_events();
	global.character_id_to_voices_map = set_characters_voices();
	
	room_goto(rm_title_screen);
}