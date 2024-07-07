
enum NOTPAD_WINDOW_STRUCT
{
	TEXT_FILE,
	Y_OFFSET,
	
}
#macro NOTPAD_WINDOW_WIDTH 750
#macro NOTPAD_WINDOW_HEIGHT 950
#macro NOTPAD_MARGIN 20
#macro NOTPAD_MAX_TEXT_WIDTH (NOTPAD_WINDOW_WIDTH - NOTPAD_MARGIN*2)
#macro NOTPAD_TEXT_SEP 10
function notpad_create_window()
{
	var _text_file = new TextFile("TEST", "yo le rap");
	var _notpad_window = new ComputerWindow(false, 0, 0, NOTPAD_WINDOW_WIDTH, NOTPAD_WINDOW_HEIGHT, NOTPAD_WINDOW_WIDTH, NOTPAD_WINDOW_HEIGHT, NOTPAD_WINDOW_WIDTH, NOTPAD_WINDOW_HEIGHT, notpad_draw, spr_computer_icon_notpad, get_text_file_title(_text_file));	
	variable_struct_set(_notpad_window, NOTPAD_WINDOW_STRUCT.TEXT_FILE, _text_file);
	variable_struct_set(_notpad_window, NOTPAD_WINDOW_STRUCT.Y_OFFSET, 0);
	add_window
	(
		_notpad_window
	);
}