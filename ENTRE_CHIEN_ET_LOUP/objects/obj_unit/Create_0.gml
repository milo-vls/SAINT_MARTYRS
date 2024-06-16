var _number_of_unit_sheet = instance_number(obj_unit_sheet);
for (var _i = 0; _i < _number_of_unit_sheet; _i ++)
{
	var _unit_sheet_instance = instance_find(obj_unit_sheet, _i);
	if _unit_sheet_instance.unit_id == unit_id
	{
		_unit_sheet_instance.unit_instance = self.id;
		return;
	}
}