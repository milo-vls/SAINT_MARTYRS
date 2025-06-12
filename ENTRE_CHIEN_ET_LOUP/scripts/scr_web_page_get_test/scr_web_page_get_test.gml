///@return {struct.WebPage} 
function web_page_get_test()
{
	var _test_page = web_page_create_ext(.8, .1, c_white, c_ltgray);
	/*
	_test_page = add_animated_sprite_to_page(_test_page, new WebAnimatedSprite(spr_Andree_portrait, 0));
	_test_page = add_sprite_image_to_page(_test_page, new WebSpriteImage(spr_Andree_portrait, 0));
	_test_page = add_scribble_to_page(_test_page, new WebScribble(scribble("Welcome to test page. :)")));
	*/
	return _test_page;
	
}