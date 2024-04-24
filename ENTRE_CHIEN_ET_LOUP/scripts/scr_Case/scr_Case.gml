enum CASE_STATE
{
	FLED = -2,
	FREE = -1,
}
function case_has_fled()
{
	return day_caught == CASE_STATE.FLED;
}
function case_is_free()
{
	return day_caught == CASE_STATE.FREE;
}
function case_is_caught()
{
	return day_caught > -1;
}
/// @desc Function Description
/// @param {real} _id_guilty_char Description
function Case() constructor
{
	day_caught = CASE_STATE.FREE;
	maluses = array_create(0);
	
	has_fled = case_has_fled;
	is_free = case_is_free;
	is_caught = case_is_caught;
}