function hovered_left_click(_id)
{
	return left_click() and obj_computer_manager.hovered_window_id == _id;
}
function hovered_right_click(_id)
{
	return right_click() and obj_computer_manager.hovered_window_id == _id;
}
function hovered_click(_id)
{
	return click() and obj_computer_manager.hovered_window_id == _id;
}


function hovered_left_click_pressed(_id)
{
	return left_click_pressed() and obj_computer_manager.hovered_window_id == _id;
}
function hovered_right_click_pressed(_id)
{
	return right_click_pressed() and obj_computer_manager.hovered_window_id == _id;
}
function hovered_click_pressed(_id)
{
	return click_pressed() and obj_computer_manager.hovered_window_id == _id;
}

function hovered_left_click_released(_id)
{
	return left_click_released() and obj_computer_manager.hovered_window_id == _id;
}
function hovered_right_click_released(_id)
{
	return right_click_released() and obj_computer_manager.hovered_window_id == _id;
}
function hovered_click_released(_id)
{
	return click_released() and obj_computer_manager.hovered_window_id == _id;
}


function hovered_mouse_wheel_down(_id)
{
	return mouse_wheel_down() and obj_computer_manager.hovered_window_id == _id;
}
function hovered_mouse_wheel_up(_id)
{
	return mouse_wheel_up() and obj_computer_manager.hovered_window_id == _id;
}