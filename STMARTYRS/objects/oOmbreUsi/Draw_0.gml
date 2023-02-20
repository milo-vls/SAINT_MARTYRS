if ADetruire
{
	part_particles_create(omapManager.partSys, instance_nearest(x, y, ousi).x, instance_nearest(x, y, ousi).y, omapManager.typePartPoussiere, irandom_range(11, 16));
	instance_destroy();
}


draw_self();