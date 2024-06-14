draw_set_alpha(1); draw_set_halign(fa_left); draw_set_valign(fa_top); draw_set_color(c_white);
draw_self();

if !surface_exists(surface_sheet)
	surface_sheet = surface_create(surface_width, surface_height);
surface_set_target(surface_sheet);
draw_clear_alpha(c_black, 0);



//crime id
draw_set_color(c_black); draw_set_font(fnt_dialogues);
draw_text_transformed(text_crime_id_x, text_crime_id_y, text_crime_id, text_crime_id_scale, text_crime_id_scale, 0);

//victim's face
draw_sprite_stretched(spr_victim_face, 0, spr_victim_face_x, spr_victim_face_y, spr_victim_face_width, spr_victim_face_width);


//change color
if obj_malus_canvas.confusion_on
{
	mouse_over_change_color = instance_position(mouse_x, mouse_y, obj_crime_focus_sheet);
	var _change_color_blend_color;
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
	
	scribble_change_color.blend(_change_color_blend_color).draw(x_center_scribble_change_color, y_top_scribble_change_color);
	scribble_anim_reset();
}


surface_reset_target();
//draw_rectangle(x + surface_left_x, y + surface_top_y, x + surface_left_x + surface_width, y + surface_top_y + surface_height, true);
draw_surface_ext(surface_sheet,x + surface_left_x, y + surface_top_y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);


/*
if obj_malus_canvas.confusion_on
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