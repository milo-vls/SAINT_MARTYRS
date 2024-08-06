#macro ADD_FILE array_push(_files, new File(

#macro F_PIC , FILE_EXPLORER_FOLDER_TYPES.PICTURE))
#macro T_PIC , FILE_EXPLORER_FOLDER_TYPES.TEXT))
 
function load_files()
{
	
	var _files = array_create(0);
	
	//PICTURES
	ADD_FILE "default", spr_file_night_in_indonesia F_PIC ;
	
	//TEXTS
	ADD_FILE "infoOS", "Goupunix V1.45.4" T_PIC ;
	
	
	return _files;
}