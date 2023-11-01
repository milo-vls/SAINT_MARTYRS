// Feather disable all
/// @param {real} _x1 
/// @param {real} _y1 
/// @param {real} _x2 
/// @param {real} _y2 
function MenuGuideLine(_x1, _y1, _x2, _y2) constructor 
{
	x1 = _x1;
	y1 = _y1;
	x2 = _x2;
	y2 = _y2;
	
	get_starting_y = function()
	{
		return min(self.y1, self.y2);
	}
	get_starting_x = function()
	{
		if self.y2 == self.y1 return min(self.x1, self.x2);
		if self.get_starting_y() == self.y1 return self.x1;
		return self.x2;
	}
	get_height = function()
	{
		return abs(self.y1 - self.y2);
	}
	get_width = function()
	{
		return abs(self.x1 - self.x2);
	}
	
}