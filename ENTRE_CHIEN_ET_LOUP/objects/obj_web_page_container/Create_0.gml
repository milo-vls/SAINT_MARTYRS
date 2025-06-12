#macro MOUSE_SCROLLING_SPEED 100

web_page = noone;
page_height = 0;


//scroller
need_scroller = false;
scroller_width = sprite_get_width(spr_page_scroller)*.9;
scroller_arrow_height = sprite_get_nineslice(spr_page_scroller).top
pixel_scrolled_down = 0;
scroller_cursor_grab_y_offset = -1;
scroller_cursor_y = 0;



surface_for_web_page = -1;
///@param {struct.WebPage} _web_page
set_web_page = function(_web_page)
{
	self.web_page = _web_page;
	self.pixel_scrolled_down = 0;
	var _page_height_without_scroller = draw_web_page(_web_page, self.y, self.x, self.sprite_width);
	if _page_height_without_scroller > self.sprite_height
	{
		self.need_scroller = true;
		self.page_height = draw_web_page(_web_page, self.y, self.x, self.sprite_width - self.scroller_width);
	}
	else
	{
		self.need_scroller = false;
		self.page_height = _page_height_without_scroller;
	}
	self.surface_for_web_page = -1;
	
}
create_surface_for_web_page = function()
{
	var _page_width = self.need_scroller ? sprite_width - self.scroller_width : sprite_width;
	return surface_create(_page_width, self.sprite_height);
}

set_web_page(web_page_get_welcome());
surface_for_web_page = create_surface_for_web_page();


