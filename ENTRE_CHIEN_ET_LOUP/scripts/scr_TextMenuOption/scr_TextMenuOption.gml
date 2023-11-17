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
		var _x1 =  self.scribble_text.get_left(x);
		var _y1 =  self.scribble_text.get_top(y);
		var _x2 = self.scribble_text.get_right(x) 
		var _y2 = self.scribble_text.get_bottom(y)
		return point_in_rectangle(mouse_x, mouse_y, _x1, _y1, _x2, _y2);
	}
	is_clicked = function()
	{
		// Feather disable once GM1011
		if self.pressed and left_click_released()
		{
			self.pressed = false;
			return true;
		}
		
		if self.is_mouse_over() and left_click_pressed()
		{
			self.pressed = true;	
		}
		if !self.is_mouse_over() or !left_click()
		{
			self.pressed = false;
		}

		return false;
	}
}