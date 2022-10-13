#region MACROS
#macro JOUR_SELON_DIALOGUES ojeu.numeroJour-3
#macro r "r"
#macro l "l"
#macro D d(



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
{nbChoices = 0;
	switch(textID)
	{
		#region usi
			case p.Liza :	txtLiza()	break;
			case p.Ernest:	txtErnest()	break;
			case p.Armand:	txtArmand()	break;
		#endregion
		#region PNJ EN VILLES
			case p.Martine:		txtMartine()		break;
			case p.Enzino:		txtEnzino()			break;
			case p.Incel:			txtIncel()				break;
			case p.Amandine:	txtAmandine()	break;
		#endregion
	}
}






