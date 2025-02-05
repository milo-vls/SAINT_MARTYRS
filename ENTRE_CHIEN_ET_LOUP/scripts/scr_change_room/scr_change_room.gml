/// @desc Function Description
/// @param {any*} _room_destination Description
/// @param {asset.GMSequence} _sequence_cover
/// @param {asset.GMSequence} _sequence_discover
function change_room(_room_destination, _sequence_cover = sqc_transition_cover_slide_up_down, _sequence_discover = sqc_transition_discover_slide_up_down, _function_when_room_entered = function(){})
{
	var _room_transition = new RoomTransition(_room_destination, _sequence_cover, _sequence_discover, _function_when_room_entered);
	add_menu(_room_transition);
}