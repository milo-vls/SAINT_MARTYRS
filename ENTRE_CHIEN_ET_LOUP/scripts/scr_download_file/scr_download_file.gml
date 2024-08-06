
//false when download impossible
//true when download succeded
function try_download_file(_file_index)
{
	if array_contains(global.downloaded_files_index, _file_index) == false
	{
		array_push(global.downloaded_files_index, _file_index);
		global.nb_downloaded_files ++;
		return true;
	}
	return false;
}