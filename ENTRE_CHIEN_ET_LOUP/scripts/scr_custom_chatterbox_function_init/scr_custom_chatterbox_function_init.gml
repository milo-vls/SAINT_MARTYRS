function get_exe_dialogue_state()
{
	//0 : first call to be done
	//1 : Blaise insists
	//2 : Blaise is blocked

		
	if global.switches[SWITCHES.EXE_MET] == false
		return 0;
	if global.switches[SWITCHES.EXE_BLOCKED] == true
		return 2
	return 1
			
		
}
function set_exe_met()
{
	if global.switches[SWITCHES.EXE_MET] == false
		global.switches[SWITCHES.EXE_MET] = true;
	else
		global.switches[SWITCHES.EXE_BLOCKED] = true;
}
	
function custom_chatterbox_function_init()
{
	
	ChatterboxAddFunction("set_exe_met", set_exe_met);
	ChatterboxAddFunction("get_exe_dialogue_state", get_exe_dialogue_state);
	
}


