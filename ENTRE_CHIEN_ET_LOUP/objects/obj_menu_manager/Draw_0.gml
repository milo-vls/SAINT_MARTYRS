
/*
var _occupied_channels = [];
for (var _i = _menus_length - 1; _i > -1; _i --)
{	
	if menus[_i].channel != -1 and !array_contains(_occupied_channels, menus[_i].channel)
	{
		array_push(_occupied_channels, menus[_i].channel)
	}
}
var _authorized_menus = [];
for (var _i = _menus_length - 1; _i > -1; _i --)
{	
	var _menu = menus[_i];
	if _menu.channel == -1 or array_contains(_occupied_channels, _menu.channel)
	{
		_authorized_menus[array_length(_authorized_menus)] = _i;
		array_delete(_occupied_channels, array_get_index(_occupied_channels, _menu.channel), 1);
	}
}
*/



var _menus_length = array_length(menus);
var _highest_priority_menu_index = -1;
var _authorized_menus = get_authorized_menus_id();

for (var _i = 0; _i < _menus_length; _i ++)
{	
	if menus[_i].end_reached
	{
		array_delete(menus, _i, 1);
		_menus_length -= 1;
		break;
	}
	if menus[_i].must_be_drawn() and array_contains(_authorized_menus, _i)
	{
		menus[_i].draw();
		
		if _highest_priority_menu_index < _i and menus[_i].parallelism == false and (menus[_i].room_presence == room or menus[_i].is_persistent)
		{
			_highest_priority_menu_index = _i;
		}
	}
	
	
}
for (var _i = 0; _i < _menus_length; _i ++)
{
	if menus[_i].parallelism or _i == _highest_priority_menu_index
	{
		menus[_i].activity();
	}
}









if debug_mode
{
	draw_text(50, 50, "nb menus:" + string(array_length(menus)))
	draw_text(50, 200, "nb menus authorisés:" + string(array_length(_authorized_menus)))
}