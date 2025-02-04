function TransitionStyleFade(_color = c_black) : RoomTransitionStyle() constructor
{
	color = _color;
	
	
	screen_alpha = 0;
	
	
	cover_screen = function()
	{
		screen_alpha += FADING_IN_SPEED;
		screen_alpha = min(1, screen_alpha);
		draw_set_alpha(screen_alpha); draw_set_color(color);
		draw_rectangle(0, 0, GAME_WIDTH, GAME_HEIGHT, false);
		
		return screen_alpha == 1;
	}
	discover_screen = function()
	{
		screen_alpha -= FADING_OUT_SPEED;
		screen_alpha = max(0, screen_alpha);
		draw_set_alpha(screen_alpha); draw_set_color(color);
		draw_rectangle(0, 0, GAME_WIDTH, GAME_HEIGHT, false);
		
		return screen_alpha == 0;
	}
}