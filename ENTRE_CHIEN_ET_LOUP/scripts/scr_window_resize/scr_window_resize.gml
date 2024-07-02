
///@param {struct.ComputerWindow} _window
function window_resize(_window, _new_width, _new_height)
{
	_window.x_scale = clamp(_new_width/_window.border_sprite_width, _window.minimum_width, _window.maximum_width);
	_window.y_scale = clamp(_new_height/_window.border_sprite_height, _window.minimum_height, _window.maximum_height);
	
	return _window;
}