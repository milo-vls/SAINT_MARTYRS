#macro MAP_WIDTH 1000
#macro MAP_HEIGHT 500

function screen_to_map_x(_x)
{
	return ((_x / GAME_WIDTH) * MAP_WIDTH) - (MAP_WIDTH/2);
}
function screen_to_map_y(_y)
{
	return ((_y / GAME_HEIGHT) * MAP_HEIGHT) - (MAP_HEIGHT/2);
}