if !debug_mode
	window_set_cursor(cr_none);
application_surface_draw_enable(false);
uinform_params_of_the_shader = shader_get_uniform(sh_crt_screen, "params");
params = [window_get_width(), window_get_height(), 1.0, -12.67, -15.0,  32,  32,  2.62,  1.88,   1];
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
		//Last
	}