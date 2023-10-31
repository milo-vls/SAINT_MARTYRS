/// @desc 
/// @param {string} _file_name
function csv_to_1d_array(_file_name)
{	
	var _ds_grid = load_csv(_file_name)
	if _ds_grid == -1
	{
		show_error("The file " + _file_name +" have not been found", 1);	
	}
	
	var _ds_grid_height = ds_grid_height(_ds_grid);
	var _array_to_return = [];


	for (var _i = 1; _i < _ds_grid_height; _i ++)
	{
		_array_to_return[_i-1] = _ds_grid[# 1, _i];
	}
	return _array_to_return;

}



/**
 *  
 * @param {String} _file_name 
 * @param {function} _constructor 
 * @returns {array<Struct>} 
 */
function csv_to_structs_of_constructor(_file_name, _constructor)
{
	
	var _ds_grid = load_csv(_file_name);
	if _ds_grid == -1
	{
		show_error("The file \"" + _file_name +"\" have not been found", 1);	
	}	

	var _structs = [];
	var _grid_height = ds_grid_height(_ds_grid);
	var _grid_width = ds_grid_width(_ds_grid);
	
	 for (var _i = 1; _i < _grid_height; _i ++)
	 {
		 _structs[_i-1] = new _constructor();
		for (var _j = 1; _j < _grid_width; _j ++)
		{
			variable_struct_set(_structs[_i-1], _ds_grid[# _j, 0], _ds_grid[# _j, _i]);
		}
		
	 }
	 
	 return _structs;
	 
}
