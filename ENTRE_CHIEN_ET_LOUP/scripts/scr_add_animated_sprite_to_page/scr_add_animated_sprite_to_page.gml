///@param {struct.WebPage} _web_page
///@param {struct.WebAnimatedSprite} _web_animated_sprite
///@returns {struct.WebPage}
function add_animated_sprite_to_page(_web_page, _web_animated_sprite)
{
	var _web_page_to_return = _web_page;
	array_push(_web_page_to_return.page_elements[WEB_DATA_TYPES.ANIMATED_SPRITE], _web_animated_sprite);
	array_push(_web_page_to_return.data_type_order, WEB_DATA_TYPES.ANIMATED_SPRITE);
	return _web_page_to_return;
}



