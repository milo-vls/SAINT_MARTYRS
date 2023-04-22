
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
		voice : [snBlaiseVoice1],
	}
	global.char[p.Armand] =	{
	colFnt : c_red,
	portrait : portArmand,
	name : "Armand",
	room : ptestexplo1,
	dialID : "test NPC talk",
	col : noone,
	voice :  [ voice_test_0],
	};
	global.char[p.Didier] =	{
		colFnt : c_red,
		portrait : portDidier,
		name : "Didier",
		room : noone,
		dialID : "test NPC talk",
		col : noone,
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
		voice :  [ voice_test_0],
	}	
	global.char[p.Liza]	=	{
		colFnt : c_red,
		portrait : portLiza,
		name : "Liza",
		room : noone,
		dialID : "test NPC talk",
		col : noone,
		voice :  [ voice_test_0],
	}
	global.char[p.Julien]	=	{
		colFnt : c_red,
		portrait : portJulien,
		name : "Julien",
		room : noone,
		dialID : p.Julien,
		col : noone,
		voice :  [ voice_test_0],
	}
	global.char[p.Rosalie]	=	{
		colFnt : c_red,
		portrait : portRosalie,
		name : "Rosalie",
		room : noone,
		dialID : p.Rosalie,
		col : noone,
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
		voice :  [voice_test_0],
//icone map
		mapIcone : noone,
		mapX : noone,
		mapY : noone,
	}

#endregion

nbPersonnages = array_length(global.char);

for (var i = 0; i < nbPersonnages; i ++)
{
	global.char[i].proximite					= 0;
	global.char[i].nbInteractionCeJour	= 0;
	global.char[i].imageIndexStopTalk	= 0;
}	
		


#region OTHER MACROS
#macro BLAISES_NEUTRAL_FACE 0
#macro BLAISES_SMILING_FACE 3

#endregion

}
