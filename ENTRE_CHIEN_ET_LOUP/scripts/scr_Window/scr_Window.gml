
#macro COMPUTER_WINDOW_BORDER_WIDTH 20
#macro COMPUTER_WINDOW_BORDER_TOP_HEIGHT 49
#macro COMPUTER_WINDOW_BORDER_BOTTOM_HEIGHT 20
function ComputerWindow
(_resizable, _x, _y, _width, _height, _min_width, _min_height, _max_width, _max_height, _app_draw, _icon = noone, _title = noone) 
constructor
{	
	draw_set_font(fnt_retron_for_comp_sys);
	static title_scale = COMPUTER_WINDOW_BORDER_TOP_HEIGHT / string_height("TLW");
	static windows_count = 0;
	
	id = windows_count;
	windows_count ++;
	
	
	resizable = _resizable;
	pos_x = _x;
	pos_y = _y;
	minimum_width = _min_width;
	minimum_height = _min_height;
	maximum_width = _max_width;
	maximum_height = _max_height;
	icon = _icon;
	title = _title;
	
	border_sprite = spr_computer_window;
	border_sprite_width = sprite_get_width(spr_computer_window);
	border_sprite_height = sprite_get_height(spr_computer_window);
	x_scale = _width/border_sprite_width;
	y_scale = _height/border_sprite_height;
	surface_x = pos_x + COMPUTER_WINDOW_BORDER_WIDTH - x_scale;
	surface_y = pos_y + COMPUTER_WINDOW_BORDER_TOP_HEIGHT;
	surface_width = _width - COMPUTER_WINDOW_BORDER_WIDTH * 2;
	surface_height = _height - (COMPUTER_WINDOW_BORDER_BOTTOM_HEIGHT + COMPUTER_WINDOW_BORDER_TOP_HEIGHT);
	surface = surface_create(surface_width, surface_height);
	
	
	//methods
	app_draw = _app_draw;
	
	
}

///@param {struct.ComputerWindow} _window
function computer_window_create_surface(_window)
{
	_window.surface = surface_create(_window.surface_width, _window.surface_height);
	return _window;
}

///@param {real} _window_id
function computer_window_repos(_window_id, _new_x, _new_y)
{
	var _window = get_window(_window_id);
	_window.pos_x = _new_x;
	_window.pos_y = _new_y;
	_window.surface_x = _new_x + COMPUTER_WINDOW_BORDER_WIDTH - _window.x_scale;
	_window.surface_y = _new_y + COMPUTER_WINDOW_BORDER_TOP_HEIGHT;
	
}

///@param {struct.ComputerWindow} _window
function computer_window_get_width(_window)
{
	return _window.border_sprite_width * _window.x_scale;
}

///@param {struct.ComputerWindow} _window
function computer_window_get_height(_window)
{
	return _window.border_sprite_height * _window.y_scale;
}

//MEANT TO BE RUN INSIDE OF OBJ_COMPUTER_MANAGER /!\
///@param {struct.ComputerWindow} _window
function window_is_hovered(_window)
{
	if point_in_rectangle(CURSOR_X, CURSOR_Y, _window.pos_x, _window.pos_y, _window.pos_x + computer_window_get_width(_window), _window.pos_y + computer_window_get_height(_window))
		hovered_window_id = _window.id;
}



enum COMPUTER_WINDOW_BORDER_REGIONS
{
	MOVE_AREA,
	
	TOP_LEFT,
	TOP_CENTER,
	TOP_RIGHT,
	CENTER_LEFT,
	CENTER,
	CENTER_RIGHT,
	BOTTOM_LEFT,
	BOTTOM_CENTER,
	BOTTOM_RIGHT,
	
}
//ONLY IF _x AND _y IS A POINT INSIDE THE WINDOW !!
///@param {struct.ComputerWindow} _window
function border_region_hovered(_window, _x, _y)
{
	var _window_height = computer_window_get_height(_window);
	var _window_width = computer_window_get_width(_window);

	var _window_pos_y = _window.pos_y;
	var _window_bottom_pos_y = _window_pos_y + _window_height;
	var _window_pos_x = _window.pos_x;
	var _window_right_pos_x = _window_pos_x + _window_width;
	
	
	var _left_minus_corner_x = _window_pos_x + COMPUTER_WINDOW_BORDER_WIDTH;
	var _right_minus_corner_x = _window_right_pos_x - COMPUTER_WINDOW_BORDER_WIDTH;
	var _top_minus_corner_y = _window_pos_y + COMPUTER_WINDOW_BORDER_TOP_HEIGHT;
	var _bottom_minus_corner_y = _window_bottom_pos_y - COMPUTER_WINDOW_BORDER_BOTTOM_HEIGHT;
	
	
	//CENTER
	if point_in_rectangle(_x, _y, _left_minus_corner_x, _window_pos_y, _right_minus_corner_x, _window_bottom_pos_y)
	{
		if _y < _window_pos_y + COMPUTER_WINDOW_BORDER_TOP_HEIGHT/3
			return COMPUTER_WINDOW_BORDER_REGIONS.TOP_CENTER;
		if _y < _top_minus_corner_y
			return COMPUTER_WINDOW_BORDER_REGIONS.MOVE_AREA;
		if _y > _bottom_minus_corner_y
			return COMPUTER_WINDOW_BORDER_REGIONS.BOTTOM_CENTER;
		return COMPUTER_WINDOW_BORDER_REGIONS.CENTER;
	}
		//return _y < _window_pos_y + _window_height/2 ? COMPUTER_WINDOW_BORDER_REGIONS.TOP_CENTER : COMPUTER_WINDOW_BORDER_REGIONS.BOTTOM_CENTER;
	//LEFT
	if _x < _window_pos_x + _window_width/2
	{
		if _y < _top_minus_corner_y
			return COMPUTER_WINDOW_BORDER_REGIONS.TOP_LEFT;
		if _y >_bottom_minus_corner_y
			return COMPUTER_WINDOW_BORDER_REGIONS.BOTTOM_LEFT;
		return COMPUTER_WINDOW_BORDER_REGIONS.CENTER_LEFT;
	}
	//RIGHT
	if _y < _top_minus_corner_y
		return COMPUTER_WINDOW_BORDER_REGIONS.TOP_RIGHT;
	if _y > _bottom_minus_corner_y
		return COMPUTER_WINDOW_BORDER_REGIONS.BOTTOM_RIGHT;
	return COMPUTER_WINDOW_BORDER_REGIONS.CENTER_RIGHT;

}















