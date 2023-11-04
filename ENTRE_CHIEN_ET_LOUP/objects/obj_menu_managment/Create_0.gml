menus = array_create(0);


/**
 * @param {struct.Menu} _menu 
 */
add_menu = function(_menu)
{
	var _menus_length = array_length(obj_menu_managment.menus);
	
	if _menus_length == 0 
	{
		menus[0] = _menu;
		return;
	}
	
	for (var _i = 0; _i < _menus_length; _i ++)
	{
		if _menu.priority < obj_menu_managment.menus[_i].priority
		{
			array_insert(menus, _i, _menu);
			return;
		}
	}
	
	menus[_menus_length] = _menu;
}