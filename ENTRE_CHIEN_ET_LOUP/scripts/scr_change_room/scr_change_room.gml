/// @desc Function Description
/// @param {any*} _room_destination Description
/// @param {struct.roomtransitionstyle} [_transition_style]=new RoomTransitionStyle(ROOM_TRANSITION_STYLES.FADE)
function change_room(_room_destination, _transition_style = new RoomTransitionStyle(ROOM_TRANSITION_STYLES.FADE), _function_when_room_entered = function(){})
{
	var _room_transition = new RoomTransition(_room_destination, _transition_style, _function_when_room_entered);
	add_menu(_room_transition);
}