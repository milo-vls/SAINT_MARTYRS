

function WebPage() constructor
{
	app_background_colour = c_dkgrey;
	back_page_colour = c_white;
	back_page_ratio_width = .6;
	back_page_ratio_margin = .1;
	
	address = "";
	
	/*
	back_page_pixel_width = room_width * back_page_ratio_width;
	back_page_pixel_margin = back_page_pixel_width * back_page_ratio_margin;
	tolerated_pixel_width = back_page_pixel_width - back_page_pixel_margin * 2
	*/
	
	data_type_order = array_create(0);
	page_elements = [
	[],			//SCRIBBLE
	[],			//ANIMATED SPRITE
	[]			//SPRITE IMAGE
	];
	
}


///@param {Constant.Color} _background_colour
///@param {Constant.Color} _back_page_colour
///@returns {struct.WebPage}
function web_page_create_color(_background_colour, _back_page_colour)
{
	var _web_page_to_return = new WebPage();
	_web_page_to_return.app_background_colour = _background_colour;
	_web_page_to_return.back_page_colour = _back_page_colour;
	
	return _web_page_to_return;
}

///@param {real} _back_page_ratio_width
///@param {real} _back_page_ratio_margin
///@returns {struct.WebPage}
function web_page_create_width(_back_page_ratio_width, _back_page_ratio_margin)
{
	var _web_page_to_return = new WebPage();
	_web_page_to_return.back_page_ratio_width =  clamp(_back_page_ratio_width, 0, 1);
	_web_page_to_return.back_page_ratio_margin = clamp(_back_page_ratio_margin, 0, 1);
	
	return _web_page_to_return;
}

///@param {real} _back_page_ratio_width
///@param {real} _back_page_ratio_margin
///@param {Constant.Color} _background_colour
///@param {Constant.Color} _back_page_colour
///@returns {struct.WebPage}
function web_page_create_ext(_back_page_ratio_width, _back_page_ratio_margin, _background_colour, _back_page_colour)
{
	var _web_page_to_return = new WebPage();
	_web_page_to_return.back_page_ratio_width =  clamp(_back_page_ratio_width, 0, 1);
	_web_page_to_return.back_page_ratio_margin = clamp(_back_page_ratio_margin, 0, 1);
	_web_page_to_return.app_background_colour = _background_colour;
	_web_page_to_return.back_page_colour = _back_page_colour;
	
	return _web_page_to_return;
}