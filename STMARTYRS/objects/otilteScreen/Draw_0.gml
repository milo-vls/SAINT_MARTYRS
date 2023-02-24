draw_set_font(ftMenu);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_alpha(1);

decaMenuTitleScreen = 25;

colRec = c_black;
y1Rec = room_height - 200;
y2Rec = room_height;
x1Rec = 0;
x2Rec = room_width;

draw_rectangle_color(x1Rec, y1Rec, x2Rec, y2Rec, colRec, colRec, colRec, colRec, false);

yOptionTitleScreen = y1Rec + 100;

for (var i = 0;i < array_length(option);i ++)
{
	//position x du texte
	option[0]._x = decaMenuTitleScreen;
	if i != 0
	{
		option[i]._x = option[i - 1]._x + string_width(option[i - 1].txt) + decaMenuTitleScreen;
	}
	//couleur du texte
	if mouse_y > y1Rec
	{
		if mouse_x < option[1]._x and mouse_x > x1Rec
		{
			option[0].col = c_yellow;
		}
		else
		{
			option[0].col = c_white;
		}
		if i != 0
		{
			if mouse_x < (option[i]._x + string_width(option[i].txt) + decaMenuTitleScreen) and mouse_x > option[i]._x
			{
				option[i].col = c_yellow;
			}
			else
			{
				option[i].col = c_white;
			}
		}
	}
	else
	{
		option[i].col = c_white;
	}
	//dessin
	draw_text_color(option[i]._x, yOptionTitleScreen, option[i].txt, option[i].col, option[i].col, option[i].col, option[i].col, 1);
	//clique
	if option[i].col == c_yellow and global.cRlLeft
	{
		option[i].command();
	}
}

