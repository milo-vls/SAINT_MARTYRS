function map_coordinates_string_from_room_coordinates(_room_x, _room_y)
{
    return "(" + string(room_x_to_map_x(_room_x)) + " x " + string(room_y_to_map_y(_room_y)) + ")";
}