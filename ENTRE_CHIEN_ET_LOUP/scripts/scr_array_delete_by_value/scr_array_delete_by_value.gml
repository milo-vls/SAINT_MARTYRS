function array_delete_by_value(_array, _value)
{	
	var _array_to_return = _array;
	var _array_lenght = array_length(_array);
	for (var _i = 0; _i < _array_lenght; _i ++)
	{
		if _array[_i] == _value
		{
			array_delete(_array_to_return, _i, 1);
		}
	}
	
	return _array_to_return;
}