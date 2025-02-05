function sequence_set_date_text()
{
	var _seq_struct = layer_sequence_get_sequence(global.room_transition.sequence_cover_id);
	var _tracks = _seq_struct.tracks;
	for (var _track_id = 0; _track_id < array_length(_tracks); _track_id ++)
	{
		if _tracks[_track_id].name == "txt_date"
			_tracks[_track_id].keyframes[0].channels[0].text = get_date_string();
			
	}
}