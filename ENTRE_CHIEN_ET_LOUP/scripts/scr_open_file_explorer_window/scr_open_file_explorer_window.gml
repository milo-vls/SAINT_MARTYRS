enum FILE_EXPLORER_WINDOW_STRUCT
{
	PLACE,
	USER,
	SHOWN_FILES,
	
	
}
enum FILE_EXPLORER_PLACES
{
	HOME,
	TEXT,
	PICTURE
	
}
enum FILE_EXPLORER_FOLDER_TYPES
{
	FOLDER,
	TEXT,
	PICTURE,
	
}

///@param {constant.FILE_EXPLORER_PLACES} _file_explorer_place
function get_files_of_place(_file_explorer_place)
{
	var _files_to_return = array_create(0);
	switch _file_explorer_place
	{
		case FILE_EXPLORER_PLACES.HOME:
			array_push(_files_to_return, new File("TEXTS", FILE_EXPLORER_PLACES.TEXT, FILE_EXPLORER_FOLDER_TYPES.FOLDER));
			array_push(_files_to_return, new File("PICTURES", FILE_EXPLORER_PLACES.PICTURE, FILE_EXPLORER_FOLDER_TYPES.FOLDER));
		break;
		case FILE_EXPLORER_PLACES.TEXT:
		case FILE_EXPLORER_PLACES.PICTURE:
			array_push(_files_to_return, new File("<-", FILE_EXPLORER_PLACES.HOME, FILE_EXPLORER_FOLDER_TYPES.FOLDER));
			
			
			
			var _downloaded_text_files
				= get_downloaded_files_of_given_type
				( _file_explorer_place == FILE_EXPLORER_PLACES.TEXT ? FILE_EXPLORER_FOLDER_TYPES.TEXT : FILE_EXPLORER_FOLDER_TYPES.PICTURE);	
			var _nb_files = array_length(_downloaded_text_files);
			for (var _i = 0; _i < _nb_files; _i ++)
				array_push(_files_to_return, _downloaded_text_files[_i]);
			
		break;/*
		case FILE_EXPLORER_PLACES.PICTURE:
			array_push(_files_to_return, new File("<-", FILE_EXPLORER_PLACES.HOME, FILE_EXPLORER_FOLDER_TYPES.FOLDER));
			array_push(_files_to_return, new File("yo le rap titre", spr_file_night_in_indonesia, FILE_EXPLORER_FOLDER_TYPES.PICTURE));
		break;*/
	}
	return _files_to_return;
}
#macro FILE_EXPLORER_WINDOW_WIDTH 950
#macro FILE_EXPLORER_WINDOW_HEIGHT 950
#macro FILE_EXPLORER_WINDOW_STARTING_X (GAME_WIDTH/2 - FILE_EXPLORER_WINDOW_WIDTH/2)
#macro FILE_EXPLORER_WINDOW_STARTING_Y 8
function open_file_explorer_window(_starting_place = FILE_EXPLORER_PLACES.HOME)
{
	var _file_explorer_window = new
	ComputerWindow(FILE_EXPLORER_WINDOW_STARTING_X, FILE_EXPLORER_WINDOW_STARTING_Y, FILE_EXPLORER_WINDOW_WIDTH, FILE_EXPLORER_WINDOW_HEIGHT, file_explorer_draw, spr_file_explorer_icon, "File explorer");
	var _variables_to_give_to_window = 
	[
		[FILE_EXPLORER_WINDOW_STRUCT.PLACE, _starting_place],
		[FILE_EXPLORER_WINDOW_STRUCT.USER, "Blaise"],
		[FILE_EXPLORER_WINDOW_STRUCT.SHOWN_FILES, get_files_of_place(_starting_place)],
	
	]
	set_struct_variables(_variables_to_give_to_window, _file_explorer_window);
	add_window(_file_explorer_window);
}