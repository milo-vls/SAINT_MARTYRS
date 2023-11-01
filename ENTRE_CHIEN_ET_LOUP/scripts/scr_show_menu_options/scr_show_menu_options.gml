/// @param {array} _menu_options Description
/// @param {struct.MenuGuideLine} _menu_guide_line Description
function show_menu_options(_menu_options, _menu_guide_line)
{
	var _nb_options = array_length(_menu_options);
	var _x_starting_point = _menu_guide_line.get_starting_x();
	var _y_starting_point = _menu_guide_line.get_starting_y();
	var _width_offset = _menu_guide_line.get_width() / _nb_options;
	var _height_offset = _menu_guide_line.get_height() / _nb_options;
	var _x_menu_option, _y_menu_option;
	
	for (var _i = 0; _i < _nb_options; _i ++)
	{
		_x_menu_option = _x_starting_point + _width_offset * _i;
		_y_menu_option = _y_starting_point + _height_offset * _i;
		//TO DO - write the menu option
		
	}
}