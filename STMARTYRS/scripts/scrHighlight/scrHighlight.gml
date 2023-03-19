function drawRectangleHighLight(_x1, _y1, _x2, _y2, _colour, _alpha)
{
	draw_set_alpha(_alpha);
	
	draw_rectangle_color(0, 0, _x1, GAME_HEIGHT, _colour, _colour, _colour, _colour, false);		//gauche
	draw_rectangle_color(_x1+1, 0, _x2-1, _y1, _colour, _colour, _colour, _colour, false);	//haut
	draw_rectangle_color(_x1+1, _y2, _x2-1, GAME_HEIGHT, _colour, _colour, _colour, _colour, false);	//bas
	draw_rectangle_color(_x2, 0, GAME_WIDTH, GAME_HEIGHT, _colour, _colour, _colour, _colour, false);	//droite
}