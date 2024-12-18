// Feather disable GM1009

#macro CRIME_BASE_COLOR_ID CRIME_COLORS.WHITE
enum CRIME_COLORS
{
	WHITE,
	RED,
	PINK,
	BLACK,
	YELLOW,
	
	NB_OF_CRIME_COLORS
}
global.crime_colors[CRIME_COLORS.WHITE] = c_white;
global.crime_colors[CRIME_COLORS.RED] = make_color_rgb(160,47,64);
global.crime_colors[CRIME_COLORS.PINK] = c_fuchsia;
global.crime_colors[CRIME_COLORS.BLACK] = c_black;
global.crime_colors[CRIME_COLORS.YELLOW] = c_yellow;

function Crime() constructor
{
	color_id = CRIME_BASE_COLOR_ID;
	appeard = false;
	discovered = false;
	
	get_color_id = function()
	{
		return color_id;
	}
	get_color = function()
	{
		return global.crime_colors[color_id];
	}
	get_victim_character_id = function()
	{
		return victim_char_id;
	}
	get_victim_nickname = function()
	{
		return global.characters[victim_char_id].nickname;
	}
	get_victim_first_and_last_name = function()
	{
		var _char = global.characters[victim_char_id];
		return string_concat(_char.first_name," ",_char.last_name);
	}
	get_x = function()
	{
		return real(x)
	}
	get_y = function()
	{
		return real(y);
	}
	get_map_x = function()
	{
		return room_x_to_map_x(get_x());
	}
	get_map_y = function()
	{
		return room_y_to_map_y(get_y());
	}
	get_position_string = function()
	{
		return string_concat("(", string(get_map_x()), " x ", string(get_map_y()), ")");
	}
	get_day_number = function()
	{
		return int64(day_number);
	}
	get_case_id = function()
	{
		var _to_return = int64(case_id);
		return _to_return;
	}
	get_first_of_case = function()
	{
		return first_of_case == "1";
	}
	get_hour = function()
	{
		return self.hour;
	}
	get_hour_string = function()
	{
		var _hour_string = string(self.get_hour());
		return string_length(_hour_string) == 1 ? "0" + _hour_string : _hour_string;
	}
	get_minute = function()
	{
		return self.minute;
	}
	get_minute_string = function()
	{
		var _minute_string = string(self.get_minute());
		return string_length(_minute_string) == 1 ? "0" + _minute_string : _minute_string;
	}
	get_hour_minute_string = function()
	{
		return self.get_hour_string() + ":" + self.get_minute_string();
	}
	
	
	
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
	is_older_than = function(_crime)
	{
		var _is_more_recent = self.is_more_recent_than(_crime);
		return _is_more_recent * -1;
		/*
		if _is_more_recent == 0 return 0;
		if _is_more_recent == 1 return -1;
		return 1;
		*/
	}
	

}

function crime_get_clues_sprite(_crime_id)
{
	var _to_return = array_create(0);
	var _crime = global.crimes[_crime_id];
	
	if _crime.sprite_name_clue_1 != ""
		array_push(_to_return, asset_get_index(_crime.sprite_name_clue_1));
	if _crime.sprite_name_clue_2 != ""
		array_push(_to_return, asset_get_index(_crime.sprite_name_clue_1));
	if _crime.sprite_name_clue_3 != ""
		array_push(_to_return, asset_get_index(_crime.sprite_name_clue_1));
	if _crime.sprite_name_clue_4 != ""
		array_push(_to_return, asset_get_index(_crime.sprite_name_clue_1));
	
	return _to_return;
}

function crime_get_portrait(_crime_id)
{
	return asset_get_index(global.crimes[_crime_id].portrait);
}
















