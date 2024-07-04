function notpad_create_window()
{
	static window_width = 750;
	static window_height = 999;
	
	add_window
	(
		new ComputerWindow(false, 0, 0, window_width, window_height, window_width, window_height, window_width, window_height, notpad_draw, spr_computer_icon_notpad, "UNTITLED")
		
	);
}