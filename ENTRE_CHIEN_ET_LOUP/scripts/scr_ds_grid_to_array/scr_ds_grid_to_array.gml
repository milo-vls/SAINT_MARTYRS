/// @desc 
/// @param {any*} _ds_grid Ds_grid id
function ds_grid_to_array(_ds_grid)
{	
	var _ds_grid_height = ds_grid_height(_ds_grid);
	var _ds_grid_width = ds_grid_width(_ds_grid);
	var _array_to_return = array_create(_ds_grid_height);

	if _ds_grid_width == 1
	{
		for (var _i = 0; _i < _ds_grid_height; _i ++)
		{
			_array_to_return[_i] = _ds_grid[# 0, _i];
		}
		return _array_to_return;
	}

	for (var _i = 0; _i < _ds_grid_height; _i ++)
	{
		for (var _j = 0; _j < _ds_grid_width; _j ++)
		{
			_array_to_return[_i][_j] = _ds_grid[# _j, _i];
		}
	}
	return _array_to_return;
}