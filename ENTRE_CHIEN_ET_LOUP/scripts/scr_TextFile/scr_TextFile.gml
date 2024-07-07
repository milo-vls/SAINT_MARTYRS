function TextFile(_title, _text) constructor
{
	static extension = ".text";
	
	title = _title;
	text = _text;
}

///@param {struct.TextFile} _text_file
function get_text_file_title(_text_file)
{
	return _text_file.title + TextFile.extension;
}