function picture_window_draw(_manager_id, _window)
{
	draw_clear_alpha(c_black, 0.075);
	draw_set_color(c_white);
	draw_sprite(struct_get(_window, PICTURE_WINDOW_STRUCT.PICTURE_FILE).data, 0, 0, 0);
}