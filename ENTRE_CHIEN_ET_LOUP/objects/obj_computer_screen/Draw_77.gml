

if !surface_exists(screen_surface)
{
	screen_surface = computer_screen_surface_create();
}
surface_copy_part(screen_surface, 0, 0, application_surface, COMPUTER_SCREEN_X_1, COMPUTER_SCREEN_Y_1, surface_get_width(screen_surface), surface_get_height(screen_surface));

surface_set_target(screen_surface);

shader_set(sh_crt_screen);
shader_set_uniform_f_array(uinform_params_of_the_shader, params);
surface_reset_target();
gpu_set_blendenable(false);
draw_surface_ext(screen_surface, COMPUTER_SCREEN_X_1, COMPUTER_SCREEN_Y_1, 1, 1, 0, c_white, 1);
gpu_set_blendenable(true);




draw_surface_ext(application_surface, 0, 0, 1, 1, 0, c_white, 1);
shader_reset();