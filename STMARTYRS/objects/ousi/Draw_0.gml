image_angle = ojeu.usi[usiID].rot;
sprite_index = ojeu.usi[usiID].hbox;




//------TAILLE
image_xscale = approach(image_xscale, tarXScale, USI_SCALE_SPEED);
image_yscale = approach(image_yscale, tarYScale, USI_SCALE_SPEED);


draw_self();