
fonduNoirTar = 0;
fonduNoir = 0;

if ojeu.tenseNight
{
	var _layId = layer_get_id("Background");
	var _id = layer_background_get_id(_layId);
	layer_background_sprite(_id, bg_tense_night);
	
	currentNightDiff = new setNightDiff(8, [PATTERN.RECTILIGNE], 0, 0, 120, 5);
	
	var _endOfTenseNight = function ()
	{
		ojeu.tenseNight = false;
		dormir();	
	}
	minuterie	= time_source_create(time_source_game, currentNightDiff.dureeSeconde, time_source_units_seconds, _endOfTenseNight, [1], -1);
	dateStartTenseNight = global.currentDate;
	time_source_start(minuterie);
	
	
	
	if array_length(crimeProc) == 0
	{
		tueurProc = killerProceduralGeneration(currentNightDiff);
		nbTueurProc = array_length(tueurProc);
	
		for (var _tueur = 0; _tueur < nbTueurProc; _tueur ++)
		{
			array_push_array(crimeProc, crimeProceduralGeneration(_tueur))
		}
	}
	
	

	
}

load_usi();
maj_npc();
load_psc();