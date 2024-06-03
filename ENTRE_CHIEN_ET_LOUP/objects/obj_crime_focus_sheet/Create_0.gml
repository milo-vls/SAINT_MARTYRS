origin_x = x;
hidden_x = left_side ? - sprite_get_width(sprite_index) : GAME_WIDTH;
x = hidden_x;
depth = DEPTHS.CRIME_SHEETS;


text_x_scale = 0.75;
text_y_scale = 0.75;

x_left_crime_id = 668;
y_top_crime_id = 25;

x_left_spr_victim_face = 195;
y_top_spr_victim_face = 105;
width_spr_victim_face = 180;

x_center_scribble_change_color = x_left_spr_victim_face + width_spr_victim_face/2;
y_top_scribble_change_color = y_top_spr_victim_face + width_spr_victim_face * 1.3;
scribble_change_color = scribble("[fnt_dialogues][shake]" + text_id_to_string("CHANGE COLOR")).wrap(width_spr_victim_face).align(fa_center, fa_top);
scribble_width = scribble_change_color.get_width();
scribble_height = scribble_change_color.get_height();
mouse_over_change_color = false;

x_left_victim_name = 407;
y_top_victim_name = 140;

x_left_date = x_left_victim_name;
y_top_date = 224;

x_left_position = x_left_victim_name;
y_top_position = y_top_date * 2 - y_top_victim_name;
set_crime_id = function(_crime_id)
{
	var _str_crime_id = string(_crime_id);
	var _crime = global.crimes[_crime_id];
	
	text_crime_id = text_id_to_string("CRIME FOCUS CRIME ID") + _str_crime_id;
	
	spr_victim_face = asset_get_index("spr_victim_face_" + _str_crime_id);
	x_scale_spr_victim_face = width_spr_victim_face/sprite_get_width(spr_victim_face);
	y_scale_spr_victim_face = width_spr_victim_face/sprite_get_height(spr_victim_face);
	
	victim_first_and_last_name = _crime.get_victim_first_and_last_name();
	
	date = get_date_string(_crime.get_day_number());
	
	position = _crime.get_position_string();
}
set_crime_id(0);
