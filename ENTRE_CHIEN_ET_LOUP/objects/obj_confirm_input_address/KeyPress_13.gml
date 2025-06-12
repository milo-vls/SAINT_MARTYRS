if obj_computer_cursor.instance_id_focus == input_text_box_id
{
	var _true_url = url_to_true_url(input_text_box_id.input_text)
	var _web_page_found = web_try_url(_true_url);
	//give the page to the container
	obj_web_page_container.set_web_page(_web_page_found);
	
	//reset address search bar
	input_text_box_id.default_text = _web_page_found.address;
	input_text_box_id.input_text = "";
	keyboard_lastchar = "";
	obj_computer_cursor.instance_id_focus = noone;
}