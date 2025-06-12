#macro DELETE_DELAY_BEFORE_FAST_DELETION 34

function text_input(_text, _char_limit = 50)
{
    static delete_pressed_down_frames = 0;
    
    var _delete_done = false;
    var _returned_text = _text;
    var _current_length = string_length(_returned_text);

    // Gestion de la suppression
    if (keyboard_check_pressed(vk_backspace) and (_current_length > 0))
    {
        _delete_done = true;
        _returned_text = string_copy(_returned_text, 0, _current_length - 1);
        _current_length -= 1;
		keyboard_string = "";
    }
    
    // Suppression continue si la touche est maintenue
    if keyboard_check(vk_backspace)
    {
        delete_pressed_down_frames += 1;
        if delete_pressed_down_frames >= DELETE_DELAY_BEFORE_FAST_DELETION
        {
            delete_pressed_down_frames = DELETE_DELAY_BEFORE_FAST_DELETION - 1;
            
            if (_current_length > 0)
            {
                _delete_done = true;
                _returned_text = string_copy(_returned_text, 0, _current_length - 1);
                _current_length -= 1;
				keyboard_string = "";
            }
        }
    }
    else
    {
        delete_pressed_down_frames = 0;
    }
    
    // Ajout de nouveaux caractères (SEULEMENT si la limite n'est pas atteinte)
    if (!_delete_done) and (keyboard_string != "")
    {
        if (_char_limit == -1) or (_current_length < _char_limit)
        {
            var _remaining_chars = _char_limit - _current_length;
            var _chars_to_add = keyboard_lastchar //array_last(keyboard_string);
            _returned_text += _chars_to_add;
            keyboard_lastchar = "";
            
            // Forcer la limite au cas où (par sécurité)
            if (_char_limit != -1)
            {
                _returned_text = string_copy(_returned_text, 0, _char_limit);
            }
        }
    }
    
    return _returned_text;    
}