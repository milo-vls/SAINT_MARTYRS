///@param {struct.ComputerWindow} _window
function add_window(_window)
{
	with obj_computer_manager
		windows[nb_windows ++] = _window;
}