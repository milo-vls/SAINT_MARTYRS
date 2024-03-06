function main_deck_to_exploration()
{
	change_room(rm_dev, new RoomTransitionStyle(ROOM_TRANSITION_STYLES.FADE), function(){add_menu(new Exploration())});
}