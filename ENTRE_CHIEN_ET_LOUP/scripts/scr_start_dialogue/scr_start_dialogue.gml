function start_dialogue(_yarn_file)
{
	var _file = "DIALOGUES\\" + _yarn_file;
	ChatterboxLoadFromFile(_file);
	obj_menu_management.add_menu(new DialogueMenu(_file));
}