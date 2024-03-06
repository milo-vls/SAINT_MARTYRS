enum ROOM_TRANSITION_STYLES
{
	FADE,
	SHOW_DATE,
	/*SLIDE_UP_DOWN,
	SLIDE_DOWN_UP,
	SLIDE_LEFT_RIGHT,
	SLIDE_RIGHT_LEFT,*/
}

//STYLES SPECIFIC MACROS
//FADE
#macro FADING_IN_SPEED 0.07
#macro FADING_OUT_SPEED 0.05
//SHOW_DATE
#macro DATE_SHOWN_LENGTH (1.4 * game_get_speed(gamespeed_fps))



/**
 * Function Description
 * @param {Constant.ROOM_TRANSITION_STYLES} _room_transition_style Description
 * @param {constant.color} [_color]=c_black Description
 */
function RoomTransitionStyle(_room_transition_style, _color = c_black) constructor 
{
	room_transition_style = _room_transition_style;
	color = _color;
	
	
	//STYLES SPECIFICS VARIABLES
	//FADE
	screen_alpha = 0;
	//SHOW_DATE
	date_shown_timer = 0;
	
	
	
	
	
	
	cover_screen = room_transition_covering;
	discover_screen = room_transition_discovering;
}


function room_transition_covering()
{
	switch(room_transition_style)
	{
		case ROOM_TRANSITION_STYLES.FADE :{
			screen_alpha += FADING_IN_SPEED;
			screen_alpha = min(1, screen_alpha);
			draw_set_alpha(screen_alpha); draw_set_color(color);
			draw_rectangle(0, 0, GAME_WIDTH, GAME_HEIGHT, false);
			
			return screen_alpha == 1;
		}
		case ROOM_TRANSITION_STYLES.SHOW_DATE:{
			screen_alpha += FADING_IN_SPEED;
			screen_alpha = min(1, screen_alpha);
			draw_set_alpha(screen_alpha); draw_set_color(color);
			draw_rectangle(0, 0, GAME_WIDTH, GAME_HEIGHT, false);
			if screen_alpha == 1 
			{
				show_date();
				date_shown_timer ++;
			}
			
			return date_shown_timer/DATE_SHOWN_LENGTH >= 1
		}
	}
}

function room_transition_discovering()
{
	switch(room_transition_style)
	{
		case ROOM_TRANSITION_STYLES.FADE:{
			screen_alpha -= FADING_OUT_SPEED;
			screen_alpha = max(0, screen_alpha);
			draw_set_alpha(screen_alpha); draw_set_color(color);
			draw_rectangle(0, 0, GAME_WIDTH, GAME_HEIGHT, false);
			
			return screen_alpha == 0;
		}
		
		case ROOM_TRANSITION_STYLES.SHOW_DATE:{
			screen_alpha -= FADING_OUT_SPEED;
			screen_alpha = max(0, screen_alpha);
			draw_set_alpha(screen_alpha); draw_set_color(color);
			draw_rectangle(0, 0, GAME_WIDTH, GAME_HEIGHT, false);	
			
			return screen_alpha == 0;
		}
	}
}