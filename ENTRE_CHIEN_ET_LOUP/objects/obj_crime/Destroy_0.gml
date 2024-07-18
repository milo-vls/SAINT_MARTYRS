if instance_coming_string_id != noone
{
	instance_coming_string_id.deployment_state = CASE_STRING_DEPLOYMENT_STATE.DESTROYING;
	instance_coming_string_id.crime_instance_id_dst = noone;
}
if instance_giving_string_id != noone
	delete_string(instance_giving_string_id);