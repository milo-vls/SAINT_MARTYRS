

draw_set_alpha(1);
draw_self();
image_yscale = (origin_height + added_height) / sprite_get_height(sprite_index);


draw_set_color(c_black); draw_set_font(fnt_small_titles); draw_set_halign(fa_center); draw_set_valign(fa_top);

draw_text(elements_x, text_y, string(nb_cases));

for (var _i = 0; _i < nb_active_malus; ++ _i)
{
	draw_sprite(malus_sprites[_i], 0, elements_x, malus_sprites_heights[_i]);
}
