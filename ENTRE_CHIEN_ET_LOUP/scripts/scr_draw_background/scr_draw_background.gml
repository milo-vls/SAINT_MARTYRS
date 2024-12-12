
function draw_background(_background_index)
{
	
	
switch _background_index
{
	case -1: break;
	case 1:
		draw_set_alpha(0.9); draw_set_color(c_white);
		draw_sprite(spr_dialogue_background, 0, 0, 0);
	break;
	case 2:
		draw_set_alpha(1); draw_set_color(c_black);
		draw_rectangle(0, 0, GAME_WIDTH, GAME_HEIGHT, false);
	break;
	case 3:
		draw_set_alpha(0.9); draw_set_color(c_black);
		draw_rectangle(0, 0, GAME_WIDTH, GAME_HEIGHT, false);
	break;
}


}