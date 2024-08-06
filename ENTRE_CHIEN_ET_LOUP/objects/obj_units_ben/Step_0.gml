//y = approach(y, !shown ? origin_y - ( ? 80 : 0) : hidden_y, SHIFTING_SPEED*4);

var _y_target = UNITS_BEN_HIDDEN_Y;
if !shown
{
	_y_target = origin_y;
}
if position_meeting(mouse_x, mouse_y, self)
	_y_target -= 80;
y = approach(y, _y_target, SHIFTING_SPEED);

shown = false;

