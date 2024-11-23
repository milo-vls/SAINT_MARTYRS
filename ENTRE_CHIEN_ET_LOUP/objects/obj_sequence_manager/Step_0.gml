if nb_steps == step_id
{
	current_sequence = noone;
}

if  current_sequence != noone
{
	if step_started == false
	{
		method_call(current_sequence.steps[step_id].step_method, current_sequence.steps[step_id].arguments);
		step_started = true;
	}
	if current_sequence.steps[step_id].is_step_finished() == true
	{
		step_id ++;
		step_started = false;
	}
}