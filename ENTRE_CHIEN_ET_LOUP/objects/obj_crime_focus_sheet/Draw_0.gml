draw_set_alpha(1); draw_set_halign(fa_left); draw_set_valign(fa_top);
draw_self();

draw_set_font(fnt_dialogues);
//crime id
draw_text_ext_transformed(x + x_left_crime_id, y + y_top_crime_id, text_crime_id, -1, -1, text_x_scale, text_y_scale, image_angle);
//victim's face
draw_sprite_ext(spr_victim_face, 0, x + x_left_spr_victim_face, y + y_top_spr_victim_face, x_scale_spr_victim_face, y_scale_spr_victim_face, image_angle, c_white, 1);
//change color
if obj_malus_canvas.malus_exists("confusion")
{
	var _x_scribble_change_color = x + x_center_scribble_change_color;
	var _y_scribble_change_color = y + y_top_scribble_change_color;
	var _change_color_blend_color;

	mouse_over_change_color = point_in_rectangle(mouse_x, mouse_y, _x_scribble_change_color - scribble_width/2, _y_scribble_change_color, _x_scribble_change_color + scribble_width/2, _y_scribble_change_color + scribble_height)
	if  mouse_over_change_color
	{
		_change_color_blend_color = c_dkgray;
		scribble_anim_shake(2.5, 1);
	}
	else
	{
		_change_color_blend_color = c_black;
		scribble_anim_shake(0.5, 0.5);
	}
	scribble_change_color.blend(_change_color_blend_color).draw(_x_scribble_change_color, _y_scribble_change_color);
	scribble_anim_reset();
}
//victim's name
draw_text_transformed(x + x_left_victim_name, y + y_top_victim_name, victim_first_and_last_name, text_x_scale, text_y_scale, image_angle);
//date
draw_text_transformed(x + x_left_date, y + y_top_date, date, text_x_scale, text_y_scale, image_angle);
//position
draw_text_transformed(x + x_left_position, y + y_top_position, position, text_x_scale, text_y_scale, image_angle);