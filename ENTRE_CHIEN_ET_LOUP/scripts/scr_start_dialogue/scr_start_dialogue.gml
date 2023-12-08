function start_dialogue(_yarn_file)
{
	var _directory = "DIALOGUES\\" + text_id_to_string("DIALOGUES DIRECTORY") + "\\";
	var _file = _directory + _yarn_file;
	ChatterboxLoadFromFile(_file);
	add_menu(new DialogueMenu(_file));
}