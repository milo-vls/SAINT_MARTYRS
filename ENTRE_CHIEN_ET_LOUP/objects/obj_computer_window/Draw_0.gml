draw_set_alpha(1);
surface_x = x + border_width - 1 * image_xscale;
surface_y = y + border_height_top;



if !surface_exists(surface)
{
	surface = surface_create(surface_width, surface_height);
}
surface_set_target(surface);
draw_content(surface_width, surface_height);
surface_reset_target();

draw_surface(surface, surface_x, surface_y);
draw_set_alpha(1);
draw_set_color(c_white);
draw_self();

//icon and title
if icon != noone
	draw_sprite_stretched(icon, 0, x, y, border_height_top, border_height_top);
if title != ""
{
	draw_set_alpha(1); draw_set_halign(fa_left);  draw_set_valign(fa_top);
	draw_set_color(c_dkgrey); draw_set_font(fnt_retron_for_comp_sys);
	draw_text_transformed(x + border_height_top*1.2, y, title, title_scale, title_scale, 0);
}
	



depth = origin_depth;

/*
draw_set_color(c_blue);
draw_rectangle(x + border_width, y + sprite_height, x + sprite_width - border_width, y + sprite_height - border_width/2, false);