function logging_off_computer()
{
	instance_destroy(obj_computer_screen);
	change_room(rm_main_desk, sqc_transition_cover_instant, sqc_transition_discover_instant);
	application_surface_draw_enable(true);
	window_set_cursor(cr_default);
}
function logging_off_cancel(_window)
{
	destroy_window(_window.id);
}

///@param {Id.instance} _computer_manager_instance
///@param {struct.ComputerWindow} _window
#macro COMPUTER_WINDOW_SYSTEM_BORDER 20
function log_off_window_draw_content(_computer_manager_instance, _window)
{	
	draw_set_alpha(1);
	draw_clear(c_white);
	draw_set_font(fnt_retron_for_comp_sys); draw_set_color(c_dkgray); draw_set_halign(fa_left); draw_set_valign(fa_top);
	var _text = text_id_to_string("LOG OFF CONFIRMATION");
	var _text_width = _window.surface_width - (COMPUTER_WINDOW_SYSTEM_BORDER * 4)
	var _text_scale = _text_width/string_width(_text);
	draw_text_transformed(COMPUTER_WINDOW_SYSTEM_BORDER, COMPUTER_WINDOW_SYSTEM_BORDER, _text, _text_scale, _text_scale, 0);
	var _button_width = (_window.surface_width - COMPUTER_WINDOW_SYSTEM_BORDER * 3) / 2;
	var _button_y = COMPUTER_WINDOW_SYSTEM_BORDER * 2 + string_height(_text) * _text_scale;
	var _button_height = (_window.surface_height - _button_y) - COMPUTER_WINDOW_SYSTEM_BORDER;
	var _button_confirm_x = COMPUTER_WINDOW_SYSTEM_BORDER;
	var _button_cancel_x = _window.surface_width - COMPUTER_WINDOW_SYSTEM_BORDER - _button_width;
	draw_set_color(c_green);
	draw_button_in_surface(_button_confirm_x, _button_y, _button_width, _button_height, surface_x, surface_y, logging_off_computer, _window);
	draw_set_color(c_red);
	draw_button_in_surface(_button_cancel_x, _button_y, _button_width, _button_height, surface_x, surface_y, logging_off_cancel, _window);
}