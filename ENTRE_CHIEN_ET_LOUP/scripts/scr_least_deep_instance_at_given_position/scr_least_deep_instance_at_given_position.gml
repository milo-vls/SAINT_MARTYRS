function least_deep_instance_at_given_position(_x, _y, _object)
{
	var _ds_list_instances = ds_list_create();
	var _nb_instances_found = instance_position_list(_x, _y, _object, _ds_list_instances, false);
	if _nb_instances_found == 0
	{
		ds_list_destroy(_ds_list_instances);
		return noone;		
	}
	var _least_deep = _ds_list_instances[| 0];
	var _instance = noone;
	for (var _i = 1; _i < _nb_instances_found; _i ++)
	{
		_instance = _ds_list_instances[|_i];
		if _instance.depth > _least_deep.depth
			_least_deep = _instance;
	}
	ds_list_destroy(_ds_list_instances);
	return _least_deep;
}