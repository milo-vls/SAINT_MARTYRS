
//ZOOM
if zoom_target != -1
	zoom_coeff = approach(zoom_coeff, zoom_target, zoom_speed);
if zoom_coeff == zoom_target
	zoom_target = -1;
camera_set_view_size(VIEW, room_width * zoom_coeff, room_height * zoom_coeff);



//POSITION
cam_x_focus = approach(cam_x_focus, cam_x_focus_target, cam_speed)
cam_y_focus = approach(cam_y_focus, cam_y_focus_target, cam_speed)


var _cam_x = clamp(cam_x_focus - VIEW_WIDTH/2, 0, room_width - VIEW_WIDTH);
var _cam_y = clamp(cam_y_focus - VIEW_HEIGHT/2, 0, room_height - VIEW_HEIGHT);
camera_set_view_pos(VIEW, _cam_x, _cam_y);