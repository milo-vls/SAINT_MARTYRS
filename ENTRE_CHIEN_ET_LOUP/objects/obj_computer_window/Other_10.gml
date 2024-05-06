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
	origin_x_scale = -1;
	origin_height = -1;
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


//	TOP south to north reisizing
if point_in_rectangle(CURSOR_X, CURSOR_Y, x + border_width, y, x + sprite_width - border_width, y + border_width/2)
{
	obj_computer_cursor.state = COMPUTER_CURSOR_STATES.RESIZE_N_S;
	
	if click_pressed()
	{
		origin_height = sprite_height;
		origin_top_left_x = x;
		origin_top_left_y = y;
		resize_y_offset = CURSOR_Y - y;
	}
}


if move_x_offset > -1
{
	x = CURSOR_X - move_x_offset;
	y = CURSOR_Y - move_y_offset;
	obj_computer_cursor.state = COMPUTER_CURSOR_STATES.MOVE_CROSS;
}
if origin_height != -1 and origin_x_scale == -1
{
	obj_computer_cursor.state = COMPUTER_CURSOR_STATES.RESIZE_N_S;
	//TOP SIDE RESIZING
	if origin_top_left_y != -1 and origin_top_left_x != -1
	{
		
		y = min(CURSOR_Y - resize_y_offset, origin_top_left_y + origin_height - minimum_height);
		
		var _added_height = origin_top_left_y - y;
		var _new_height = origin_height + _added_height;
		resize(sprite_width, _new_height);
	}
	
}


