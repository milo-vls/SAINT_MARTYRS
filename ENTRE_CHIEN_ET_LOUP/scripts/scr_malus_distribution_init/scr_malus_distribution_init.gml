function malus_distribution_init()
{
	var _malus_distribution_constructor = function() constructor{};
	var _malus_distribution = csv_to_structs_of_constructor("malus_distribution.csv", _malus_distribution_constructor);
	
	array_foreach(_malus_distribution, function(_distrib, _i)
	{
		array_push(global.cases[int64(_distrib.case_id)].maluses, int64(_distrib.malus_id));
	});
}