
enum PICTURE_WINDOW_STRUCT
{
	PICTURE_FILE,
	
}

///@param {struct.File} _picture_file
function open_picture_file(_picture_file)
{
	var _picture_height = sprite_get_height(_picture_file.data);
	var _picture_width = sprite_get_width(_picture_file.data);
	
	var _picture_window = new ComputerWindow(CURSOR_X, CURSOR_Y, _picture_width + COMPUTER_WINDOW_BORDER_WIDTH * 2, _picture_height + COMPUTER_WINDOW_BORDER_BOTTOM_HEIGHT + COMPUTER_WINDOW_BORDER_TOP_HEIGHT, picture_window_draw, spr_picture_window_icon, get_file_title(_picture_file));	
	var _picture_window_struct_array = 
	[
		[PICTURE_WINDOW_STRUCT.PICTURE_FILE, _picture_file],
		
	]
	
	set_struct_variables(_picture_window_struct_array, _picture_window);	
	add_window(_picture_window);
}