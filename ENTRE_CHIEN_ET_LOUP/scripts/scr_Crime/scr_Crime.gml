#macro CRIME_BASE_COLOR c_white


// Feather disable GM1009
function Crime() constructor
{
	
	
	color = CRIME_BASE_COLOR;
	
	
	/**
	 * @param {struct.Crime} _crime
	 * @returns {real} 1 if true, -1 if false, 0 if simultaneous
	 */
	is_more_recent_than = function(_crime)
	{
		if self.day_number > _crime.day_number return 1;
		if self.day_number < _crime.day_number return -1;
		if self.hour > _crime.hour return 1;
		if self.hour < _crime.hour return -1;
		if self.minute > _crime.minute return 1;
		if self.minute < _crime.minute return -1;
		return 0;
	}
	
	
	
	/**
	 * @param {struct.crime} _crime Description
	 * @returns {real} Description
	 */
	is_older_than = function(_crime)
	{
		var _is_more_recent = self.is_more_recent_than(_crime);
		if _is_more_recent == 0 return 0;
		if _is_more_recent == 1 return -1;
		return 1;
	}

}














/*
/// @desc Function Description
/// @param {real} _id_case Description
/// @param {real} _id_char_victim Description
/// @param {real} _day_number Description
/// @param {real} _hour Description
/// @param {real} _minute Description
/// @param {real} _x Description
/// @param {real} _y Description
/// @param {bool} _first_of_case Description
/// @param {bool} _last_of_case Description
/// @param {string} _sprite_name_clue_1 Description
/// @param {string} _sprite_name_clue_2 Description
/// @param {string} _sprite_name_clue_3 Description
/// @param {string} _sprite_name_clue_4 Description
function Crime(_id_case, _id_char_victim, _day_number, _hour, _minute , _x, _y, _first_of_case, _last_of_case, _sprite_name_clue_1, _sprite_name_clue_2, _sprite_name_clue_3, _sprite_name_clue_4) constructor
{
	id_case = _id_case;
	id_char_victim  = _id_char_victim;
	date = new Date(_day_number, _hour, _minute);
	x = _x;
	y = _y;
	first_of_case = _first_of_case;
	last_of_case = _last_of_case;
	clues = new Clues(	asset_get_index(_sprite_name_clue_1),
										asset_get_index(_sprite_name_clue_2),
										asset_get_index(_sprite_name_clue_3),
										asset_get_index(_sprite_name_clue_4)
										);
}