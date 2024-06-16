x = clamp(x, 0, GAME_WIDTH);


draw_set_alpha(1); 
draw_set_halign(fa_left); 
draw_set_valign(fa_top); 
draw_set_color(c_white);
draw_self();


if !surface_exists(surface_sheet)
{
	surface_sheet = surface_create(sheet_width, sheet_height);
}
surface_set_target(surface_sheet);
draw_clear_alpha(c_black, 0);
//portrait
draw_sprite_stretched(portrait_sprite, 0, portrait_x, portrait_y, portrait_width, portrait_height);
//name
draw_set_color(c_black);draw_set_font(fnt_oswald); 
draw_text(name_x, name_y, name_text);
//deployment stat
if unit_instance != noone
{
	draw_set_color(c_red); draw_set_font(fnt_franklin_gothic_heavy);
	draw_text_transformed(deployed_text_x, deployed_text_y, deployed_text, 1, 1, deployed_text_angle);
}

surface_reset_target();
draw_surface_ext(surface_sheet, x - sprite_width/2 + sheet_left_x * image_xscale, y + sheet_top_y * image_yscale, image_xscale, image_yscale, image_angle, image_blend, image_alpha);


if unit_instance != noone and mouse_over
{
	draw_set_color(c_black); draw_set_alpha(255);
	draw_sprite(spr_show_unit, 0, unit_instance.x, unit_instance.y+ unit_instance.sprite_height*0.6);
}