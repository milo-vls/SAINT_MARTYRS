#macro ZOOM_SPEED_DEFAULT 0.025
#macro MINIMAL_ZOOM 0.25
#macro MAXIMAL_ZOOM 1

function zoom_in(_zoom_speed = ZOOM_SPEED_DEFAULT)
{
	var _projected_zoom = max(obj_camera.zoom_coeff - _zoom_speed, MINIMAL_ZOOM);
	obj_camera.zoom_coeff = _projected_zoom;
	return _projected_zoom;
}

function zoom_out(_zoom_speed = ZOOM_SPEED_DEFAULT)
{
	var _projected_zoom = obj_camera.zoom_coeff + _zoom_speed;
	obj_camera.zoom_coeff = min(_projected_zoom, MAXIMAL_ZOOM);
	return _projected_zoom;
}

function zoom(_zoom_speed)
{
	var _projected_zoom = obj_camera.zoom_coeff + _zoom_speed;
	obj_camera.zoom_coeff = clamp(_projected_zoom , MINIMAL_ZOOM, MAXIMAL_ZOOM);
	return _projected_zoom;
}

function set_camera_zoom_target()
{
	
}