
///@param {struct.File} _file
///@param {real} _y
function draw_file(_file, _y)
{
	draw_text(NOTPAD_MARGIN, _y, get_file_title(_file));
}

///@param {real} _manager_id
///@param {struct.ComputerWindow} _window
function file_explorer_draw(_manager_id, _window)
{
	draw_clear(c_black);
	draw_set_alpha(1); draw_set_color(c_white); draw_set_halign(fa_left); draw_set_valign(fa_top);
	draw_set_font(fnt_notpad);
	static floor_height = string_height("T");
	
	var _files_to_show = struct_get(_window, FILE_EXPLORER_WINDOW_STRUCT.SHOWN_FILES);
	var _nb_files = array_length(_files_to_show);
	
	//selection highlightment
	var _selected_floor = -1
	
	

	//FILES DRAW
	for (var _nb_floors_drawn = 0; _nb_floors_drawn < _nb_files; _nb_floors_drawn ++)
	{
		var _y = NOTPAD_MARGIN + ( floor_height * _nb_floors_drawn )
		if cursor_in_rectangle_in_window(0, _y + floor_height, _window.surface_width, floor_height, _window) and _manager_id.hovered_window_id == _window.id
		{
			_selected_floor =_nb_floors_drawn;
			draw_rectangle_color(0, NOTPAD_MARGIN + floor_height * _selected_floor, FILE_EXPLORER_WINDOW_WIDTH, NOTPAD_MARGIN + floor_height * (_selected_floor + 1 ), c_blue, c_blue, c_blue, c_blue, false);
		}
		draw_file(_files_to_show[_nb_floors_drawn], _y);
		
	}
	
	
	//SELECTION CONFIRMATION
	if keyboard_check_pressed(vk_enter) 
	or hovered_click_pressed(_window.id) 
	and _nb_files > 0
	if border_region_hovered(_window, CURSOR_X, CURSOR_Y) == COMPUTER_WINDOW_BORDER_REGIONS.CENTER and _selected_floor > -1
	{
		var _selected_file = _files_to_show[_selected_floor];
		switch _selected_file.type
		{
			case FILE_EXPLORER_FOLDER_TYPES.FOLDER :
				variable_struct_set(_window, FILE_EXPLORER_WINDOW_STRUCT.PLACE, _selected_file.data);
				variable_struct_set(_window, FILE_EXPLORER_WINDOW_STRUCT.SHOWN_FILES, get_files_of_place(_selected_file.data));
				
			break;
			case FILE_EXPLORER_FOLDER_TYPES.TEXT :
				open_text_file(_selected_file);
			break;
		}
	}
	
}