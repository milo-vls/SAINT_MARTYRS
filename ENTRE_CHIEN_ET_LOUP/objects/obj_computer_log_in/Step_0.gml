if	obj_computer_cursor.instance_id_focus == self.id 
	and left_click_released()
{

	var _password_true = pswd_text_box_instance.input_text == BLAISE_COMP_PASSWORD;
	var _username_true = user_text_box_instance.input_text == BLAISE_COMP_USER_NAME;
	if (_password_true and _username_true) or debug_mode
	{
		global.switches.computer_unlocked = true;
		change_room(rm_computer_desktop);
	}
	else
	{
		user_text_box_instance.input_text = "";
		pswd_text_box_instance.input_text = "";
	}
}