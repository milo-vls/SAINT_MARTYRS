function filtered_last_char()
{
	var _last_char = keyboard_lastkey;
	if ((_last_char >= ord("A") and _last_char <= ord("Z")) // Majuscules
	    or (_last_char >= ord("a") and _last_char <= ord("z")) // Minuscules
	    or _last_char == vk_space) // Espace
	{
		keyboard_lastkey = -1;
		return _last_char;
	}
	return -1;
}
