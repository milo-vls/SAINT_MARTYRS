function array_delete_by_value(_array, _value)
{	
	var _array_lenght = array_length(_array);
	var _array_to_return = array_create(0);
	array_copy(_array_to_return, 0, _array, 0, _array_lenght);
	for (var _i = 0; _i < _array_lenght; _i ++)
	{
		if _array[_i] == _value
		{
			array_delete(_array_to_return, _i, 1);
		}
	}
	
	return _array_to_return;
}