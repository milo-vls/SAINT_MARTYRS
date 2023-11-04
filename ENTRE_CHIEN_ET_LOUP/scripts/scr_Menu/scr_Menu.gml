
/**
 * @param {real} _priority Description
 * @param {asset.GMRoom} [_room_presence]=room Description
 * @param {bool} [_is_persistent]=false Description
 * @param {bool} [_end_with_room]=true Description
 *@param {bool} _parallelism
 */
function Menu(_priority, _room_presence = room, _is_persistent = false, _end_with_room = true, _parallelism = false) constructor 
{
	priority = _priority;
	room_presence = _room_presence;
	is_persistent = _is_persistent;
	end_with_room = _end_with_room;
	parallelism = _parallelism;
	
	///@returns {bool} Description
	static must_be_drawn = function()
	{
		return is_persistent or (room_presence == room);
	}
	
	
}