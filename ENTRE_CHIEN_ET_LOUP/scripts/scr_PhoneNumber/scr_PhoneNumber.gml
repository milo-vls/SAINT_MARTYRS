/// @desc Phone numbers' contructor
/// @param {real} _number 
function PhoneNumber() constructor
{
	
}

///@param {struct.PhoneNumber} _phone_number
function get_phone_number_int(_phone_number)
{
	return int64(_phone_number.number)
}
///@param {struct.PhoneNumber} _phone_number
function get_phone_number_string(_phone_number)
{
	return _phone_number.number;
}

function get_phone_number_id_by_number_string(_number_string)
{
	var _phone_numbers = global.phone_numbers;
	var _nb_phone_numbers = array_length(global.phone_numbers);
	for (var _phone_id = 0; _phone_id < _nb_phone_numbers; _phone_id ++)
		if get_phone_number_string(_phone_numbers[_phone_id]) == _number_string
			return _phone_id;
}