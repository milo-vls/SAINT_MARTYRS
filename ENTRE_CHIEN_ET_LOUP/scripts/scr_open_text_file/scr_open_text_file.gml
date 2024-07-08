
enum NOTPAD_WINDOW_STRUCT
{
	TEXT_FILE,
	Y_OFFSET,
	MAX_Y_OFFSET,
	
}
#macro NOTPAD_WINDOW_WIDTH 750
#macro NOTPAD_WINDOW_HEIGHT 950
#macro NOTPAD_MARGIN 20
#macro NOTPAD_MAX_TEXT_WIDTH (NOTPAD_WINDOW_WIDTH - NOTPAD_MARGIN*2)
#macro NOTPAD_TEXT_SEP 10

///@param {struct.TextFile} _text_file
function open_text_file(_text_file)
{
	draw_set_font(fnt_notpad);
	var _notpad_window = new ComputerWindow(false, 0, 0, NOTPAD_WINDOW_WIDTH, NOTPAD_WINDOW_HEIGHT, NOTPAD_WINDOW_WIDTH, NOTPAD_WINDOW_HEIGHT, NOTPAD_WINDOW_WIDTH, NOTPAD_WINDOW_HEIGHT, notpad_draw, spr_computer_icon_notpad, get_text_file_title(_text_file));	
	var _notpad_window_struct_array = 
	[
		[NOTPAD_WINDOW_STRUCT.TEXT_FILE, _text_file],
		[NOTPAD_WINDOW_STRUCT.Y_OFFSET, 0],
		[NOTPAD_WINDOW_STRUCT.MAX_Y_OFFSET, max(0, string_height_ext(_text_file.text, NOTPAD_TEXT_SEP, NOTPAD_MAX_TEXT_WIDTH) - NOTPAD_WINDOW_HEIGHT)]
	]
	
	set_struct_variables(_notpad_window_struct_array, _notpad_window);
	
	add_window
	(
		_notpad_window
	);
}