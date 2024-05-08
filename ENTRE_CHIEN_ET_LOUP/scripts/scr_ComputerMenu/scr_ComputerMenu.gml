function ComputerMenu() : Menu(MENU_PRIORITIES.COMPUTER_MENU, room, false, true) constructor 
{
	
	surface = computer_screen_surface_create();
	windows = array_create(0);

	activity = computer_activity;
	draw = computer_draw;
}

function computer_activity()
{
	
}
function computer_draw()
{
	
}