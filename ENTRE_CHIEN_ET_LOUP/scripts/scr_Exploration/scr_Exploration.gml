function return_to_main_desk()
{
	change_room(rm_main_desk);
}

function Exploration() : Menu(MENU_PRIORITIES.EXPLORATION, room, true, false, false, MENU_CHANNELS.EXPLORATION) constructor 
{
	pressed_interactable = noone;
	cards_set = new CardsSet([new Card(scribble("[fnt_small_titles]" + text_id_to_string("RETURN POLICE STATION")), return_to_main_desk)], ORIENTATION.BOT_DOWN_PIN, CIRCLE_DIRECTION.POSITIVE); 
	
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