function return_to_main_desk()
{
	change_room(rm_main_desk);
	obj_menu_manager.get_active_menu(Exploration).end_reached = true;
}

function Exploration() : Menu(MENU_PRIORITIES.EXPLORATION, room, false, true, false, MENU_CHANNELS.DIALOGUES) constructor 
{
	pressed_interactable = noone;
	var _sub_elements = [new CardSubElement("[fnt_small_titles]" + text_id_to_string("RETURN POLICE STATION"), CARD_SUB_ELEMENT_TYPES.SCRIBBLE_TEXT) ];
	var _cards = [new Card(_sub_elements, return_to_main_desk)]
	cards_set = new CardsSet(_cards, ORIENTATION.BOT_DOWN_PIN, CIRCLE_DIRECTION.POSITIVE); 
	
	draw = function()
	{
		cards_set.draw();
	}
	activity = function()
	{	
		cards_set.activity();
		//FUNCTION WHEN PRESSED
		var _mouse_is_over_instance = instance_position(mouse_x, mouse_y, obj_interactables_exploration);
		if _mouse_is_over_instance > -1 and left_click_released()
		{
			if _mouse_is_over_instance == pressed_interactable
			{
				_mouse_is_over_instance.function_when_pressed();
			}
		}
		if _mouse_is_over_instance > -1 and left_click_pressed() 
		{
			pressed_interactable = _mouse_is_over_instance;
		}
		if !left_click()
		{
			pressed_interactable = noone;
		}
		//ACTIVITY NO PARALLELISM
		with obj_interactables_exploration if activity_no_parallelism != noone then activity_no_parallelism();
	}
}