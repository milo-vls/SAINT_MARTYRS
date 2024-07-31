function screen_shake(_force, _rad_angle)
{
	with obj_camera
	{
		shake_force = _force;
		shake_angle = _rad_angle
	}
}