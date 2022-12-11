


#macro RAYON_LIEU (display_get_gui_width()/70)*_scale


// dessine un lieu visitable et retourne si oui ou non la souris survole le lieu dessiné
function draw_visitable(_index, _scale = 1, _xOrigin=0, _yOrigin=0){
var _lieu = ojeu.lieu[_index];
switch (_lieu.connu)
{
	case CONNAISSANCE_LIEU.JUXTAPOSE:{
		var _x = _xOrigin+(_lieu.xMap*_scale)
		var _y = _yOrigin+(_lieu.yMap*_scale)
		draw_set_alpha(0.8)
		draw_set_color(c_black)
		draw_circle(_x, _y, RAYON_LIEU, false);
		return point_in_circle(mouse_x, mouse_y, _x , _y, RAYON_LIEU);
	}break;
	case CONNAISSANCE_LIEU.VISITE:{
		var _x = _xOrigin+(_lieu.xMap*_scale)
		var _y = _yOrigin+(_lieu.yMap*_scale)
		draw_set_alpha(0.9)
		draw_set_color(c_blue)
		draw_circle(_x, _y, RAYON_LIEU, false);
		return point_in_circle(mouse_x, mouse_y, _x , _y, RAYON_LIEU);
		
	}break;
	case CONNAISSANCE_LIEU.INCONNU:{
		
	}break;
}



}



function draw_visitables(_MapScale = 1, _MapX = 0, _MapY = 0)
{
var _lieux = ojeu.lieu
var _lenLieux = array_length(_lieux)
lieuSurvole = noone;
for(var i = 0; i < _lenLieux; i ++)
{
	if draw_visitable(i, _MapScale, _MapX, _MapY)
	{
		lieuSurvole = i;
	}
}
	
}


