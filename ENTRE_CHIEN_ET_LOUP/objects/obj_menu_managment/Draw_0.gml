var _menus_length = array_length(menus);
var _highest_priority_menu_index = -1;
for (var _i = 0; _i < _menus_length; _i ++)
{
	if menus[_i].must_be_drawn()
	{
		menus[_i].draw();
		
		if _highest_priority_menu_index < _i
		{
			_highest_priority_menu_index = _i;
		}
	}
}

if _highest_priority_menu_index > -1
{
	menus[_highest_priority_menu_index].activity();
}