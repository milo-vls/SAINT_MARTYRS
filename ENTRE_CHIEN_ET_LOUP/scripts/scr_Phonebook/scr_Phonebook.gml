#macro PHONEBOOK_VERTICAL_MARGIN 10
#macro PHONEBOOK_HORIZONTAL_MARGIN 25


function PhonebookMenu() : Menu(MENU_PRIORITIES.PHONE_MENU + 1, room, false, true, false) constructor
{
	
	
	
	nb_turned_sheets = 0;	
	
	string_phone_numbers_to_show = array_create(0);
	
	surface_height = abs(obj_phonebook_left_page.sprite_height);
	surface_width = abs(obj_phonebook_left_page.sprite_width);

	
	page_height = surface_height - PHONEBOOK_VERTICAL_MARGIN * 2;
	page_width = surface_width - PHONEBOOK_HORIZONTAL_MARGIN * 2;
	
	left_page_surface = surface_create(surface_width, surface_height);
	right_page_surface = surface_create(surface_width, surface_height);
	
	var _ids_obtained_phone_numbers = global.ids_obtained_phone_numbers;
	var _phone_numbers = global.phone_numbers;
	nb_obtained_phone_numbers = array_length(_ids_obtained_phone_numbers);
	for (var _i = 0; _i < nb_obtained_phone_numbers; _i ++)
		array_push(string_phone_numbers_to_show, get_phonebook_text(_ids_obtained_phone_numbers[_i]));
	
	
	var _sub_elements = [new CardSubElement("[fnt_small_titles]" + text_id_to_string("BACK"), CARD_SUB_ELEMENT_TYPES.SCRIBBLE_TEXT) ];
	var _cards = [new Card(_sub_elements, function(){change_room(rm_phone)} )];
	cards_set = new CardsSet(_cards, ORIENTATION.BOT_DOWN_PIN, CIRCLE_DIRECTION.POSITIVE); 
	



	activity = activity_phonebook;
	draw = draw_phonebook;
	
	
	
}

function draw_phonebook()
{
	draw_set_alpha(1);

	if !surface_exists(left_page_surface)
		left_page_surface = surface_create(surface_width, surface_height);	
	if !surface_exists(right_page_surface)
		right_page_surface = surface_create(surface_width, surface_height);
		
		
	draw_set_font(fnt_dialogues); draw_set_valign(fa_bottom); draw_set_color(c_black); draw_set_halign(fa_left);
	//draw phone number	
	var _cumulated_height = 0;
	var _left_page_shown = nb_turned_sheets * 2  - 1;
	var _nb_phone_numbers_obtained = array_length(string_phone_numbers_to_show);
	
	surface_set_target(left_page_surface); draw_clear_alpha(c_black, 0.0);surface_reset_target();
	surface_set_target(right_page_surface); draw_clear_alpha(c_black, 0.0);surface_reset_target();
	
	
	for (var _i = 0; _i < _nb_phone_numbers_obtained; _i ++)
	{
		var _string_height = string_height(string_phone_numbers_to_show[_i]);
		#macro CURRENT_PAGE 
		var _occupied_height_on_current_page = _cumulated_height % surface_height;
		var _remaining_height_on_current_page = surface_height - _occupied_height_on_current_page;
		
		
		//computing the virtual height of the current text
		//IF THERE'S ROOM FOR ANOTHER NUMBER, PUT IT HERE
		if _remaining_height_on_current_page > _string_height
			_cumulated_height += _string_height;
		//OTHERWISE ON THE NEXT PAGE
		else
			_cumulated_height += _string_height + _remaining_height_on_current_page;
		
		//DRAWING THE TEXT
		var _current_page = floor(_cumulated_height / surface_height);
		if _current_page < _left_page_shown
			continue;
		if _current_page > _left_page_shown + 2
			continue;
		
		var _y_text = _cumulated_height % surface_height;
		if _current_page == _left_page_shown
		{
			surface_set_target(left_page_surface);
			draw_text(0, _y_text, string_phone_numbers_to_show[_i]);
			
		}
		else
		{
			
			surface_set_target(right_page_surface);
			draw_text(PHONEBOOK_HORIZONTAL_MARGIN, _y_text, string_phone_numbers_to_show[_i]);
		}
		
		surface_reset_target();
	}
	
	
	
	//draw_surface_general(left_page_surface, 0, 0, surface_width, surface_height * obj_phonebook_left_page.image_yscale, obj_phonebook_left_page.bbox_left, obj_phonebook_left_page.bbox_top, abs(obj_phonebook_left_page.image_xscale), obj_phonebook_left_page.image_yscale, obj_phonebook_left_page.image_angle, c_white, c_white, c_white, c_white, 1);
	//draw_surface_general(right_page_surface, 0, 0, surface_width, surface_height, obj_phonebook_right_page.bbox_left, obj_phonebook_right_page.bbox_top, obj_phonebook_right_page.image_xscale, obj_phonebook_right_page.image_yscale, obj_phonebook_right_page.image_angle, c_white, c_white, c_white, c_white, 1);
	draw_surface_ext(left_page_surface, obj_phonebook_left_page.bbox_left + 20, obj_phonebook_left_page.y + 10, 1, 1, obj_phonebook_left_page.image_angle, c_white, 1);
	draw_surface_ext(right_page_surface, obj_phonebook_right_page.x, obj_phonebook_right_page.y, 1, 1, obj_phonebook_right_page.image_angle, c_white, 1);
	
	nb_sheets = ceil(_cumulated_height / surface_height);
	
	obj_phonebook_left_page.visible = nb_turned_sheets > 0;
	obj_phonebook_right_page.visible = nb_turned_sheets < nb_sheets;
	
	cards_set.draw();
}
function activity_phonebook()
{
	if instance_position(mouse_x, mouse_y, obj_phonebook_right_page) != noone and click_pressed()
		phonebook_turn_page_right();
	if instance_position(mouse_x, mouse_y, obj_phonebook_left_page) != noone and click_pressed()
		phonebook_turn_page_left();
	
	cards_set.activity();
}


function phonebook_turn_page_right()
{
	if nb_turned_sheets < nb_sheets
		nb_turned_sheets ++;
}
function phonebook_turn_page_left()
{
	if nb_turned_sheets > 0
		nb_turned_sheets --;
}



