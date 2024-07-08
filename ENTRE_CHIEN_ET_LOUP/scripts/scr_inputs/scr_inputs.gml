
function left_click()
{
	return mouse_check_button(mb_left);
}
function right_click()
{
	return mouse_check_button(mb_right);
}
function click()
{
	return  left_click() or right_click();
}

function left_click_pressed()
{
	return mouse_check_button_pressed(mb_left);
}
function right_click_pressed()
{
	return mouse_check_button_pressed(mb_right);
}
function click_pressed()
{
	return right_click_pressed() or left_click_pressed();
}

function left_click_released()
{
	return mouse_check_button_released(mb_left);
}
function right_click_released()
{
	return mouse_check_button_released(mb_right);
}
function click_released()
{
	return left_click_released() or right_click_released();
}



function get_regrab_timer()
{
	return obj_input_delay.regrab_timer/REGRAB_FRAMES_DELAY;
}
function reset_regrab_timer()
{
	obj_input_delay.regrab_timer = 0;
}

function get_release_timer()
{
	return obj_input_delay.release_timer/RELEASE_FRAMES_DELAY;
}
function reset_release_timer()
{
	obj_input_delay.release_timer = 0;
}