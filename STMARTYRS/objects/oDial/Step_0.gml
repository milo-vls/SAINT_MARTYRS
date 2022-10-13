draw_set_font(font);
if !setup
{
	for (var i = 0;i < nbBulles;i ++)
	{
		bulle[i].txt = scribble("["+colFnt +"][ftDial][fa_top][fa_left]"+bulle[i].txt).wrap(wtxt);
		bulle[i].typist = scribble_typist();
		bulle[i].typist.in(0, fadingSpeed);
		var _bullechar = bulle[i].char
		if _bullechar != noone
		{
			if  is_array(global.char[_bullechar].voice)
			{
				bulle[i].typist.sound_per_char(global.char[_bullechar].voice, 0.1, 0.5, " ,.!?;'");
			}
		}
	}
	bulle[0].typist.in(baseTypeSpeed, fadingSpeed);
	setup  = true;
	yCentralSlide = display_get_gui_height();
}


#region texte tapé
if bulle[currentBulle].drewchar < string_length(bulle[currentBulle].txt)
{
	bulle[currentBulle].drewchar += typingSpeed;
	bulle[currentBulle].drewchar = clamp(bulle[currentBulle].drewchar, 0, bulle[currentBulle].ltxt);
}
#endregion


#region position des éléments
	yCurrentBulle = yChoiceBox-decaHChoiceBulle - sprite_get_height(sprAnsIcone)*5;

	//tar y
	bulle[currentBulle].tarY = yCurrentBulle;
	//vérification des bulles de la bulle actuelle vers le bas
	var _arrLen = array_length(bulle)
	for (var i = currentBulle+1;i < _arrLen; i ++)
	{
		bulle[i].tarY = bulle[i-1].y + bulle[i-1].h + decaBulle;
		bulle[i].y = bulle[i].tarY;
	}
	//vérification des bulles de la bulle actuelles vers le dessus
	for (var i = currentBulle-1;i > -1; i --)
	{
		bulle[i].tarY = bulle[i+1].y - bulle[i].h - decaBulle;
		bulle[i].tarY = clamp(bulle[i].tarY, -3000, bulle[i].y);
		bulle[i].y = bulle[i].tarY;
		//bulle[i].y = approach(bulle[i].y,bulle[i].tarY, 10);
		//bulle[i].y = min(bulle[i+1].y, bulle[i].y);
	}

	//y selon tarY et h ET LE TEXT TO DRAW
	for (var i = 0;i < array_length(bulle);i ++)
	{
	
		bulle[i].txtToDraw = string_copy(bulle[i].txt, 1, bulle[i].drewchar);
		bulle[i].y = lerp(bulle[i].y, bulle[i].tarY, 0.1);
		bulle[i].tarH = decaTexteBulle*2 + bulle[i].txt.get_height();
		bulle[i].h = bulle[i].tarH//approach(bulle[i].h, bulle[i].tarH, 20);
		bulle[i].h = max(hBulleMin, bulle[i].h);
	}
#endregion


#region choix
if showChoice 
{
	tarYChoiceBox = yChoiceBoxMax;
	//taper texte	
	if choiceDrewChar < choice[currentChoice].ltxt
	{
		visibleIconeAnswer = false;
		choiceDrewChar = choiceDrewChar + typingSpeed*1.5;
		choiceDrewChar = clamp(choiceDrewChar, 0, choice[currentChoice].ltxt);
		
	}
	else
	{
		visibleIconeAnswer = true;
	}
	
	choiceTxtToDraw = string_copy(choice[currentChoice].txt, 1, choiceDrewChar);
	
}
else
{
	visibleIconeAnswer = false;
	tarYChoiceBox = yChoiceBoxMin;
}

//flèche visible ?
if currentChoice == 0
{
	visibleLeftArr = false;
}
else
{
	visibleLeftArr = true;
}
if currentChoice == array_length(choice)-1
{
	visibleRightArr = false;	
}
else
{
	visibleRightArr = true;
}



yChoiceBox = approach(yChoiceBox, tarYChoiceBox, 11);	
yAnsIcone = yChoiceBox - decaArrChoice/2 - sprite_get_height(iconeAnswer);
yArr = yChoiceBox + hChoiceBox/2 - sprite_get_height(Arr)/2;


#endregion


#region commandes
if yCentralSlide<200
{
	
if global.cRlLeft or clickAuto
{
	clickAuto = false;
	if !showChoice
	{
		var checkState = bulle[currentBulle].typist.get_state();
		
		if checkState == 1
		{
			if currentBulle < nbBulles -1
			{
				typingSpeed = baseTypeSpeed;
				setupPort = false;
				currentBulle ++;
				bulle[currentBulle].typist.in(baseTypeSpeed, fadingSpeed);
				
			}
			else
			{
				if nbChoices < 1
				{
					
					instance_destroy();
				}
				else
				{
					typingSpeed = baseTypeSpeed;
					showChoice = true;	
				}
			}
		}
		else
		{
			bulle[currentBulle].typist.in(maxTypeSpeed, fadingSpeed);
			typingSpeed = maxTypeSpeed;	
	
		}
	}
	else
	{
		if choiceDrewChar != choice[currentChoice].ltxt
		{
			typingSpeed = maxTypeSpeed+5;
		}			
	}

}

if showChoice
{
	if visibleIconeAnswer
	{
		if global.cPrLeft and point_in_rectangle(mouse_x, mouse_y, xAnsIcone, yAnsIcone, xAnsIcone+sprite_get_width(iconeAnswer), yAnsIcone+sprite_get_height(iconeAnswer))
		{
			ansPressed = true;
		}
		if !point_in_rectangle(mouse_x, mouse_y, xAnsIcone, yAnsIcone, xAnsIcone+sprite_get_width(iconeAnswer), yAnsIcone+sprite_get_height(iconeAnswer))
		{
			ansPressed = false;
		}
		if global.cRlLeft and ansPressed
		{
			txtData(choice[currentChoice].choiceID);
			showChoice = false;
			setupPort = false;
			currentBulle ++;
			nbChoices = 0;
			clickAuto = true;
		}
	}
	if visibleRightArr
	{
		if global.cPrLeft and point_in_rectangle(mouse_x, mouse_y, xRightArr, yArr, xRightArr + sprite_get_width(Arr), yArr + sprite_get_height(Arr))
		{
			rightArrPressed = true;
		}
		if !point_in_rectangle(mouse_x, mouse_y, xRightArr, yArr, xRightArr + sprite_get_width(Arr), yArr + sprite_get_height(Arr))
		{
			rightArrPressed = false;
		}
		if global.cRlLeft and rightArrPressed
		{
			typingSpeed = baseTypeSpeed;
			choiceDrewChar = 0;
			currentChoice ++;
		}
	}
	if visibleLeftArr
	{
		if global.cPrLeft and point_in_rectangle(mouse_x, mouse_y, xLeftArr-sprite_get_width(Arr), yArr, xLeftArr, yArr + sprite_get_height(Arr))
		{
			leftArrPressed = true;
		}
		if !point_in_rectangle(mouse_x, mouse_y, xLeftArr-sprite_get_width(Arr), yArr, xLeftArr, yArr + sprite_get_height(Arr))
		{
			leftArrPressed = false;
		}
		if global.cRlLeft and leftArrPressed
		{
			typingSpeed = baseTypeSpeed;
			choiceDrewChar = 0;
			currentChoice --;
		}
	}
}

}
#endregion

