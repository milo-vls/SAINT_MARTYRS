x = mouse_x//COMPUTER_SCREEN_X_1+ ( (COMPUTER_SCREEN_X_2- COMPUTER_SCREEN_X_1) *  (window_mouse_get_x()/window_get_width()));
y = mouse_y//COMPUTER_SCREEN_Y_1 + ((COMPUTER_SCREEN_Y_2- COMPUTER_SCREEN_Y_1) *  (window_mouse_get_y()/window_get_height()));


if left_click_pressed()
{
	var _list_can_focus_instances = ds_list_create();
	var _number_can_be_focus_instances = instance_position_list(x, y, obj_parent_cursor_can_focus, _list_can_focus_instances, true);
	
	if _number_can_be_focus_instances == 0
	{
		instance_id_focus = noone;
	}else if _number_can_be_focus_instances == 1
	{
		instance_id_focus = _list_can_focus_instances[| 0];
	}
	else
	{
		var _less_deep_instance = _list_can_focus_instances[| 0];
		for (var _i = 1; _i < _number_can_be_focus_instances; _i ++)
			if _list_can_focus_instances[| _i].depth <_less_deep_instance.depth
				_less_deep_instance = _list_can_focus_instances[| _i];
		
		instance_id_focus = _less_deep_instance;
	}
	
	
	ds_list_destroy(_list_can_focus_instances);
}