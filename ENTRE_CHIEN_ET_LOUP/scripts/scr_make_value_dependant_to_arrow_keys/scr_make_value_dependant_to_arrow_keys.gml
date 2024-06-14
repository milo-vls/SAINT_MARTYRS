function make_value_dependant_to_arrow_keys(_int)
{
	if keyboard_check(vk_up)
		return _int +1;
	if keyboard_check(vk_down)
		return _int -  1;
	return _int;
}