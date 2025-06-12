//surface set up
draw_set_alpha(1);
if !surface_exists(surface_for_web_page)
	surface_for_web_page = create_surface_for_web_page();
surface_set_target(surface_for_web_page);

//web page
draw_clear_alpha(web_page.app_background_colour, 0);
var _surface_width = surface_get_width(surface_for_web_page);
page_height = draw_web_page(web_page, -pixel_scrolled_down, 0, _surface_width);

//draw surface in the room
surface_reset_target();
draw_surface(surface_for_web_page, self.bbox_left, self.bbox_top);

//scroller
if need_scroller
{
	var _max_nb_pixel_scrolled_down = page_height - sprite_height;
	
	
	//scroller coordinates
	var _scroller_x = bbox_right - scroller_width;
	var _scroller_y = y;
	var _scroller_height = sprite_height
	var _scroller_space_height = _scroller_height - scroller_arrow_height*2;
	var _scroller_cursor_height = _scroller_space_height * ( sprite_height / page_height );
	
	//scroll control
	if obj_computer_cursor.instance_id_focus == self.id or never_lose_focus == true
	{
		//---MOUSE WHEEL---//
		pixel_scrolled_down += wheel_upward(MOUSE_SCROLLING_SPEED);
		//---CURSOR DRAG---//
		if left_click() == false
		{
			scroller_cursor_grab_y_offset = -1;
		}
		if point_in_rectangle(CURSOR_X, CURSOR_Y, 
			_scroller_x, scroller_cursor_y, 
			_scroller_x + scroller_width, scroller_cursor_y + _scroller_cursor_height)
			and left_click_pressed()
		{
			scroller_cursor_grab_y_offset = CURSOR_Y - scroller_cursor_y;
		}
		if scroller_cursor_grab_y_offset > -1
		{
			var _min_scroller_cursor_y = _scroller_y + scroller_arrow_height;
			var _max_scroller_cursor_y = _scroller_y + _scroller_height - scroller_arrow_height - _scroller_cursor_height;
			var _mouse_y = obj_computer_cursor.y;
			//var _scroller_cursor_y = clamp( _mouse_y - scroller_cursor_grab_y_offset, _min_scroller_cursor_y, _max_scroller_cursor_y);		
			var _scroller_cursor_y = _mouse_y - scroller_cursor_grab_y_offset;
			var _scroller_cursor_relative_y = ( _scroller_cursor_y - _min_scroller_cursor_y ) / ( _max_scroller_cursor_y - _min_scroller_cursor_y);
			_scroller_cursor_relative_y = clamp(_scroller_cursor_relative_y, 0, 1);
			
			pixel_scrolled_down = _max_nb_pixel_scrolled_down * _scroller_cursor_relative_y;
			
		}
		
		
		
		
		pixel_scrolled_down = clamp(pixel_scrolled_down, 0, _max_nb_pixel_scrolled_down);
	}
	var _scrolled_down_ratio = pixel_scrolled_down / _max_nb_pixel_scrolled_down;
	
	
	
	scroller_cursor_y = (_scroller_y + scroller_arrow_height ) + ((_scroller_space_height - _scroller_cursor_height) * _scrolled_down_ratio);
	
	//scroll draw	
	draw_set_alpha(1);
	
	
	
	
	
	
	
	draw_scroller(_scroller_x, _scroller_y, scroller_cursor_y, _scroller_height, scroller_width, _scroller_cursor_height);
}














