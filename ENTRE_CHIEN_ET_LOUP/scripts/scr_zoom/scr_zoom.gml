#macro ZOOM_SPEED_DEFAULT 0.025
#macro MINIMAL_ZOOM 0.25
#macro MAXIMAL_ZOOM 1

function zoom_in(_zoom_speed = ZOOM_SPEED_DEFAULT)
{
	with obj_camera
	{
		var _projected_zoom = max(zoom_coeff - _zoom_speed, MINIMAL_ZOOM);
		zoom_coeff = _projected_zoom;
	}
}

function zoom_out(_zoom_speed = ZOOM_SPEED_DEFAULT)
{
	with obj_camera
	 zoom_coeff = min(zoom_coeff + _zoom_speed, MAXIMAL_ZOOM);
}