shader_set(sh_crt_screen);
shader_set_uniform_f_array(uinform_params_of_the_shader, params);
gpu_set_blendenable(false);
draw_set_alpha(1);
draw_surface_stretched(application_surface, COMPUTER_SCREEN_X_1, COMPUTER_SCREEN_Y_1, COMPUTER_SCREEN_X_2 - COMPUTER_SCREEN_X_1, COMPUTER_SCREEN_Y_2 - COMPUTER_SCREEN_Y_1);
gpu_set_blendenable(true);
shader_reset();