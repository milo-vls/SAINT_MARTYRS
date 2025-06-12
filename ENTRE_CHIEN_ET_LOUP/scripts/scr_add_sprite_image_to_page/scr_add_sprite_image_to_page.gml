///@param {struct.WebPage} _web_page
///@param {struct.WebSpriteImage} _web_sprite_image
///@returns {struct.WebPage}
function add_sprite_image_to_page(_web_page, _web_sprite_image)
{
	var _web_page_to_return = _web_page;
	array_push(_web_page_to_return.page_elements[WEB_DATA_TYPES.SPRITE_IMAGE], _web_sprite_image);
	array_push(_web_page_to_return.data_type_order, WEB_DATA_TYPES.SPRITE_IMAGE);
	return _web_page_to_return;
}