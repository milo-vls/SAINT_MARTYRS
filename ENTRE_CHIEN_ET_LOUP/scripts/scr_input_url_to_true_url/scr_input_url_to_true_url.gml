///@param {string} _url
///@param {Id.DsMap<Array<String>>} _urls_grid


function url_to_true_url(_url, _urls_grid = load_urls_grid())
{
	var _lowered_url =  string_lower(_url);
	
	var _url_y = ds_grid_value_y(_urls_grid,0, 0, ds_grid_width(_urls_grid)-1, ds_grid_height(_urls_grid)-1, _lowered_url);
	
	if _url_y == -1
	{
		ds_grid_destroy(_urls_grid);
		return "address not found";
	}
	
	var _true_url = ds_grid_get(_urls_grid, 0, _url_y);
	ds_grid_destroy(_urls_grid);
	return _true_url;
	
	
	
}