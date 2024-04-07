function GameOver() : Menu(MENU_PRIORITIES.EXPLORATION, room, true, true, false) constructor 
{
	cards_set = new CardsSet([new Card([new CardSubElement("abandonner", CARD_SUB_ELEMENT_TYPES.SCRIBBLE_TEXT)], function(){game_end(0) }),new Card([new CardSubElement("réessayer", CARD_SUB_ELEMENT_TYPES.SCRIBBLE_TEXT)],function(){change_room(rm_main_desk)})], ORIENTATION.BOT_UP_PIN, CIRCLE_DIRECTION.NEGATIVE);
	
	
	draw = function()
	{
		draw_set_color(c_yellow); draw_set_alpha(1); draw_set_font(fnt_test); draw_set_valign(fa_middle); draw_set_halign(fa_center);
		draw_text(room_width/2, room_height/2, "game over");
		cards_set.draw();
	}
	activity = cards_set.activity;
}