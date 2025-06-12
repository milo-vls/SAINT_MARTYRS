function web_page_get_welcome()
{
	var _page = web_page_create_ext(.8, .1, c_ltgray, c_gray);
	
	_page = add_scribble_to_page(_page, new WebScribble(scribble("[fnt_retron_for_comp_sys][c_black]Bienvenu sur votre navigateur net.")))
	
	return _page;
}