function show_date(_day_number = global.day_number)
{
	
	
	var _date_string = get_date_string(_day_number);
	
	
	draw_set_alpha(1); draw_set_color(c_white); draw_set_valign(fa_middle); draw_set_halign(fa_center);
	draw_text(GAME_WIDTH/2, GAME_HEIGHT/2, _date_string);
	
}