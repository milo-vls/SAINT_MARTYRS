
#macro DELETE_DELAY_BEFORE_FAST_DELETION 34
//merce gpt
function text_input(_text, _char_limit = 50)
{
    static delete_pressed_down_frames = 0;
    
	var _delete_done = false
    var _text_length = string_length(_text);
    var _returned_text = string_copy(_text, 0, _text_length);
    
	
	
    if (keyboard_check_pressed(vk_backspace) and _text_length > 0)
    {
		_delete_done = true;
		_returned_text = string_copy(_returned_text, 0, _text_length - 1);
		_text_length -= 1;
    }
	
	
	if keyboard_check(vk_backspace)
	{
		delete_pressed_down_frames += 1;
		if delete_pressed_down_frames >= DELETE_DELAY_BEFORE_FAST_DELETION
		{
			delete_pressed_down_frames -= 4;
			_delete_done = true;
			_returned_text = string_copy(_returned_text, 0, _text_length - 1);
			_text_length -= 1;
		}
	}
	else
	{
		delete_pressed_down_frames = 0;
	}
	
    
    if ((_char_limit == -1 || _text_length < _char_limit)
		and _delete_done == false)
	{
	    var _remaining_chars = _char_limit - _text_length;
	    if _remaining_chars > 0
	    {
	        var _chars_to_add = string_copy(keyboard_string, 0, _remaining_chars);
	        _returned_text += _chars_to_add;
	    }
	    keyboard_string = "";
	}
    
    return _returned_text;    
}
