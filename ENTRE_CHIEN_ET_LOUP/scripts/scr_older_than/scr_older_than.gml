#macro INVESTIGATION_HOUR 19
#macro INVESTIGATION_MINUTE 30

/// @param {real} _day_number Description
/// @returns {bool} is the date number prior to the current date ?
function older_than_yersteday(_day_number)
{
	return _day_number < global.day_number;
}

function older_than_now(_day_number, _hour, _minute)
{
	if _day_number != global.day_number then return _day_number < global.day_number;
	if _hour !=INVESTIGATION_HOUR then return _hour < INVESTIGATION_HOUR;
	return _minute < INVESTIGATION_MINUTE;
}