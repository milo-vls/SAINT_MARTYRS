function character_is_present(_char_id, _day_number)
{
	var _presences = global.presences;
	var _nb_presences = array_length(_presences);
	
	
	for (var _presence_id = 0; _presence_id < _nb_presences; _presence_id ++)
	{
		var _presence = _presences[_presence_id];
		if _presence.day_number != _day_number
			continue;
		if _presence.character_id == _char_id
			return true;
	}
	
	return false;
}