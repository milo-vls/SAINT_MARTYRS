if value == LANGUE_DISPOS.ANGLAIS
{
	
	with instance_create_depth(x, y, DEPTH_OJEU, ojeu)
	{
		initTranslation(LANGUAGE.EN);
	}
	GoToRoom(pstart);
}
if value == LANGUE_DISPOS.FRANCAIS
{
	with instance_create_depth(x, y, DEPTH_OJEU, ojeu)
	{
		initTranslation(LANGUAGE.FR);
	}
	GoToRoom(pstart);
}