if value == LANGUE_DISPOS.ANGLAIS
{
	if !instance_exists(ojeu)
	{
		with instance_create_depth(0, 0, DEPTH_OJEU, ojeu)
		{
			initTranslation(LANGUAGE.EN);
		}
		GoToRoom(pstart);
	}
}
if value == LANGUE_DISPOS.FRANCAIS
{
	if !instance_exists(ojeu)
	{
		with instance_create_depth(0, 0, DEPTH_OJEU, ojeu)
		{
			initTranslation(LANGUAGE.FR);
		}
		GoToRoom(pstart);
	}
}