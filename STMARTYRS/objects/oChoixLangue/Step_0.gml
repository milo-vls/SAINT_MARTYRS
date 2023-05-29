if value == LANGUE_DISPOS.ANGLAIS
{
	
	with instance_create_depth(x, y, dpojeu, ojeu)
	{
		initTranslation(LANGUAGE.EN);
	}
	GoToRoom(pstart);
}
if value == LANGUE_DISPOS.FRANCAIS
{
	with instance_create_depth(x, y, dpojeu, ojeu)
	{
		initTranslation(LANGUAGE.EN);
	}
	GoToRoom(pstart);
}