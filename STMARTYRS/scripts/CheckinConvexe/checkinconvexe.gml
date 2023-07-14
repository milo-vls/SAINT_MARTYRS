/*
THIS FUNCTION RETURN TRUE OR FALSE,
depending on if a given point (the two first arguments) is inside the limits of a convexe polygone.
insert as arguments positions of every points of the convexe following this order:

[point x], [point y], [point x], [point y], [point x], [point y], [point x], [point y], [point x], [point y], ...

there's no limit in the number of points

*/

function point_in_convexe(pointX, pointY, listeDeX, listeDeY)
{
	//check if the number of argument is right
	
	if array_length(listeDeX) == array_length(listeDeY)
	{
		var inConvexe = false;
		//establish how many points/triangles make the convexe
		var nbPoints = array_length(listeDeY);
		var nbTriangles = nbPoints - 2;
		
		//establishes position of every points
		var sommetx = listeDeX;
		var sommety = listeDeY;

		
		//creates a list of triangles composing the convexe
		for  (var i = 0;i < nbTriangles;i++)
		{
			if point_in_triangle(pointX, pointY,   sommetx[0], sommety[0], sommetx[i+1], sommety[i+1], sommetx[i+2], sommety[i+2])
			{
				inConvexe = true;
				i = nbTriangles;
			}
			
		/*	if debug_mode
			{
				show_debug_message(sommetx);
				show_debug_message(sommety);
				draw_set_color(c_blue);
				draw_triangle(sommetx[0], sommety[0], sommetx[i+1], sommety[i+1], sommetx[i+2], sommety[i+2], false);
				draw_set_color(c_black);
			}*/
		}
		
		
		return inConvexe;
	}
	else
	{
		show_message("wrong number arguments");
	}
		
}	
	
function draw_convexe(listeDeX, listeDeY, couleur = noone){
	// Feather disable GM1044
	nbTriangles = array_length(listeDeY) - 2
	
	if array_length(listeDeX) == array_length(listeDeY)
	{
		//establishes position of every points
		var sommetx = listeDeX;
		var sommety = listeDeY;
		for  (var i = 0;i < nbTriangles ;i++)
		{
			if couleur != noone
			{
				draw_set_color(couleur)
			}
			draw_triangle(sommetx[0], sommety[0], sommetx[i+1], sommety[i+1], sommetx[i+2], sommety[i+2], false);
		}
		
	}
	
	
}









