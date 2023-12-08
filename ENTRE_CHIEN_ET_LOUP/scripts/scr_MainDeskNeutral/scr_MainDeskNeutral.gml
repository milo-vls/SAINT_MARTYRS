function MainDeskNeutral() : Menu(MENU_PRIORITIES.MAIN_DESK_NEUTRAL, room, false, true, false, MENU_CHANNELS.MAIN_DESK_NEUTRAL) constructor 
{
	pressed_crime = -1;
	
	var _units_cards = array_create(0);
	var _nb_units = array_length(global.units);
	for (var _unit_id = 0; _unit_id < _nb_units; _unit_id ++)
	{
		var _unit = global.units[_unit_id];
		if _unit.is_available()
		{
			var _scribble_unit_nickname = scribble("[fnt_small_titles]" + global.characters[_unit.character_id].nickname);
			_units_cards[array_length(_units_cards)] = new Card
				([
					new CardSubElement(_scribble_unit_nickname, CARD_SUB_ELEMENT_TYPES.SCRIBBLE_TEXT),
					
				], );
		}
	}
	units_cards_set = new CardsSet(_units_cards, ORIENTATION.BOT_DOWN_PIN, CIRCLE_DIRECTION.NEGATIVE);
	
	draw = main_desk_neutral_draw;
	activity = main_desk_neutral_activity;
}

function main_desk_neutral_activity()
{
		var _mouse_is_over_crime = instance_position(mouse_x, mouse_y, obj_crime);
		if _mouse_is_over_crime > -1
		{
			if _mouse_is_over_crime == pressed_crime and left_click_released()
			{
				add_menu(new MainDeskCrimeFocus(pressed_crime.crime_id));
			}
		}
		if _mouse_is_over_crime > -1 and left_click_pressed() 
		{
			pressed_crime = _mouse_is_over_crime;
		}
		if !left_click()
		{
			pressed_crime = noone;
		}	
}
function main_desk_neutral_draw()
{
	units_cards_set.draw();
}