draw_set_alpha(1);

draw_self();

draw_set_color(c_black); draw_set_font(fnt_dialogues);
draw_text_ext_transformed(text_coordinates_x, text_coordinates_y, "(" + string(int64(room_x_to_map_x(mouse_x))) + " x " + string(int64(room_y_to_map_y(mouse_y))) + ")", 0, -1, 0.65, 0.8, text_rotation);
