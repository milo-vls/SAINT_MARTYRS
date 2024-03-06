function get_date_string(_day_number = global.day_number)
{
	var _date = day_number_to_date(_day_number);
	var _month_string = text_id_to_string("MONTH"+string(date_get_month(_date)));
	var _day_string = string(date_get_day(_date));
	var _year_string = string(date_get_year(_date));
	switch(global.language)
	{
		case LANGUAGES.EN:
		return _month_string + " " + _day_string + " " + _year_string;
		case LANGUAGES.FR:
		return _day_string + " " + _month_string + " " + _year_string;
	}
}