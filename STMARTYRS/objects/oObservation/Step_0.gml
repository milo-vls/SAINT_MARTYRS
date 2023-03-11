
yBoxMax = display_get_gui_height() - decaTxtBox*2 - string_height_ext(txt[page], sep, wTxtMax) - decaBoxScreen;
if !setup 
{
	setup = true;
	txt[page] = aLaLigne(txt[page], wTxtMax);	
	yBox = irandom_range(yBoxMin, yBoxMax);
}


#region taper le texte
if drewChar < string_length(txt[page])
{
	drewChar += typingSpeed;
	drewChar = clamp(drewChar, 0, string_length(txt[page]));
}
txtToDraw = string_copy(txt[page], 1, drewChar);
#endregion

#region Commandes

if global.cPrLeft
{
	if drewChar < string_length(txt[page])
	{
		typingSpeed = maxTypingSpeed;
	}
	else
	{
		if is_method(fun[page]) then fun[page]();
		//IL RESTE DES PAGES
		if page < nbPages - 1
		{
			typingSpeed = baseTypingSpeed;
			drewChar = 0;
			txtToDraw = "";
			hBox = 0;
			lBox = 0;
			page ++;
			txt[page] = aLaLigne(txt[page], wTxtMax);
			xBox = irandom_range(xBoxMin, xBoxMax);
			yBox = irandom_range(yBoxMin, yBoxMax)
			
			
		}
		//PLUS DE PAGES
		else
		{
			instance_destroy();
		}
	}
}

#endregion

#region taille position et autres

draw_set_font(fnt);
lBox = string_width_ext(txtToDraw, sep, wTxtMax) + decaTxtBox*2;
hBox = string_height_ext(txtToDraw, sep, wTxtMax)+ decaTxtBox*2;

yTxt = yBox + decaTxtBox;
xTxt = xBox + decaTxtBox;

#endregion