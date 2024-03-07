function get_authorized_menus_id()
{
	var _channels = array_create(MENU_CHANNELS.NB_CHANNELS, -1);
	var _menus = obj_menu_management.menus;
	var _authorized_menus_id = [];
	var _nb_menus = array_length(_menus);
	
	for (var _menu_id = 0; _menu_id < _nb_menus; _menu_id ++)
	{
		var _menu = _menus[_menu_id];
		var _menu_channel = _menu.channel;
		if _menu_channel == -1
		{
			array_push(_authorized_menus_id, _menu_id);
		}
		else
		{
			if _channels[_menu_channel] == -1
			{
				_channels[_menu_channel] = _menu_id;
				array_push(_authorized_menus_id, _menu_id);
			}
			else
			{
				var _removed_menu_id = _channels[_menu_channel];
				_authorized_menus_id = array_delete_by_value(_authorized_menus_id, _removed_menu_id);
				array_push(_authorized_menus_id, _menu_id);
			}
			
		}
	}
	
	return _authorized_menus_id;
}