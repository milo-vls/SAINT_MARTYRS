// Feather disable GM1041
#macro TEXT_BUBBLE_WIDTH (GAME_WIDTH/2.5)
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
	if _speech == "" 
	{
		end_reached = true;
		with obj_npc
			alpha_target = 1; 
		return;
		}
	var _side;
	if _nb_text_bubbles < 1
	{
		_side = SIDES.LEFT;
	}
	else
	{
		//SAME SPEAKER
		if text_bubbles[_nb_text_bubbles-1].speaking_character == _speaker
		{
			text_bubbles[_nb_text_bubbles-1].is_last_speaker_bubble = false;
			_side = text_bubbles[_nb_text_bubbles-1].side;
		}
		//DIFFERENT SPEAKER
		else
		{
			_side = text_bubbles[_nb_text_bubbles-1].side == SIDES.LEFT ? SIDES.RIGHT : SIDES.LEFT;
		}
	}
	text_bubbles[_nb_text_bubbles] = new TextBubble(_speech, _speaker, _side);
	if text_bubbles[_nb_text_bubbles].side == SIDES.RIGHT
	{
		right_character_nickname = _speaker;
		right_character_protrait = get_character_portrait_sprite(_speaker);
		
	}
	if text_bubbles[_nb_text_bubbles].side == SIDES.LEFT
	{
		left_character_nickname = _speaker;
		left_character_portrait = get_character_portrait_sprite(_speaker);
	}
	

	
}

function draw_portraits(_left_sprite_portrait = -1, _right_sprite_portrait = -1)
{
	if _left_sprite_portrait != -1
	{
		draw_sprite(_left_sprite_portrait, 0, GAME_WIDTH/6, GAME_HEIGHT);
	}
	if _right_sprite_portrait != -1
	{
		draw_sprite(_right_sprite_portrait, 0, (GAME_WIDTH*5)/6, GAME_HEIGHT);
	}
}



function dialogue_menu_draw_method()
{	
	/////////////////
	//* HIDE NPCs *//
	/////////////////
	
	with obj_npc
		alpha_target = 0;
	
	
	///////////////////
	//* BACK GROUND *//
	///////////////////

	draw_background(background_index);
	
	/////////////////
	//* PORTRAITS *//
	/////////////////
	
	draw_set_alpha(1);
	draw_portraits(left_character_portrait, right_character_protrait);
	
	///////////////
	//* BUBBLES *//
	///////////////

	var _option_select_menu = obj_menu_manager.get_active_menu(DialoguesOptionsSelect);	
	var _nb_text_bubbles = array_length(text_bubbles);
	var _last_bubble = _nb_text_bubbles - 1;
	self.text_bubbles[_last_bubble].y_bot  = min(TEXT_BUBBLE_MINIMUM_Y_BOTTOM_TARGET, _option_select_menu!=-1 ? GAME_HEIGHT - _option_select_menu.cards_set.get_highest_card_height() - GAP_BETWEEN_TEXT_BUBBLES*2.5 : TEXT_BUBBLE_MINIMUM_Y_BOTTOM_TARGET);
	for (var _i = _last_bubble - 1; _i >= 0; _i --)
	{
		text_bubbles[_i].y_bot = text_bubbles[_i + 1].y_bot  - text_bubbles[_i + 1].get_height() - GAP_BETWEEN_TEXT_BUBBLES;
	}	
	for (var _i = 0; _i < _nb_text_bubbles; _i ++)
	{
		text_bubbles[_i].draw();
	}
}


function dialogue_menu_activity_method()
{
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
	else if left_click_pressed()
	{
		text_bubbles[_nb_text_bubbles-1].typist.skip();
	}
}


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


function DialogueMenu(_file_name, _starting_node) : Menu(MENU_PRIORITIES.DIALOGUES, room, true, false, false, MENU_CHANNELS.DIALOGUES) constructor
{
	
	background_index = -1;
	
	
	
	right_character_nickname = NO_ONE;
	right_character_protrait = -1;
	left_character_nickname = NO_ONE;
	left_character_portrait = -1;
	
	
	
	
	
	text_bubbles = array_create(0);
	selected_option_index = -1;
	
	
	chatterbox = ChatterboxCreate(_file_name, true, self);
	ChatterboxJump(chatterbox, _starting_node);
	next_text_bubble();
	
	draw = dialogue_menu_draw_method;

	activity = dialogue_menu_activity_method;

}






