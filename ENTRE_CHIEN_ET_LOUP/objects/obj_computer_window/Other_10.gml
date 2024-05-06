if !left_click()
{
	move_y_offset = -1;
	move_x_offset = -1;
	
	resize_x_offset = -1;
	resize_y_offset = -1;
	
	
	origin_top_left_x = -1;
	origin_top_left_y = -1;
	origin_bottom_right_x = -1;
	origin_bottom_right_y = -1;
	origin_height = -1;
	origin_width = -1;
}

//moving the window
if point_in_rectangle(CURSOR_X, CURSOR_Y, x + border_width, y + border_width/2, x + sprite_width - border_width, y + border_height_top)
{
	obj_computer_cursor.state = COMPUTER_CURSOR_STATES.MOVE_CROSS;
	
	if left_click_pressed()
	{
		move_x_offset = CURSOR_X - x;
		move_y_offset = CURSOR_Y - y;
	}

}

if left_click_pressed()
{
	//SN reisizing
	//n
	if point_in_rectangle(CURSOR_X, CURSOR_Y, x, y, x + sprite_width, y + border_height_top/2)
	{
		origin_height = sprite_height;
		origin_top_left_y = y;
		resize_y_offset = CURSOR_Y - y;
	}
	//s
	if point_in_rectangle(CURSOR_X, CURSOR_Y, x, y + sprite_height - border_height_bottom, x + sprite_width, y + sprite_height)
	{
		origin_height = sprite_height;
		origin_bottom_right_y = y + sprite_height;
		resize_y_offset = CURSOR_Y - (y + sprite_height);
	}
	//WE
	//w
	if point_in_rectangle(CURSOR_X, CURSOR_Y, x, y, x + border_width, y + sprite_height)
	{
		origin_width = sprite_width;
		origin_top_left_x = x;
		resize_x_offset = CURSOR_X - x;
	}
	//e
	if point_in_rectangle(CURSOR_X, CURSOR_Y, x + sprite_width - border_width, y, x + sprite_width, y + sprite_height)
	{
		origin_width = sprite_width;
		origin_bottom_right_x = x + sprite_width;
		resize_x_offset = CURSOR_X - (x + sprite_width);
	}
}



if move_x_offset > -1
{
	x = CURSOR_X - move_x_offset;
	y = CURSOR_Y - move_y_offset;
	obj_computer_cursor.state = COMPUTER_CURSOR_STATES.MOVE_CROSS;
	return;
}
if origin_height != -1
{
	//n
	if origin_top_left_y != -1
	{
		
		y = min(CURSOR_Y - resize_y_offset, origin_top_left_y + origin_height - minimum_height);
		
		var _added_height = origin_top_left_y - y;
		var _new_height = origin_height + _added_height;
		resize(sprite_width, _new_height);
	}
	//s
	if origin_bottom_right_y != -1
	{
		var _new_bottom_y = CURSOR_Y - resize_y_offset;
		var _added_height = origin_bottom_right_y - _new_bottom_y;
		var _new_height = origin_height - _added_height;
		resize(sprite_width, _new_height);
	}
}
if origin_width != -1
{
	//w
	if origin_top_left_x != -1
	{
		x =  min(CURSOR_X - resize_x_offset, origin_top_left_x + origin_width - minimum_width);
		var _added_width = origin_top_left_x - x;
		var _new_width = origin_width + _added_width;
		resize(_new_width, sprite_height);
	}
	//e
	if origin_bottom_right_x != -1
	{
		var _new_bottom_x = CURSOR_X - resize_x_offset;
		var _added_width = origin_bottom_right_x - _new_bottom_x;
		var _new_width = origin_width - _added_width;
		resize(_new_width, sprite_height);
	}
}


