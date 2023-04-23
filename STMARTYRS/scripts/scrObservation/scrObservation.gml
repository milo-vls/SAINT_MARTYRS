
function obs(_str, _function = noone)
{
	txt[nbPages] = _str;
	ltxt[nbPages] = string_length(_str);
	fun[nbPages] = _function;
	
	nbPages ++;
}

function startObs(_obsID)
{
	if !instance_exists(oDial)
	{
		with instance_create_depth(0, 0, dptxt, oObservation)
		{
			obsData(_obsID);
		}
	}
	
}

