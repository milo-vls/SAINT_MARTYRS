//box
draw_set_alpha(1);
draw_rectangle_color(xBox, yBox, xBox + lBox, yBox + hBox, c_black, c_black, c_black, c_black, false);

//txt
draw_set_color(colFnt)
draw_set_font(fnt);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_text_ext(xTxt, yTxt, txtToDraw, sep, wTxtMax);