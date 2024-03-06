enum ROOM_TRANSITION_STATES
{
	COVERING_SCREEN,
	SCREEN_IS_COVERED,
	DISCOVERING_SCREEN,
	SCREEN_IS_DISCOVERED,
}




function RoomTransition(_room_destination, _transition_style) : Menu(MENU_PRIORITIES.ROOM_TRANSITION, room, true, false, false ) constructor 
{
	room_destination = _room_destination;
	transition_style = _transition_style;
	
	transition_state = ROOM_TRANSITION_STATES.COVERING_SCREEN;
	
	draw = function()
	{
		if transition_state == ROOM_TRANSITION_STATES.COVERING_SCREEN
		{
			if transition_style.cover_screen() transition_state = ROOM_TRANSITION_STATES.SCREEN_IS_COVERED
		}
		if transition_state == ROOM_TRANSITION_STATES.SCREEN_IS_COVERED
		{
			transition_style.cover_screen();
		}
		if transition_state == ROOM_TRANSITION_STATES.DISCOVERING_SCREEN
		{
			if transition_style.discover_screen() then transition_state = ROOM_TRANSITION_STATES.SCREEN_IS_DISCOVERED;
		}
	}
	activity = function()
	{
		if self.transition_state == ROOM_TRANSITION_STATES.SCREEN_IS_COVERED
		{
			room_goto(self.room_destination);
			self.transition_state = ROOM_TRANSITION_STATES.DISCOVERING_SCREEN;
			return;
		}
		if self.transition_state == ROOM_TRANSITION_STATES.DISCOVERING_SCREEN
		{
			self.parallelism = true;
			return;
		}
		if self.transition_state == ROOM_TRANSITION_STATES.SCREEN_IS_DISCOVERED
		{
			self.end_reached = true;
		}
		
	}
}