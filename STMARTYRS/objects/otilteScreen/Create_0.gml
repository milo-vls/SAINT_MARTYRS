option[0] = {
	txt : text("TITLE_SCREEN_START"),
	command : function(){
		//startObs("WELCOME DEMO");
		GoToRoom(global.startingRoom, noone, true, noone/*, function(){
			sprite_prefetch_multi(ojeu.pageTexture[PAGE_TEXTURE_BACKGROUND]);
			sprite_prefetch_multi(ojeu.pageTexture[PAGE_TEXTURE_PERSONNAGE]);
			}*/);
			
	},
	_x : 0,
	col : c_white,
}
option[1] = {
	txt : text("TITLE_SCREEN_OPTIONS", "yo le", " rap"),
	command : function(){startObs("OPTIONS DEMO INDISPO")},
	_x : 0,
	col : c_white,
}
option[2] = {
	txt : text("TITLE_SCREEN_QUIT"),
	command : function() {game_end()},
	_x : 0,
	col : c_white,
}
	


changeBackgroundMusic(mainTheme);