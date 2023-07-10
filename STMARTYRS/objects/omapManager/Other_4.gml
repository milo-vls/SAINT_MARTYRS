
//fonduNoirTar = 0;
//fonduNoir = 0;
layer_background_visible(layer_background_get_id(layer_get_id("Background2")), false);
time_source_reset(minuterieTenseNight);
time_source_pause(minuterieTenseNight);

if ojeu.tenseNight
{
	instance_destroy(oPanneauLateral);
	var _layId = layer_get_id("Background");
	var _id = layer_background_get_id(_layId);
	layer_background_visible(_id, false);
	layer_background_visible(layer_background_get_id(layer_get_id("Background2")), true);
	currentNightDiff = new setNightDiff(4, [PATTERN.RECTILIGNE], 0, 0, 60, 7);
	
	var _endOfTenseNight = function ()
	{
		instance_destroy(ocrime);
		ojeu.tenseNight = false;
		dormir();	
	}
	minuterieTenseNight	= time_source_create(time_source_game, currentNightDiff.dureeSeconde, 0 , _endOfTenseNight, [1], -1);

	
	
	
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