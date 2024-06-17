function create_computer_window(_title, _icon, _draw_method)
{
	instance_create_layer(10, 10, "windows", obj_computer_window, {title : _title, icon : _icon, draw_content : _draw_method});
}