
function set_switch_off()
{
	variable_struct_set(global.switches, argument0[0], false);
}

function set_switch_on()
{
	variable_struct_set(global.switches, argument0[0], true);
}

function set_switch()
{
	variable_struct_set(global.switches, argument0[0], argument0[1]);
}

function get_switch_state()
{
	var _result = variable_struct_get(global.switches, argument0[0]) ? 1 : 0;
	return _result;
}


function custom_chatterbox_function_init()
{
	
	ChatterboxAddFunction("set_switch_off", set_switch_off);
	ChatterboxAddFunction("set_switch_on", set_switch_on);
	ChatterboxAddFunction("set_switch", set_switch);
	ChatterboxAddFunction("get_switch_state", get_switch_state);

}


