///@param {Constant.FILE_EXPLORER_FOLDER_TYPES} _type
function get_downloaded_files_of_given_type(_type)
{
	var _files_to_return = array_create(0);
	var _files = obj_computer_manager.files;
	var _downloaded_files_index = global.downloaded_files_index;
	var _nb_downloaded_files = global.nb_downloaded_files;
	
	for (var _i = 0; _i < _nb_downloaded_files; _i ++)
	{
		var _file = _files[_downloaded_files_index[_i]];
		if _file.type == _type
			array_push(_files_to_return, _file);
	}
	
	return _files_to_return;
}