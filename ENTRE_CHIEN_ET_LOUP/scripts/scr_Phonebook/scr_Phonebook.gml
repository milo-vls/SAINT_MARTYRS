function PhonebookMenu() : Menu(MENU_PRIORITIES.PHONE_MENU + 1, room, false, true, false) constructor
{
	nb_turned_sheets = 0;
	
	nb_sheets = 1;
	
	
	
	
	
	
	
	
	
	
	
	var _sub_elements = [new CardSubElement("[fnt_small_titles]" + text_id_to_string("BACK"), CARD_SUB_ELEMENT_TYPES.SCRIBBLE_TEXT) ];
	var _cards = [new Card(_sub_elements, function(){change_room(rm_phone)} )];
	cards_set = new CardsSet(_cards, ORIENTATION.BOT_DOWN_PIN, CIRCLE_DIRECTION.POSITIVE); 
	



	activity = activity_phonebook;
	draw = draw_phonebook;
	
	
	
}

function draw_phonebook()
{
	obj_phonebook_left_page.visible = nb_turned_sheets > 0;

	obj_phonebook_right_page.visible = nb_turned_sheets < nb_sheets;
	
	draw_set_alpha(1);
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