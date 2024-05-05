if !surface_exists(surface)
{
	surface = surface_create(surface_width, surface_height);
}
surface_set_target(surface);
draw_content(surface_width, surface_height);
surface_reset_target();
draw_surface(surface, x + border_width, y + border_height);
draw_self();


