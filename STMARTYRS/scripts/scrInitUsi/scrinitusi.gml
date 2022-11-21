enum USI_STATE
{
DEAD,
RESTING,
AVAILABLE,
NOT_AVAILABLE,
PATROL,

}
enum USI
{ARMAND, DIDIER, LIZA, ERNEST, ROSALIE, JULIEN}

compoUsiDone = false;

function init_usi()
{
	
	usi[USI.DIDIER] = {
		etat			: USI_STATE.AVAILABLE,
		_name		:"DIDIER",
		tpsRepos	: 5,					
		tpsPatrol	: 3,
		hbox			: DidierHbxUsi,
		port			: portDidierusi,
	}
	usi[USI.LIZA] = {
		etat			: USI_STATE.AVAILABLE,
		_name			: "LIZA",
		tpsRepos		: 72,				
		tpsPatrol		: 7,
		hbox				: DidierHbxUsi,
		port				: portLizausi,
	}
	usi[USI.ROSALIE] = {
		etat			: USI_STATE.AVAILABLE,
		_name		: "ROSALIE",
		tpsRepos	: 72,						 
		tpsPatrol	: 7,
		hbox			: DidierHbxUsi,
		port			: portRosalieusi,
	}
	usi[USI.ARMAND] = {
		etat			: USI_STATE.AVAILABLE,
		_name : "ARMAND",
		tpsRepos	: 72,						
		tpsPatrol	: 7,
		hbox			: DidierHbxUsi,
		port			: portArmandusi,
	}
	usi[USI.ERNEST] = {
		etat			: USI_STATE.AVAILABLE,
		_name		: "ERNEST",
		tpsRepos	: 72,						 
		tpsPatrol	: 7,
		hbox			: DidierHbxUsi,
		port			: portErnestusi,
	}
	usi[USI.JULIEN] = {
		etat			: USI_STATE.AVAILABLE,
		_name		: "JULIEN",
		tpsRepos	: 5,						
		tpsPatrol	: 20,
		hbox			: DidierHbxUsi,
		port			: portJulienusi,
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