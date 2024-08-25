#macro SAVE_FILE_NAME "blaises.pov"



function save_game()
{
	var _struct_to_save =
	{
		language : global.language,
		day_number : global.day_number,
		nb_ids_obtained_phone_numbers : array_length(global.ids_obtained_phone_numbers),
		ids_obtained_phone_numbers : [],
		cases : array_create(array_length(global.cases)),
		switches : array_create(SWITCHES.NUMBER_OF_SWITCHES),
	}
	
	var _nb_ids_obtained_phone_numbers = array_length(global.ids_obtained_phone_numbers);
	for (var _id_obtained_phone_numbers = 0; _id_obtained_phone_numbers < _nb_ids_obtained_phone_numbers; _id_obtained_phone_numbers ++)
	{
		_struct_to_save.ids_obtained_phone_numbers[_id_obtained_phone_numbers] = global.ids_obtained_phone_numbers[_id_obtained_phone_numbers];
	}
	var _nb_cases = array_length(global.cases);
	for (var _case = 0; _case < _nb_cases; _case ++)
	{
		_struct_to_save.cases[_case].day_caught = global.cases[_case].day_caught;
	}
	for (var _switch = 0; _switch < SWITCHES.NUMBER_OF_SWITCHES; _switch ++)
	{
		_struct_to_save.switches[_switch] = global.switches[_switch];
	}
	
	string_to_file(SAVE_FILE_NAME, json_stringify(_struct_to_save));
}