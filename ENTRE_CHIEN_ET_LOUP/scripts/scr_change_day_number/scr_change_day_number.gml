function change_day_number(_new_value)
{
	global.day_number = _new_value;
	ChatterboxVariableSet("day_number", _new_value);
}