/// @param {string} _text_id 
/// @param {function} _function_when_clicked 
function TextMenuOption(_text_id, _function_when_clicked) constructor
// Feather disable GM2023
{
	scribble_text = scribble(text_id_to_string(_text_id)).align(fa_center, fa_middle);
	function_when_clicked = _function_when_clicked;
	x = 0;
	y = 0;
	pressed = false;
	
	is_mouse_over = function()
	{
		return point_in_rectangle(mouse_x, mouse_y,  scribble_text.get_left(x), scribble_text.get_top(y), scribble_text.get_right(x), scribble_text.get_bottom(y));
	}
	is_clicked = function()
	{
		if pressed and left_click_released()
		{
			pressed = false;
			return true;
		}
		
		if is_mouse_over() and left_click_pressed()
		{
			pressed = true;	
		}
		if !is_mouse_over() or !left_click()
		{
			pressed = false;
		}

		return false;
	}
}