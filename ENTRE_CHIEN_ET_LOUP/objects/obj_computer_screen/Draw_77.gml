draw_set_alpha(1);
shader_set(sh_crt_screen);
shader_set_uniform_f_array(uinform_params_of_the_shader, params);
gpu_set_blendenable(false);
draw_surface_ext(application_surface, 0, 0, 1, 1, 0, c_white, 1);
gpu_set_blendenable(true);
shader_reset();
