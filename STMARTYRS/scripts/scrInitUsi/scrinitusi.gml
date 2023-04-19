enum USI_SECTIONS
{
	PREVENTION_UNIT,TACTIC_UNIT,	
}

enum USI
{ARMAND, DIDIER, LIZA, ERNEST, ROSALIE, JULIEN}



function init_usi()
{
	recapTenseNight = false;
	
	
	usiPatrol = array_create(0);
	nbUsiPatrol = 0;
	
	usi[USI.DIDIER] = {
		section		: USI_SECTIONS.PREVENTION_UNIT,
		disponible			: true,
		_name		:"DIDIER",
		tpsRepos	: 5,					
		tpsPatrol	: 3,
		hbox			: DidierHbxUsi,
		port			: portDidierusi,
	}
	usi[USI.LIZA] = {
		section			: USI_SECTIONS.PREVENTION_UNIT,
		etat				: true,
		_name			: "LIZA",
		tpsRepos		: 72,				
		tpsPatrol		: 7,
		hbox				: DidierHbxUsi,
		port				: portLizausi,
	}
	usi[USI.ROSALIE] = {
		section		: USI_SECTIONS.TACTIC_UNIT,
		disponible			: true,
		_name		: "ROSALIE",
		tpsRepos	: 72,						 
		tpsPatrol	: 7,
		hbox			: DidierHbxUsi,
		port			: portRosalieusi,
	}
	usi[USI.ARMAND] = {
		section		: USI_SECTIONS.TACTIC_UNIT,
		etat			: true,
		_name : "ARMAND",
		tpsRepos	: 72,						
		tpsPatrol	: 7,
		hbox			: DidierHbxUsi,
		port			: portArmandusi,
	}
	usi[USI.ERNEST] = {
		section		: USI_SECTIONS.TACTIC_UNIT,
		etat			: true,
		_name		: "ERNEST",
		tpsRepos	: 72,						 
		tpsPatrol	: 7,
		hbox			: DidierHbxUsi,
		port			: portErnestusi,
	}
	usi[USI.JULIEN] = {
		section		: USI_SECTIONS.PREVENTION_UNIT,
		disponible			: true,
		_name		: "JULIEN",
		tpsRepos	: 5,						
		tpsPatrol	: 20,
		hbox			: DidierHbxUsi,
		port			: portJulienusi,
	}
		
	
	var _nbusi = array_length(usi)
	for (var i = 0; i <  _nbusi;i++)
	{
		//------position------//
		usi[i].x							= 200*i;
		usi[i].y							= 500;			
		usi[i].rot						= noone;				//rotation sur la carte de l'hitbox 
		usi[i].hauteur				= sprite_get_height(usi[i].port);
		//-------menu------//
		usi[i].pressed = false;
	}

}