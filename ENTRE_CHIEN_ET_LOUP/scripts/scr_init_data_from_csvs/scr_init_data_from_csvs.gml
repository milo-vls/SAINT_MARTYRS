
/// @desc  import alla parameters set in the included CSV files
function init_data_from_csvs()
{
	global.street_types = [];
	global.characters = [];
	global.phone_numbers = [];
	global.streets = [];
	global.addresses = [];
	global.cases = [];
	global.crime = [];
	
	global.street_types = ds_grid_to_array(load_csv("street_types.csv"));
	global.phone_numbers = ds_grid_to_array(load_csv("phone_numbers.csv"));
	
}