//---EFFET DE FLOU
blurFx = fx_create("_filter_large_blur")
blurLayer = layer_get_id("npc");



#macro RETOUR_GENDARMERIE_X 0
#macro RETOUR_GENDARMERIE_Y (GAME_HEIGHT - sprite_get_height(sprRetourGendarmerie))
if (showButtonRetourCarte or global.lastRoom == pcarte) and peutAllerGendarmerie and room != pcarte
{
	instance_create_depth(RETOUR_GENDARMERIE_X, RETOUR_GENDARMERIE_Y, DEPTH_OJEU - 1, oRetourCarte);	
}
