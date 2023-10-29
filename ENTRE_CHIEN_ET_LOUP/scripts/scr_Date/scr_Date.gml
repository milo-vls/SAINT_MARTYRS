// Feather disable GM1009


/// @desc Function Description
/// @param {real} _day_number Description
/// @param {real} _hour Description
/// @param {real} _minute Description
function Date(_day_number, _hour, _minute) constructor
{
	
	day_number = _day_number;
	hour = _hour;
	minute = _minute;
	
	/**
	 *  Function 
	 * @param {struct.date} _date  Date to make the comparison with
	 * @returns {real}  Returns 1 if is more recent than, 0 if equal, -1 if older
	 */	
	static is_more_recent_than = function(_date)
	{
		if self.day_number > _date.date_number return 1;
		if self.day_number < _date.date_number return -1;
		if self.hour > _date.hour return 1;
		if self.hour < _date.hour return -1;
		if self.minute > _date.minute return 1;
		if self.minute < _date.minute return -1;
		return 0;
	}
	
	/**
	 * Function
	 * @param {struct.date} _date Description
	 * @returns {real} Returns 1 if older, 0 if equal, -1 if more recent
	 */
	static is_older_than = function(_date)
	{
		var _is_more_recent = self.is_more_recent_than(_date);
		if _is_more_recent == 0 return 0;
		if _is_more_recent == 1 return -1;
		return 1;
	}
	
}