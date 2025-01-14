#macro FIRST_SUB_ELEMENT sub_elements[0]
#macro SUB_ELEMENT sub_elements[_sub_element]

function Card(_sub_elements, _function = function(){}, _always_revealed = false, _data = []) constructor 
{
	sub_elements = _sub_elements;
	function_when_clicked = _function;	
	always_revealed = _always_revealed;
	data = _data;
	
	hovering_sound_played = false;
	nb_sub_elements = array_length(_sub_elements);
	width = min(sub_elements[0].get_width() + TEXT_BUBBLE_MARGIN*2, TEXT_BUBBLE_WIDTH/1.5);
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
		if mouse_is_over()
		{
			if mouse_is_over() and !hovering_sound_played 
			{
				add_sound_to_play(new Sound(snd_sf_hover_1, x_left + width/2, y_bot - height/2, 0, false, 0.6, true));
				hovering_sound_played = true;
			} 
		}
		else 
		{
			hovering_sound_played = false;
		}

		draw_set_color(CARDS_COLOR); draw_set_alpha(1);
		draw_rectangle_color(x_left, mouse_is_over() ? y_top - TEXT_BUBBLE_MARGIN : y_top, x_right, y_bot, CARDS_COLOR, CARDS_COLOR, CARDS_COLOR, CARDS_COLOR, false);
		FIRST_SUB_ELEMENT.draw(mouse_is_over());
		for (var _sub_element = 1; _sub_element < nb_sub_elements; _sub_element++)
		{
			SUB_ELEMENT.draw(mouse_is_over());
		}
	}
}














