draw_set_alpha(1); 
draw_set_font(fnt_dialogues); 
draw_set_halign(fa_left); 
draw_set_valign(fa_top); 
draw_set_color(c_white);
draw_self();


if !surface_exists(surface_sheet)
{
	surface_create(sheet_width, sheet_height);
}
surface_set_target(surface_sheet);
//portrait
draw_sprite_stretched(portrait_sprite, 0, portrait_x, portrait_y, portrait_width, portrait_width);
//name
draw_set_color(c_black); 
draw_text(name_x, name_y, name_text);
//hitbox
i += 0.01
draw_sprite_ext(hitbox_sprite, 0, hitbox_x, hitbox_y, 1, 1, 540 * sin(i), -1, 0.9);

surface_reset_target();
draw_surface_ext(surface_sheet, x + sheet_left_x * image_xscale, y + sheet_top_y * image_yscale, image_xscale, image_yscale, image_angle, image_blend, image_alpha);