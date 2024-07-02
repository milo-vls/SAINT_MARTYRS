switch(state)
{
	case COMPUTER_CURSOR_STATES.DEFAULT :
	{
		sprite_index = spr_computer_cursor_default
	}
	break;
	case COMPUTER_CURSOR_STATES.HANDPOINT :
	{
		sprite_index = spr_computer_cursor_handpoint;
	}
	break;
	case COMPUTER_CURSOR_STATES.MOVE_CROSS :
	{
		sprite_index = spr_computer_cursor_move_cross;
	}
	break;
	case COMPUTER_CURSOR_STATES.RESIZE_NE_SW :
	{
		sprite_index = spr_computer_cursor_resize_ne_sw;
	}
	break;
	case COMPUTER_CURSOR_STATES.RESIZE_NW_SE :
	{
		sprite_index = spr_computer_cursor_resize_nw_se;
	}
	break;
	case COMPUTER_CURSOR_STATES.RESIZE_N_S :
	{
		sprite_index = spr_computer_cursor_resize_n_s;
	}
	break;
	case COMPUTER_CURSOR_STATES.RESIZE_W_E :
	{
		sprite_index = spr_computer_cursor_resize_w_e;
	}
	break;
}
//state = COMPUTER_CURSOR_STATES.DEFAULT;
draw_self();