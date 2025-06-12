#macro CURSOR_X obj_computer_cursor.x
#macro CURSOR_Y obj_computer_cursor.y


enum COMPUTER_CURSOR_STATES
{
	DEFAULT, 
	HANDPOINT, 
	RESIZE_N_S,
	RESIZE_NE_SW,
	RESIZE_NW_SE,
	RESIZE_W_E,
	MOVE_CROSS,
}
state = COMPUTER_CURSOR_STATES.DEFAULT;

instance_id_focus = noone;


///@param {Id.instance} _new_instance_id
change_instance_id_focus = function(_new_instance_id)
{
	self.instance_id_focus = _new_instance_id;
	if _new_instance_id != noone
		_new_instance_id.when_getting_focus();
}

image_xscale = 1.5;
image_yscale = image_xscale;