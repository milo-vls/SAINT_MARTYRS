//@param {struct.RangeOfCards} _range_of_cards
//@param {real} _priority
//@param {Asset.GMRoom} _room_presence
//@param {bool} _persistence
//@param {bool} _end_with_room
//@param {bool} _parallelism
//@param {real} _parallelism
function BasicCardMenu(_range_of_cards = template_range_of_card(),_room_presence = room, _is_persistent = false, _end_with_room = true, _parallelism = false, _channel = -1) : Menu(_room_presence, _is_persistent, _end_with_room, _parallelism, _channel) constructor
{
	range_of_cards = _range_of_cards;
	
	hovered_card_id = -1;
	
	draw = function()
	{
		hovered_card_id = range_of_cards_get_hovered_card_id(range_of_cards, mouse_x, mouse_y);
		range_of_cards_update_padding(range_of_cards, hovered_card_id);
		draw_range_of_cards(range_of_cards, hovered_card_id);
	}
	activity = function()
	{
		if left_click_pressed() and hovered_card_id > -1
			range_of_cards.methods[hovered_card_id]();		
	}
}

function test_menu_basic_card_menu()
{
	add_menu(new BasicCardMenu());
}