function start_first_call_cutscene()
{
	start_sequence(cutscene_first_call());
}


function cutscene_first_call()
{
	var _steps = array_create(0);
	
	
	//////////////////////////////////////
	/*   BLACK SCREEN STEP   */
	/////////////////////////////////////
	_steps[0] = new Step(change_room, [rm_black_room], function ()
	{
		return room == rm_black_room && obj_menu_manager.get_active_menu(RoomTransition) == -1
	});
	
	/////////////////////////////////////////
	/*       RING SOUND STEP       */
	/////////////////////////////////////////
	_steps[1] = new Step(function(){}, [], function()
	{
		#macro NB_RINGS 2
		static phone_ring_count = 0;
		static phone_ring_sound = new Sound(snd_phone_ring, GAME_WIDTH/2, GAME_HEIGHT/2, 0, true);
		
		var _audios_playing = audio_is_playing(snd_phone_ring);
		
		if phone_ring_count == 2 && !_audios_playing
			return true;
		
		if !_audios_playing && phone_ring_count < 2
		{	
			add_sound_to_play(phone_ring_sound);
			phone_ring_count ++;
		}
		
		return false;
	});
	
	
	
	//////////////////////////////////////
	/*       DIALOGUE STEP       */
	/////////////////////////////////////	
	_steps[2] = new Step(start_dialogue, ["Cutscenes", "First call"], function()
	{
		return obj_menu_manager.dialogue_exists() == false;
	});
	
	////////////////////////////////
	/*       SLEEP STEP       */
	///////////////////////////////
	
	_steps[3] = new Step(sleep_until_next_event, [], function(){return true});

	
	
	return new Sequence(_steps, rm_title_screen);


}