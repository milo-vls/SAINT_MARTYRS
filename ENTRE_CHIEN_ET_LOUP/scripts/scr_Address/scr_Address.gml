function Address() constructor{}


function get_address_full_name(_address_id)
{
	var _address = global.addresses[_address_id];
	var _street = global.streets[_address.street_id];
	var _street_type_id = _street.street_type_id;
	
	var _number_text = string(_address.number);
	var _street_type_text = text_id_to_string(global.street_types[_street_type_id]);
	var _street_text = text_id_to_string(_street.name_text_id);
	
	return string_concat(_number_text, " ", _street_type_text, " ", _street_text);
}

function get_address_position_text(_address_id)
{
	var _address = global.addresses[_address_id];
	var _x_text = string_concat("x = ", string(_address.x));
	var _y_text = string_concat("y = ", string(_address.y));
	
	return string_concat(_x_text, "    ", _y_text);
}


function get_addresses_ids_of_given_street_id(_street_id)
{
	var _addresses = global.addresses;
	var _nb_addresses = array_length(_addresses);
	var _addresses_to_return = [];
	
	
	for (var _address_id = 0; _address_id < _nb_addresses; _address_id ++)
		if _addresses[_address_id].street_id == _street_id
			array_push(_addresses_to_return, _address_id);
			
	return _addresses_to_return;
}


function address_id_of_number_from_given_street(_street_id, _number)
{
	var _addresses = global.addresses;
	var _addresses_ids = get_addresses_ids_of_given_street_id(_street_id);
	var _nb_addresses_ids = array_length(_addresses_ids);
	var _address_id_found = -1;
	for (var _i = 0; _i < _nb_addresses_ids;_i ++)
	{
		var _address_id = _addresses_ids[_i];
		if string(_addresses[_address_id].number) == _number
			return _address_id;
	}
	
	return -1;
}


