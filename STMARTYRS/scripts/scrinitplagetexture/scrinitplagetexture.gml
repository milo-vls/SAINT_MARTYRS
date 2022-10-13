
function init_plage_texture(){
	activeTexturePlage = [];		//à sauvegarder pour savoir quoi charger lors d'une reprise de partie
	enum PLAGE_TEXTURE
	{
		GENDARMERIE,
		CARTE,
		UI_DIALOGUES,
		VILLE_ZONE_1,
		VILLE_ZONE_2,
		VILLE_ZONE_3,
		VILLE_ZONE_4,
		GENERAL_EXPLORATION,
	}
	plageTexture[PLAGE_TEXTURE.UI_DIALOGUES] = [sprBulle, sprBulle2, sprAnsIcone, sprArr];
	plageTexture[PLAGE_TEXTURE.CARTE] = [sprMap, sprCrime, sprrotateUsi, sprtrash, sprPaneauUsi, sprChangepscCol, sprCadreUsi, sprCadreUsiDead, sprCadreUsiPlaced, sprCadreUsiRest, sprBackGendarmerie];                                                             
}