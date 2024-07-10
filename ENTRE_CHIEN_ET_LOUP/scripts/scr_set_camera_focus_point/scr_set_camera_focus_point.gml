function set_camera_focus_point(_x, _y, _cam_focus_locked)
{
	with obj_camera
	{
		cam_x_focus = _x;
		cam_y_focus = _y;
		cam_focus_locked = _cam_focus_locked
	}
}

function cam_lock(_bool)
{
	obj_camera.cam_focus_locked = _bool;
}