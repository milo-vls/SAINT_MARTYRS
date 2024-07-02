#macro WINDOW_INIT_POS_OFFSET 15


function get_nb_windows_in_intial_position(_nb_windows_found)
{
	var _x_y = WINDOW_INIT_POS_OFFSET + WINDOW_INIT_POS_OFFSET * _nb_windows_found;
	var _position_free = true;
	with obj_computer_window
		if x == _x_y and y == _x_y
			_position_free = false;
	return _position_free ? _nb_windows_found : get_nb_windows_in_intial_position(_nb_windows_found + 1);
}
