#macro TEXT_BUBBLE_WIDTH (GAME_WIDTH/4)
#macro TEXT_BUBBLE_X_OFFSET (TEXT_BUBBLE_WIDTH/4)
#macro TEXT_BUBBLE_MINIMUM_Y_TOP_TARGET (GAME_HEIGHT/2)
#macro TEXT_BUBBLE_MARGIN (TEXT_BUBBLE_WIDTH/8)
#macro GAP_BETWEEN_TEXT_BUBBLES (TEXT_BUBBLE_MARGIN * 3)

function DialogueMenu(_file_name) : Menu(MENU_PRIORITIES.DIALOGUES, room, true, false, false, MENU_CHANNELS.DIALOGUES) constructor
{
	chatterbox = ChatterboxCreate(_file_name, true, 100000);
	ChatterboxJump(chatterbox, "Start");
	var _speaker = ChatterboxGetContentSpeaker(chatterbox, 0);
	var _speech = ChatterboxGetContentSpeech(chatterbox, 0);
	text_bubbles[0] = new TextBubble(_speech, _speaker, SIDES.LEFT);
	
	draw = function()
	{
		var _nb_text_bubbles = array_length(text_bubbles);
		text_bubbles[_nb_text_bubbles - 1].y_top  = TEXT_BUBBLE_MINIMUM_Y_TOP_TARGET;
		for (var _i = _nb_text_bubbles - 2; _i >= 0; _i --)
		{
			text_bubbles[_i].y_top = text_bubbles[_i + 1].y_top;
			
		}
		
		for (var _i = 0; _i < _nb_text_bubbles; _i ++)
		{
			text_bubbles[_i].draw();
		}
	}
	activity = function()
	{
		
	}
}