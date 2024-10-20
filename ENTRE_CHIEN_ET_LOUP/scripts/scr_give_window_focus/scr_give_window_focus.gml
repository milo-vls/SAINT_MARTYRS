
//meant to be run inside of obj_computer_manager


function give_window_focus(_window_id)
{
	var _nb_windows = array_length(windows);
	var _windows_copy = array_create(0);
	var _initial_index = -1;
	var _window = noone;
	array_copy(_windows_copy, 0, windows, 0, _nb_windows);
	for (var _i = 0; _i < _nb_windows; _i ++)
	{
		_window = _windows_copy[_i];
		if _window.id  == _window_id
		{
			_initial_index = _i;
			break;
		}
	}
	array_delete(_windows_copy, _initial_index, 1);
	array_push(_windows_copy, _window);
	windows = _windows_copy;
}