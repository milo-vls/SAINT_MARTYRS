///@param {struct.ComputerWindow} [_window]
function draw_window(_window)
{
	//APP
	if !surface_exists(_window.surface)
		_window = computer_window_create_surface(_window);
	surface_set_target(_window.surface);
	_window.app_draw(self.id, _window);
	surface_reset_target();
	draw_surface(_window.surface, _window.surface_x, _window.surface_y);
	
	
	//BORDER
	draw_set_alpha(1);
	draw_sprite_ext(_window.border_sprite, 0, _window.pos_x, _window.pos_y, _window.x_scale, _window.y_scale, 0, c_white, 1);
	
	if _window.icon != noone
		draw_sprite_stretched(_window.icon, 0, _window.pos_x, _window.pos_y, COMPUTER_WINDOW_BORDER_TOP_HEIGHT, COMPUTER_WINDOW_BORDER_TOP_HEIGHT);
	if _window.title != noone
	{
		draw_set_alpha(1); draw_set_halign(fa_left);  draw_set_valign(fa_top);
		draw_set_color(c_dkgrey); draw_set_font(fnt_retron_for_comp_sys);
		draw_text_transformed(_window.pos_x + COMPUTER_WINDOW_BORDER_TOP_HEIGHT * 1.2, _window.pos_y, _window.title, _window.title_scale, _window.title_scale, 0);	
	}
	
	//draw_rectangle_color(_window.surface_x, _window.surface_y, _window.surface_x + _window.surface_width, _window.surface_y + _window.surface_height, c_blue, c_blue, c_blue, c_blue, true);
	
}