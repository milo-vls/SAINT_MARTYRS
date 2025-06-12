///@return {struct.WebPage} 
function web_page_get_not_found()
{
	var _test_page = web_page_create_ext(.8, .1, c_ltgray, c_gray);
	/*
	_test_page = add_scribble_to_page(_test_page, new WebScribble(scribble("1")));
	_test_page = add_scribble_to_page(_test_page, new WebScribble(scribble("2")));
	_test_page = add_scribble_to_page(_test_page, new WebScribble(scribble("3")));
	_test_page = add_scribble_to_page(_test_page, new WebScribble(scribble("Welcome to test page. :)Welcome to test page. :)Welcome to test page. :)Welcome to test page. :)Welcome to test page. :)Welcome to test page. :)")));
	*/
	var _string =text_id_to_string("PAGE NOT FOUND");
	_test_page = add_scribble_to_page(_test_page, new WebScribble(scribble("")));
	_test_page = add_scribble_to_page(_test_page, new WebScribble(scribble("")));
	_test_page = add_scribble_to_page(_test_page, new WebScribble(scribble("")));
	_test_page = add_scribble_to_page(_test_page, new WebScribble(scribble("")));
	_test_page = add_scribble_to_page(_test_page, new WebScribble(scribble("")));
	_test_page = add_scribble_to_page(_test_page, new WebScribble(scribble("")));
	_test_page = add_scribble_to_page(_test_page, new WebScribble(scribble("")));
	_test_page = add_scribble_to_page(_test_page, new WebScribble(scribble(_string)));
	
	
	return _test_page;
	
}