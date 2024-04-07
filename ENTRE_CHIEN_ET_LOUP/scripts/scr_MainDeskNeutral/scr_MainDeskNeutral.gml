function MainDeskNeutral() : Menu(MENU_PRIORITIES.MAIN_DESK_NEUTRAL, room, false, true, false, MENU_CHANNELS.MAIN_DESK_NEUTRAL) constructor 
{
	pressed_crime = noone;
	
	var _units_cards = array_create(0);
	var _nb_units = array_length(global.units);
	for (var _unit_id = 0; _unit_id < _nb_units; _unit_id ++)
	{
		var _unit = global.units[_unit_id];
		if _unit.is_available()
		{
			var _scribble_unit_nickname = scribble("[fnt_small_titles]" + global.characters[_unit.character_id].nickname);
			_units_cards[array_length(_units_cards)] = new Card([new CardSubElement(_scribble_unit_nickname, CARD_SUB_ELEMENT_TYPES.SCRIBBLE_TEXT)], unit_card_clicked, false, [_unit_id]);
		}
	}
	units_cards_set = new CardsSet(_units_cards, ORIENTATION.BOT_DOWN_PIN, CIRCLE_DIRECTION.NEGATIVE);
	
	
	var _exploration_button_card = new Card([new CardSubElement(scribble(SMALL_TITLE_FORMATIING_TEXT"Exploration"), CARD_SUB_ELEMENT_TYPES.SCRIBBLE_TEXT)], main_deck_to_exploration);
	var _advance_sleep_button_card = new Card([new CardSubElement(scribble(SMALL_TITLE_FORMATIING_TEXT"Finir la journée"), CARD_SUB_ELEMENT_TYPES.SCRIBBLE_TEXT)], sleep_until_next_event, true);
	main_desk_upper_buttons_set = new CardsSet([_advance_sleep_button_card, _exploration_button_card], ORIENTATION.BOT_UP_PIN, CIRCLE_DIRECTION.POSITIVE);
	
	
	draw = main_desk_neutral_draw;
	activity = main_desk_neutral_activity;
}

function main_desk_neutral_activity()
{		
	//SLEEP
	main_desk_upper_buttons_set.activity();
	
	
	//UNITS
	units_cards_set.activity();
	//units slection
	var _mouse_is_over_unit = instance_position(mouse_x, mouse_y, obj_unit);
	if _mouse_is_over_unit > -1 and left_click_pressed()
	{
		reset_release_timer();
		return add_menu(new MainDeskUnitFocus(_mouse_is_over_unit.unit_id));
	}

	//CRIMES	
	//crime selection
	var _mouse_is_over_crime = instance_position(mouse_x, mouse_y, obj_crime);
	if _mouse_is_over_crime > -1
	{
		if _mouse_is_over_crime == pressed_crime and left_click_released()
		{
			return add_menu(new MainDeskCrimeFocus(pressed_crime.crime_id));
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
	main_desk_upper_buttons_set.draw();
	units_cards_set.draw();
}


function unit_card_clicked(_void, _data)
{
	var _unit_id = _data[0];
	
	if destroy_existing_instance_of_unit_id(_unit_id) == false
	{
		instance_create_depth(mouse_x, mouse_y, DEPTHS.UNITS, obj_unit, {unit_id : _unit_id});
		add_menu(new MainDeskUnitFocus(_unit_id));
	}
	
}

function destroy_existing_instance_of_unit_id(_unit_id)
{
	var _nb_of_units_on_map = instance_number(obj_unit);
	for (var _i= 0; _i < _nb_of_units_on_map; _i ++)
	{
		var _current_unit_instance = instance_find(obj_unit, _i);
		if _current_unit_instance.unit_id == _unit_id
		{
			return instance_destroy(_current_unit_instance);
		}
	} 
	return false;
}