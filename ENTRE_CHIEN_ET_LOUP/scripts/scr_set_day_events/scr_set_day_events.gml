function set_day_events()
{
	var _day_events_ds_map = ds_map_create();
	
	ds_map_add(_day_events_ds_map, 0, get_cutscene_test());
	
	return _day_events_ds_map;
}