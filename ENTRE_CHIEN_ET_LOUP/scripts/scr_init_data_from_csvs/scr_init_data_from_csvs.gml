

/// @desc  import all the parameters set in the included CSV files
function init_data_from_csvs()
{

	global.street_types = csv_to_1d_array("street_types.csv");
	global.characters = csv_to_structs_of_constructor("characters.csv", Character);
	global.phone_numbers = csv_to_structs_of_constructor("phone_numbers.csv", PhoneNumber);
	global.streets = csv_to_structs_of_constructor("streets.csv", Street);
	global.addresses = csv_to_structs_of_constructor("addresses.csv", Address);
	global.cases = csv_to_structs_of_constructor("cases.csv", Case);
	global.crimes = csv_to_structs_of_constructor("crimes.csv",Crime);

	enum LANGUAGES{FR, EN}
	global.language = LANGUAGES.FR;
	global.map_texts = csv_to_map_of_arrays("texts.csv");
	
}