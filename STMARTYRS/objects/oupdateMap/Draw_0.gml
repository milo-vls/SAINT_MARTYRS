global.inputOn = false;
draw_set_alpha(1);

if global.alphaBlackScreen == 0
{
	x += 20;
}
wRec = 20;
draw_rectangle_color(x - wRec/2, 0, x + wRec/2, room_height, c_green, c_green, c_green, c_green, false);

//vérification de nouveaux meurtres

maj_meurtre();

//-----------création icônes des pnj le jour-----------------------//

maj_npc();

//fin de la mise à jour de la carte, destruction de l'objet (voir l'event destroy)

if x > room_width
{
	instance_destroy();
	global.inputOn = true;
	with ousi
	{
		ojeu.usi[usiID].stam = 0;
		instance_destroy();
	}
}