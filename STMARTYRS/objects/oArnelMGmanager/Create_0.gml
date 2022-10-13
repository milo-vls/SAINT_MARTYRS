
//déplacement objets

pas									= 500;		//nombre de pixels à déplacer les moving objects

enum ArnelMG {
	START_ROOM,						//écran accueillant le joueur + consignes de base
	LOADING_STAGE,				//Il y a un niveau par soir 
	LOADING_SEQUENCE,		//Il y a trois séquences par niveau
	END_OF_BLACKSCREEN,
	SHOW_INSTRUCTIONS,
	CONFIRM_START,
	WAIT_FOR_INPUT,
	MOVING_OBJECTS,
	LOST,										//FAIT RECOMMENCER LA SEQUENCE, si input raté
	END_OF_SEQUENCE,
	END_OF_LEVEL,
	
}

enum ArnelMGInstructions {
bas,
droite,
gauche,
haut,
}



#region écriture instructions
ArnelMGSpriteInstruction[ArnelMGInstructions.bas]		= sprArrDown;
ArnelMGSpriteInstruction[ArnelMGInstructions.droite]	= sprArrRight;
ArnelMGSpriteInstruction[ArnelMGInstructions.haut]		= sprArrUp;
ArnelMGSpriteInstruction[ArnelMGInstructions.gauche] = sprArrLeft;

typist		= scribble_typist();
typist.in(0, 10);
#endregion

perdu											= false;	
gagne										= false;//ON PARLE DE LA SEQUENCE !!!
progress									= ArnelMG.START_ROOM;
stage											= ojeu.miniGameStage[MINI_GAME.ARNEL];	// va de 1 à +inf
sequence									= 1;																				// va de 1 à 3, AUGMENTE si séquence réussie
minimumInstructionLength	= 5;
nbSequences							= 3;																				//nombre de séquence durant le niveau
indexInputAReproduire			= 0;																				//augmente de 1à chaque mouvement réussi
inputARepoduire					= [];																				//liste 
entreeJoueur							= noone;																	//Doit être égale à instruction selon l'index d'input à reproduire
//initialise pour chaque séquence la longueur des instructions à reproduire
for (var _sequence = 0; _sequence < nbSequences; _sequence ++)
{
	instructions[_sequence] = "";
	nbInstruction[_sequence] = minimumInstructionLength + stage -1 + _sequence;
	for (var i = 0 ; i < nbInstruction[_sequence]; i++)
	{
		var _randomID = irandom_range(0, 3);
		inputARepoduire[_sequence][i] =  _randomID
		instructions[_sequence] = instructions[_sequence]+"[scale, 0.1]["+sprite_get_name(ArnelMGSpriteInstruction[inputARepoduire[_sequence][i]]) +"][delay, 1000]     " ;
	}
}











