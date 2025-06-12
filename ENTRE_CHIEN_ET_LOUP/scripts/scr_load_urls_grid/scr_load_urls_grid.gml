///@returns {Id.DsGrid}

function load_urls_grid()
{
	var _to_return = load_csv("CSVs\\" + "urls.csv");
	return _to_return;
}