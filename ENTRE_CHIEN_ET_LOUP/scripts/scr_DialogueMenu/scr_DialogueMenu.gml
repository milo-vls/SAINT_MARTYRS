function DialogueMenu(_file_name) : Menu(MENU_PRIORITIES.DIALOGUES, room, true, false, false, MENU_CHANNELS.DIALOGUES) constructor
{
	chatterbox = ChatterboxCreate(_file_name, true);
}