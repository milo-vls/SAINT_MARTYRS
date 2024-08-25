if !global.switches[SWITCHES.COMPUTER_UNLOCKED]
{
	
	user_input = string_copy(keyboard_string, 1, 20);

	
	if selected_user == noone and keyboard_check_released(vk_enter)
	{
		if does_user_exists(users, user_input)
		{
			cmd_lines[array_length(cmd_lines) - 1] = user_input;
			selected_user = user_input;
			array_push(cmd_lines, text_id_to_string("CMD ASK PSW"));
			array_push(cmd_lines, text_id_to_string(""));
			io_clear();
		}
	}
	if selected_user != noone
	{
		if keyboard_check_pressed(vk_enter)
			if check_pswd(users, selected_user, user_input)
				global.switches[SWITCHES.COMPUTER_UNLOCKED] = true;
			else
				cmd_lines[array_length(cmd_lines) - 2] = text_id_to_string("CMD WRONG PSW");
	}
	
	
	draw_clear_alpha(c_black, 1);
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_set_font(fnt_notpad);
	draw_set_valign(fa_top); draw_set_halign(fa_left);
	
	var _nb_cmd_lines = array_length(cmd_lines);
	var _v_offset = COMP_WELCOME_SCREEN_INERLINE/2;
	for (var _cmd_line_index = 0; _cmd_line_index < _nb_cmd_lines; _cmd_line_index ++)
	{
		_v_offset += COMP_WELCOME_SCREEN_INERLINE*2;
		var _text = cmd_lines[_cmd_line_index];
		draw_text(20, _v_offset, ">>" + (_text == "" ? user_input : _text));
	}
}

array_foreach(windows, draw_window);
