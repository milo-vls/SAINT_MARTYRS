enum CRIME_STRING_MODE
{
	BY_COLOR,
	BY_CASE
}

function get_crime_string_mode()
{
	var _to_return = obj_malus_canvas.confusion_on ? CRIME_STRING_MODE.BY_COLOR : CRIME_STRING_MODE.BY_CASE;
	return _to_return;
}