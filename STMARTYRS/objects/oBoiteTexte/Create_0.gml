#macro MARGE_BOITE_TEXTE (sprite_width/12)
strScribble = scribble(police + str).align(fa_left, fa_top).blend(c_white).scale_to_box(sprite_width-MARGE_BOITE_TEXTE, sprite_height-MARGE_BOITE_TEXTE, true);


//image_yscale = (strScribble.get_height() + (MARGE_BOITE_TEXTE)*2)/sprite_height * image_yscale;
