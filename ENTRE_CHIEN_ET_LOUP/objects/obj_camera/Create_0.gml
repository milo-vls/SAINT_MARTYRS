#macro VIEW view_camera[0]
#macro VIEW_VISIBLE view_visible[0]
#macro VIEW_WIDTH camera_get_view_width(VIEW)
#macro VIEW_HEIGHT camera_get_view_height(VIEW)
#macro DEFAULT_CAM_SPEED 15


cam_x_focus = room_width/2;
cam_y_focus = room_height/2;
cam_x_focus_target = cam_x_focus;
cam_y_focus_target = cam_y_focus;
cam_speed = DEFAULT_CAM_SPEED;

zoom_coeff = 1;
zoom_target = -1;
zoom_speed = ZOOM_SPEED_DEFAULT;