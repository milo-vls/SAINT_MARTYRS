var _menus_length = array_length(menus);
var _highest_priority_menu_index = -1;
for (var _i = 0; _i < _menus_length; _i ++)
{
	if menus[_i].must_be_drawn()
	{
		menus[_i].draw();
		
		if _highest_priority_menu_index < _i and menus[_i].parallelism == false
		{
			_highest_priority_menu_index = _i;
		}
	}
}

for (var _i = 0; _i < _menus_length; _i ++)
{
	if menus[_i].parallelism == true or _i == _highest_priority_menu_index
	{
		menus[_i].activity();
	}
}