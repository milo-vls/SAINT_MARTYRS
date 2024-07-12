function set_camera_focus_point(_x, _y, _cam_focus_locked)
{
	with obj_camera
	{
		cam_x_focus_target = _x;
		cam_y_focus_target = _y;
		cam_focus_locked = _cam_focus_locked
	}
}
function set_cam_pos(_x, _y)
{
	with obj_camera
	{
		cam_x_focus = _x;
		cam_y_focus = _y;
	}
}
function set_cam_speed(_cam_speed)
{
	obj_camera.cam_speed = _cam_speed;
}
function cam_lock(_bool)
{
	obj_camera.cam_focus_locked = _bool;
}