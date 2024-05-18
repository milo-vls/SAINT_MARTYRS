function int_array_to_string(_array_int_to_copy)
{
	var _array_int = array_create(0);
	array_copy(_array_int, 0, _array_int_to_copy, 0, array_length(_array_int_to_copy));
	if array_length(_array_int) == 0 
	{
		return "";
	}
	return string(array_shift(_array_int)) + int_array_to_string(_array_int);
}