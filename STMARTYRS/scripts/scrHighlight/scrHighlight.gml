function drawRectangleHighLight(_x1, _y1, _x2, _y2, _colour, _alpha)
{
	draw_set_alpha(_alpha);
	
	draw_rectangle_color(0, 0, _x1, GAME_HEIGHT, _colour, _colour, _colour, _colour, false);		//gauche
	draw_rectangle_color(_x1, 0, GAME_WIDTH, _y1, _colour, _colour, _colour, _colour, false);	//haut
	draw_rectangle_color(_x1, _y1, GAME_WIDTH, GAME_HEIGHT, _colour, _colour, _colour, _colour, false);	//bas
	draw_rectangle_color(_x2, 0, GAME_WIDTH, , _colour, _colour, _colour, _colour, false);	//droite
}