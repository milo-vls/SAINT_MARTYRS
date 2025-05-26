///@param {Asset.GMRoom} _room
function change_current_room_app_title(_room)
{
	global.current_computer_app_title = app_get_title(_room);
	return global.current_computer_app_title;
}