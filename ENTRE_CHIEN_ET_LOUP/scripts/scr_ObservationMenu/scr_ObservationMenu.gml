function ObservationMenu(_text) : Menu(MENU_PRIORITIES.DIALOGUES, room, true, false, false) constructor 
{
	
	draw_set_font(fnt_dialogues);
	
	text_scribble = scribble(DIALOGUES_FORMATING_TEXT _text)
	
	textbox_max_width = (TEXT_BUBBLE_WIDTH)/2;
	
	textbox_width = min(textbox_max_width, text_scribble.get_width() + TEXT_BUBBLE_MARGIN*2);
	
	text_scribble = text_scribble.wrap(textbox_width - TEXT_BUBBLE_MARGIN*2).align(fa_left, fa_middle);
	text_typist = scribble_typist().in(1.3, 4);
	
	
	textbox_height = text_scribble.get_height() + TEXT_BUBBLE_MARGIN;
	
	textbox_y = random_range(100, GAME_HEIGHT - 100 - textbox_height);
	textbox_x = random_range(100, GAME_WIDTH - 100 - textbox_width);
	
	
	activity = function()
	{
		if left_click_pressed()
			end_reached = true;
	}
	draw = function()
	{
		if left_click_pressed()
			end_reached = true;
		
		
		
		
		draw_set_alpha(0.9); draw_set_color(TEXT_BUBBLE_BACKGROUND_COLOR);
		draw_roundrect(textbox_x, textbox_y, textbox_x + textbox_width, textbox_y + textbox_height, false);
		
		text_scribble.blend(DIALOGUES_BASE_FONT_COLOR).draw(textbox_x + TEXT_BUBBLE_MARGIN, textbox_y + textbox_height/2, text_typist);
	}
}