#macro FIRST_SUB_ELEMENT sub_elements[0]
#macro SUB_ELEMENT sub_elements[_sub_element]

function Card(_sub_elements, _function = function(){}, _always_revealed = false) constructor 
{
	sub_elements = _sub_elements;
	function_when_clicked = _function;	
	always_revealed = _always_revealed;
	
	
	nb_sub_elements = array_length(_sub_elements);
	width = min(FIRST_SUB_ELEMENT.get_width() + TEXT_BUBBLE_MARGIN*2, TEXT_BUBBLE_WIDTH);
	
	for (var _sub_element = 0; _sub_element < nb_sub_elements; _sub_element ++)
	{
		sub_elements[_sub_element].set_width(width - TEXT_BUBBLE_MARGIN*2);
	}
	
	height = FIRST_SUB_ELEMENT.get_height() + TEXT_BUBBLE_MARGIN*2;
	
	x_left = -1.0;
	x_left_hidden = -1.0;
	x_left_revealed = -1.0;
	
	x_right = -1.0;
	x_right_hidden = -1.0;
	x_right_revealed = -1.0;
	
	y_top = -1.0;
	y_top_hidden = -1.0;
	y_top_revealed = -1.0;
	
	y_bot = -1.0;
	y_bot_hidden = -1.0;
	y_bot_revealed = -1.0;
	

	static mouse_is_over = function()
	{
		return point_in_rectangle(mouse_x, mouse_y, self.x_left_hidden, self.y_top_hidden, self.x_right_hidden, self.y_bot_hidden);
	}
	static get_hidden_part_height = function()
	{
		var _to_return = 0;
		for (var _sub_element = 1; _sub_element < nb_sub_elements; _sub_element ++)
		{
			_to_return += SUB_ELEMENT.get_height();
		}
		return _to_return;
	}
	
	static update_points_of_draw = function(_is_hidden)
	{
		
		if _is_hidden or always_revealed
		{
			x_left = x_left_revealed;
			x_right = x_right_revealed;
			y_top = y_top_revealed;
			y_bot = y_bot_revealed;
			
			for (var _sub_element = 0; _sub_element < nb_sub_elements; _sub_element ++)
			{
				SUB_ELEMENT.x_left = SUB_ELEMENT.x_left_revealed;
				SUB_ELEMENT.y_top = SUB_ELEMENT.y_top_revealed;
			}
			
			return;
		}
			
		x_left =x_left_hidden;
		x_right = x_right_hidden;
		y_top = y_top_hidden;
		y_bot = y_bot_hidden;
		for (var _sub_element = 0; _sub_element < nb_sub_elements; _sub_element ++)
		{
			SUB_ELEMENT.x_left = SUB_ELEMENT.x_left_hidden;
			SUB_ELEMENT.y_top = SUB_ELEMENT.y_top_hidden;
		}
		
		return;
	}
	
	static draw = function()
	{
		draw_set_color(CARDS_COLOR); draw_set_alpha(1);
		draw_rectangle(x_left, y_top, x_right, y_bot, false);
		FIRST_SUB_ELEMENT.draw(point_in_rectangle(mouse_x, mouse_y, self.x_left, self.y_top, self.x_right, self.y_bot) ? MOUSE_OVER_TEXT_FONT_COLOR : DIALOGUES_BASE_FONT_COLOR);
		for (var _sub_element = 1; _sub_element < nb_sub_elements; _sub_element++)
		{
			SUB_ELEMENT.draw();
		}
	}
}














