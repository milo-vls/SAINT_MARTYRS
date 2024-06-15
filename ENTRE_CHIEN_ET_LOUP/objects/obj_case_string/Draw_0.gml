if debug_mode
	draw_self();
	
//crimes coordinates 
var _crime_src_x = crime_instance_id_src.x;
var _crime_src_y = crime_instance_id_src.y;
var _crime_dst_x = crime_instance_id_dst.x;
var _crime_dst_y = crime_instance_id_dst.y;
var _crimes_distance = point_distance(_crime_src_x, _crime_src_y, _crime_dst_x, _crime_dst_y);
var _crimes_angle = point_direction(_crime_src_x, _crime_src_y, _crime_dst_x, _crime_dst_y);
draw_sprite_ext(string_sprite, 0, _crime_src_x, _crime_src_y, 1, _crimes_distance/string_sprite_height, _crimes_angle + angle_ajustement, color, 0.8);




