element_vertical_offset = 20;
elements_x = x + sprite_width/2;
origin_height = sprite_height;
added_height = 0;
malus_ids = array_create(0);
nb_cases = 0;
top_nineslice_y = sprite_get_nineslice(sprite_index).top;
bottom_nineslice_height = sprite_get_nineslice(sprite_index).bottom;
malus_sprites = array_create(0);
malus_sprites_heights = array_create(0);
nb_active_malus = 0;
all_malus = global.malus;
text_y = y + (top_nineslice_y);
confusion_on = false;

add_malus = function(_malus_id)
{
	if _malus_id == 1
		confusion_on = true;
	array_push(malus_ids, _malus_id);
	var _malus_sprite = asset_get_index("spr_malus_" + all_malus[_malus_id].name);
	array_push(malus_sprites, _malus_sprite);
	array_push(malus_sprites_heights, text_y + added_height);
	added_height += element_vertical_offset + sprite_get_height(_malus_sprite);
	nb_active_malus ++;
}
malus_exists = function(_malus_name)
{
	var _malus_id_to_found = get_malus_id(_malus_name);
	for (var _active_malus_id_index = 0; _active_malus_id_index < nb_active_malus; _active_malus_id_index ++)
	{
		if malus_ids[_active_malus_id_index] == _malus_id_to_found
		{
			return true;
		}
	}
	return false;
}
