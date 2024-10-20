
///@param {Array} _array 
///@param {any} _el 
function array_func_push(_array, _el)
{
	var _returned_array = array_create(0);
	array_copy(_returned_array, 0, _array, 0, array_length(_array));
	array_push(_returned_array, _el);
	return _returned_array;
}