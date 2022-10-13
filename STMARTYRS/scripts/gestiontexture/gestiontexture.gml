//gestion de quelle plages employé et lesquelles supprimer en fonction de la zone pénétrée

function chargementPlageTexture(plageSpriteID){

var _toLoad = [];

switch (plageSpriteID) {
    case PLAGE_TEXTURE.GENDARMERIE:{
		sprite_flush_multi(PLAGE_TEXTURE.VILLE_ZONE_1);
		sprite_flush_multi(PLAGE_TEXTURE.VILLE_ZONE_2);
		sprite_flush_multi(PLAGE_TEXTURE.VILLE_ZONE_3);
		sprite_flush_multi(PLAGE_TEXTURE.VILLE_ZONE_4);
       _toLoad = ojeu.plageTexture [PLAGE_TEXTURE.GENDARMERIE];
	   _toLoad =+ ojeu.plageTexture[PLAGE_TEXTURE.UI_DIALOGUES];
	   
	   ojeu.activeTexturePlage = [PLAGE_TEXTURE.GENDARMERIE, PLAGE_TEXTURE.UI_DIALOGUES];
	   
	}break;
	case PLAGE_TEXTURE.UI_DIALOGUES:{
		_toLoad = ojeu.plageTexture[PLAGE_TEXTURE.UI_DIALOGUES]
	}break;
	case PLAGE_TEXTURE.VILLE_ZONE_1:{
	
	
	}break;
	default:{
	 _toLoad = noone;
	}break;
}	

sprite_prefetch_multi(_toLoad);


}
