enum TASK_TYPE
{
	USI_DEATH, 
	GO_TO_ROOM, 
	DIALOGUE
}
function init_map_tasks()
{
	nbTasks = 0
	mapTasks = array_create(0)
}

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
	nbTasks ++;
}
