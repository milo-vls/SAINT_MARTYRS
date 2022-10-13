draw_set_alpha(1);
draw_set_font(ftDial);
switch (progress) {
    case ArnelMG.START_ROOM					:{
        draw_rectangle_color(0, 0, display_get_gui_width()/2, display_get_gui_height()/2, c_black, c_black, c_black, c_black, false);
		draw_text(display_get_gui_width()/2, display_get_gui_height()/2, "clique droit pour commencer, veuiller reproduire la série de directions.");
		
		if global.cRlLeft
		{
			progress = ArnelMG.LOADING_SEQUENCE;
		}
	}break;
	case ArnelMG.LOADING_SEQUENCE	:{
		progress = ArnelMG.SHOW_INSTRUCTIONS
	}break;
	case ArnelMG.SHOW_INSTRUCTIONS	:{
		var _toShow = scribble(instructions[sequence-1]+"[/s][/shake].[delay, 200].[delay, 200].[delay, 200]PRÊT ?");
		_toShow.draw(500, 500, typist);
		typist.in(0.5, 5);
		var _state = typist.get_state()
		if _state == 1
		{
			if global.cRlLeft
			{
				progress = ArnelMG.WAIT_FOR_INPUT;
				keyboard_lastkey = -1;
			}
		}
	}break;
	case ArnelMG.WAIT_FOR_INPUT			:{
		var _input = keyboard_lastkey
		switch (_input) //transforme _input en haut bas gauiche droite
		{
			case vk_left:{
				entreeJoueur = ArnelMGInstructions.gauche;
			}break;
			case vk_right:{
				entreeJoueur = ArnelMGInstructions.droite;
			}break;
			case vk_up:{
				entreeJoueur = ArnelMGInstructions.haut;
			}break;
			case vk_down:{
				entreeJoueur = ArnelMGInstructions.bas;
			}break;
			default:
			entreeJoueur = noone;
		}
		if entreeJoueur != noone
		{
			progress = ArnelMG.MOVING_OBJECTS;//un déplacement a été 
		}
	}break;
	case ArnelMG.MOVING_OBJECTS			:{
		//----------------------MOUVEMENT-----------------------------//
		switch (entreeJoueur)
		{
			case ArnelMGInstructions.bas		:{
				
				oParentArnelMovingObject.y -=  pas;
				
			}break;
			case ArnelMGInstructions.haut		:{
				
				oParentArnelMovingObject.y +=  pas;
				
			}break;
			case ArnelMGInstructions.gauche	:{
				
				oParentArnelMovingObject.x -=  pas;
				
			}break;
			case ArnelMGInstructions.droite	:{
				
				oParentArnelMovingObject.x +=  pas;
				
			}break;
		}
		//---------LE MOUVEMENT ÉTAIT IL LE BON ?----------//
		var _check = inputARepoduire[sequence-1][indexInputAReproduire]
		if entreeJoueur == _check 		//OUI
		{
			indexInputAReproduire ++ ;	
			progress = ArnelMG.WAIT_FOR_INPUT;
			keyboard_lastkey = noone;
		}
		else																											//NON
		{
			room_restart();
		}
		//----------------------UNE FOIS LE MOUVEMENT ACHEVÉ-------------------------------------//
	
		
	}break;
}


