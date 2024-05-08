function room_x_to_map_x(_room_x)
{
	return -(MAP_WIDTH/2) + (MAP_WIDTH * (_room_x/room_width));
}
function room_y_to_map_y(_room_y)
{
	return (MAP_HEIGHT/2) - (MAP_HEIGHT * (_room_y/room_height));
}