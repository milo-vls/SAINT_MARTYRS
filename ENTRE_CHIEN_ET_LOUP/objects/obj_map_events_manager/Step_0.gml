var _map_steps_lenght = array_length(global.map_steps);

if _map_steps_lenght == 0
{
	return;	
}
var _step = global.map_steps[0];
if !step_started
{
	
	method_call(_step.step_method, _step.arguments);
	step_started = true;
}
if _step.is_step_finished() == true
{
	step_started = false;
	array_delete(global.map_steps, 0, 1);
}
