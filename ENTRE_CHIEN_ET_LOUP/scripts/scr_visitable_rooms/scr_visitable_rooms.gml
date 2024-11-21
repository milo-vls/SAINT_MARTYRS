function visitable_rooms(_day_number = global.day_number)
{
	var _visitable_rooms = array_create(0);
	
	var _presences = global.presences;
	var _chars = global.characters;
	var _nb_presences = array_length(_presences);
	
	for (var _i = 0; _i < _nb_presences; _i ++)
	{
		var _presence = _presences[_i];
		var _char = _chars[int64(_presence.character_id)];
		if _presence.day_number == _day_number and character_may_appear(_presence.character_id)
			array_push(_visitable_rooms, _char.room);		
	}
	
	return _visitable_rooms;
}