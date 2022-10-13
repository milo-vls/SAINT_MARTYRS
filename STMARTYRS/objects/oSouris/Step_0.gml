//position
x = mouse_x;
y = mouse_y;


//clique/détection

if not  (instance_exists(oDial) or instance_exists(oGoToRoom))
{
	if !ojeu.pause
	{
		
		if position_meeting(mouse_x, mouse_y, oParentClickObj)
		{
			var _concernedCObj = instance_nearest(mouse_x, mouse_y, oParentClickObj);
			if global.cPrLeft
			{
				_concernedCObj.pressed = true;
			}
			if _concernedCObj.pressed and global.cRlLeft
			{
				with _concernedCObj
				{
					if _concernedCObj.cObjID != noone
					{
						ojeu.ClickObj[_concernedCObj.cObjID].event();
					}	
				}
			}
		}
		else
		{
			
			if instance_exists(oParentClickObj)
			oParentClickObj.pressed = false;
			
			
			if position_meeting(mouse_x, mouse_y, oParentObservable)
			{
				var _concernedObs = instance_nearest(mouse_x, mouse_y, oParentObservable);
				if global.cPrLeft
				{
					_concernedObs.pressed = true;
				}
				if _concernedObs.pressed and global.cRlLeft
				{
					with _concernedObs
					{
						pressed = false;
						startObs(ojeu.obsObj[obsObjID].obsID);
						visible = true;
						if usageUnique
						{
							desac = true;
						}
						
					}
						
				}

			}
			else
			{
				
				if instance_exists(oParentObservable)
				oParentObservable.pressed = false;
				
				
				if position_meeting(mouse_x, mouse_y, oNPCparent)
				{
					var _concernedNPC = instance_nearest(mouse_x, mouse_y, oNPCparent);
					if global.cPrLeft
					{
						_concernedNPC.pressed = true;
					}
					if global.cRlLeft and _concernedNPC.pressed
					{
						_concernedNPC.pressed = false;
						with _concernedNPC
						{
							startDial(global.char[charID].dialID, self);
						}
					}
				}
				else
				{
					if instance_exists(oNPCparent)
					oNPCparent.pressed = false;
					if position_meeting(mouse_x, mouse_y, omoveArrow)
					{
						omoveArrow.visible = true;
						var _concernedArr = instance_nearest(mouse_x, mouse_y, omoveArrow);
						if global.cPrLeft
						{
							_concernedArr.pressed = true;
						}
						if _concernedArr.pressed and global.cRlLeft
						{
							with _concernedArr
							{
								GoToRoom(destination, TransiSound);
							}
						}
					}
					else
					{
						
						if instance_exists(omoveArrow)
						{
							omoveArrow.visible = true;
							omoveArrow.pressed = false;
						}					
					}
				}
			}
		}
	}
}