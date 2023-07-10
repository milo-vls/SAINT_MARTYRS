event_inherited();

quotienParcours = 0;
quotienParcoursSignature = 0;
tpsParcours = room_speed * 0.5;
tpsParcoursSignature = room_speed*0.2;
courbe = animcurve_get_channel(acCourbes, "cDocumentShift");


drawProgress = true;
drawHighlight = false;
drawSignature = false;