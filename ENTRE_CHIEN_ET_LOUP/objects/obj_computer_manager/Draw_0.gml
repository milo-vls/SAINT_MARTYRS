if !global.switches.computer_unlocked
{
	/*
	var _last_char = filtered_last_char();
	if _last_char  != -1 and array_length(user_input) < 21
		user_input += string_concat(user_input, _last_char)
	*/
	user_input = text_input(user_input, 25);

	
	if selected_user == noone and keyboard_check_released(vk_enter)
	{
		if does_user_exists(users, user_input)
		{
			cmd_lines[array_length(cmd_lines) - 1] = user_input;
			selected_user = user_input;
			array_push(cmd_lines, text_id_to_string("CMD ASK PSW"));
		}
		keyboard_string = "";
		user_input = "";
	}
	if selected_user != noone
	{
		if keyboard_check_pressed(vk_enter)
			if check_pswd(users, selected_user, user_input)
			{
				global.switches.computer_unlocked = true;
				keyboard_string = "";
				user_input = "";
			}
			else
				cmd_lines[array_length(cmd_lines) - 2] = text_id_to_string("CMD WRONG PSW");
	}
	
	
	draw_clear_alpha(c_black, 1);
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_set_font(fnt_notpad);
	draw_set_valign(fa_top); draw_set_halign(fa_left);
	
	draw_lines(array_func_push(cmd_lines, user_input),  0, COMP_WELCOME_SCREEN_INERLINE*2, 20, COMP_WELCOME_SCREEN_INERLINE/2.5);
	
	
	
}

array_foreach(windows, draw_window);
