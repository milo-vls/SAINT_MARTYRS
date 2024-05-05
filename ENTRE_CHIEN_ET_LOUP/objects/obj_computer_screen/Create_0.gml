window_set_cursor(cr_none);

application_surface_draw_enable(false);
screen_surface = -1;
uinform_params_of_the_shader = shader_get_uniform(sh_crt_screen, "params");
params = [window_get_width(), window_get_height(), 2.0,   -8.0, -3.0,  11,  8,  0.5,  1.5,   1];
/*
SHADER by u/Badwrong_
enum ECRT
	{
		ResX,
		ResY,
		ResScale,
		HardScan,
		HardPixel,
		WarpX,
		WarpY,  
		MaskDark,
		MaskLight,
		SRGB,
		Last
	}