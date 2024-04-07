
function MainDeskCrimeFocus(_crime_id) : Menu(MENU_PRIORITIES.MAIN_DESK_CRIME_FOCUS, room, false, true, false, MENU_CHANNELS.MAIN_DESK_NEUTRAL) constructor 
{
	crime_id = _crime_id;
	
	
	var _text_nickname = "[fnt_small_titles]" + global.crimes[crime_id].get_victim_nickname();
	var _text_change_color = "[fnt_small_titles]" + text_id_to_string("CRIME NEXT COLOR");
	var _cards = 
	[
		new Card([new CardSubElement(_text_nickname, CARD_SUB_ELEMENT_TYPES.SCRIBBLE_TEXT), new CardSubElement(spr_arrow, CARD_SUB_ELEMENT_TYPES.SPRITE)], function(){}, true),
		new Card([new CardSubElement(_text_change_color, CARD_SUB_ELEMENT_TYPES.SCRIBBLE_TEXT)], change_crime_color_next)
	]
	cards_set = new CardsSet(_cards , ORIENTATION.BOT_UP_PIN, CIRCLE_DIRECTION.NEGATIVE);
	
	
	pressed_crime = -1;
	pressed_card = -1;
	void_is_pressed = false;
	
	draw = function()
	{
		cards_set.draw();
	}
	activity = main_desk_crime_focus_activity;
}

function main_desk_crime_focus_activity()
{
	var _mouse_is_over_crime = instance_position(mouse_x, mouse_y, obj_crime);
	var _mouse_over_card = cards_set.get_card_mouse_over();
	for (var _card = 0; _card < cards_set.nb_cards; _card ++)
	{
		cards_set.cards[_card].update_points_of_draw(_mouse_over_card == _card);
	}
	
	
	if left_click_released()
	{
		if pressed_card > -1 then cards_set.cards[pressed_card].function_when_clicked(crime_id);
		else if pressed_crime > -1 
		{
			end_reached = true;
			add_menu(new MainDeskCrimeFocus(pressed_crime.crime_id));
		}
		else if void_is_pressed then end_reached = true;
	}
	if left_click_pressed()
	{
		pressed_crime = _mouse_is_over_crime;
		pressed_card = _mouse_over_card;
		void_is_pressed = (_mouse_over_card == -1) and (_mouse_is_over_crime == noone);
	}
	if _mouse_is_over_crime != noone or _mouse_over_card > -1 then void_is_pressed = false;
	pressed_card = _mouse_over_card == -1 ? -1 : pressed_card;
	pressed_crime = _mouse_is_over_crime == noone ? noone : pressed_crime;
}

function change_crime_color_next(_crime_id)
{
	if global.crimes[_crime_id].color_id != CRIME_COLORS.NB_OF_CRIME_COLORS -1
	{
		global.crimes[_crime_id].color_id ++;
	}
	else
	{
		global.crimes[_crime_id].color_id = 0;
	}
}