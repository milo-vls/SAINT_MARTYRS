function npc_pressed()
{
	start_dialogue(nickname, "Start" + nickname);
	get_character_by_nickname(nickname).nb_interactions_today ++;
}

function npc_activity_parallelism()
{

}

function npc_activity_no_parallelism()
{
	
}