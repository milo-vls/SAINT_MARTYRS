#region slide et fond
//fond noir
draw_set_alpha(0.2);
draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
//cadran slide
draw_set_alpha(1);
yCentralSlide = lerp(yCentralSlide, -200, 0.1);
//draw_sprite_stretched(sprSlide, 0, xCentralSlide, yCentralSlide, wCentralSlide, hCentralSlide + 200);
#endregion

#region portrait

if limpSynchSpd > 0
{
	cptr += limpSynchSpd;
	numSubImage = (cptr mod 6 == 0) ? irandom_range(1, 5) : numSubImage //+        ((( cptr div 10)mod 4) * irandom_range(1, 4))
}
else
{
		numSubImage = 0;
}

if bulle[currentBulle].side == "r"
{
	if bulle[currentBulle].char != noone
	rightPort = global.char[bulle[currentBulle].char].portrait ?? rightPort;	

	//si on précise que le perso de droite parle seul
	if bulle[currentBulle].char2 == PAS_D_ECOUTEUR
	{
		leftPort = PAS_D_ECOUTEUR;
	}else if bulle[currentBulle].char2 != noone
	{
		leftPort = global.char[bulle[currentBulle].char2].portrait ?? leftPort;		
	}
	
}
if bulle[currentBulle].side == "l"
{
	if bulle[currentBulle].char != noone
	leftPort = global.char[bulle[currentBulle].char].portrait ?? leftPort;	
		
	//si on précise que le perso de droite parle seul
	if bulle[currentBulle].char2 == PAS_D_ECOUTEUR
	{
		rightPort = PAS_D_ECOUTEUR;
	}else if bulle[currentBulle].char2 != noone
	{
		rightPort = global.char[bulle[currentBulle].char2].portrait ?? rightPort;
	}
	
	
}

if !setupPort
{
	//première bulle
	if currentBulle == 0
	{
		//y a t-il un portrait ?
		if rightPort != noone or rightPort != PAS_D_ECOUTEUR
		{
			xrightPort = display_get_gui_width();
		}
		if leftPort != noone or leftPort != PAS_D_ECOUTEUR
		{
			xleftPort = 0 - sprite_get_width(leftPort) * hPort/sprite_get_height(leftPort);
		}
	}
	//reste des bulles
	else
	{
		if bulle[currentBulle].side == "r"
		{
			//ancien portrait définit ici
			if bulle[currentBulle-1].side == "r"
			{
			var ancienPortraitDroit = bulle[currentBulle-1].char;
			var ancienPortraitGauche = bulle[currentBulle-1].char2;
			}
			else
			{
			var ancienPortraitDroit = bulle[currentBulle-1].char2;
			var ancienPortraitGauche = bulle[currentBulle-1].char;
			}
			
			if bulle[currentBulle].char != ancienPortraitDroit and bulle[currentBulle].char != noone //si le portrait droit change
			{
				xrightPort = display_get_gui_width();
				alphaRPort = 0;
			}
			if bulle[currentBulle].char2 != ancienPortraitGauche and bulle[currentBulle].char2 != noone //si le portrait gauche change
			{
				xleftPort = 0 - sprite_get_width(leftPort) * hPort/sprite_get_height(leftPort);
				alphaLPort = 0;
			}
		}
		if bulle[currentBulle].side == "l"
	{
		if bulle[currentBulle-1].side == "r"
		{
		var ancienPortraitDroit = bulle[currentBulle-1].char;
		var ancienPortraitGauche = bulle[currentBulle-1].char2;
		}
		else
		{
		var ancienPortraitDroit = bulle[currentBulle-1].char2;
		var ancienPortraitGauche = bulle[currentBulle-1].char;
		}
		
		if bulle[currentBulle].char != ancienPortraitGauche and bulle[currentBulle].char != noone //si le portrait droit change
		{
			xleftPort = 0 - sprite_get_width(leftPort) * hPort/sprite_get_height(leftPort);
			alphaLPort = 0;
		}
		if bulle[currentBulle].char2 != ancienPortraitDroit and bulle[currentBulle].char2 != noone //si le portrait gauche change
		{
			xrightPort = display_get_gui_width();
			alphaRPort = 0;
		}
	}
	}
	setupPort = !setupPort
}


//DESSIN PORTRAIT ACTUEL
draw_set_alpha(1);
if setup{

if rightPort != noone and rightPort != PAS_D_ECOUTEUR
{
	scale = hPort/sprite_get_height(rightPort);
	
	
	var _deplacement = targetHPort - hPort;
	vitesseScale += _deplacement * tensionScale;
	hPort += vitesseScale;
	
	
	tarXrightPort = display_get_gui_width() -/*xCentralSlide/2 - */(sprite_get_width(rightPort)*targetHPort/sprite_get_height(rightPort))///2;
	//yrightPort = display_get_gui_height();//display_get_gui_height()/2 - (sprite_get_height(rightPort)*scale)/2;
	
	xrightPort = approach(xrightPort, tarXrightPort, 100);
	alphaRPort = approach(alphaRPort, 1, 0.1);
	
	
	
	if bulle[currentBulle].side == "r"and bulle[currentBulle].typist.get_state() <1
	draw_sprite_ext(rightPort, numSubImage, xrightPort, yrightPort, targetHPort/sprite_get_height(rightPort), targetHPort/sprite_get_height(rightPort), 0, -1, alphaRPort);
	else
	draw_sprite_ext(rightPort, global.char[bulle[currentBulle].char].imageIndexStopTalk, xrightPort, yrightPort, targetHPort/sprite_get_height(rightPort), targetHPort/sprite_get_height(rightPort), 0, -1, alphaRPort);
}
if leftPort != noone and leftPort != PAS_D_ECOUTEUR
{
	scale = hPort/sprite_get_height(leftPort);
	tarXleftPort = 0//xCentralSlide/2 - (sprite_get_width(leftPort)*scale)/2
	//yleftPort = display_get_gui_height();//display_get_gui_height()/2 - (sprite_get_height(leftPort)*scale)/2;
	
	xleftPort = approach(xleftPort, tarXleftPort, 80);
	alphaLPort = approach(alphaLPort, 1, 0.1);	
	if bulle[currentBulle].side == "l" and bulle[currentBulle].typist.get_state() <1
	{
		draw_sprite_ext(leftPort, numSubImage, xleftPort, yleftPort, targetHPort/sprite_get_height(leftPort), targetHPort/sprite_get_height(leftPort), 0, -1, alphaLPort);
	}else
	draw_sprite_ext(leftPort, global.char[bulle[currentBulle].char2].imageIndexStopTalk, xleftPort, yleftPort, targetHPort/sprite_get_height(leftPort), targetHPort/sprite_get_height(leftPort), 0, -1, alphaLPort);
}

}


//DESSIN PORTRAIT PARTANT DU CADRE
if antRightPort != noone
{
	scale = hPort/sprite_get_height(antRightPort)
	xrightPort = display_get_gui_width() - xCentralSlide/2 - (sprite_get_width(antRightPort)*scale)/2;
	//yrightPort = display_get_gui_height();//display_get_gui_height()/2 - (sprite_get_height(rightPort)*scale)/2;
	
	alphaAntRPort = approach(alphaAntRPort, 0, 0.1);
	
	draw_sprite_ext(antRightPort, 0, xrightPort, yrightPort, scale, scale, 0, -1, alphaRPort);
	
}
if antLeftPort != noone
{
	scale = hPort/sprite_get_height(antLeftPort)
	xleftPort = xCentralSlide/2 - (sprite_get_width(antLeftPort)*scale)/2
	//yleftPort = display_get_gui_height();//display_get_gui_height()/2 - (sprite_get_height(leftPort)*scale)/2;
	
	alphaLPort = approach(alphaLPort, 1, 0.1);	
	
	
	draw_sprite_ext(antLeftPort, 0, xleftPort, yleftPort, scale, scale, 0, -1, 1);

}
#endregion

#region bulles et texte

if setup
for (var i = 0; i < array_length(bulle);i ++)
{
	#region quel alpha? quelle couleur?
		//taralpha
		bulle[currentBulle].alpha = 0.95;
		if currentBulle > i
		{
			bulle[i].tarAlpha = 0.8;
		}
		
		bulle[i].alpha = approach(bulle[i].alpha, bulle[i].tarAlpha, 0.08);
		draw_set_alpha(bulle[i].alpha);
		cBulle = global.char[bulle[i].char].col ?? c_white;
	#endregion
	#region dessin bulles
		if bulle[i].side == "r"
			draw_sprite_stretched_ext(spriteBulle, 0, xBulle + decaBulleOtherSide, bulle[i].y, wBulle-decaBulleOtherSide, bulle[i].h -20, cBulle, bulle[i].alpha);
		if bulle[i].side == "l"
		{
			draw_sprite_stretched_ext(sprBulle2, 0, xBulle, bulle[i].y, wBulle - decaBulleOtherSide, bulle[i].h -20, cBulle, bulle[i].alpha);
		}
	#endregion
	#region dessin texte
		#region position
			var _ytxt = bulle[i].y + decaTexteBulle/2;
			if bulle[i].side == "r"
			{
				var _xtxt = xtxt+decaBulleOtherSide;
			}
			else
			{
				var _xtxt = xtxt;
			}
		#endregion
		draw_set_alpha(bulle[i].alpha);
		bulle[i].txt.draw(_xtxt, _ytxt, bulle[i].typist);
			
	#endregion
}
draw_set_color(c_white);

#endregion


#region choix
if visibleIconeAnswer
{
	draw_sprite(iconeAnswer, 0, xAnsIcone, yAnsIcone);
	//draw_rectangle_color(xAnsIcone, yAnsIcone, xAnsIcone+sprite_get_width(iconeAnswer), yAnsIcone+sprite_get_height(iconeAnswer), c_blue, c_blue, c_blue, c_blue, false)        
}
if visibleLeftArr
{
	draw_sprite_ext(Arr, 0, xLeftArr, yArr, -1, 1, -1, -1, 1);
	//draw_rectangle_color(xLeftArr-sprite_get_width(Arr), yArr, xLeftArr + sprite_get_width(Arr), yArr + sprite_get_height(Arr), c_blue, c_blue, c_blue, c_blue, true);
}
if visibleRightArr
{
	draw_sprite_ext(Arr, 0, xRightArr, yArr, 1, 1, -1, -1, 1);
}

//draw_sprite(sprBulle, 0, xChoiceBox, yChoiceBox);
yChoiceTxt = yChoiceBox +  decaTexteBulle;
//draw_text_ext(xChoiceTxt, yChoiceTxt, choiceTxtToDraw, sepTxt, wChoiceTxt);

 scribble("["+colFnt +"][ftDial][fa_top][fa_left]"+choiceTxtToDraw).wrap(wtxt).draw(xChoiceTxt, yChoiceTxt);


#endregion

