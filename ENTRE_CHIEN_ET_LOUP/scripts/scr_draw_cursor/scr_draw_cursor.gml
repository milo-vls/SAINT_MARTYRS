///@param {real} _x
///@param {real} _y
///@param {real} _cursor_y
///@param {real} _height
///@param {real} _width
///@param {real} _cursor_height
function draw_scroller(_x, _y, _cursor_y, _height, _width, _cursor_height)
{
	var _scroller_cursor_offset = 4;
	var _scroller_arrow_height = sprite_get_nineslice(spr_page_scroller).top;
	
	
	draw_sprite_stretched(spr_page_scroller, 0, _x, _y, _width, _height);
	
	
	
	var _scroller_space_height = _height - _scroller_arrow_height * 2;
	var _cursor_width = _width - _scroller_cursor_offset;
	
	
	draw_sprite_stretched(spr_page_scroller_cursor, 0, _x + _scroller_cursor_offset/2, _cursor_y, _cursor_width, _cursor_height);
}