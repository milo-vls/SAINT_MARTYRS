// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function BlackScreen(_end_reached_method_condition, _alpha) : Menu(MENU_PRIORITIES.BLACK_SCREEN, room, false, false, true, MENU_CHANNELS.BLACK_SCREEN) constructor 
{
	end_reached_method_condition = _end_reached_method_condition;
	alpha = 1//_alpha;
	
	activity = function()
	{
		if end_reached_method_condition() == true
		{
			end_reached = true;
		}
	}
	draw = function()
	{
		draw_set_alpha(alpha); draw_set_color(c_white);
		draw_rectangle(0, 0, GAME_WIDTH, GAME_HEIGHT, false);
	}
}