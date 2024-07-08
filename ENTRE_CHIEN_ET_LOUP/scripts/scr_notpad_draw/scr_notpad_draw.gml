

///@param _manager_id 
///@param {struct.ComputerWindow} _window
function notpad_draw(_manager_id, _window)
{
	draw_clear(c_black);
	draw_set_color(c_white); draw_set_font(fnt_notpad); draw_set_halign(fa_left); draw_set_valign(fa_top);
	var _text_file = struct_get(_window, NOTPAD_WINDOW_STRUCT.TEXT_FILE);
	
	var _y_offset = struct_get(_window, NOTPAD_WINDOW_STRUCT.Y_OFFSET);
	var _scroll_speed = MOUSE_WHEEL_SPEED * (hovered_mouse_wheel_down(_window.id) ? -1 : (hovered_mouse_wheel_up(_window.id) ? 1 : 0) )
	_y_offset = clamp(_y_offset + _scroll_speed, -struct_get(_window, NOTPAD_WINDOW_STRUCT.MAX_Y_OFFSET), 0);
	variable_struct_set(_window, NOTPAD_WINDOW_STRUCT.Y_OFFSET, _y_offset);
	
	draw_text_ext(NOTPAD_MARGIN, _y_offset, _text_file.text, NOTPAD_TEXT_SEP, NOTPAD_MAX_TEXT_WIDTH);
	
}