
#macro CRIME_FOCUS_SIMPLE_MAIN_BOX_WIDTH (GAME_WIDTH/6)



function MainDeskCrimeFocusSimple(_crime_id) : Menu(MENU_PRIORITIES.MAIN_DESK_CRIME_FOCUS, room, false, true, false, MENU_CHANNELS.MAIN_DESK_NEUTRAL) constructor 
{
	crime_id = _crime_id;
	crime_instance = crime_instance_by_crime_id(_crime_id);
	crime = global.crimes[crime_id];
	
	victim_char_id = crime.get_victim_character_id();
	victim_first_name = character_get_first_name(victim_char_id);
	victim_last_name = character_get_last_name(victim_char_id);
	
	crime_position_string = "(" + string(int64(room_x_to_map_x(crime_instance.x))) + " x " + string(int64(room_y_to_map_y(crime_instance.y))) + ")";
	date_string = get_date_string(crime.get_day_number(), false);
	hour_minute_string = crime.get_hour_minute_string();
	crime_instance_is_left_sided = crime_instance.x <  (GAME_WIDTH/2);
	crime_instance_is_up_sided = crime_instance.y < (GAME_HEIGHT/2);
	clues_sprites = crime_get_clues_sprite(crime_id);
	portrait_sprite = crime_get_portrait(crime_id);
	
	var _offset = 20;
	
	///////////////////////////
	//* MAIN BOX LEFT X POS *//
	///////////////////////////
	
	if crime_instance_is_left_sided
		main_box_left_x = crime_instance.x + _offset
	else
		if crime_instance_is_up_sided
			if portrait_sprite != -1
				main_box_left_x = (CRIME_FOCUS_SIMPLE_MAIN_BOX_WIDTH/2)*3 + _offset;
			else
				main_box_left_x = CRIME_FOCUS_SIMPLE_MAIN_BOX_WIDTH + _offset;
		else
			if array_length(clues_sprites)>0
				main_box_left_x = (CRIME_FOCUS_SIMPLE_MAIN_BOX_WIDTH/2)*3 - _offset;
			else
				main_box_left_x = CRIME_FOCUS_SIMPLE_MAIN_BOX_WIDTH - _offset;
	
	//////////////////////////
	//* MAIN BOX TOP Y POS *//
	//////////////////////////
	
	if crime_instance_is_up_sided
		if portrait_sprite == -1
			main_box_top_y = crime_instance.y + _offset;
		else
			main_box_top_y = crime_instance.y + _offset - CRIME_FOCUS_SIMPLE_MAIN_BOX_WIDTH/4;
	else
		if array_length(clues_sprites) > 0
			main_box_top_y = crime_instance.y - CRIME_FOCUS_SIMPLE_MAIN_BOX_WIDTH * 2/3 - _offset;
		else
			main_box_top_y = crime_instance.y - CRIME_FOCUS_SIMPLE_MAIN_BOX_WIDTH - _offset;
	
	
	pressed_crime = -1;
	void_is_pressed = false;
	
	draw = crime_focus_simple_draw;
	activity = crime_focus_simple_activity;
	
	//play_paper_wind(_crime_instance_is_left_sided ? 0 : room_width, room_height/2, false);
	
}

function crime_focus_simple_activity()
{
	obj_crime.target_scale = obj_crime.base_image_scale;
	crime_instance.target_scale = crime_instance.max_image_scale;
	
	
	obj_units_ben.y = UNITS_BEN_HIDDEN_Y;
	var _mouse_is_over_crime = instance_position(mouse_x, mouse_y, obj_crime);
	if _mouse_is_over_crime != noone
	{
		_mouse_is_over_crime.target_scale = _mouse_is_over_crime.max_image_scale;
		void_is_pressed = false;
	}
	if left_click_released()
	{
		if pressed_crime > -1 
		{
			if pressed_crime == crime_instance
				return;
			end_reached = true;
			add_menu(new MainDeskCrimeFocusSimple(pressed_crime.crime_id));
		}
		else 
			if void_is_pressed
				end_reached = true;
	}
	if left_click_pressed()
	{
		pressed_crime = _mouse_is_over_crime;
		void_is_pressed =  (_mouse_is_over_crime == noone );
	}
	if _mouse_is_over_crime != noone
		void_is_pressed = false;
	pressed_crime = _mouse_is_over_crime == noone ? noone : pressed_crime;
	
}

function crime_focus_simple_draw()
{
    crime_focus_simple_main_box_draw(main_box_left_x, main_box_top_y, crime_id, victim_first_name, victim_last_name, crime_position_string, hour_minute_string, date_string);
	if portrait_sprite > -1
		crime_focus_portrait_draw(main_box_left_x + CRIME_FOCUS_SIMPLE_MAIN_BOX_WIDTH, main_box_top_y - CRIME_FOCUS_SIMPLE_MAIN_BOX_WIDTH/7, portrait_sprite);
}

function crime_focus_portrait_draw(_x, _y, _sprite)
{
	var _offset = 8;
	draw_rectangle_color(_x, _y, _x + CRIME_FOCUS_SIMPLE_MAIN_BOX_WIDTH/2, _y + CRIME_FOCUS_SIMPLE_MAIN_BOX_WIDTH/2, c_black, c_black, c_black, c_black, false);
	draw_sprite_pos
	(
		_sprite, 0,
		//xy1
		_x + _offset,
		_y + _offset,
		//xy2
		_x + CRIME_FOCUS_SIMPLE_MAIN_BOX_WIDTH/2 - _offset,
		_y + _offset,
		//xy3
		_x + CRIME_FOCUS_SIMPLE_MAIN_BOX_WIDTH/2 - _offset,
		_y + CRIME_FOCUS_SIMPLE_MAIN_BOX_WIDTH/2 - _offset,
		//xy4
		_x + _offset,
		_y + CRIME_FOCUS_SIMPLE_MAIN_BOX_WIDTH/2 - _offset,
		//alpha
		1
	);
}

function crime_focus_simple_main_box_draw(_x, _y, _crime_id, _first_name, _last_name, _position, _hour_minute, _day_and_month)
{
    draw_rectangle_color(_x, _y, _x + CRIME_FOCUS_SIMPLE_MAIN_BOX_WIDTH, _y + CRIME_FOCUS_SIMPLE_MAIN_BOX_WIDTH, c_black, c_black, c_black, c_black, false);
    
    
    draw_set_font(fnt_dialogues); draw_set_color(c_white);
    draw_set_valign(fa_top); draw_set_halign(fa_left);
    var _offset = 8;
    var _text_x = _x + _offset;
    var _string_height = string_height("W");
    draw_text(_text_x, _y + _offset, "crime " + string(_crime_id));
    
    var _l_name_y = _y + _offset * 3 + _string_height;
    draw_text(_text_x, _l_name_y, _last_name);
    
    var _f_name = _l_name_y + _string_height + _offset/2;
    draw_text(_text_x, _f_name, _first_name);
    
    var _position_y = _f_name + _string_height + _offset;
    draw_text(_text_x, _position_y, _position);
    
    var _day_and_month_y = _position_y + _string_height + _offset;
    draw_text(_text_x, _day_and_month_y, _day_and_month);
    
    var _hour_minute_y = _day_and_month_y + _string_height + _offset;
    draw_text(_text_x, _hour_minute_y, _hour_minute);
}



















