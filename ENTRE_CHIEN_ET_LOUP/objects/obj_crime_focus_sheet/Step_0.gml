if shown 
{
	shown_animation_timer ++;
}
else
{
	shown_animation_timer --;
}
shown_animation_timer = clamp(shown_animation_timer, 0, shown_animation_duration);
 
var _duration_quotient = shown_animation_timer/shown_animation_duration;
var _animation_quotient = animcurve_channel_evaluate(shown_animation_animcurve_channel, _duration_quotient);

x = hidden_x + horizontal_sign * (horizontal_distance * _animation_quotient);
y = hidden_y + (vertical_distance * _animation_quotient);
image_angle = hidden_angle + horizontal_sign * (angle_diff * _animation_quotient);

shown = false;