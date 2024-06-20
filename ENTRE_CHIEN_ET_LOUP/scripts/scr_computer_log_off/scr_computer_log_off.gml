function computer_log_off()
{
	static _log_off_window_height = 300;
	static _log_off_window_width = 700;
	create_computer_window({title : text_id_to_string("SYSTEM MESSAGE"), icon : spr_log_off, draw_content : log_off_window_draw_content, minimum_width : _log_off_window_width, minimum_height : _log_off_window_height, can_be_resizable : false});
}