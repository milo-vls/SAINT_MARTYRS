///@param {struct.WebPage} _web_page
///@param {struct.WebScribble} _web_scribble
///@returns {struct.WebPage}
function add_scribble_to_page(_web_page, _web_scribble)
{
	var _web_page_to_return = _web_page;
	array_push(_web_page_to_return.page_elements[WEB_DATA_TYPES.SCRIBBLE], _web_scribble);
	array_push(_web_page_to_return.data_type_order, WEB_DATA_TYPES.SCRIBBLE);
	return _web_page_to_return;
}