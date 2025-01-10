function start_observation_by_text(_text)
{
	start_observation(new ObservationMenu(_text));
}

function start_observation(_observation_menu)
{
	add_menu(_observation_menu);
}