#macro COMPUTER_SCREEN_LAYER_NAME "permanent_computer_object_layer"
#macro COMPUTER_SCREEN_LAYER_DEPTH DEPTHS.MENU_MANAGEMENT


function go_to_computer()
{
	
	
	
	
	var _first_room_of_session;
	
	if global.switches.computer_unlocked
		_first_room_of_session = rm_computer_desktop;
	else
		_first_room_of_session = rm_app_login;
		
	var _computer_screen_layer_id = layer_get_id(COMPUTER_SCREEN_LAYER_NAME);
	if -1 == _computer_screen_layer_id
		_computer_screen_layer_id = layer_create(COMPUTER_SCREEN_LAYER_DEPTH, COMPUTER_SCREEN_LAYER_NAME);
	
	
	instance_create_layer(0, 0, _computer_screen_layer_id, obj_computer_screen);

	
	change_room(_first_room_of_session, sqc_transition_cover_instant, sqc_transition_discover_instant);
}