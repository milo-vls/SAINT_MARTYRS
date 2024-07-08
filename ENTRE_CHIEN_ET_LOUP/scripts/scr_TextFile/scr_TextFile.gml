function File(_title, _data, _type) constructor
{
	type = _type;
	
	
	title = _title;
	data = _data;
}

function get_file_extension(_file_type)
{
	if _file_type == FILE_EXPLORER_FOLDER_TYPES.FOLDER
		return "/";
	if _file_type == FILE_EXPLORER_FOLDER_TYPES.TEXT
		return ".text";
}

///@param {struct.File} _text_file
function get_file_title(_text_file)
{
	return _text_file.title + get_file_extension(_text_file.type);
}
