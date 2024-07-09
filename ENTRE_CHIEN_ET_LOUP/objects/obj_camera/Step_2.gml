camera_set_view_size(VIEW, room_width * zoom_coeff, room_height * zoom_coeff);

cam_x_focus = mouse_x;
cam_y_focus = mouse_y;

var _cam_x = clamp(cam_x_focus - VIEW_WIDTH/2, 0, room_width - VIEW_WIDTH);
var _cam_y = clamp(cam_y_focus - VIEW_HEIGHT/2, 0, room_height - VIEW_HEIGHT);
camera_set_view_pos(VIEW, _cam_x, _cam_y);