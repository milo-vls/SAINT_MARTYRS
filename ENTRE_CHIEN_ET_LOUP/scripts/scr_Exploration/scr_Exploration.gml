function Exploration() : Menu(MENU_PRIORITIES.EXPLORATION, room, true, false, false, MENU_CHANNELS.EXPLORATION) constructor 
{
	pressed_interactable = noone;
	return_to_desk_card = new Card();
	
	draw = function()
	{
		
	}
	
	activity = function()
	{
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