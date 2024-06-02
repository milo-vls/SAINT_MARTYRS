origin_y = y;
hidden_y = GAME_HEIGHT + sprite_get_yoffset(sprite_index);
mouse_over = false;
y = hidden_y;
origin_depth = depth;
origin_angle = image_angle;
origin_scale = image_xscale;
selected_scale = image_xscale + 0.25;


unit =  global.units[unit_id];
character = global.characters[unit.get_character_id()]
available = unit.is_available();


sheet_top_y = 41;
sheet_left_x = 145;
sheet_right_x = 854;
sheet_bottom_y = 958;
sheet_width = sheet_right_x - sheet_left_x;
sheet_height = sheet_bottom_y - sheet_top_y;
surface_sheet = surface_create(sheet_width, sheet_height);

portrait_x = 50;
portrait_y = 50;
portrait_sprite = asset_get_index("spr_unit_face_"+string(unit_id));
portrait_width = 150;

name_x = portrait_x;
name_y = portrait_y * 1.5 + portrait_width;
name_text = character.last_name + " " + character.first_name;

hitbox_x = sheet_width/2
hitbox_y = 150;
hitbox_sprite = asset_get_index("spr_unit_hitbox_" + string(unit_id));
i = 0
