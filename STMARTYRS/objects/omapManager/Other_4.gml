
//fonduNoirTar = 0;
//fonduNoir = 0;
layer_background_visible(layer_background_get_id(layer_get_id("Background2")), false);
if ojeu.tenseNight
{
	instance_destroy(oPanneauLateral);
	var _layId = layer_get_id("Background");
	var _id = layer_background_get_id(_layId);
	layer_background_visible(_id, false);
	layer_background_visible(layer_background_get_id(layer_get_id("Background2")), true);
	currentNightDiff = new setNightDiff(8, [PATTERN.RECTILIGNE], 0, 0, 120, 5);
	
	var _endOfTenseNight = function ()
	{
		ojeu.tenseNight = false;
		dormir();	
	}
	minuterieTenseNight	= time_source_create(time_source_game, currentNightDiff.dureeSeconde, time_source_units_seconds, _endOfTenseNight, [1], -1);
	time_source_start(minuterieTenseNight);
	
	
	
	if array_length(crimeProc) == 0
	{
		tueurProc = killerProceduralGeneration(currentNightDiff);
		nbTueurProc = array_length(tueurProc);
	
		for (var _tueur = 0; _tueur < nbTueurProc; _tueur ++)
		{
			array_push_array(crimeProc, crimeProceduralGeneration(_tueur))
		}
	}
	
	
	ojeu.recapTenseNight = false;
	
}

load_usi();
maj_npc();
load_psc();