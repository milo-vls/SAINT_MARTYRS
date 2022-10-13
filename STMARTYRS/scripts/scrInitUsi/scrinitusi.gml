enum USI_STATE
{
DEAD,
RESTING,
AVAILABLE,
NOT_AVAILABLE,
PATROL,

}


function init_usi()
{
	usi[0] = {
		etat			: USI_STATE.NOT_AVAILABLE,
		_name		: "usi 0",
		tpsRepos	: 72,
		tpsPatrol	: 7,
		hbox			: DidierHbxUsi,			
		port			: portPlayerusi,
	}
	usi[1] = {
		etat			: USI_STATE.AVAILABLE,
		_name		:"DIDIER",
		tpsRepos	: 5,					
		tpsPatrol	: 3,
		hbox			: DidierHbxUsi,
		port			: portDidierusi,
	}
	usi[2] = {
		etat			: USI_STATE.AVAILABLE,
		_name			: "LIZA",
		tpsRepos		: 72,				
		tpsPatrol		: 7,
		hbox				: DidierHbxUsi,
		port				: portLizausi,
	}
	usi[3] = {
		etat			: USI_STATE.NOT_AVAILABLE,
		_name		: "usi 3",
		tpsRepos	: 72,					
		tpsPatrol	: 7,
		hbox			: DidierHbxUsi,
		port			: portLizausi,
	}
	usi[4] = {
		etat			: USI_STATE.NOT_AVAILABLE,
		_name		: "usi 4",
		tpsRepos	: 72,					
		tpsPatrol	: 7,
		hbox			: DidierHbxUsi,
		port			: portArmandusi,
	}
	usi[5] = {
		etat			: USI_STATE.AVAILABLE,
		_name		: "ROSALIE",
		tpsRepos	: 72,						 
		tpsPatrol	: 7,
		hbox			: DidierHbxUsi,
		port			: portRosalieusi,
	}
	usi[6] = {
		etat			: USI_STATE.AVAILABLE,
		_name : "ARMAND",
		tpsRepos	: 72,						
		tpsPatrol	: 7,
		hbox			: DidierHbxUsi,
		port			: portArmandusi,
	}
	usi[7] = {
		etat			: USI_STATE.NOT_AVAILABLE,
		_name		: "usi 7",
		tpsRepos	: 72,						
		tpsPatrol	: 7,
		hbox			: DidierHbxUsi,
		port			: portErnestusi,
	}
	usi[8] = {
		etat			: USI_STATE.NOT_AVAILABLE,
		_name		: "usi 8",
		tpsRepos	: 72,						 
		tpsPatrol	: 7,
		hbox			: DidierHbxUsi,
		port			: portErnestusi,
	}
	usi[9] = {
		etat			: USI_STATE.AVAILABLE,
		_name		: "ERNEST",
		tpsRepos	: 72,						 
		tpsPatrol	: 7,
		hbox			: DidierHbxUsi,
		port			: portErnestusi,
	}
	usi[10] = {
		etat			: USI_STATE.AVAILABLE,
		_name		: "JULIEN",
		tpsRepos	: 5,						
		tpsPatrol	: 20,
		hbox			: DidierHbxUsi,
		port			: portJulienusi,
	}
	usi[11] = {
		etat			: USI_STATE.NOT_AVAILABLE,
		_name		: "usi 11",
		tpsRepos	: 72,						
		tpsPatrol	: 7,
		hbox			: DidierHbxUsi,
		port			: portErnestusi,
	}
		
	var _nbusi = array_length(usi)
	for (var i = 0; i <  _nbusi;i++)
	{
		usi[i].retireDate			= noone;				//date à laquelle l'objet usi se supprimera
		usi[i].dispoDate			= noone;				//date à partir de laquelle l'usi sera disponible
		//------position------//
		usi[i].x							= noone;
		usi[i].y							= noone;			
		usi[i].rot						= noone;				//rotation sur la carte de l'hitbox 
		usi[i].hauteur				= sprite_get_height(usi[i].port);
	}


}