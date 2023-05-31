draw_set_color(c_black);
draw_rectangle(0, 0, GAME_WIDTH, GAME_HEIGHT, false);



var _x = GAME_WIDTH/2
for (var i = 0; i < array_length(currentOptions); i ++)
{
	var _nbOptions = array_length(currentOptions);
	var _optionHauteur = hauteurOptions/_nbOptions;
	var _scribbleMiLength = currentOptions[i].scrbbl.get_width()/2;
	var _y = OPTIONS_PAUSE_MIN_Y + ( i * _optionHauteur);
	var _survole =  point_in_rectangle(mouse_x, mouse_y, _x - _scribbleMiLength, _y, _x + _scribbleMiLength, _y + _optionHauteur);
	
	scribble_anim_shake(0.01, 0.02);
	if _survole scribble_anim_shake(2, 3);;
	currentOptions[i].scrbbl.blend(_survole ? c_yellow : c_white).draw(_x, _y);
	
	if _survole and global.cPrLeft
	{
		currentOptions[i].fonction();
		global.cPrLeft = false;
	}
}