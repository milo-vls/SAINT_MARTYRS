function get_window(_window_id)
{
	var _windows = obj_computer_manager.windows;
	var _nb_windows = obj_computer_manager.nb_windows;
	for (var _i = 0; _i < _nb_windows; _i ++)
		if _windows[_i].id == _window_id
			return _windows[_i];
	show_error("aucune fenêtre existante ne possède cet identifiant", true);
}