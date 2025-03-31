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

image_xscale = 1.5;
image_yscale = image_xscale;