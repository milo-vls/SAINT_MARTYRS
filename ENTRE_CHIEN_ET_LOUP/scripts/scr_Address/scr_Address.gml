function Address() constructor{}


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


function address_id_of_number_from_given_ids(_addresses_ids, _number)
{
	var _addresses = global.addresses;
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