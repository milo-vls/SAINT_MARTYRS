#macro MOUSE_WHEEL_SPEED 10



function draw_button_in_surface(_x, _y, _width, _height, _surface_x_in_room, _surface_y_in_room, _on_press, _window)
{
	var _x_2 = _x + _width;
	var _y_2 = _y + _height
	var _must_be_pressed = point_in_rectangle(CURSOR_X - _surface_x_in_room, CURSOR_Y - _surface_y_in_room, _x, _y, _x_2, _y_2) and hovered_left_click_pressed(_window.id);
	draw_button(_x, _y, _x_2, _y_2, _must_be_pressed);
	if _must_be_pressed and obj_computer_manager.hovered_window_id == _window.id
		_on_press(_window);
}
///@param {real} _x_left_rec
///@param {real} _y_top_rec
///@param {real} _rec_width
///@param {real} _rec_height
///@param {struct.ComputerWindow} _window
function cursor_in_rectangle_in_window(_x_left_rec, _y_top_rec, _rec_width, _rec_height,_window)
{
	return point_in_rectangle(CURSOR_X - _window.pos_x, CURSOR_Y - _window.pos_y, _x_left_rec, _y_top_rec, _x_left_rec + _rec_width, _y_top_rec + _rec_height);
}



///@param {Array<String>} _str_lines
///@param {real} _starting_line_index
///@param {real} _vertical_offset
///@param {real} _x
///@param {real} _y
///@param {String} _prefix

function draw_lines(_str_lines, _starting_line_index, _vertical_offset, _x, _y, _prefix = "")
{
	draw_set_valign(fa_top); draw_set_halign(fa_left);
	var _cumulated_height = _y;
	var _nb_str_lines = array_length(_str_lines);
	for (var _line_i = 0; _line_i < _nb_str_lines; _line_i ++)
	{
		_cumulated_height += _vertical_offset;
		draw_text(_x, _cumulated_height, string_concat(_prefix, _str_lines[_line_i]));
	}
}