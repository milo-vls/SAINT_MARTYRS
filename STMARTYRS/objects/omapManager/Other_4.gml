
fonduNoirTar = 0;
fonduNoir = 0;

if ojeu.tenseNight
{
	var _layId = layer_get_id("Background");
	var _id = layer_background_get_id(_layId);
	layer_background_sprite(_id, bg_tense_night);
}

load_usi();
maj_npc();
load_psc();