depth = DEPTHS.CRIME_SHEETS;

surface_left_x = 145;
surface_top_y = 41;
surface_right_x = 854;
surface_bottom_y = 958;
surface_width = surface_right_x - surface_left_x;
surface_height = surface_bottom_y - surface_top_y;
surface_sheet = surface_create(surface_width, surface_height);

var _offset =  (sprite_width - (surface_left_x + surface_width))/2;
shown_x = left_side ? - _offset : room_width - sprite_width + _offset;
shown_y = 0;
shown_angle = 0;
hidden_x = x;
hidden_y = y;
hidden_angle = image_angle;
shown_angle = 0;

shown_animation_timer = 0;
shown_animation_duration = 0.3 * room_speed;
shown_animation_animcurve_channel = animcurve_get_channel(ac_crime_sheet, 0);
horizontal_distance = abs(shown_x - hidden_x); 
horizontal_sign = left_side ? 1 : -1;
vertical_distance = abs(shown_y - hidden_y);
angle_diff = abs(hidden_angle - shown_angle);




//text crime id infos
text_crime_id_x = 520;
text_crime_id_y = 5;
text_crime_id_scale = 0.85;
text_crime_id = "";

//victim's face infos
spr_victim_face = spr_victim_face_0;
spr_victim_face_x = 55;
spr_victim_face_y = 79;
spr_victim_face_width = 180;

//change color
x_center_scribble_change_color = spr_victim_face_x + spr_victim_face_width/2;
y_top_scribble_change_color = spr_victim_face_y + spr_victim_face_width * 1.3;
scribble_change_color = scribble("[fnt_dialogues][shake]" + text_id_to_string("CHANGE COLOR")).wrap(spr_victim_face_width).align(fa_center, fa_top);
scribble_width = scribble_change_color.get_width();
scribble_height = scribble_change_color.get_height();
mouse_over_change_color = false;



set_crime_id = function(_crime_id)
{
	x = hidden_x;
	y = hidden_y;
	shown_animation_timer = 0;
	
	static _crimes = global.crimes;
	var _str_crime_id = string(_crime_id);
	var _crime = _crimes[_crime_id];
	
	text_crime_id = text_id_to_string("CRIME FOCUS CRIME ID") + _str_crime_id;
	spr_victim_face = asset_get_index("spr_victim_face_" + _str_crime_id);
}


/*



x_left_victim_name = 407;
y_top_victim_name = 140;

x_left_date = x_left_victim_name;
y_top_date = 224;

x_left_position = x_left_victim_name;
y_top_position = y_top_date * 2 - y_top_victim_name;
set_crime_id = function(_crime_id)
{
	
	var _crime = global.crimes[_crime_id];
	
	
	
	
	x_scale_spr_victim_face = width_spr_victim_face/sprite_get_width(spr_victim_face);
	y_scale_spr_victim_face = width_spr_victim_face/sprite_get_height(spr_victim_face);
	
	victim_first_and_last_name = _crime.get_victim_first_and_last_name();
	
	date = get_date_string(_crime.get_day_number());
	
	position = _crime.get_position_string();
}
set_crime_id(0);




