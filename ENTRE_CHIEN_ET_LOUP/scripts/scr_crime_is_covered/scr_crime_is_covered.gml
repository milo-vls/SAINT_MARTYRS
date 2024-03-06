function crime_is_covered(_crime_id)
{
	return position_meeting(global.crimes[_crime_id].get_x(), global.crimes[_crime_id].get_y(), obj_unit);
}