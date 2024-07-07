///@param {struct.ComputerWindow} _window
function add_window(_window)
{
	with obj_computer_manager
		array_insert(windows, 0, _window);
}