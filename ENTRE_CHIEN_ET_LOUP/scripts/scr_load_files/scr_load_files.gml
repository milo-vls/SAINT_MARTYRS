#macro ADD_FILE array_push(_files, new File(

#macro F_PIC , FILE_EXPLORER_FOLDER_TYPES.PICTURE))
#macro T_PIC , FILE_EXPLORER_FOLDER_TYPES.TEXT))
 
#macro INGAME_OS "Goupilux"
#macro INGAME_OS_VER "V17.10.19"
 
function load_files()
{
	
	var _files = array_create(0);
	
	//PICTURES
	ADD_FILE "default", spr_rec_hitbox F_PIC ;
	
	//TEXTS
	ADD_FILE "infoOS", INGAME_OS + INGAME_OS_VER T_PIC ;
	
	
	return _files;
}