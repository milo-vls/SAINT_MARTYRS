#macro SEQUENCE current_sequence
#macro STEP current_sequence.steps[step_id]

current_sequence = noone;
step_id = 0;
step_started = false;
nb_steps = 0;

set_sequence = function(_sequence)
{
	SEQUENCE = _sequence;
	step_id = 0;
	nb_steps = array_length(SEQUENCE.steps);
}