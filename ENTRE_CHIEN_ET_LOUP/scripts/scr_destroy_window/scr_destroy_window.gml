function destroy_window(_window_id)
{
	with obj_computer_manager
	{
		var _index_found = -1;
		for (var _i = 0; _i < nb_windows; _i ++) 
		{
		    if windows[_i].id == _window_id
			{
				_index_found = _i;
				break;
			}
		}
		nb_windows --;
		array_delete(windows, _index_found, 1);
	}
}