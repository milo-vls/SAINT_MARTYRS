///@param {Array} _array
///@param {struct} _struct
function set_struct_variables(_array, _struct)
{
	var _array_length = array_length(_array);
	for (var _i = 0; _i < _array_length; _i ++)
		variable_struct_set(_struct, _array[_i][0], _array[_i][1])
}