enum TASK_TYPE
{
	USI_DEATH, 
	GO_TO_ROOM, 
	DIALOGUE
	}

array_create(0, mapTasks)

function task_add_usi_death()
{
	
	ojeu.mapTasks[ojeu.nbTasks] = {
	type : TASK_TYPE.USI_DEATH, 	
	}
	nbTasks ++;
}

function task_add_dialogue(_dialogueId)
{
	ojeu.mapTasks[ojeu.nbTasks] ={
		type : TASK_TYPE.DIALOGUE,
		dialogueId : _dialogueId
	}
}
