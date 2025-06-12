
/// @param {string} _text_id Description
/// @returns {string}
function text_id_to_string(_text_id)
{
	return global.map_texts[? _text_id][global.language];
}


function string_to_text_id(_string)
{
	var _map_texts = global.map_texts;
	var _language = global.language;
	var _text_ids = ds_map_keys_to_array(_map_texts);
	var _nb_text_ids = array_length(_text_ids);
	
	for (var _i = 0; _i < _nb_text_ids; _i ++)
	{
		var _text_id = _text_ids[_i];
		if string_equals_ignore_cases(_map_texts[? _text_id][_language], _string)
			return _text_id;
	}
	
	return -1
	
}