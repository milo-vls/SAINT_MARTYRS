origin_y = y;
hidden_y = GAME_HEIGHT + sprite_get_yoffset(sprite_index);
mouse_over = false;
y = hidden_y;
origin_depth = depth;
origin_angle = image_angle;
origin_scale = image_xscale;
selected_scale = image_xscale + 0.275;


unit =  global.units[unit_id];
character = global.characters[unit.get_character_id()]
available = unit.is_available();
unit_instance = noone;


sheet_top_y = 41;
sheet_left_x = 145;
sheet_right_x = 854;
sheet_bottom_y = 958;
sheet_width = sheet_right_x - sheet_left_x;
sheet_height = sheet_bottom_y - sheet_top_y;
surface_sheet = surface_create(sheet_width, sheet_height);

portrait_x = 25;
portrait_y = 25;
portrait_sprite = asset_get_index("spr_unit_face_"+string(unit_id));
portrait_height = 290;
portrait_width = portrait_height * 4 / 5;

name_x = portrait_x * 2 + portrait_width;
name_y = portrait_y;
name_text = character.last_name + "\n" + character.first_name;

deployed_text_angle = -10;
deployed_text_x = portrait_x/2;
deployed_text_y = portrait_y + portrait_height/3;
deployed_text = text_id_to_string("UNIT DEPLOYED");





