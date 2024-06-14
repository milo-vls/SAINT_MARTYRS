
function update_all_crimes_string(_mode)
{
	with obj_crime
	{
		string_mode = _mode;
		event_user(0);
	}
}