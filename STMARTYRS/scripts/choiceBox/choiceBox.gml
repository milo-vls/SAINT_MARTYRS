// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function createChoiceBox(name1, command1, name2=noone, command2=noone, name3=noone, command3=noone, name4=noone, command4=noone, name5=noone, command5=noone)
{
	var _depth = DEPTH_TEXT;
	if !instance_exists(ochoiceBox)
	{
		with instance_create_depth(0,0,_depth-1, ochoiceBox)
		{
			choice[0] = {
				txt : name1,
				command : command1,
			}
			choice[1] = {
				txt : name2,
				command : command2,
			}
			choice[2] = {
				txt : name3,
				command : command3,
			}
			choice[3] = {
				txt : name4,
				command : command4,
			}
			choice[4] = {
				txt : name5,
				command : command5,
			}
		}
	}
}