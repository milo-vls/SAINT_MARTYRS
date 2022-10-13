if !instance_exists(oDial)
{
	decaCBox = 50;
	nbChoices = 0;
	for (var i = 0; i < 5;i ++)
	{
		draw_set_font(ftDial);
	
		if choice[i].txt != noone and choice[i].command != noone
		{
			choice[i].ltxt = string_width(choice[i].txt);
			nbChoices ++;
		}
	
	
		hCBox = nbChoices*(string_height("W")+decaCBox);
		#region lCBox
		if nbChoices == 1 {var _maxLtxt = choice[0].ltxt};
		if nbChoices == 2 {var _maxLtxt = max(choice[0].ltxt, choice[1].ltxt)};
		if nbChoices == 3 {var _maxLtxt = max(choice[0].ltxt, choice[1].ltxt, choice[2].ltxt)};
		if nbChoices == 4 {var _maxLtxt = max(choice[0].ltxt, choice[1].ltxt, choice[2].ltxt, choice[3].ltxt)};
		if nbChoices == 5 {var _maxLtxt = max(choice[0].ltxt, choice[1].ltxt, choice[2].ltxt, choice[3].ltxt, choice[4].ltxt)};
		lCBox = _maxLtxt + decaCBox*2;
		#endregion
		y1Box = display_get_gui_height()/2 - hCBox/2;
		x1Box = display_get_gui_width()/2 - lCBox/2;
		y2Box = y1Box + hCBox;
		x2Box = x1Box + lCBox;
	
	
	
	
	
	}
	draw_set_alpha(1);
	draw_rectangle_color(x1Box, y1Box, x2Box, y2Box, c_black, c_black, c_black, c_black, false);
	for (var i = 0; i < 5;i ++)
	{
		if choice[i].txt != noone
		{
		
			draw_set_valign(fa_top);
			draw_set_halign(fa_center);
			var _xtxt = display_get_gui_width()/2;
			choice[i].y = y1Box  + (decaCBox + string_height("W"))*i + 25
		
			choice[i].col = c_white;
			if point_in_rectangle(mouse_x, mouse_y, _xtxt - choice[i].ltxt/2, choice[i].y, _xtxt +choice[i].ltxt/2, choice[i].y + string_height("W"))
			{
				choice[i].col = c_yellow;
			}

		draw_set_color(choice[i].col);
		draw_text(_xtxt,choice[i].y, choice[i].txt);	
		}
	
		if global.cPrLeft and choice[i].txt != noone
		{
			if choice[i].col == c_yellow
			{
				if !is_method(choice[i].command)
				{
					script_execute(choice[i].command);
				}
				else
				{
					choice[i].command();
				}
			}
		}
	}

}