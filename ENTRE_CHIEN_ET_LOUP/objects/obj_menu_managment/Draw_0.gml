var _menus_length = array_length(menus);
var _highest_priority_menu_index = -1;



for (var _i = 0; _i < _menus_length; _i ++)
{	
	if menus[_i].must_be_drawn()
	{
		menus[_i].draw();
		
		if _highest_priority_menu_index < _i and menus[_i].parallelism == false and (menus[_i].room_presence == room or menus[_i].is_persistent)
		{
			_highest_priority_menu_index = _i;
		}
	}
	
	if menus[_i].end_reached
	{
		array_delete(menus, _i, 1);
		_i = 0;
		_menus_length -= 1;
	}
}

for (var _i = 0; _i < _menus_length; _i ++)
{
	if menus[_i].parallelism or _i == _highest_priority_menu_index
	{
		menus[_i].activity();
	}
}