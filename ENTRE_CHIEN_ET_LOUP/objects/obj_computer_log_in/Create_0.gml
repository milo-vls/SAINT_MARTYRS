var _nb_input_text_boxs = instance_number(obj_computer_input_text_box);

user_text_box_instance = noone;
pswd_text_box_instance = noone;

for (var _i = 0; _i < _nb_input_text_boxs; _i ++)
{
	var _txt_box_instance = instance_find(obj_computer_input_text_box, _i);
	if _txt_box_instance.default_text == text_id_to_string("USER")
		user_text_box_instance = _txt_box_instance;
	if _txt_box_instance.default_text == text_id_to_string("PASSWORD")
		pswd_text_box_instance = _txt_box_instance;
}

if user_text_box_instance == noone
	show_error("No user text box found", true);
	
if pswd_text_box_instance == noone
	show_error("No password text box found", true);