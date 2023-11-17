if nb_steps == step_id
{
	SEQUENCE = noone
;}

if  SEQUENCE != noone
{
	if step_started == false
	{
		method_call(STEP.step_method, STEP.arguments);
		step_started = true;
	}
	if STEP.is_step_finished() == true
	{
		step_id ++;
		step_started = false;
	}
}