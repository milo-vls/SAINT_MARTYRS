draw_set_alpha(1);
draw_self();
txtScribble.blend( !position_meeting(mouse_x, mouse_y, self) ? c_white : c_yellow).draw(x + marge, y + marge/2);