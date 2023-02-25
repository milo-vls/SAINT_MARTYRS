 //-------observation rue
draw_set_alpha(1);

if instance_exists(olimiteRue)
for (var i = 0;i < nbRue;i ++)
{
	//établir la liste des points
	
	var _listX = [noone];
	var _listY = [noone];
	var _nbCoordo =  array_length(rue[i]);
	for (var j = 0;j < _nbCoordo;j ++)
	{
		_listX[j] = rue[i][j].x;
		_listY[j] = rue[i][j].y;
	}
	//la souris du joueur est elle dans une rue ?
	if point_in_convexe(mouse_x, mouse_y, _listX, _listY)
	{
		
		draw_sprite_stretched(rue[i][0].spriteRueAssocie, 0, 0, 0, 75, 100);
		
		draw_set_alpha(0.2);
		draw_convexe( _listX, _listY, c_blue);
		
	}
	
}

