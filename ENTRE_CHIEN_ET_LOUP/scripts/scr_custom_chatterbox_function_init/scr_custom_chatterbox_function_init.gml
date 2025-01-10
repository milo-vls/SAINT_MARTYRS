
				////////////////
				//* SWITCHES *//
				////////////////

function set_switch_off()
{
	variable_struct_set(global.switches, argument0[0], false);
}

function set_switch_on()
{
	variable_struct_set(global.switches, argument0[0], true);
}

function set_switch()
{
	variable_struct_set(global.switches, argument0[0], argument0[1]);
}

function get_switch_state()
{
	var _result = variable_struct_get(global.switches, argument0[0]) ? 1 : 0;
	return _result;
}



				///////////////
				//* SCENERY *//
				///////////////

function dialogue_set_background()
{
	background_index = argument0[0];
	/*
	var _dialogue_menu = obj_menu_manager.get_active_menu(DialogueMenu);
	if _dialogue_menu == -1
		return;
	_dialogue_menu.background_index = _background_index;
	*/
}

function start_observation_from_dialogue()
{
	start_observation_by_text(argument0[0]);
}


				/////////////////////
				//* OTHER GETTERS *//
				/////////////////////

function dialogue_get_day_number()
{
	return global.day_number;
}



				/////////////////////////////////////////
				//* NUMBER OF INTERACTIONS MANAGEMENT *//
				/////////////////////////////////////////

function dialogue_get_character_nb_interactions_today()
{
	var _nickname = argument0[0];
	return get_character_by_nickname(_nickname).nb_interactions_today;
}
function dialogue_increase_character_nb_interactions()
{
	var _nickname = argument0[0];
	return global.characters[get_character_id_by_nickname(_nickname)].nb_interactions_today ++;
}
function dialogue_set_character_nb_interactions()
{
	var _nickname = argument0[0];
	var _increament = argument0[1];
	
	return global.characters[get_character_id_by_nickname(_nickname)].nb_interactions_today + _increament;
}



				//////////////////////////////////
				//* ADDING FUNCTION AT STARTUP *//
				//////////////////////////////////

function custom_chatterbox_function_init()
{
	
	ChatterboxAddFunction("set_switch_off", set_switch_off);
	ChatterboxAddFunction("set_switch_on", set_switch_on);
	ChatterboxAddFunction("set_switch", set_switch);
	ChatterboxAddFunction("get_switch_state", get_switch_state);
	ChatterboxAddFunction("background", dialogue_set_background);
	ChatterboxAddFunction("get_day_number", dialogue_get_day_number);
	ChatterboxAddFunction("get_nb_interactions_of", dialogue_get_character_nb_interactions_today);
	ChatterboxAddFunction("increase_nb_interactions_of", dialogue_increase_character_nb_interactions);
	ChatterboxAddFunction("set_nb_interactions_of", dialogue_set_character_nb_interactions);
	ChatterboxAddFunction("observation", start_observation_from_dialogue)

}


