if !left_click()
{
	move_y_offset = -1;
	move_x_offset = -1;
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
if move_x_offset > -1
{
	x = CURSOR_X - move_x_offset;
	y = CURSOR_Y - move_y_offset;
	show_debug_message(move_x_offset, move_y_offset);
}

//