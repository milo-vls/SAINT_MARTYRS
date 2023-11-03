




/**
 * Function Description
 * @param {Array<struct.TextMenuOptions>} _options
 * @param {struct} _guide_line Description
 * @param {real} _priority Description
 * @param {asset.GMRoom} [_room_presence]=room Description
 * @param {bool} [_end_with_room]=true Description
 * @param {bool} [_is_persistent]=false Description
 */
function TextOptionsMenu( _options, _guide_line, _priority, _room_presence = room, _end_with_room = true, _is_persistent = false) : Menu(_priority, _room_presence, _is_persistent, _end_with_room) constructor
{
	options = _options;
	guide_line = _guide_line
	
 	draw = function()
	{
		var _nb_options = array_length(options);
		var _x_starting_point = guide_line.get_starting_x();
		var _y_starting_point = guide_line.get_starting_y();
		var _width_offset = guide_line.get_width() / _nb_options;
		var _height_offset = guide_line.get_height() / _nb_options;
		var _x_menu_option, _y_menu_option;
	
		for (var _i = 0; _i < _nb_options; _i ++)
		{
			_x_menu_option = _x_starting_point + _width_offset * _i;
			_y_menu_option = _height_offset/2 + _y_starting_point + _height_offset * _i;
			if options[_i].is_mouse_over()
			{
				options[_i].scribble_text.blend(c_yellow).draw(_x_menu_option, _y_menu_option);
				
			}
			options[_i].scribble_text.draw(_x_menu_option, _y_menu_option);
		}
	}
	
}