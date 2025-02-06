

global.room_transition = noone;

function RoomTransition(_room_destination, _sequence_cover, _sequence_discover, _function_when_room_entered) : Menu(MENU_PRIORITIES.ROOM_TRANSITION, room, true, false, false ) constructor 
{
	room_destination = _room_destination;
	sequence_cover = _sequence_cover;
	sequence_discover = _sequence_discover;
	function_when_room_entered = _function_when_room_entered;
	
	sequence_cover_id = noone;
	sequence_discover_id = noone;
	set_up_done = false;
	
	draw = function(){};
	activity = function()
	{
		if false == set_up_done 
		{
			global.room_transition = self;
				
				
			//cover sequence for current room
			sequence_cover_id = room_transition_place_sequence(sequence_cover);
				
			//discover sequence for destination room
			layer_set_target_room(room_destination);
			sequence_discover_id = room_transition_place_sequence(sequence_discover);
			layer_reset_target_room();
			
			set_up_done = true;
		}
	}
}


#macro ROOM_TRANSITION_LAYER_NAME "room_transition_layer"

function room_transition_place_sequence(_sequence_type)
{
	if layer_exists(ROOM_TRANSITION_LAYER_NAME)
		layer_destroy(ROOM_TRANSITION_LAYER_NAME);
	
	var _sequence_layer = layer_create(DEPTHS.GUI, ROOM_TRANSITION_LAYER_NAME);
	return layer_sequence_create(_sequence_layer, 0, 0, _sequence_type);
}


function room_transition_end_of_covering_sequence()
{
	room_goto(global.room_transition.room_destination);
}

function room_transition_start_of_discovering_sequence()
{
	global.room_transition.function_when_room_entered();
}

function room_transition_end_of_discovering_sequence()
{
	layer_sequence_destroy(self.elementID);
	global.room_transition.end_reached = true;
	global.room_transition = noone;
}







function room_transition_activity()
{
	if self.transition_state == ROOM_TRANSITION_STATES.SCREEN_IS_COVERED
	{
		room_goto(self.room_destination);
		self.transition_state = ROOM_TRANSITION_STATES.DISCOVERING_SCREEN;
		return;
	}
	if self.transition_state == ROOM_TRANSITION_STATES.DISCOVERING_SCREEN
	{
		function_when_room_entered();
		self.parallelism = true;
		return;
	}
	if self.transition_state == ROOM_TRANSITION_STATES.SCREEN_IS_DISCOVERED
	{
		self.end_reached = true;
	}
}
