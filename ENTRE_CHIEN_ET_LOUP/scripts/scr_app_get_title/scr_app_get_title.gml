
///@param {Asset.GMRoom} _app_room 
///@returns {string}
function app_get_title(_app_room)
{
	switch _app_room
	{
		case rm_app_dev : return "app_dev";
		case rm_app_login : return "loging in";
		default : return "";
		
	}
}