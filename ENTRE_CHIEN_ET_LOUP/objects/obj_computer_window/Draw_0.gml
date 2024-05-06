draw_set_alpha(1);
if !surface_exists(surface)
{
	surface = surface_create(surface_width, surface_height);
}
surface_set_target(surface);
draw_content(surface_width, surface_height);
surface_reset_target();
draw_surface(surface, x + border_width, y + border_height_top);
draw_self();


depth = origin_depth;
if position_meeting(obj_computer_cursor.x, obj_computer_cursor.y, self)
{
	obj_computer_manager.hovered_window = self;
}

 draw_set_color(c_blue);
draw_rectangle(x + border_width, y + sprite_height, x + sprite_width - border_width, y + sprite_height - border_width/2, false);