function destroy_window(_window_id)
{
	with obj_computer_manager
	{
		var _index_found = -1;
		var _nb_windows = array_length(windows);
		for (var _i = 0; _i < _nb_windows; _i ++) 
		{
		    if windows[_i].id == _window_id
			{
				return array_delete(windows, _index_found, 1);
			}
		}
		
	}
}