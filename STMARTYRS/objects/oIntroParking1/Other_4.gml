
switch room
{
	case P_TABLEAU_DE_NUIT :{
		startObs(OBS_ID_TABLEAU_DE_NUIT);	
	}break;
	case P_SANITAIRES:{
		startObs(OBS_ID_SANITAIRE);
	}break;
	case P_CORRIDOR:{
		startDial(DIAL_ID_SCENE_3);
	}break;
	case pcarte : {
		if tutoMapState == 0
		{
			startDial(DIAL_ID_SCENE_4, false);
			tutoMapState ++;
		}
	}
}