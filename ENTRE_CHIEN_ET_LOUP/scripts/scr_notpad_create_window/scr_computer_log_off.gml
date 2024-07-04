function computer_log_off()
{
	static log_off_window_height = 300;
	static log_off_window_width = 700;
	var _pos = get_nb_windows_in_intial_position(0);
	add_window
	(
		new ComputerWindow(false, _pos, _pos, log_off_window_width, log_off_window_height, log_off_window_width, log_off_window_height, log_off_window_width, log_off_window_height, log_off_window_draw_content)
	)
}