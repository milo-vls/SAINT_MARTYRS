function start_exploration_menu()
{
	if obj_menu_management.get_active_menu(Exploration) == -1
	{
		return add_menu(new Exploration());
	}
}