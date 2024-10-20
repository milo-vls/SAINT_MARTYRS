if global.switches.computer_unlocked == true
	return;
io_clear();
user_input = "";
wait_for_text_input = true;
selected_user = noone;
cmd_lines = array_create(0);
#macro COMP_WELCOME_SCREEN_INERLINE 20
array_push(cmd_lines, text_id_to_string("CMD WELCOME"));
array_push(cmd_lines, text_id_to_string("CMD ASK USERNAME"));
array_push(cmd_lines, text_id_to_string("CMD ESC QUIT"));




