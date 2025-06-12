///@param {string} _url


///@returns {struct.WebPage}

function web_try_url(_url)
{
	var _web_page_to_return;
	switch (_url)
	{	
		case "teste"	: _web_page_to_return = debug_mode ? web_page_get_test() : web_page_get_not_found() ; break;
		default			: _web_page_to_return = web_page_get_not_found(); break;
	}

	
	
	_web_page_to_return.address = _url
	return _web_page_to_return;
}
