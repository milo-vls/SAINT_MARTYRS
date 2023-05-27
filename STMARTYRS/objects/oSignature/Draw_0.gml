
if drawHighlight
{
	draw_set_alpha(0.5);
	draw_set_color(c_white);
	draw_rectangle(x, y, x + largeurCadre, y + hauteurCadre, false);
}

if drawProgress
{
	var _valeurCourbe = animcurve_channel_evaluate(courbe, quotienParcours);
	draw_set_alpha(_valeurCourbe)
	draw_healthbar(x, y, x + largeurCadre-1, y + hauteurCadre-1, 100 * _valeurCourbe, c_black, c_blue, c_blue, 0, false, false);
}

if drawSignature
{
	draw_set_alpha(1);
	var _valeurCourbe = animcurve_channel_evaluate(courbe, quotienParcoursSignature);
	var _lSprite = sprite_get_width(sprBlaiseSignature);
	var _hSprite = sprite_get_height(sprBlaiseSignature);
	var _xScale = largeurCadre/_lSprite;
	var _yScale = hauteurCadre/_hSprite;
	var _largeur = (_lSprite * _xScale) * _valeurCourbe*1.4;
	draw_sprite_part_ext(sprBlaiseSignature, 0, 0, 0,  _largeur, _hSprite, x, y, _xScale, _yScale, -1, 1);
}

draw_set_alpha(1);
draw_self();
