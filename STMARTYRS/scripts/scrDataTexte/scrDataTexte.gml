// Feather disable GM1051
// Feather disable GM2017

#region MACROS

#macro JOUR_SELON_DIALOGUES ojeu.numeroJour-3
#macro r "r"
#macro l "l"



#region usi
	#macro pl ,p.player, l);
	#macro pr ,p.player, r);
	#macro ll ,p.Liza, l);
	#macro lr ,p.Liza, r);
	#macro el ,p.Ernest, l);
	#macro er ,p.Ernest, r);
	#macro al ,p.Armand, l);
	#macro ar ,p.Armand, r);
	#macro dl ,p.Didier, l);
	#macro dr ,p.Didier, r);
	#macro jl ,p.Julien, l);
	#macro jr ,p.Julien, r);
	#macro rl ,p.Rosalie, l);
	#macro rr ,p.Rosalie, r);
#endregion
#region pnj en ville
	#macro ml ,p.Martine, l);
	#macro mr ,p.Martine, r);
	#macro enl ,p.Enzino, l);
	#macro enr ,p.Enzino, r);
	#macro her ,p.Incel, r);
	#macro hel ,p.Incel, l);
	
#endregion


#endregion

//dialgue v2
function startDial(textIndex, blur = true)
{
	if !instance_exists(oDial)
	{
		var _depht = dptxt
		with instance_create_depth(0, 0, _depht, oDial)
		{
			self.blur = blur;
			txtData(textIndex);	//give the txt box the txt to show
			
		}
	}
}
function choiceDial(txtChoix, redirID)
{
	choice[nbChoices]={
	txt : txtChoix,
	ltxt : string_length(txtChoix),
	choiceID : redirID,
	}
	
	nbChoices ++;
	
	
}




function txtData(textID)	
{
	nbChoices = 0;
	switch(textID)
	{
		#region NPC
			#region USI
				case p.Liza :	txtLiza()	break;
				case p.Ernest:	txtErnest()	break;
				case p.Armand:	txtArmand()	break;
			#endregion
			#region CIVIL
				case p.Martine:		txtMartine()		break;
				case p.Enzino:		txtEnzino()			break;
				case p.Incel:			txtIncel()				break;
				case p.Amandine:	txtAmandine()	break;
			#endregion
		#endregion
		#region CINÉMATIQUE
			#region INTRO
				#region SCENE 3
					case DIAL_ID_SCENE_3 :{
						d( text("S3_L1_DIDIER"), p.Didier, l, p.player);
						d( text("S3_L2_BLAISE") pr
						d(text("S3_L3_DIDIER"), p.Didier, l, noone, turnLimpSynchOff);
						d( text("S3_L4_BLAISE") pr
						d(text("S3_L5_BLAISE"),p.player, r, noone, noone, function(){global.char[p.player].imageIndexStopTalk = BLAISES_SMILING_FACE});
						d(text("S3_L6_DIDIER"), p.Didier, l,noone, function(){global.char[p.player].imageIndexStopTalk = BLAISES_NEUTRAL_FACE});
						d( text("S3_L7_BLAISE") pr 
					}break;
				#endregion
				#region SCENE 4
					case DIAL_ID_SCENE_4:{
						d(text("S4_L1_DIDIER"), p.Didier, l, p.player);
					}break;
				#endregion
			#endregion
		#endregion
		#region TÉLÉPHONE
			case ojeu.num[INDEX_NUM.MAMAN].numero:{
				d(text("S3_L1_DIDIER"), p.player, l);
			}break;
		#endregion
		
		default:{
			d(text("ERROR")pr 
		}break;
	}
}






