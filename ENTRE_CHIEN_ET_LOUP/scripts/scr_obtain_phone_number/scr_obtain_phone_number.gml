function obtain_phone_number_by_number_id(_number_id)
{
	if array_contains(global.ids_obtained_phone_numbers, _number_id)
	{
		return false;
	}
	array_push(global.ids_obtained_phone_numbers, _number_id);
}