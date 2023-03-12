// runs during create event of ojeu 
function init_personnages(){
	
enum p
{
	player,
	Armand,
	Didier,
	Ernest,
	Liza,
	Julien,
	Rosalie,
	Enzino, 
	Martine,
	Incel,
	Amandine,
	ryuto,
}

#macro PREMIER_PNJ p.Enzino
#macro DERNIER_USI p.Rosalie

#region USI
	global.char[p.player] =	{
		colFnt : c_white,
		portrait : portPlayer,
		name : "Blaise",
		col : make_color_rgb(232, 217, 197),
		room : noone,
		spr : noone,
		num : -666,
		enPossession : false,
		phoneID : "phoneID",
		voice : [snBlaiseVoice1],
	}
	global.char[p.Armand] =	{
	colFnt : c_red,
	portrait : portArmand,
	name : "Armand",
	room : ptestexplo1,
	dialID : "test NPC talk",
	col : noone,
	spr : noone,
	num : 101991,
	enPossession : false,
	phoneID : "phoneID",
	voice :  [ voice_test_0],
	};
	global.char[p.Didier] =	{
		colFnt : c_red,
		portrait : portDidier,
		name : "Didier",
		room : noone,
		dialID : "test NPC talk",
		col : noone,
			
		spr : noone,
		num : 107983,
		enPossession : false,
		phoneID : "phoneID",
		voice :  [ voice_test_0],
	}
	global.char[p.Ernest] =	{
		colFnt : c_red,
		portrait : portErnest,
		name : "Ernest",
		room : ptestexplo1,
		dialID : "test NPC talk",
		col : noone,
			
		//numéro téléphone
		spr : noone,
		num : 113971,
		enPossession : false,
		phoneID : "répondeur Ernest",
		voice :  [ voice_test_0],
	}	
	global.char[p.Liza]	=	{
		colFnt : c_red,
		portrait : portLiza,
		name : "Liza",
		room : noone,
		dialID : "test NPC talk",
		col : noone,
	
		spr : noone,
		num : 131967,
		enPossession : false,
		phoneID : "phoneID",	
		voice :  [ voice_test_0],
	}
	global.char[p.Julien]	=	{
		colFnt : c_red,
		portrait : portJulien,
		name : "Julien",
		room : noone,
		dialID : p.Julien,
		col : noone,
	
		spr : noone,
		num : 131967,
		enPossession : false,
		phoneID : "phoneID",	
		voice :  [ voice_test_0],
	}
	global.char[p.Rosalie]	=	{
		colFnt : c_red,
		portrait : portRosalie,
		name : "Rosalie",
		room : noone,
		dialID : p.Rosalie,
		col : noone,
	
		spr : noone,
		num : 131967,
		enPossession : false,
		phoneID : "phoneID",	
		voice : [ voice_test_0],
	}		
#endregion

#region EN VILLE
	global.char[p.Martine]	=	{
		colFnt : c_white,
		portrait : portMartine,
		name : "Martine",
		room : P_FAKE_RUE_BLUE,
		dialID : p.Martine,
		col : noone,
		voice : [ voice_test_0],
		spr : noone,
		num : 1324876,
		enPossession : false,
		phoneID : "phoneID",	
				//icone map
		mapIcone : mapIconeMartine,
		mapX : noone,
		mapY : noone,
	
	}
	global.char[p.Enzino]	=	{
		colFnt : c_white,
		portrait : portEnzino,
		name : "Enzino",
		room : P_RUE_BLUE,
		dialID : p.Enzino,
		col : noone,
	
		spr : noone,
		num : 1324876,
		enPossession : false,
		phoneID : "phoneID",	
		voice :  [ voice_test_0],
			//icone map
		mapIcone : noone,
		mapX : noone,
		mapY : noone,
	}
	global.char[p.Incel]	=	{
		colFnt : c_white,
		portrait : portHenryVille,
		name : "???",
		room : P_FRONT_BENCH,
		dialID : p.Incel,
		col : noone,
	
		spr : noone,
		num : 1324876,
		enPossession : false,
		phoneID : "phoneID",	
		voice :  [voice_test_0],
				//icone map
		mapIcone : noone,
		mapX : noone,
		mapY : noone,
	}
	global.char[p.Amandine]	=	{
		colFnt : c_white,
		portrait : portAmandine,
		name : "???",
		room : P_AMANDINE_DEADEND,
		dialID : p.Amandine,
		col : noone,
		spr : noone,
		num : 1324876,
		enPossession : false,
		phoneID : "phoneID",	
		voice :  [voice_test_0],
//icone map
		mapIcone : noone,
		mapX : noone,
		mapY : noone,
	}
	global.char[p.ryuto]	=	{
		colFnt : c_white,
		portrait : Sprite159,
		name : "Martine",
		room : P_FAKE_RUE_BLUE,
		dialID : p.Martine,
		col : noone,
		voice : [ voice_test_0],
		spr : noone,
		num : 1324876,
		enPossession : false,
		phoneID : "phoneID",	
				//icone map
		mapIcone : mapIconeMartine,
		mapX : noone,
		mapY : noone,
	
	}
#endregion




#region valeurs par défauts 
	nbPersonnages = array_length(global.char);
	ftRep = ftRepertoire
	draw_set_font(ftRep);

	for (var i = 0; i < nbPersonnages; i ++)
	{
		
		if global.char[i].spr != noone
		{
			global.char[i].hauteur = sprite_get_height(global.char[i].spr);
		}
		else
		{
			global.char[i].hauteur = string_height(string(global.char[i].num));
		}
	
		global.char[i].y									= noone;
		global.char[i].page							= noone;
		//dialogues relative
		global.char[i].proximite					= 0;
		global.char[i].nbInteractionCeJour	= 0;
		global.char[i].imageIndexStopTalk	= 0;

	}	
		
#endregion

#region OTHER MACROS
#macro BLAISES_NEUTRAL_FACE 0
#macro BLAISES_SMILING_FACE 3

#endregion

}






