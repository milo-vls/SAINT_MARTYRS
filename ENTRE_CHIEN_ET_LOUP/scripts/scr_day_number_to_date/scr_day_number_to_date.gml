function day_number_to_date(_day_number = global.day_number)
{
	return date_inc_day(global.starting_date, _day_number);
}