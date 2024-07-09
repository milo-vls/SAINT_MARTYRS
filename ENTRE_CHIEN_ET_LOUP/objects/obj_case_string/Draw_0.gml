

if debug_mode
	draw_self();
	
//crimes coordinates 
var _crime_src_x = crime_instance_id_src.x;
var _crime_src_y = crime_instance_id_src.y;
var _crime_dst_x = crime_instance_id_dst.x;
var _crime_dst_y = crime_instance_id_dst.y;
var _crimes_distance = point_distance(_crime_src_x, _crime_src_y, _crime_dst_x, _crime_dst_y);
var _crimes_angle = point_direction(_crime_src_x, _crime_src_y, _crime_dst_x, _crime_dst_y);


//SETTING STRING LENGTH
var _duration_quotient = deployment_timer/deployment_duration;
switch(deployment_state)
{
	case CASE_STRING_DEPLOYMENT_STATE.WAITING_FOR_DEPLOYMENT :
		deployment_timer = 0;
		if crime_instance_id_src.instance_coming_string_id != noone
		{
			if crime_instance_id_src.instance_coming_string_id.deployment_state == CASE_STRING_DEPLOYMENT_STATE.DEPLOYMENT_DONE
				deployment_state = CASE_STRING_DEPLOYMENT_STATE.DEPLOYMENT_STARTED;
		}
		else
			deployment_state = CASE_STRING_DEPLOYMENT_STATE.DEPLOYMENT_STARTED;
	break;
	case CASE_STRING_DEPLOYMENT_STATE.DEPLOYMENT_STARTED :
		deployment_timer ++;
		if deployment_timer >= deployment_duration
			deployment_state = CASE_STRING_DEPLOYMENT_STATE.DEPLOYMENT_DONE;
	break;
	case CASE_STRING_DEPLOYMENT_STATE.DEPLOYMENT_DONE :
		if to_be_destroyed
			deployment_state = CASE_STRING_DEPLOYMENT_STATE.DESTROYING;
	break;
	case CASE_STRING_DEPLOYMENT_STATE.DESTROYING :
		deployment_timer --;
		if deployment_timer <= 0
			instance_destroy();
	break;
}
var _deployment_quotient = animcurve_channel_evaluate(deployment_animcurve_channel, _duration_quotient);

string_y_scale = (_crimes_distance/string_sprite_height) * _deployment_quotient;
var _angle = _crimes_angle + angle_ajustement;
draw_sprite_ext(string_sprite, 0, _crime_src_x, _crime_src_y, 0.25, string_y_scale, _angle, color, 0.8);


//SMOKE EFFECT
if deployment_timer > 0 and deployment_timer < deployment_duration
{
    var _x_end = _crime_src_x + lengthdir_x(string_y_scale * string_sprite_height, _crimes_angle);
    var _y_end = _crime_src_y + lengthdir_y(string_y_scale * string_sprite_height, _crimes_angle);
    var _part_sys = part_system_create(ps_smoke_following_string);
	
    part_system_position(_part_sys, _x_end, _y_end);
}



