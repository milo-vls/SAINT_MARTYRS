enum OBSERVABLE
{TEST_OBS,
}
enum CLICKABLE
{CARTE,
}
function init_objects()
begin





ClickObj[CLICKABLE.CARTE] = {
	room : ptestexplo2,
	event : function()
	{
		createChoiceBox("consulter la carte", GoToMap, "Annuler", instance_destroy);
	}
}





obsObj[OBSERVABLE.TEST_OBS] = {
	room : ptestexplo2,
	obsID : "obsID test",
}
	
	
	

end