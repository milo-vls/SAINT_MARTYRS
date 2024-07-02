function give_cursor_state(_state, _window)
{
	obj_computer_cursor.state = _state
	obj_computer_manager.cursor_x_offset = CURSOR_X - _window.pos_x;
	obj_computer_manager.cursor_y_offset = CURSOR_Y - _window.pos_y;
}