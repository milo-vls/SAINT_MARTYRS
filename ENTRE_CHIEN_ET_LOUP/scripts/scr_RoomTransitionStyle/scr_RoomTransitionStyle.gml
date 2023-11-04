enum ROOM_TRANSITION_STYLES
{
	FADE,
	/*SLIDE_UP_DOWN,
	SLIDE_DOWN_UP,
	SLIDE_LEFT_RIGHT,
	SLIDE_RIGHT_LEFT,*/
}

/**
 * Function Description
 * @param {constant.ROOM_TRANSITION_STYLES} _room_transition_style Description
 * @param {constant.color} [_color]=c_black Description
 */
function RoomTransitionStyle(_room_transition_style, _color = c_black) constructor 
{
	room_transition_style = _room_transition_style;
	color = _color;
	
	//FADE VARIABLES	
	screen_alpha = 0;
	
	cover_screen = function()
	{
		if room_transition_style ==  ROOM_TRANSITION_STYLES.FADE
		{
			screen_alpha = 1;
			draw_set_alpha(screen_alpha); draw_set_color(color);
			draw_rectangle(0, 0, GAME_WIDTH, GAME_HEIGHT, false);
			return screen_alpha == 1;
		}
	}
	discover_screen = function()
	{
		if room_transition_style ==  ROOM_TRANSITION_STYLES.FADE
		{
			screen_alpha = 0;
			draw_set_alpha(screen_alpha); draw_set_color(color);
			draw_rectangle(0, 0, GAME_WIDTH, GAME_HEIGHT, false);
			return screen_alpha == 0;
		}
	}
}