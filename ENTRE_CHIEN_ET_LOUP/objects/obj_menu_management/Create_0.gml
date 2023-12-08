menus = array_create(0);


/**
 * @param {struct.Menu} _menu 
 */
add_menu_to_manage = function(_menu)
{
	var _menus_length = array_length(obj_menu_management.menus);
	
	if _menus_length == 0 
	{
		menus[0] = _menu;
		return;
	}
	
	for (var _i = 0; _i < _menus_length; _i ++)
	{
		if _menu.priority < obj_menu_management.menus[_i].priority
		{
			array_insert(menus, _i, _menu);
			return;
		}
	}
	
	menus[_menus_length] = _menu;
}



//GETERS
dialogue_exists = function()
{
	var _nb_menus = array_length(menus);
	for (var _i = 0; _i < _nb_menus; _i ++)
	{
		if is_instanceof(menus[_i], DialogueMenu) then return true;
	}
	
	return false;
	
}
get_active_menu = function(_constructor)
{
	var _menus_length = array_length(menus);
	for (var _menu = _menus_length-1; _menu != -1; _menu --)
	{
		if is_instanceof(menus[_menu], _constructor) then return menus[_menu];
	}
	return -1;
}