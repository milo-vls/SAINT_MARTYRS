

///@param _manager_id 
///@param {struct.ComputerWindow} _window
function notpad_draw(_manager_id, _window)
{
	draw_clear(c_black);
	draw_set_color(c_white); draw_set_font(fnt_notpad); draw_set_halign(fa_left); draw_set_valign(fa_top);
	var _y_offset = struct_get(_window, NOTPAD_WINDOW_STRUCT.Y_OFFSET);
	var _text_file = struct_get(_window, NOTPAD_WINDOW_STRUCT.TEXT_FILE);
	draw_text_ext(NOTPAD_MARGIN, _y_offset, _text_file.text, NOTPAD_TEXT_SEP, NOTPAD_MAX_TEXT_WIDTH);
	
}