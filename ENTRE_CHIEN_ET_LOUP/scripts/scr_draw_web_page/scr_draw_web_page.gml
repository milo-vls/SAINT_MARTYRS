///@param {struct.WebPage} _web_page
///@param {real} _y
///@param {real} _x

///@returns {real}
function draw_web_page(_web_page, _y, _x, _total_width)
{
	var _data_type_order = _web_page.data_type_order;
	var _nb_elements = array_length(_data_type_order);
	var _data_types_number_track = array_create(WEB_DATA_TYPES.NB_WEB_DATA_TYPES, 0);
	
	var _cumulated_height = 100 + _y;
	var _offset = 20;
	var _back_page_pixel_width = _total_width * _web_page.back_page_ratio_width;
	var _back_page_pixel_margin = _back_page_pixel_width * _web_page.back_page_ratio_margin;
	var _tolerated_pixel_width = _back_page_pixel_width - _back_page_pixel_margin * 2;
	var _back_page_x = _x + (_total_width/2) - _tolerated_pixel_width/2
	var _margin_x = _back_page_x + _back_page_pixel_margin;
	
	var _type = -1;
	var _index = -1;
	var _page_element = -1;
	var _element_height = -1;
	
	
	//draw_sprite_ext(spr_pixel, 0, _x, _y, _total_width, 4000, 0, _web_page.app_background_colour, 1);
	draw_clear(_web_page.app_background_colour);
	draw_sprite_ext(spr_pixel, 0, _back_page_x, 0, _tolerated_pixel_width, GAME_HEIGHT, 0, _web_page.back_page_colour, 1);
	
	
	//page elements
	for (var _i = 0; _i < _nb_elements; _i ++)
	{
		_element_height = -1;
		
		_type = _data_type_order[_i];
		_index = _data_types_number_track[_type];
		_page_element = _web_page.page_elements[_type][_index];
		
		
		if _type == WEB_DATA_TYPES.SCRIBBLE
		{
			draw_set_color(c_black);
			_page_element.scribble_text = _page_element.scribble_text.wrap(_tolerated_pixel_width)
			_page_element.scribble_text.draw(_margin_x, _cumulated_height);
			_element_height = _page_element.scribble_text.get_height();
		}
		else if _type == WEB_DATA_TYPES.SPRITE_IMAGE
		{
			var _sprite_x_scale = sprite_get_width(_page_element.sprite) <= _tolerated_pixel_width ?
				1 : _tolerated_pixel_width / sprite_get_width(_page_element.sprite);
			var _sprite_x = _margin_x + sprite_get_xoffset(_page_element.sprite);
			var _sprite_y = _cumulated_height + sprite_get_yoffset(_page_element.sprite);


			draw_sprite_ext(_page_element.sprite, 
							_page_element.image_index, 
							_sprite_x, 
							_sprite_y, 
							_sprite_x_scale, 
							_sprite_x_scale, 
							0, c_white, 1);

			_element_height = sprite_get_height(_page_element.sprite) * _sprite_x_scale;
		}
		else if _type == WEB_DATA_TYPES.ANIMATED_SPRITE
		{
			var _sprite_x_scale = sprite_get_width(_page_element.sprite) <= _tolerated_pixel_width ?
				1 : _tolerated_pixel_width / sprite_get_width(_page_element.sprite);
			var _sprite_x = _margin_x + sprite_get_xoffset(_page_element.sprite);
			var _sprite_y = _cumulated_height + sprite_get_yoffset(_page_element.sprite);
			var _sprite_image = (current_time div max(_page_element.animation_speed, 1)) mod _page_element.nb_images;
			
			draw_sprite_ext(_page_element.sprite,
							_sprite_image,
							_sprite_x,
							_sprite_y,
							_sprite_x_scale,
							_sprite_x_scale,
							0, c_white, 1);
			_element_height = sprite_get_height(_page_element.sprite) * _sprite_x_scale;
		}
		
		if _element_height == -1
			show_error("element page height not set", true)
		_cumulated_height += _element_height + _offset;
		_data_types_number_track[_type] ++;
	}
	
	
	return _cumulated_height - _y;
}