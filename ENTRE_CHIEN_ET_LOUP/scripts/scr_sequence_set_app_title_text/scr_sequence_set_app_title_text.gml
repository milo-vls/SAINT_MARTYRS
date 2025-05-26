function sequence_set_app_title_text()
{
	var _seq = other.sequence;
	var _tracks = _seq.tracks;
	for (var _track_id = 0; _track_id < array_length(_tracks); _track_id ++)
	{
		if _tracks[_track_id].name == "app_title"
			_tracks[_track_id].keyframes[0].channels[0].text = global.current_computer_app_title;
	}
	//layer_sequence_pause(_seq);
}