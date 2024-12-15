#macro DIALOGUES_DIRECTORY_NAME "dial"


function start_dialogue(_yarn_file, _starting_node)
{
	var _directory = DIALOGUES_DIRECTORY_NAME+"\\";// + text_id_to_string("DIALOGUES DIRECTORY") + "\\";
	var _file = _directory + _yarn_file + ".yarn";
	if !file_exists(_file)
		return false;
	ChatterboxLoadFromFile(_file);
	
	if !ChatterboxSourceNodeExists(_file, _starting_node)
		return false;
	add_menu(new DialogueMenu(_file, _starting_node));
	
	return true;
}