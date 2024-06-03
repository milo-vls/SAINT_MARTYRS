function get_malus_id(_malus_name)
{
	var _malus = global.malus;
	var _nb_malus = global.nb_malus;
	for (var _malus_index = 0; _malus_index < _nb_malus; _malus_index ++)
	{
		if _malus[_malus_index].get_name() == _malus_name
		{
			return _malus_index;
		}
	}
	return -1;
}