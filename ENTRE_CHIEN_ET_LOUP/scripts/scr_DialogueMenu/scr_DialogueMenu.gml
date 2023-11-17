#macro TEXT_BUBBLE_WIDTH (GAME_WIDTH/4)
#macro TEXT_BUBBLE_X_OFFSET (-TEXT_BUBBLE_WIDTH/8)
#macro TEXT_BUBBLE_MINIMUM_Y_BOTTOM_TARGET (5 * GAME_HEIGHT/6)
#macro TEXT_BUBBLE_MARGIN (TEXT_BUBBLE_WIDTH/16)
#macro GAP_BETWEEN_TEXT_BUBBLES (TEXT_BUBBLE_MARGIN/2)
#macro GAP_BETWEEN_OPTION_BUBBLES GAP_BETWEEN_TEXT_BUBBLES
#macro NO_ONE ""

function next_text_bubble()
{
	var _nb_text_bubbles = array_length(text_bubbles);
	var _speaker = ChatterboxGetContentSpeaker(chatterbox, 0);
	var _speech = ChatterboxGetContentSpeech(chatterbox, 0);
	//IF THE TEXT IS EMPTY, THEN ENDS THE DIALOGUE
	if _speech == "" {end_reached = true; return}
	var _side;
	if _nb_text_bubbles < 1
	{
		_side = SIDES.LEFT;
	}
	else
	{
		if text_bubbles[_nb_text_bubbles-1].speaking_character == _speaker
		{
			_side = text_bubbles[_nb_text_bubbles-1].side;
		}
		else
		{
			_side = text_bubbles[_nb_text_bubbles-1].side == SIDES.LEFT ? SIDES.RIGHT : SIDES.LEFT;
		}
	}
	text_bubbles[_nb_text_bubbles] = new TextBubble(_speech, _speaker, _side);
	if text_bubbles[_nb_text_bubbles].side == SIDES.RIGHT
	{
		right_character_nickname = _speaker;
	}
	if text_bubbles[_nb_text_bubbles].side == SIDES.LEFT
	{
		left_character_nickname = _speaker;
	}
	

	
}

function DialogueMenu(_file_name) : Menu(MENU_PRIORITIES.DIALOGUES, room, true, false, false, MENU_CHANNELS.DIALOGUES) constructor
{
	right_character_nickname = NO_ONE;
	left_character_nickname = NO_ONE;
	text_bubbles = array_create(0);
	selected_option_index = -1;
	y_bottom_target_minimum_bubble = TEXT_BUBBLE_MINIMUM_Y_BOTTOM_TARGET;

	chatterbox = ChatterboxCreate(_file_name, true, 100000);
	ChatterboxJump(chatterbox, "Start");
	next_text_bubble()
	
	draw = function()
	{
		draw_set_alpha(0.45); draw_set_color(c_black);
		draw_rectangle(0, 0, GAME_WIDTH, GAME_HEIGHT, false);
		draw_set_alpha(1);
		
		if right_character_nickname != NO_ONE
		{
			
		}
		if left_character_nickname != NO_ONE
		{
				
		}
		
		var _nb_text_bubbles = array_length(text_bubbles);
		var _last_bubble = _nb_text_bubbles - 1;
		self.text_bubbles[_last_bubble].y_bot  = y_bottom_target_minimum_bubble;
		for (var _i = _last_bubble - 1; _i >= 0; _i --)
		{
			text_bubbles[_i].y_bot = text_bubbles[_i + 1].y_bot  - text_bubbles[_i + 1].get_height() - GAP_BETWEEN_TEXT_BUBBLES;
		}	
		for (var _i = 0; _i < _nb_text_bubbles; _i ++)
		{
			text_bubbles[_i].draw();
		}
	}
	activity = function()
	{
		y_bottom_target_minimum_bubble = TEXT_BUBBLE_MINIMUM_Y_BOTTOM_TARGET;
		var _nb_text_bubbles = array_length(text_bubbles);
		if  text_bubbles[_nb_text_bubbles-1].is_fully_shown()
		{
			
			if ChatterboxIsWaiting(self.chatterbox) 
			{
				if left_click_pressed()
				{
					ChatterboxContinue(chatterbox);
					next_text_bubble();
				}
			}
			else if selected_option_index == -1
			{
				show_options(ChatterboxGetOptionArray(chatterbox), self, text_bubbles[_nb_text_bubbles-1].side == SIDES.LEFT ? SIDES.RIGHT : SIDES.LEFT);
			}
			else
			{
				ChatterboxSelect(chatterbox, selected_option_index);
				selected_option_index = -1;
				next_text_bubble();
			}
		}
	}
}