#region inputs joueur
if canPlayerInput
{
	//clavier
	if keyboard_check_pressed(vk_backspace)
	{
		charsInputJoueur = "";
	}
	else
	if keyboard_check_pressed(vk_anykey) and !keyboard_check(vk_enter)
	if keyboard_lastchar != -1
	{
		// ajoutLettreURL(keyboard_lastchar);
		
		charsInputJoueur += keyboard_lastchar;
		keyboard_lastchar = -1;
	
	}
	
	//entré
	if charsInputJoueur != "" and keyboard_check_pressed(vk_enter)
	{
		loadPageWeb(charsInputJoueur);
	}
	
	#region défilement
	if hauteurScroller < hauteurCadreScroller
	{
		if point_in_rectangle(mouse_x, mouse_y, xScroller, yScroller, xScroller + lScroller, yScroller + hauteurScroller) and global.cPrLeft
		{
			scrollerPressed =  true;
			diffHauteurSourisScroller = mouse_y - yScroller;
		}
		if global.cRlLeft
		{
			scrollerPressed =  false;
		}
		if scrollerPressed
		{
			yScroller = mouse_y - diffHauteurSourisScroller;
			var _yMax = yCadreScroller + hauteurCadreScroller - hauteurScroller;
			yScroller = clamp(yScroller, yCadreScroller,_yMax);
			var _coeff = (yScroller - yCadreScroller)/_yMax;
			yAjoute = yMin  + hauteurPage * _coeff;
			yAjoute = clamp(yAjoute, yMin, hauteurPage + 100);
		}
	}
	
	#endregion
	
}

#endregion

